package team1.mini2.dz3.auth.model;

public interface AuthDao {
	AuthVo getById(String authId);
	AuthVo getByEmail(String authEmail);
	int deleteEmailCode(String authEmail);
	int addEmailCode(PutEmailCodeDto codeDto);
	int putAuthUser(SignUpDto signUpDto);
	int putRefreshToken(PutRefreshTokenDto updateRefreshTokenDto);
	String getRefreshToken(String authId);
	AuthVo get(String id);
}