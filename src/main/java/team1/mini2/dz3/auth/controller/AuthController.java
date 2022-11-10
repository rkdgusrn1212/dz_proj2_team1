package team1.mini2.dz3.auth.controller;

import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import team1.mini2.dz3.auth.core.AuthService;
import team1.mini2.dz3.auth.model.AuthDto;
import team1.mini2.dz3.auth.model.JwtDto;
import team1.mini2.dz3.auth.model.ValidDto;
import team1.mini2.dz3.auth.model.SignUpDto;

@RestController
@Validated
public class AuthController {

	@Autowired
	private AuthService authService;
	
	@PostMapping("/login")
	public JwtDto login(@Valid @RequestBody(required=true) AuthDto userDto) {
		return authService.login(userDto);
	}
	
	@PostMapping("/signup")
	public ValidDto SignUp(@Valid @RequestBody(required=true) SignUpDto signUpDto) {
		return null;
		
	}
	
	@GetMapping("/valid/email")
	public ValidDto validEmail( 
			@Valid @NotBlank @Email @RequestParam(required=true) String authEmail) {
		return null;//eturn authService.validId(authEmail);
	}
	
	@GetMapping("/valid/id")
	public ValidDto validId(@NotBlank @RequestParam(required=true) String authId) {
		return authService.validId(authId);
	}
}