package team1.mini2.dz3.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class NoticeDaoImpl implements NoticeDao {
	
	@Autowired
	private SqlSession sqlsession; // SqlSessionTemplate

	@Override
	public List<NoticeDto> getList(Map<String, String> map) {
		NoticeDao noticeDao = sqlsession.getMapper(NoticeDao.class);
		return noticeDao.getList(map);
	}

	@Override
	public List<NoticeDto> getListWithTitle(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<NoticeDto> getListWithContent(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<NoticeDto> getListWithRegDate(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<NoticeDto> getListWithWriter(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public NoticeDto get(int noticeNo) {
		NoticeDao noticeDao = sqlsession.getMapper(NoticeDao.class);
		return noticeDao.get(noticeNo);
	}

	@Override
	public int getCount() {
		NoticeDao noticeDao = sqlsession.getMapper(NoticeDao.class);
		return noticeDao.getCount();
	}

	@Override
	public void add(Map<String, String> map) {
		// TODO Auto-generated method stub

	}

	@Override
	public void remove(int noticeNo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void set(Map<String, String> map) {
		// TODO Auto-generated method stub

	}


}
