package team1.mini2.dz3.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import team1.mini2.dz3.model.NoticeDao;
import team1.mini2.dz3.model.NoticeDto;

@Component
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<NoticeDto> getNoticePage(int page) {
		return sqlSession.getMapper(NoticeDao.class).getList(getPageMap(page));
	}
	
	@Override
	public List<NoticeDto> getNoticePageWithTitle(int page, String key){
		Map<String, String> map = getPageMap(page);
		map.put("key", key);
		return sqlSession.getMapper(NoticeDao.class).getListWithTitle(map);
	}
	@Override
	public List<NoticeDto> getNoticePageWithContent(int page, String key){
		Map<String, String> map = getPageMap(page);
		map.put("key", key);
		return sqlSession.getMapper(NoticeDao.class).getListWithContent(map);
	}
	@Override
	public List<NoticeDto> getNoticePageWithRegDate(int page, String key){
		Map<String, String> map = getPageMap(page);
		map.put("key", key);
		return sqlSession.getMapper(NoticeDao.class).getListWithRegDate(map);
	}

	@Override
	public int getNoticePageWithTitleCount(String key){
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		return (int) Math.ceil(dao.getWithTitleCount(key)/10.);
	}
	@Override
	public int getNoticePageWithContentCount(String key){
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		return (int) Math.ceil(dao.getWithContentCount(key)/10.);
	}
	@Override
	public int getNoticePageWithRegDateCount(String key){
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		return (int) Math.ceil(dao.getWithRegDateCount(key)/10.);
	}
	

	@Override
	public int getNoticeWithTitleCount(String key){
		return sqlSession.getMapper(NoticeDao.class).getWithTitleCount(key);
	}
	@Override
	public int getNoticeWithContentCount(String key){
		return sqlSession.getMapper(NoticeDao.class).getWithContentCount(key);
	}
	@Override
	public int getNoticeWithRegDateCount(String key){
		return sqlSession.getMapper(NoticeDao.class).getWithRegDateCount(key);
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
	public NoticeDto getNotice(int noticeNo) {
		return sqlSession.getMapper(NoticeDao.class).get(noticeNo);
	}

	@Override
	public void addNotice(Map<String, String> map) {
		sqlSession.getMapper(NoticeDao.class).add(map);
	}

	@Override
	public void removeNotice(int noticeNo) {
		sqlSession.getMapper(NoticeDao.class).remove(noticeNo);
	}

	@Override
	public void setNotice(Map<String, String> map) {
		sqlSession.getMapper(NoticeDao.class).set(map);
	}

	@Override
	public int getNoticeCount() {
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		return dao.getCount();
	}
	
	@Override
	public int getNoticePageCount() {
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		return (int) Math.ceil(dao.getCount()/10.);
	}
}
