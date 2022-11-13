package team1.mini2.dz3.auth.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class AccessTokenDto {
	private String grantType;
	private String accessToken;
}
