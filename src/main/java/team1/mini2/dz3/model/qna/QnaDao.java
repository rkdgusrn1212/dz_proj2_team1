package team1.mini2.dz3.model.qna;

import java.util.Map;
import java.util.List;

public interface QnaDao {
	List<QnaDto> getList(QnaSearchKeyDto dto); //리스트 받아옴
 	int getCount(QnaSearchKeyDto dto);  
	QnaDto get(int qnaNo); //번호가져옴
	int addWithoutAuth(QuestionWithNoAuthDto dto); //비회원 작성자
	int addWithAuth(QuestionWithAuthDto dto); //회원 작성자
	int remove(int noticeNo); //noticeNo 번호로 삭제
	int removeAnswer(int noticeNo);
	int setQuestionWithoutAuth(QuestionWithNoAuthWithIdDto dto); //비회원 qnaNo 받아옴 수정
	int setQuestionWithAuth(QuestionWithAuthWithIdDto dto);//회원 qnaNo받아옴 수정
	int setAnswer(Map<String, Object> map); //답변들 가져오기
}