package team1.mini2.dz3.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import team1.mini2.dz3.model.MenuDto;
import team1.mini2.dz3.model.MenuDao;

@Component
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<MenuDto> MenuListget(int restaurantId) {
		// TODO Auto-generated method stub
		MenuDao dao = sqlSession.getMapper(MenuDao.class);
		return dao.getMenuList(restaurantId);
	}
	
	@Override
	public int MenuCountget(int restaurantId) {
		// TODO Auto-generated method stub
		MenuDao dao = sqlSession.getMapper(MenuDao.class);
		return dao.getMenuCount(restaurantId);
	}
	
}
