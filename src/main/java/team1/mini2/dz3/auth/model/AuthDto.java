package team1.mini2.dz3.auth.model;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class AuthDto {
	@NotBlank
    private String authId;
	@NotBlank
    private String authPwd;
}