package team1.mini2.dz3.model.qna;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnaDto {

	private int qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaRegDate;
	private int qnaWriter;
	private String qnaNonMember;
	private String qnaPwd;
	private char qnaPublic;
	private String qnaReply;
	private Date qnaReplyRegDate;
}