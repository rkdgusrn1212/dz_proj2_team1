package team1.mini2.dz3.auth.core;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
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
	public WebSecurityCustomizer webSecurityCustomizer() {
		return (web) -> web.ignoring().antMatchers(
				"/**/login", "/**/signup", "/resources/**", "/auth/valid/**");
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
				.anonymous().disable()

				.authorizeRequests()
				.anyRequest().denyAll()

				.and()
				.apply(new JwtConfigurerAdapter(authenticationManagerBuilder.getOrBuild()))

				.and()
				.build();
	}

	@Bean
	public PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}


}
