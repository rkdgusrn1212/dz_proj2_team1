package team1.mini2.dz3.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.NonNull;
import team1.mini2.dz3.controller.api.exception.NotMatchMapException;
import team1.mini2.dz3.model.QnaDao;
import team1.mini2.dz3.model.QnaDto;

@Component
public class QnaServiceImpl implements QnaService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<QnaDto> getQnaPage(int page, Map<String, String> optMap) throws NotMatchMapException {
		Map<String, String> map = new HashMap<>();
		String[] keys = {"qnaTitleKey", "qnaContentKey", "qnaPublicKey", "qnaWriterKey", "qnaReplyKey", "dateStart", "dateEnd", "replyDateStart", "replyDateEnd"};
		for(String key : keys) {
			String val = optMap.get(key);
			if(val!=null) {
				map.put(key, val);
			}
		}
		if(optMap.size()!=map.size()) {
			throw new NotMatchMapException();//잘못된 컬럼명 입력은 실행에는 문제없지만 사용자 편의를 위해 오류처리.
		}
		map.putAll(PageCalculator.getPageIdx(page));
		return sqlSession.getMapper(QnaDao.class).getList(map);
	}

	@Override
	public int getQnaPageCount(Map<String, String> optMap) throws NotMatchMapException {
		Map<String, String> map = new HashMap<>();
		String[] keys = {"qnaTitleKey", "qnaContentKey", "qnaPublicKey", "qnaWriterKey", "qnaReplyKey", "dateStart", "dateEnd", "replyDateStart", "replyDateEnd"};
		for(String key : keys) {
			String val = optMap.get(key);
			if(val!=null) {
				map.put(key, val);
			}
		}
		if(optMap.size()!=map.size()) {
			throw new NotMatchMapException();//잘못된 컬럼명 입력은 실행에는 문제없지만 사용자 편의를 위해 오류처리.
		}
		return PageCalculator.getPageCount(sqlSession.getMapper(QnaDao.class).getCount(optMap));
	}

	@Override
	public int getQnaCount(Map<String, String> optMap) throws NotMatchMapException {
		Map<String, String> map = new HashMap<>();
		String[] keys = {"qnaTitleKey", "qnaContentKey", "qnaPublicKey", "qnaWriterKey", "qnaReplyKey", "dateStart", "dateEnd", "replyDateStart", "replyDateEnd"};
		for(String key : keys) {
			String val = optMap.get(key);
			if(val!=null) {
				map.put(key, val);
			}
		}
		if(optMap.size()!=map.size()) {
			throw new NotMatchMapException();//잘못된 컬럼명 입력은 실행에는 문제없지만 사용자 편의를 위해 오류처리.
		}
		return sqlSession.getMapper(QnaDao.class).getCount(optMap);
	}

	@Override
	public QnaDto getQna(int qnaNo) {
		return sqlSession.getMapper(QnaDao.class).get(qnaNo);
	}

	@Override
	public boolean addAnswer(int qnaNo, @NonNull String reply) {
		Map<String, String> map = new HashMap<>();
		map.put("qnaReply", reply);
		map.put("qnaNo", Integer.toString(qnaNo));
		return sqlSession.getMapper(QnaDao.class).setAnswer(map)>0;
	}

	@Override
	public boolean removeAnswer(int qnaNo) {
		return sqlSession.getMapper(QnaDao.class).removeAnswer(qnaNo)>0;
	}

	@Override
	public boolean setAnswer(int qnaNo, @NonNull String reply) {
		Map<String, String> map = new HashMap<>();
		map.put("qnaReply", reply);
		map.put("qnaNo", Integer.toString(qnaNo));
		return sqlSession.getMapper(QnaDao.class).setQuestion(map)>0;
	}

	@Override
	public boolean addQuestionWithoutAuth(@NonNull Map<String, String> questionMap) throws NotMatchMapException {
		Map<String, String> map = new HashMap<>();
		String[] keys = {"qnaTitle", "qnaContent", "qnaPublic", "qnaNonMember", "qnaPwd"};
		for(String key : keys) {
			String val = questionMap.get(key);
			if(val==null) {
				throw new NotMatchMapException();
			}
			map.put(key, val);
		}
		if(map.size()!=questionMap.size()) {
			throw new NotMatchMapException();//잘못된 컬럼명 제거
		}
		return sqlSession.getMapper(QnaDao.class).add(map)>0;
	}

	@Override
	public boolean addQuestionWtihAuth(@NonNull Map<String, String> questionMap) throws NotMatchMapException {
		Map<String, String> map = new HashMap<>();
		String[] keys = {"qnaTitle", "qnaContent", "qnaPublic", "qnaWriter"};
		for(String key : keys) {
			String val = questionMap.get(key);
			if(val==null) {
				throw new NotMatchMapException();
			}
			map.put(key, val);
		}
		if(map.size()!=questionMap.size()) {
			throw new NotMatchMapException();//잘못된 컬럼명 아웃
		}
		return sqlSession.getMapper(QnaDao.class).add(map)>0;
	}

	@Override
	public boolean setQuestionWithoutAuth(int qnaNo, @NonNull Map<String, String> questionMap) throws NotMatchMapException {
		Map<String, String> map = new HashMap<>();
		String[] keys = {"qnaTitle", "qnaContent", "qnaPublic", "qnaNonMember", "qnaPwd"};
		for(String key : keys) {
			String val = questionMap.get(key);
			if(val!=null) {
				map.put(key, val);
			}
		}
		if(map.size()<1||map.size()!=questionMap.size()) {//잘못된 컬럼명도 걸러냄
			throw new NotMatchMapException();
		}
		map.put("qnaNo", Integer.toString(qnaNo));
		return sqlSession.getMapper(QnaDao.class).setQuestion(map)>0;
	}

	@Override
	public boolean setQuestionWithAuth(int qnaNo, @NonNull Map<String, String> questionMap) throws NotMatchMapException {
		Map<String, String> map = new HashMap<>();
		String[] keys = {"qnaTitle", "qnaContent", "qnaPublic"};
		for(String key : keys) {
			String val = questionMap.get(key);
			if(val!=null) {
				map.put(key, val);
			}
		}
		if(map.size()<1||map.size()!=questionMap.size()) {
			throw new NotMatchMapException();
		}
		map.put("qnaNo", Integer.toString(qnaNo));
		return sqlSession.getMapper(QnaDao.class).setQuestion(map)>0;
	}

	@Override
	public boolean removeQna(int qnaNo) {
		return sqlSession.getMapper(QnaDao.class).remove(qnaNo)>0;
	}
}
