package team1.mini2.dz3.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import team1.mini2.dz3.model.FaqDao;
import team1.mini2.dz3.model.FaqDto;

@Component
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<FaqDto> getFaqPage(int page) {
		if(page<=0) {//페이지가 0보다 같거나 작을순 없음.
			return null;
		}
		FaqDao dao = sqlSession.getMapper(FaqDao.class);
		int rowSize = 10;
		int cnt = dao.getCount();
		int start = (page*rowSize)-(rowSize -1);
		int end = Math.max(cnt, page*rowSize);
		if(start>cnt) {//시작 행 번호가 행 개수보다 크면 해당 페이지 없음.
			return null;
		}
		HashMap<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return dao.getList(map);
	}
	
	@Override
	public FaqDto getFaq(int faqNo) {
		return sqlSession.getMapper(FaqDao.class).get(faqNo);
	}

	@Override
	public void addFaq(Map<String, String> map) {
		sqlSession.getMapper(FaqDao.class).add(map);
	}

	@Override
	public void removeFaq(int faqNo) {
		sqlSession.getMapper(FaqDao.class).remove(faqNo);
	}

	@Override
	public void setFaq(Map<String, String> map) {
		sqlSession.getMapper(FaqDao.class).set(map);
	}

	@Override
	public int getFaqCount() {
		FaqDao dao = sqlSession.getMapper(FaqDao.class);
		return dao.getCount();
	}

}
