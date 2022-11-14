package team1.mini2.dz3.auth.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class SignUpResultDto {
	
	public static final int SUCCESS = 0;
	public static final int CODE_FAIL = 1;
	public static final int FAIL = 2;
	public static final int ID_FAIL = 3;
	public static final int EMAIL_FAIL = 4;
	
	private int result;
}