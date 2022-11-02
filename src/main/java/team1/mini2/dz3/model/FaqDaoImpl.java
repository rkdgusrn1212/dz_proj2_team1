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
public class FaqDaoImpl implements FaqDao {
	
	
	@Autowired
	private SqlSession sqlsession; //SqlSessionTemplate

	@Override
	public FaqDto faqgetdetail(int faq_no) {
		// TODO Auto-generated method stub
		FaqDao boardDAO = sqlsession.getMapper(FaqDao.class);
		return boardDAO.faqgetdetail(faq_no);
		
	}

	@Override
	public List<FaqDto> faqgetBoardList(HashMap map) {
		// TODO Auto-generated method stub
		FaqDao boardDAO = sqlsession.getMapper(FaqDao.class);
		return boardDAO.faqgetBoardList(map);
		
	}

	@Override
	public int faqgetBoardCount() {
		// TODO Auto-generated method stub
		FaqDao boardDAO = sqlsession.getMapper(FaqDao.class);
		return boardDAO.faqgetBoardCount();
	}

	@Override
	public int faqselectSearchCount(HashMap map) {
		// TODO Auto-generated method stub
		FaqDao boardDAO = sqlsession.getMapper(FaqDao.class);
		return boardDAO.faqselectSearchCount(map);
		
	}

	@Override
	public List<FaqDto> faqgetselectSearch(HashMap map) {
		// TODO Auto-generated method stub
		FaqDao boardDAO = sqlsession.getMapper(FaqDao.class);
		return boardDAO.faqgetselectSearch(map);
	}
	
	


}
