package team1.mini2.dz3.auth.core;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.web.servlet.handler.HandlerMappingIntrospector;


@Configuration
@EnableWebSecurity
class AuthConfig{

	private final AuthenticationManagerBuilder authenticationManagerBuilder;

	public AuthConfig(AuthenticationManagerBuilder authenticationManagerBuilder,
			JwtAuthenticationProvider jwtProvider
			) {
		this.authenticationManagerBuilder = authenticationManagerBuilder;
		this.authenticationManagerBuilder.authenticationProvider(jwtProvider);
	}

	@Bean(name = "mvcHandlerMappingIntrospector")
	public HandlerMappingIntrospector mvcHandlerMappingIntrospector() {
		return new HandlerMappingIntrospector();
	}

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		System.out.println("filterChain");
		return http.csrf().disable()//세션 안쓰니 csrf도 필요없다.
				.cors().and()
				.sessionManagement()
				.sessionCreationPolicy(SessionCreationPolicy.STATELESS)//세션 사용안함.
				.and()
				.formLogin().disable()//Spring Security에서 제공하는 formLogin방식 안씀.
				.httpBasic().disable()//대신 bearer방식(haeder에 authentication)

				.authorizeRequests()
				.antMatchers("member").hasAuthority("MEMBER")

				.and()
				.apply(new JwtConfigurerAdapter(authenticationManagerBuilder.getOrBuild()))

				.and()
				.logout()
				.logoutUrl("/logout")
				.logoutSuccessUrl("/")
				.deleteCookies("jwtToken", "JSESSIONID")
				.clearAuthentication(true)
				.invalidateHttpSession(true)
				
				.and()
				.build();
	}

	@Bean
	public PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}


}
