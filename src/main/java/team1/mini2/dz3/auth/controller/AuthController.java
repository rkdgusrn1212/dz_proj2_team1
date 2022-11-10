package team1.mini2.dz3.auth.controller;

import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import team1.mini2.dz3.auth.core.AuthService;
import team1.mini2.dz3.auth.model.AuthDto;
import team1.mini2.dz3.auth.model.JwtDto;
import team1.mini2.dz3.auth.model.ResultDto;
import team1.mini2.dz3.auth.model.SignUpDto;
@RestController
public class AuthController {

	@Autowired
	private AuthService authService;
	
	@PostMapping("/login")
	public JwtDto login(@Valid @RequestBody(required=true) AuthDto userDto) {
		return authService.login(userDto);
	}
	
	@PostMapping("/signup")
	public ResultDto SignUp(@Valid @RequestBody(required=true) SignUpDto signUpDto) {
		return null;
		
	}
	
	@GetMapping("/valid/email")
	public ResultDto validEmail(@NotNull@Email @RequestBody(required=true) String validEmail) {
		return null;
	}
	
	@GetMapping("/valid/id")
	public ResultDto validId(@NotBlank @RequestBody(required=true) String validId) {
		return null;
	}
}
