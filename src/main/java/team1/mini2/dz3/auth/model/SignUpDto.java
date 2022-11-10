package team1.mini2.dz3.auth.model;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class SignUpDto {
	@NotBlank
	String authId;
	@NotBlank
	String authPwd;
	@NotBlank
	String userName;
	@Email
	@NotNull
	String email;
}