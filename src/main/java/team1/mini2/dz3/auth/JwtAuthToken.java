package team1.mini2.dz3.auth;

import java.util.Collection;

import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;


public class JwtAuthToken extends AbstractAuthenticationToken{
	
	private static final long serialVersionUID = -2466850710586626364L;
	private String jwtToken;
    private Object principal;
    private Object credentials;
    
    public JwtAuthToken(String token) {
    	super(null);
    	jwtToken = token;
    	setAuthenticated(false);
    }
	
    public JwtAuthToken(Object principal, Object credentials, Collection<? extends GrantedAuthority> authorities) {
		super(authorities);
		this.principal = principal;
		this.credentials = credentials;
		super.setAuthenticated(true);
	}

	@Override
	public Object getCredentials() {
		return credentials;
	}

	@Override
	public Object getPrincipal() {
		return principal;
	}
	
	public String getJwtToken() {
		return jwtToken;
	}
}