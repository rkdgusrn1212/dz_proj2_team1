package team1.mini2.dz3.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import team1.mini2.dz3.model.RestaurantDto;
import team1.mini2.dz3.model.RestaurantDao;

@Component
public class RestaurantServiceImpl implements RestaurantService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<RestaurantDto> getRestaurantPage(int page) {
		return sqlSession.getMapper(RestaurantDao.class).getList(getPageMap(page));
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
	public List<RestaurantDto> getRestaurantPageWithName(int page, String key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RestaurantDto> getRestaurantPageWithCategory(int page, String key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getRestaurantPageWithNameCount(String key) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getRestaurantPageWithCategoryCount(String key) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public RestaurantDto getRestaurant(int restaurantNo) {
		return sqlSession.getMapper(RestaurantDao.class).get(restaurantNo);
	}

	@Override
	public void addRestaurant(Map<String, String> map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeRestaurant(int restaurantNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setRestaurant(Map<String, String> map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getRestaurantCount() {
		RestaurantDao dao = sqlSession.getMapper(RestaurantDao.class);
		return dao.getCount();
	}

	@Override
	public int getRestaurantPageCount() {
		RestaurantDao dao = sqlSession.getMapper(RestaurantDao.class);
		return (int) Math.ceil(dao.getCount()/10.);
	}
	
	
}
