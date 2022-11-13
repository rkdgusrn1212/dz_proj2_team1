package team1.mini2.dz3.auth.core;

import java.util.Collections;
import java.util.Date;

import org.springframework.stereotype.Component;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.auth0.jwt.interfaces.JWTVerifier;

@Component
class JwtIssuer {
	private final int ONE_SECONDS = 1000;
	private final int ONE_MINUTE = 60 * ONE_SECONDS;

	private final byte[] secretKeyBytes;
	private final byte[] refreshSecretKeyBytes;
	private final int expireMin;
	private final int refreshExpireMin;

	public JwtIssuer() {
		this.secretKeyBytes = JwtProperties.SECRET_KEY.getBytes();
		this.refreshSecretKeyBytes = JwtProperties.REFRESH_SECRET_KEY.getBytes();
		this.expireMin = ExpireProperties.EXPIRE_MIN;
		this.refreshExpireMin = ExpireProperties.REFRESH_EXPIRE_MIN;
	}

	private String createToken(String userName, String authority, byte[] secretKeyBytes, int expireMin) {
		Date now = new Date();
		return JWT.create().withSubject(userName)
				.withClaim(JwtProperties.KEY_ROLES, Collections.singletonList(authority))
				.withIssuedAt(now)
				.withExpiresAt(new Date(now.getTime() + ONE_MINUTE * expireMin))
				.sign(Algorithm.HMAC512(secretKeyBytes));
	}

	public String createAccessToken(String userName, String authority) {
		return createToken(userName, authority, secretKeyBytes, expireMin);
	}

	public String createRefreshToken(String userName, String authority) {
		return createToken(userName, authority, refreshSecretKeyBytes, refreshExpireMin);
	}

	public DecodedJWT parseClaimsFromRefreshToken(String jwtToken) {
		JWTVerifier verifier = JWT.require(Algorithm.HMAC512(refreshSecretKeyBytes)).build();
		return verifier.verify(jwtToken);
	}
}
