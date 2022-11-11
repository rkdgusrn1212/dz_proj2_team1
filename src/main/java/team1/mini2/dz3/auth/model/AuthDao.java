package team1.mini2.dz3.auth.model;

public interface AuthDao {
	AuthVo get(String authId);
	AuthVo getByEmail(String authEmail);
	int deleteEmailCode(String authEmail);
	int addEmailCode(PutEmailCodeDto codeDto);
	int putAuthUser(SignUpDto signUpDto);
}