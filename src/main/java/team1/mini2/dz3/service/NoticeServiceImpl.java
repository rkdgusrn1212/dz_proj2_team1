package team1.mini2.dz3.service;

import java.util.HashMap;
import java.util.List;

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
	public List<NoticeDto> getNoticeList(int page) {
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		int rowSize = 10;
		int cnt = dao.getCount();
		int start = (page*rowSize)-(rowSize -1);
		int end = Math.max(cnt, page*rowSize);
		HashMap<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return dao.getList(map);
	}

	@Override
	public void addNotice() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteNotice() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateNotice(String title, String content) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getNoticeCount() {
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		return dao.getCount();
	}

}
