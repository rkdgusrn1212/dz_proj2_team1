package team1.mini2.dz3.auth;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpHeaders;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import com.auth0.jwt.exceptions.JWTVerificationException;

public class JwtAuthenticationFilter extends OncePerRequestFilter {

	private static final String TOKEN_PREFIX = "Bearer";
	
	private final AuthenticationManager authenticationManager;
	
	public JwtAuthenticationFilter(AuthenticationManager authenticationManager) {
		this.authenticationManager = authenticationManager;
	}

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
		String authorizationHeader = request.getHeader(HttpHeaders.AUTHORIZATION);

		if (authorizationHeader != null && authorizationHeader.startsWith(TOKEN_PREFIX)) {
			String token = authorizationHeader.substring(TOKEN_PREFIX.length());
			try {
				JwtAuthToken jwtToken = new JwtAuthToken(token);
				Authentication auth = authenticationManager.authenticate(jwtToken);
				SecurityContextHolder.getContext().setAuthentication(auth);
			} catch (BadCredentialsException | JWTVerificationException e) {
				SecurityContextHolder.clearContext();
			}
		}
		chain.doFilter(request, response);
	}
}