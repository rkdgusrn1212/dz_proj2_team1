package team1.mini2.dz3.auth.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import team1.mini2.dz3.auth.AuthDto;
import team1.mini2.dz3.auth.AuthServiceImpl;
import team1.mini2.dz3.auth.JwtDto;

@RestController
public class AuthController {

	@Autowired
	private AuthServiceImpl authService;
	
	@PostMapping("/login")
	public JwtDto login(@Valid @RequestBody(required=true) AuthDto userDto) {
		return authService.login(userDto);
	}
}
