package team1.mini2.dz3.auth.core;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Component;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.auth0.jwt.interfaces.JWTVerifier;

@Component
class JwtAuthenticationProvider implements AuthenticationProvider {


	private Collection<? extends GrantedAuthority> createGrantedAuthorities(DecodedJWT jwt) {
		List<String> roles = (List<String>) jwt.getClaim(JwtProperties.KEY_ROLES);
		List<GrantedAuthority> grantedAuthorities = new ArrayList<>();
		for (String role : roles) {
			grantedAuthorities.add(() -> role);
		}
		return grantedAuthorities;
	}

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		JWTVerifier verifier = JWT.require(Algorithm.HMAC512(JwtProperties.SECRET_KEY)).build();
		DecodedJWT jwt = verifier.verify(((JwtAuthToken)authentication).getJwtToken());
		return new JwtAuthToken(jwt.getSubject(), "", createGrantedAuthorities(jwt));
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return JwtAuthToken.class.isAssignableFrom(authentication);
	}
}