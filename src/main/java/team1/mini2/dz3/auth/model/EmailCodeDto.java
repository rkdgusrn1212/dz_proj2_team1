package team1.mini2.dz3.auth.model;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import lombok.Data;
import team1.mini2.dz3.auth.core.ValidationProperties;

@Data
public class EmailCodeDto {
	@NotNull
	@Pattern(regexp = ValidationProperties.AUTH_EMAIL_REGEX)
	private String email;
	
	@NotBlank
	@Pattern(regexp = ValidationProperties.AUTH_PWD_REGEX)
	private String code;
}
