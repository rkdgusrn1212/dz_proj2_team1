package team1.mini2.dz3.model.member;

import javax.validation.constraints.Null;
import javax.validation.constraints.Pattern;

import lombok.Data;
import team1.mini2.dz3.auth.core.ValidationProperties;

@Data
public class MemberSearchKeyDto {

	@Pattern(regexp=ValidationProperties.NAME_REGEX)
	private String nameKey;
	@Pattern(regexp=ValidationProperties.AUTH_EMAIL_REGEX)
	private String emailKey;
	/**
	 * {@code page}는 서비스에 주입될 때 null이어야한다.
	 */
	@Null
	private PageVo pageVo;
	@Pattern(regexp=ValidationProperties.AUTH_ID_REGEX)
	private String idKey;
}
