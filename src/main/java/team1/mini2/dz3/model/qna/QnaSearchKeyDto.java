package team1.mini2.dz3.model.qna;

import java.util.Date;

import javax.validation.constraints.Null;
import javax.validation.constraints.Size;

import lombok.Data;
/**
 * 검색 조건 DTO, 모든 검색 조건들을 60자 이내로 제한한다.
 */
@Data
public class QnaSearchKeyDto {
	@Size(min=1, max=60)
	private String titleKey;
	@Size(min=1, max=60)
	private String contentKey;
	/**
	 * {@code page}는 서비스에 주입될 때 null이어야한다.
	 */
	@Null
	private PageVo pageVo;
	private String dateStart;
	private String dateEnd;
	/**
	 * {@code writerKey} 는 비인증, 인증 작성자 모두에 대한 키 이다. 
	 */
	@Size(min=1,max=60)
	private String writerKey;
	@Size(min=1,max=60)
	private String replyKey;
	private Date replyDateStart;
	private Date replyDateEnd;
}
