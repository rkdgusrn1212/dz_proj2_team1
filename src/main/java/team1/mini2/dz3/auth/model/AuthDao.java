package team1.mini2.dz3.auth.model;

public interface AuthDao {
	AuthVo get(String authId);
	AuthVo getByEmail(String authEmail);
}