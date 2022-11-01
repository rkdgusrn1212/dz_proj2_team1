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
		if(page<=0) {//페이지가 0보다 같거나 작을순 없음.
			return null;
		}
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
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

}
