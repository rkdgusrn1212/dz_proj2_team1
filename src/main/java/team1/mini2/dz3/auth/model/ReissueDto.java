package team1.mini2.dz3.auth.model;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class ReissueDto {
	@NotBlank
	String refreshToken;
}
