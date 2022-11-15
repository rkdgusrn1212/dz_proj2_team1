package team1.mini2.dz3.auth.core;

import java.util.Date;

import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.auth0.jwt.interfaces.DecodedJWT;

import team1.mini2.dz3.auth.model.AuthDao;
import team1.mini2.dz3.auth.model.AuthDto;
import team1.mini2.dz3.auth.model.AuthVo;
import team1.mini2.dz3.auth.model.EmailCodeDto;
import team1.mini2.dz3.auth.model.EmailValidDto;
import team1.mini2.dz3.auth.model.JwtDto;
import team1.mini2.dz3.auth.model.PutEmailCodeDto;
import team1.mini2.dz3.auth.model.PutRefreshTokenDto;
import team1.mini2.dz3.auth.model.SignUpDto;
import team1.mini2.dz3.auth.model.SignUpResultDto;
import team1.mini2.dz3.auth.model.ValidDto;

@Service
class AuthServiceImpl implements AuthService{

    private final PasswordEncoder passwordEncoder;
    private final JwtIssuer jwtIssuer;
    private final SqlSessionTemplate sqlSession;
    private final MailSender mailSender;
    private final PwdGeneratorComponent generator;
    
    public AuthServiceImpl(SqlSessionTemplate sqlSession,
            PasswordEncoder passwordEncoder,
            JwtIssuer jwtIssuer, MailSender mailSender
            ,PwdGeneratorComponent generator) {
    	this.sqlSession = sqlSession;
        this.passwordEncoder = passwordEncoder;
        this.jwtIssuer = jwtIssuer;
        this.mailSender = mailSender;
        this.generator = generator;
    }

    private String resolveToken(String bearerToken) {
        if (StringUtils.hasText(bearerToken) && bearerToken.startsWith(JwtProperties.TOKEN_PREFIX)) {
            return bearerToken.substring(JwtProperties.TOKEN_PREFIX.length());
        }
        return null;
    }

    private JwtDto createJwtDto(AuthVo UserVo) { 
        String id = Integer.toString(UserVo.getId());
        String authority = UserVo.getAuthAuthority();
        return JwtDto.builder()
                .grantType(JwtProperties.TOKEN_PREFIX)
                .accessToken(jwtIssuer.createAccessToken(id, authority))
                .refreshToken(jwtIssuer.createRefreshToken(id, authority))
                .result(JwtDto.SUCCESS)
                .build();
    }

    @Override
    public JwtDto login(AuthDto authDto) {
        AuthVo UserVo = sqlSession.getMapper(AuthDao.class).getById(authDto.getAuthId());
        if(UserVo==null) {
        	return new JwtDto(null, null, null, JwtDto.USER_ERROR);
        }
        if (!passwordEncoder.matches(authDto.getAuthPwd(), UserVo.getAuthPwd())) {
        	return new JwtDto(null, null, null, JwtDto.PWD_ERROR);
        }
        JwtDto jwtDto = createJwtDto(UserVo);
    	if(sqlSession.getMapper(AuthDao.class).putRefreshToken(new PutRefreshTokenDto(authDto.getAuthId(), passwordEncoder.encode(jwtDto.getRefreshToken())))<1) {
        	return new JwtDto(null, null, null, JwtDto.SAVE_REFRESH_ERROR);
    	}
        return jwtDto;
    }

    @Override
    public JwtDto reissue(@NotBlank String refreshToken) {
    	DecodedJWT claims = jwtIssuer.parseClaimsFromRefreshToken(refreshToken);
        String subject = claims.getSubject();
        if (subject == null||claims.getExpiresAt().before(new Date())) {//subject가 없거나, 만료된 토큰일때.
        	return new JwtDto(null, null, null, JwtDto.CLAIM_ERROR);
        }
        AuthVo UserVo = sqlSession.getMapper(AuthDao.class).get(subject);
        if(UserVo==null) {
        	return new JwtDto(null, null, null, JwtDto.USER_ERROR);
        }
        String savedToken = UserVo.getRefreshToken();
        if(savedToken==null||passwordEncoder.matches(refreshToken, savedToken)) {//저장된 refresh토큰이 없거나 저장값과 일치하지 않음(이미 갱신된 토큰)
        	return new JwtDto(null, null, null, JwtDto.SAVE_REFRESH_ERROR);
        }
        return createJwtDto(UserVo);
    }

	@Override
	public ValidDto validId(@NotBlank String authId) {
		return new ValidDto(sqlSession.getMapper(AuthDao.class).getById(authId)==null);
	}

	@Override
	public EmailValidDto validEmail(@NotNull @Email String authEmail) {
		EmailValidDto dto = new EmailValidDto();
		AuthVo authVo = sqlSession.getMapper(AuthDao.class).getByEmail(authEmail);
		if(authVo!=null&&!authVo.getAuthAuthority().equals("code")) {
			dto.setExist(true);
			dto.setSend(false);
			return dto;
		}
		dto.setExist(false);
		if(authVo!=null) {
			if(sqlSession.getMapper(AuthDao.class).deleteEmailCode(authEmail)<1) {
				dto.setSend(false);
				return dto;
			}
		}
		
		String code = generator.getRamdomPwd(13);//60자리 난수 id로 Qnique 속성에 대응, 13자리 난수 pwd를 코드로 사용.
		if(sqlSession.getMapper(AuthDao.class).addEmailCode(new PutEmailCodeDto(generator.getRandomCode(60),passwordEncoder.encode(code), "CODE", authEmail))<1) {
			dto.setSend(false);
			return dto;
		}
		dto.setSend(mailSender.sendMail(authEmail,
				"Tasty Way 인증코드", code));
		return dto;
	}
	

	@Override
	public ValidDto validPwd(@NotBlank String authPwd) {
		return new ValidDto(java.util.regex.Pattern.matches(ValidationProperties.AUTH_PWD_REGEX, authPwd));
	}

	@Override
	public ValidDto validCode(@NotNull @Valid EmailCodeDto emailCodeDto) {
		AuthVo authVo = sqlSession.getMapper(AuthDao.class).getByEmail(emailCodeDto.getEmail());
		if(authVo==null) {
			return new ValidDto(false);
		}
		return new ValidDto(passwordEncoder.matches((emailCodeDto.getCode()),authVo.getAuthPwd()));//코드 일치 확인
	}
	
	@Override
	public SignUpResultDto signUp(@NotNull @Valid SignUpDto signUpDto) {
		if(!validId(signUpDto.getAuthId()).isValid()) {
			return new SignUpResultDto(SignUpResultDto.ID_FAIL);
		}
		EmailCodeDto emailCodeDto = new EmailCodeDto();
		emailCodeDto.setCode(signUpDto.getCode());
		emailCodeDto.setEmail(signUpDto.getAuthEmail());
		if(!validCode(emailCodeDto).isValid()) {
			return new SignUpResultDto(SignUpResultDto.CODE_FAIL);
		}
		signUpDto.setAuthPwd(passwordEncoder.encode(signUpDto.getAuthPwd()));
		if(sqlSession.getMapper(AuthDao.class).putAuthUser(signUpDto)>0) {
			return new SignUpResultDto(SignUpResultDto.SUCCESS);	
		}else {
			return new SignUpResultDto(SignUpResultDto.FAIL);	
		}
	}

	@Override
	public String getEncryptedPwd(@NotBlank String pwd) {
		return passwordEncoder.encode(pwd);
	}

	@Override
	public boolean matchEncryptedPwd(@NotBlank String pwd, @NotBlank String encrypted) {
		return passwordEncoder.matches(pwd, encrypted);
	}
}		