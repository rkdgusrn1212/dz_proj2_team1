package team1.mini2.dz3.auth.core;

class JwtProperties {
	static final String SECRET_KEY = "비밀값입니다";
	static final String REFRESH_SECRET_KEY = "이것도 비밀입니다";
	static final int EXPIRE_MIN = 60;
	static final int REFRESH_EXPIRE_MIN = 43200;
	static final String ISSUER = "tasty-way";
	static final String KEY_ROLES = "roles";
}
