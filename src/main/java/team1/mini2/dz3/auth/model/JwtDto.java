package team1.mini2.dz3.auth.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class JwtDto {
	
	public static final int SUCCESS = 0;
	public static final int CLAIM_ERROR = 1;
	public static final int GRANT_ERROR = 2;
	public static final int USER_ERROR = 3;
	public static final int PWD_ERROR = 4;
	
    private String grantType;
    private String accessToken;
    private String refreshToken;
    private int result;
}