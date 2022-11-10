package team1.mini2.dz3.model.qna;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnaDto {
	private int qnaNo; //문의번호 
	private String qnaTitle; //제목
	private String qnaContent; //내용
	private Date qnaRegDate; //날짜
	private int qnaWriter; //작성자
	private String qnaNonMember; //비회원 작성자
	private String qnaPwd; //비번
	private char qnaPublic; //공개여부 (비공개 0) 
	private String qnaReply; //답글
	private Date qnaReplyRegDate; //답변 날짜
}