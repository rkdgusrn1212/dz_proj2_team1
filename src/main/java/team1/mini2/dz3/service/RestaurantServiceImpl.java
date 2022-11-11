package team1.mini2.dz3.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import team1.mini2.dz3.model.RestaurantDto;
import team1.mini2.dz3.model.FaqDao;
import team1.mini2.dz3.model.NoticeDao;
import team1.mini2.dz3.model.RestaurantDao;

@Component
public class RestaurantServiceImpl implements RestaurantService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<RestaurantDto> getRestaurantPage(int page) {
		return sqlSession.getMapper(RestaurantDao.class).getList(getPageMap(page));
	}

	@Override
	public List<RestaurantDto> getRestaurantPageWithName(int page, String key) {
		Map<String, String> map = getPageMap(page);
		map.put("key", key);
		return sqlSession.getMapper(RestaurantDao.class).getListWithName(map);
	}

	@Override
	public List<RestaurantDto> getRestaurantPageWithCategory(int page, String key) {
		Map<String, String> map = getPageMap(page);
		map.put("key", key);
		return sqlSession.getMapper(RestaurantDao.class).getListWithCategory(map);
	}

	@Override
	public List<RestaurantDto> getRestaurantPageWithMenu(int page, String key) {
		Map<String, String> map = getPageMap(page);
		map.put("key", key);
		return sqlSession.getMapper(RestaurantDao.class).getListWithMenu(map);
	}

	@Override
	public List<RestaurantDto> getRestaurantPageWithSi(int page, String key) {
		Map<String, String> map = getPageMap(page);
		map.put("key", key);
		return sqlSession.getMapper(RestaurantDao.class).getListWithSi(map);
	}

	@Override
	public List<RestaurantDto> getRestaurantPageWithGu(int page, String key) {
		Map<String, String> map = getPageMap(page);
		map.put("key", key);
		return sqlSession.getMapper(RestaurantDao.class).getListWithGu(map);
	}

	@Override
	public List<RestaurantDto> getRestaurantPageWithDong(int page, String key) {
		Map<String, String> map = getPageMap(page);
		map.put("key", key);
		return sqlSession.getMapper(RestaurantDao.class).getListWithDong(map);
	}

	@Override
	public int getRestaurantPageWithNameCount(String key) {
		RestaurantDao dao = sqlSession.getMapper(RestaurantDao.class);
		return (int) Math.ceil(dao.getWithNameCount(key) / 5.);
	}

	@Override
	public int getRestaurantPageWithCategoryCount(String key) {
		RestaurantDao dao = sqlSession.getMapper(RestaurantDao.class);
		return (int) Math.ceil(dao.getWithCategoryCount(key) / 5.);
	}

	@Override
	public int getRestaurantPageWithMenuCount(String key) {
		RestaurantDao dao = sqlSession.getMapper(RestaurantDao.class);
		return (int) Math.ceil(dao.getWithMenuCount(key) / 5.);
	}

	@Override
	public int getRestaurantPageWithSiCount(String key) {
		RestaurantDao dao = sqlSession.getMapper(RestaurantDao.class);
		return (int) Math.ceil(dao.getWithSiCount(key) / 5.);
	}

	@Override
	public int getRestaurantPageWithGuCount(String key) {
		RestaurantDao dao = sqlSession.getMapper(RestaurantDao.class);
		return (int) Math.ceil(dao.getWithGuCount(key) / 5.);
	}

	@Override
	public int getRestaurantPageWithDongCount(String key) {
		RestaurantDao dao = sqlSession.getMapper(RestaurantDao.class);
		return (int) Math.ceil(dao.getWithDongCount(key) / 5.);
	}

	@Override
	public int getRestaurantWithNameCount(String key) {
		return sqlSession.getMapper(RestaurantDao.class).getWithNameCount(key);
	}

	@Override
	public int getRestaurantWithCategoryCount(String key) {
		return sqlSession.getMapper(RestaurantDao.class).getWithCategoryCount(key);
	}

	@Override
	public int getRestaurantWithMenuCount(String key) {
		return sqlSession.getMapper(RestaurantDao.class).getWithMenuCount(key);
	}

	@Override
	public int getRestaurantWithSiCount(String key) {
		return sqlSession.getMapper(RestaurantDao.class).getWithSiCount(key);
	}

	@Override
	public int getRestaurantWithGuCount(String key) {
		return sqlSession.getMapper(RestaurantDao.class).getWithGuCount(key);
	}

	@Override
	public int getRestaurantWithDongCount(String key) {
		return sqlSession.getMapper(RestaurantDao.class).getWithDongCount(key);
	}
	
	public Map<String, String> getPageMap(int page) {
		int rowSize = 5;
		int start = (page * rowSize) - (rowSize - 1);
		int end = page * rowSize;
		HashMap<String, String> map = new HashMap<>();
		map.put("start", Integer.toString(start));
		map.put("end", Integer.toString(end));
		return map;
	}

	@Override
	public RestaurantDto getRestaurant(int restaurantNo) {
		return sqlSession.getMapper(RestaurantDao.class).get(restaurantNo);
	}

	@Override
	public void addRestaurant(Map<String, String> map) {
		sqlSession.getMapper(RestaurantDao.class).add(map);
	}

	@Override
	public void removeRestaurant(int restaurantNo) {
		sqlSession.getMapper(RestaurantDao.class).remove(restaurantNo);
	}

	@Override
	public void setRestaurant(Map<String, String> map) {
		sqlSession.getMapper(RestaurantDao.class).set(map);
	}

	@Override
	public int getRestaurantCount() {
		RestaurantDao dao = sqlSession.getMapper(RestaurantDao.class);
		return dao.getCount();
	}

	@Override
	public int getRestaurantPageCount() {
		RestaurantDao dao = sqlSession.getMapper(RestaurantDao.class);
		return (int) Math.ceil(dao.getCount() / 5.);
	}

	

}
