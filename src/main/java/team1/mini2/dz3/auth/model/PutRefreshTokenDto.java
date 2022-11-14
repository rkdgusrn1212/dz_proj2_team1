package team1.mini2.dz3.auth.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import team1.mini2.dz3.auth.core.ValidationProperties;

@Data
@AllArgsConstructor
public class PutRefreshTokenDto {
	@NotNull
	@Pattern(regexp = ValidationProperties.AUTH_ID_REGEX)
	private String authId;
	@NotNull
	@Size(max = 60, min = 60)
	private String refreshToken;
}