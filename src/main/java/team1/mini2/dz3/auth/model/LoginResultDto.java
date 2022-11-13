package team1.mini2.dz3.auth.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class LoginResultDto {
	
	public static final int SUCCESS = 0;
	public static final int NO_USER = 1;
	public static final int PWD_NOT_MATCH = 2;
	
	private String grantType;
	private String accessToken;
	private int result;
}
