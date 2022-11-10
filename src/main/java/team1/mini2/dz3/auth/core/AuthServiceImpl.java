package team1.mini2.dz3.auth.core;

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
import team1.mini2.dz3.auth.model.JwtDto;
import team1.mini2.dz3.auth.model.ValidDto;

@Service
class AuthServiceImpl implements AuthService{

    private final PasswordEncoder passwordEncoder;
    private final JwtIssuer jwtIssuer;
    private final SqlSessionTemplate sqlSession;
    
    public AuthServiceImpl(SqlSessionTemplate sqlSession,
            PasswordEncoder passwordEncoder,
            JwtIssuer jwtIssuer) {
    	this.sqlSession = sqlSession;
        this.passwordEncoder = passwordEncoder;
        this.jwtIssuer = jwtIssuer;
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
	public ValidDto validEmail(@NotNull @Email String authEmail) {
		return new ValidDto(sqlSession.getMapper(AuthDao.class).get(authEmail)==null);
	}
}		