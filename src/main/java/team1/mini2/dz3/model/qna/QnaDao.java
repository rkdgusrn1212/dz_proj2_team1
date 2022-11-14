package team1.mini2.dz3.model.qna;

import java.util.Map;
import java.util.List;

public interface QnaDao {
	List<QnaDto> getList(QnaSearchKeyDto dto);
	int getCount(QnaSearchKeyDto dto);
	QnaDto get(int qnaNo);
	int addWithoutAuth(QuestionWithNoAuthDto dto);
	int addWithAuth(QuestionWithAuthDto dto);
	int remove(int noticeNo);
	int removeAnswer(int noticeNo);
	int setQuestionWithoutAuth(QuestionWithNoAuthWithIdDto dto);
	int setQuestionWithAuth(QuestionWithAuthWithIdDto dto);
	int setAnswer(Map<String, Object> map);
}