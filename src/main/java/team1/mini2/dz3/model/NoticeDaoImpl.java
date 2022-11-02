package team1.mini2.dz3.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import team1.mini2.dz3.model.FaqDao;
import team1.mini2.dz3.model.FaqDto;


@Component
public class NoticeDaoImpl implements NoticeDao {
	
	
	@Autowired
	private SqlSession sqlsession; //SqlSessionTemplate

	@Override
	public NoticeDto noticegetdetail(int notice_no) {
		// TODO Auto-generated method stub
		NoticeDao boardDAO = sqlsession.getMapper(NoticeDao.class);
		return boardDAO.noticegetdetail(notice_no);
		
	}

	@Override
	public List<NoticeDto> noticegetBoardList(HashMap map) {
		// TODO Auto-generated method stub
		NoticeDao boardDAO = sqlsession.getMapper(NoticeDao.class);
		return boardDAO.noticegetBoardList(map);
		
	}

	@Override
	public int noticegetBoardCount() {
		// TODO Auto-generated method stub
		NoticeDao boardDAO = sqlsession.getMapper(NoticeDao.class);
		return boardDAO.noticegetBoardCount();
	}

	@Override
	public int noticeselectSearchCount(HashMap map) {
		// TODO Auto-generated method stub
		NoticeDao boardDAO = sqlsession.getMapper(NoticeDao.class);
		return boardDAO.noticeselectSearchCount(map);
		
	}

	@Override
	public List<NoticeDto> noticegetselectSearch(HashMap map) {
		// TODO Auto-generated method stub
		NoticeDao boardDAO = sqlsession.getMapper(NoticeDao.class);
		return boardDAO.noticegetselectSearch(map);
	}
	
	


}
