package team1.mini2.dz3.auth;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.auth0.jwt.interfaces.DecodedJWT;

@Service
public class AuthServiceImpl implements AuthService{

    private final String GRANT_TYPE_BEARER = "Bearer";
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
        if (StringUtils.hasText(bearerToken) && bearerToken.startsWith(GRANT_TYPE_BEARER)) {
            return bearerToken.substring(7);
        }
        return null;
    }

    private JwtDto createJwtDto(AuthVo UserVo) { 
        String userId = UserVo.getAuthId();
        String authority = UserVo.getAuthAuthority();
        return JwtDto.builder()
                .grantType(GRANT_TYPE_BEARER)
                .accessToken(jwtIssuer.createAccessToken(userId, authority))
                .refreshToken(jwtIssuer.createRefreshToken(userId, authority))
                .build();
    }

    @Override
    public JwtDto login(AuthDto UserVoDto) {

        AuthVo UserVo = sqlSession.getMapper(AuthDao.class).get(UserVoDto.getAuthId());
        if(UserVo==null) {
        	throw new JwtException("해당 유저 없음");
        }
        if (!passwordEncoder.matches(UserVoDto.getAuthPwd(), UserVo.getAuthPwd())) {
            throw new JwtException("비밀번호가 맞지 않음");
        }

        return createJwtDto(UserVo);
    }

    @Override
    public JwtDto reissue(String bearerToken) {

        String refreshToken = resolveToken(bearerToken);
        if (!StringUtils.hasText(refreshToken)) {
            throw new JwtException("grant type 오류");
        }

        DecodedJWT claims = jwtIssuer.parseClaimsFromRefreshToken(refreshToken);
        if (claims == null) {
            throw new JwtException("코튼 클래임이 비어있음");
        }

        AuthVo UserVo = sqlSession.getMapper(AuthDao.class).get(claims.getSubject());
        if(UserVo==null) {
        	 throw new JwtException("해당 유저 없음");
        }

        return createJwtDto(UserVo);
    }
}		