package team1.mini2.dz3.auth.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import lombok.AllArgsConstructor;
import team1.mini2.dz3.auth.core.ValidationProperties;

@AllArgsConstructor
public class PutEmailCodeDto {
	
	@NotNull
	@Pattern(regexp = ValidationProperties.AUTH_ID_REGEX)
	String authId;
	
	@NotNull
	@Pattern(regexp = ValidationProperties.AUTH_PWD_REGEX)
	String authPwd;

	@NotNull
	String authAuthority;

	@NotNull
	@Pattern(regexp = ValidationProperties.AUTH_PWD_REGEX)
	String authEmail;
}