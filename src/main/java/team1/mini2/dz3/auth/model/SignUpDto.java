package team1.mini2.dz3.auth.model;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import lombok.Data;
import team1.mini2.dz3.auth.core.ValidationProperties;

@Data
public class SignUpDto{
	@NotBlank
	@Pattern(regexp=ValidationProperties.AUTH_ID_REGEX)
	String authId;
	@NotBlank
	@Pattern(regexp=ValidationProperties.AUTH_PWD_REGEX)
	String authPwd;
	@NotBlank
	@Pattern(regexp=ValidationProperties.NAME_REGEX)
	String authName;
	@Email
	@NotNull
	String authEmail;
	@NotBlank
	@Pattern(regexp = ValidationProperties.AUTH_PWD_REGEX)
	String code;
}