package team1.mini2.dz3.auth.core;

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
        String userId = UserVo.getAuthId();
        String authority = UserVo.getAuthAuthority();
        return JwtDto.builder()
                .grantType(JwtProperties.TOKEN_PREFIX)
                .accessToken(jwtIssuer.createAccessToken(userId, authority))
                .refreshToken(jwtIssuer.createRefreshToken(userId, authority))
                .build();
    }

    @Override
    public JwtDto login(AuthDto UserVoDto) {

        AuthVo UserVo = sqlSession.getMapper(AuthDao.class).get(UserVoDto.getAuthId());
        if(UserVo==null) {
        	throw new AuthException("해당 유저 없음");
        }
        if (!passwordEncoder.matches(UserVoDto.getAuthPwd(), UserVo.getAuthPwd())) {
            throw new AuthException("비밀번호가 맞지 않음");
        }

        return createJwtDto(UserVo);
    }

    @Override
    public JwtDto reissue(String bearerToken) {

        String refreshToken = resolveToken(bearerToken);
        if (!StringUtils.hasText(refreshToken)) {
            throw new AuthException("grant type 오류");
        }

        DecodedJWT claims = jwtIssuer.parseClaimsFromRefreshToken(refreshToken);
        if (claims == null) {
            throw new AuthException("코튼 클래임이 비어있음");
        }

        AuthVo UserVo = sqlSession.getMapper(AuthDao.class).get(claims.getSubject());
        if(UserVo==null) {
        	 throw new AuthException("해당 유저 없음");
        }

        return createJwtDto(UserVo);
    }

	@Override
	public ValidDto validId(@NotBlank String authId) {
		return new ValidDto(sqlSession.getMapper(AuthDao.class).get(authId)==null);
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
		
		String code = generator.getRamdomPwd(13);
		if(sqlSession.getMapper(AuthDao.class).addEmailCode(new PutEmailCodeDto(passwordEncoder.encode(code), "code", authEmail))<1) {
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
		if(sqlSession.getMapper(AuthDao.class).putAuthUser(signUpDto)>0) {
			return new SignUpResultDto(SignUpResultDto.SUCCESS);	
		}else {
			return new SignUpResultDto(SignUpResultDto.FAIL);	
		}
	}
}		