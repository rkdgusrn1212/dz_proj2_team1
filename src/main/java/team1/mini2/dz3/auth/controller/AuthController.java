package team1.mini2.dz3.auth.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseCookie;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import team1.mini2.dz3.auth.core.AuthService;
import team1.mini2.dz3.auth.core.ExpireProperties;
import team1.mini2.dz3.auth.model.AccessTokenDto;
import team1.mini2.dz3.auth.model.AuthDto;
import team1.mini2.dz3.auth.model.EmailCodeDto;
import team1.mini2.dz3.auth.model.EmailValidDto;
import team1.mini2.dz3.auth.model.JwtDto;
import team1.mini2.dz3.auth.model.SignUpDto;
import team1.mini2.dz3.auth.model.SignUpResultDto;
import team1.mini2.dz3.auth.model.ValidDto;

@RestController
@Validated
public class AuthController {

	@Autowired
	private AuthService authService;

	@PostMapping("/login")
	public AccessTokenDto login(@Valid @RequestBody(required=true) AuthDto userDto, HttpServletResponse response) {
		JwtDto dto = authService.login(userDto);
		ResponseCookie cookie = ResponseCookie.from("refreshToken", dto.getRefreshToken())
				.maxAge(ExpireProperties.REFRESH_EXPIRE_MIN)
				.path("/")
				.secure(true)
				.sameSite("None")
				.httpOnly(true)
				.build();
		response.setHeader("Set-Cookie", cookie.toString());
		return new AccessTokenDto(dto.getGrantType(), dto.getAccessToken());
	}

	@PostMapping("/signup")
	public SignUpResultDto SignUp(@Valid @RequestBody(required=true) SignUpDto signUpDto) {
		return authService.signUp(signUpDto);
	}

	@GetMapping("/valid/email")
	public EmailValidDto validEmail( 
			@NotBlank @Email @RequestParam(required=true) String authEmail) {
		return authService.validEmail(authEmail);
	}

	@GetMapping("/valid/id")
	public ValidDto validId(@NotBlank @RequestParam(required=true) String authId) {
		return authService.validId(authId);
	}

	@PostMapping("/valid/pwd")
	public ValidDto validPwd(@RequestBody(required=true) HashMap<String, String> map) {
		return authService.validPwd(map.get("authPwd"));
	}

	@PostMapping("valid/code")
	public ValidDto validCode(@Valid @RequestBody(required=true) EmailCodeDto dto) {
		return authService.validCode(dto);
	}
}