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
		return sqlSession.getMapper(FaqDao.class).getList(getPageMap(page));
	}
	
	@Override
	public List<FaqDto> getFaqPageWithTitle(int page, String key){
		Map<String, String> map = getPageMap(page);
		map.put("key", key);
		return sqlSession.getMapper(FaqDao.class).getListWithTitle(map);
	}
	@Override
	public List<FaqDto> getFaqPageWithContent(int page, String key){
		Map<String, String> map = getPageMap(page);
		map.put("key", key);
		return sqlSession.getMapper(FaqDao.class).getListWithContent(map);
	}
	@Override
	public List<FaqDto> getFaqPageWithRegDate(int page, String key){
		Map<String, String> map = getPageMap(page);
		map.put("key", key);
		return sqlSession.getMapper(FaqDao.class).getListWithRegDate(map);
	}
	

	@Override
	public int getFaqPageWithTitleCount(String key){
		FaqDao dao = sqlSession.getMapper(FaqDao.class);
		return (int) Math.ceil(dao.getWithTitleCount(key)/10.);
	}
	@Override
	public int getFaqPageWithContentCount(String key){
		FaqDao dao = sqlSession.getMapper(FaqDao.class);
		return (int) Math.ceil(dao.getWithContentCount(key)/10.);
	}
	@Override
	public int getFaqPageWithRegDateCount(String key){
		FaqDao dao = sqlSession.getMapper(FaqDao.class);
		return (int) Math.ceil(dao.getWithRegDateCount(key)/10.);
	}
	
	@Override
	public int getFaqWithTitleCount(String key){
		return sqlSession.getMapper(FaqDao.class).getWithTitleCount(key);
	}
	@Override
	public int getFaqWithContentCount(String key){
		return sqlSession.getMapper(FaqDao.class).getWithContentCount(key);
	}
	@Override
	public int getFaqWithRegDateCount(String key){
		return sqlSession.getMapper(FaqDao.class).getWithRegDateCount(key);
	}
	
	
	public Map<String, String> getPageMap(int page) {
		int rowSize = 10;
		int start = (page*rowSize)-(rowSize -1);
		int end = page*rowSize;
		HashMap<String, String> map = new HashMap<>();
		map.put("start", Integer.toString(start));
		map.put("end", Integer.toString(end));
		return map;
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
	
	@Override
	public int getFaqPageCount() {
		FaqDao dao = sqlSession.getMapper(FaqDao.class);
		return (int) Math.ceil(dao.getCount()/10.);
	}

}
