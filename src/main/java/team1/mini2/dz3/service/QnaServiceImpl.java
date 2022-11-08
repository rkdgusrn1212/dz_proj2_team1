package team1.mini2.dz3.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.NonNull;
import team1.mini2.dz3.model.qna.QuestionWithNoAuthDto;
import team1.mini2.dz3.model.qna.QuestionWithNoAuthWithIdDto;
import team1.mini2.dz3.model.qna.PageVo;
import team1.mini2.dz3.model.qna.QnaDao;
import team1.mini2.dz3.model.qna.QnaDto;
import team1.mini2.dz3.model.qna.QnaSearchKeyDto;
import team1.mini2.dz3.model.qna.QuestionWithAuthDto;
import team1.mini2.dz3.model.qna.QuestionWithAuthWithIdDto;


@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public List<QnaDto> getQnaPage(@Min(1) int page, @Valid QnaSearchKeyDto optKey) {
		if(optKey==null) {
			optKey = new QnaSearchKeyDto();
		}
		optKey.setPageVo(new PageVo(page));
		return sqlSession.getMapper(QnaDao.class).getList(optKey);
	}

	@Override
	public int getQnaPageCount(@Valid QnaSearchKeyDto optKey) {
		if(optKey==null) {
			optKey = new QnaSearchKeyDto();
		}
		return PageVo.calculatePageCount(sqlSession.getMapper(QnaDao.class).getCount(optKey));
	}

	@Override
	public int getQnaCount(@Valid QnaSearchKeyDto optKey) {
		if(optKey==null) {
			optKey = new QnaSearchKeyDto();
		}
		return sqlSession.getMapper(QnaDao.class).getCount(optKey);
	}

	@Override
	public QnaDto getQna(@Min(1) int qnaNo) {
		return sqlSession.getMapper(QnaDao.class).get(qnaNo);
	}

	
	@Override
	public boolean setAnswer(@Min(1) int qnaNo, @NotNull @Size(max=1000) String reply) {
		Map<String, Object> map = new HashMap<>();
		map.put("qnaNo", qnaNo);
		map.put("qnaReply", reply);
		return sqlSession.getMapper(QnaDao.class).setAnswer(map)>0;
	}

	@Override
	public boolean removeAnswer(@Min(1) int qnaNo) {
		return sqlSession.getMapper(QnaDao.class).removeAnswer(qnaNo)>0;
	}

	@Override
	public boolean addQuestionWithoutAuth(@Valid @NotNull QuestionWithNoAuthDto questionDto){
		return sqlSession.getMapper(QnaDao.class).addWithoutAuth(questionDto)>0;
	}

	@Override
	public boolean addQuestionWtihAuth(@Valid @NotNull QuestionWithAuthDto questionDto){
		return sqlSession.getMapper(QnaDao.class).addWithAuth(questionDto)>0;
	}

	@Override
	public boolean setQuestionWithoutAuth(@Valid @NotNull QuestionWithNoAuthWithIdDto questionDto){
		return sqlSession.getMapper(QnaDao.class).setQuestionWithoutAuth(questionDto)>0;
	}
	
	@Override
	public boolean setQuestionWithAuth(@NonNull QuestionWithAuthWithIdDto questionDto) {
		return sqlSession.getMapper(QnaDao.class).setQuestionWithAuth(questionDto)>0;
	}

	
	@Override
	public boolean removeQna(@Min(1) int qnaNo) {
		return sqlSession.getMapper(QnaDao.class).remove(qnaNo)>0;
	}
}
