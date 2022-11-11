package team1.mini2.dz3.auth.core;

public class ValidationProperties {
	public static final String AUTH_PWD_REGEX = "^(?=.*[A-Za-z])(?=.*\\\\d)(?=.*[@$!%*#?&])[A-Za-z\\\\d@$!%*#?&]{13,60}$";
	public static final String AUTH_PWD_REGEX_DESC = "영문자, 숫자, 특수문자가 각각 하나 이상 포함된 13자 이상 60자 이하의 문자열";
	public static final String AUTH_ID_REGEX = "^[a-zA-Z0-9_]{6,60}$";
	public static final String AUTH_ID_REGEX_DESC = "영문자, 숫자 또는 '_'로 구성된 6자 이상 60자 이하의 문자열";
	public static final String NAME_REGEX = "^.{6,60}$";
	public static final String NAME_REGEX_DESC = "2자이상 60자 이하의 문자열";
	public static final String AUTH_EMAIL_REGEX = "^[a-zA-Z0-9+-//!#$%&'*+-/=?^_`{|}~_.]+@[a-zA-Z0-9-]+\\\\.[a-zA-Z0-9-.]+$";
	public static final String AUTH_EMAIL_REGEX_DESC = "@ 앞에 '+-/!#$%&'*+-/=?^_`{|}~_. 영문자 및 숫자' @ 뒤에는 '영문자, 숫자, -, .'의 도메인 형식으로 구성된 문자열";
}
