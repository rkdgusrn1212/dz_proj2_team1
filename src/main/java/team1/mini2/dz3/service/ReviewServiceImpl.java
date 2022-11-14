package team1.mini2.dz3.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import team1.mini2.dz3.model.FaqDao;
import team1.mini2.dz3.model.ReviewDao;
import team1.mini2.dz3.model.ReviewDto;

@Component
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ReviewDto> getReviewPage(int page) {
		return sqlSession.getMapper(ReviewDao.class).getList(getPageMap(page));
	}

	@Override
	public List<ReviewDto> getReviewPageWithRestaurant(int page, String key) {
		Map<String, String> map = getPageMap(page);
		map.put("key", key);
		return sqlSession.getMapper(ReviewDao.class).getListWithRestaurant(map);
	}
	@Override
	public List<ReviewDto> getReviewPageWithWriter(int page, String key) {
		Map<String, String> map = getPageMap(page);
		map.put("key", key);
		return sqlSession.getMapper(ReviewDao.class).getListWithWriter(map);
	}

	@Override
	public List<ReviewDto> getReviewPageWithStar(int page, String key) {
		Map<String, String> map = getPageMap(page);
		map.put("key", key);
		return sqlSession.getMapper(ReviewDao.class).getListWithStar(map);
	}

	@Override
	public List<ReviewDto> getReviewPageWithRegDate(int page, String key) {
		Map<String, String> map = getPageMap(page);
		map.put("key", key);
		return sqlSession.getMapper(ReviewDao.class).getListWithRegDate(map);
	}

	@Override
	public int getReviewPageWithRestaurantCount(String key) {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		return (int) Math.ceil(dao.getWithRestaurantCount(key)/3.);
	}

	@Override
	public int getReviewPageWithWriterCount(String key) {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		return (int) Math.ceil(dao.getWithWriterCount(key)/3.);
	}

	@Override
	public int getReviewPageWithStarCount(String key) {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		return (int) Math.ceil(dao.getWithStarCount(key)/3.);
	}

	@Override
	public int getReviewPageWithRegDateCount(String key) {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		return (int) Math.ceil(dao.getWithRegDateCount(key)/3.);
	}

	@Override
	public int getReviewWithRestaurantCount(String key) {
		return sqlSession.getMapper(ReviewDao.class).getWithRestaurantCount(key);
	}

	@Override
	public int getReviewWithWriterCount(String key) {
		return sqlSession.getMapper(ReviewDao.class).getWithWriterCount(key);
	}

	@Override
	public int getReviewWithStarCount(String key) {
		return sqlSession.getMapper(ReviewDao.class).getWithStarCount(key);
	}

	@Override
	public int getReviewWithRegDateCount(String key) {
		return sqlSession.getMapper(ReviewDao.class).getWithRegDateCount(key);
	}
	public Map<String, String> getPageMap(int page) {
		int rowSize = 3;
		int start = (page*rowSize)-(rowSize -1);
		int end = page*rowSize;
		HashMap<String, String> map = new HashMap<>();
		map.put("start", Integer.toString(start));
		map.put("end", Integer.toString(end));
		return map;
	}
	@Override
	public ReviewDto getReview(int reviewNo) {
		return sqlSession.getMapper(ReviewDao.class).get(reviewNo);
	}

	@Override
	public void addReview(Map<String, String> map) {
		sqlSession.getMapper(ReviewDao.class).add(map);
	}

	@Override
	public void removeReview(int reviewNo) {
		sqlSession.getMapper(ReviewDao.class).remove(reviewNo);
	}

	@Override
	public void setReview(Map<String, String> map) {
		sqlSession.getMapper(ReviewDao.class).set(map);
	}

	@Override
	public int getReviewCount() {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		return dao.getCount();
	}

	@Override
	public int getReviewPageCount() {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		return (int) Math.ceil(dao.getCount()/3.);
	}
	
	@Override
	public double getReviewAvg(int id) {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		//System.out.println(dao.getAvg(id));
		
		return dao.getAvg(id);
		
		
	}

}
