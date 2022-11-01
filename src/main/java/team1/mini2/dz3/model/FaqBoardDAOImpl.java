package team1.mini2.dz3.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import team1.mini2.dz3.model.FaqBoardDAO;
import team1.mini2.dz3.model.FaqBoardDTO;


@Component
public class FaqBoardDAOImpl implements FaqBoardDAO {
	
	
	@Autowired
	private SqlSession sqlsession; //SqlSessionTemplate

	@Override
	public FaqBoardDTO getdetail(int notice_no) {
		// TODO Auto-generated method stub
		FaqBoardDAO boardDAO = sqlsession.getMapper(FaqBoardDAO.class);
		return boardDAO.getdetail(notice_no);
		
	}

	@Override
	public List<FaqBoardDTO> getBoardList(HashMap map) {
		// TODO Auto-generated method stub
		FaqBoardDAO boardDAO = sqlsession.getMapper(FaqBoardDAO.class);
		return boardDAO.getBoardList(map);
		
	}

	@Override
	public int getBoardCount() {
		// TODO Auto-generated method stub
		FaqBoardDAO boardDAO = sqlsession.getMapper(FaqBoardDAO.class);
		return boardDAO.getBoardCount();
	}

	@Override
	public int selectSearchCount() {
		// TODO Auto-generated method stub
		FaqBoardDAO boardDAO = sqlsession.getMapper(FaqBoardDAO.class);
		return boardDAO.selectSearchCount();
		
	}

	@Override
	public List<FaqBoardDTO> getselectSearch(HashMap map) {
		// TODO Auto-generated method stub
		FaqBoardDAO boardDAO = sqlsession.getMapper(FaqBoardDAO.class);
		return boardDAO.getselectSearch(map);
	}
	
	


}
