package team1.mini2.dz3.model;

import java.util.Map;
import java.util.List;

public interface QnaDao {
	List<QnaDto> getList(Map<String, String> map);//작성자(비회원 포함) 기준 쿼리.
	int getCount(Map<String, String> map);
	QnaDto get(int qnaNo);
	int add(Map<String, String> map);
	int remove(int noticeNo);
	int removeAnswer(int noticeNo);
	int setQuestion(Map<String, String> map);
	int setAnswer(Map<String, String> map);
}