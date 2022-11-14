package team1.mini2.dz3.auth.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import lombok.Data;
import team1.mini2.dz3.auth.core.ValidationProperties;

@Data
public class AuthDto {
	@NotNull
	@Pattern(regexp= ValidationProperties.AUTH_ID_REGEX)
    private String authId;
	@NotNull//영문, 특문, 숫자 하나씩 들어간 13~60짜리 문자.
	@Pattern(regexp = ValidationProperties.AUTH_PWD_REGEX)
    private String authPwd;
}