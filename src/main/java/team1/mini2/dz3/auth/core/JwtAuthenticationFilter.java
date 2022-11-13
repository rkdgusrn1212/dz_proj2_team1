package team1.mini2.dz3.auth.core;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpHeaders;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import com.auth0.jwt.exceptions.JWTVerificationException;
import com.fasterxml.jackson.databind.ObjectMapper;

class JwtAuthenticationFilter extends OncePerRequestFilter {

	private final AuthenticationManager authenticationManager;

	public JwtAuthenticationFilter(AuthenticationManager authenticationManager) {
		this.authenticationManager = authenticationManager;
	}

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
		String accessToken = null;//혹시라도 헤더에 넣어서 보내는 경우. 이 앱에선 안쓰지만 나중을 위해 남겨둔다. 우선순위를 둔다.
		String authorizationHeader = request.getHeader(HttpHeaders.AUTHORIZATION);
		if (authorizationHeader != null && authorizationHeader.startsWith(JwtProperties.TOKEN_PREFIX)) {
			accessToken = authorizationHeader.substring(JwtProperties.TOKEN_PREFIX.length()+1);
		}else {
			Cookie[] cookies = request.getCookies();
			if(cookies!=null) {
				for(int i=0; i<cookies.length; i++) {
					if(cookies[i].getName().equals("jwtToken")) {
						Map<String, String> map = new ObjectMapper().readValue(URLDecoder.decode(cookies[i].getValue(), "UTF-8"), HashMap.class);
						accessToken = map.get("accessToken"); 
					}
				}
			}
		}
		if (accessToken!=null) {
			try {
				JwtAuthToken jwtToken = new JwtAuthToken(accessToken);
				Authentication auth = authenticationManager.authenticate(jwtToken);
				SecurityContextHolder.getContext().setAuthentication(auth);
			} catch (BadCredentialsException | JWTVerificationException e) {
				System.out.print(e.getLocalizedMessage());
				SecurityContextHolder.clearContext();
			}
		}
		chain.doFilter(request, response);
	}
}