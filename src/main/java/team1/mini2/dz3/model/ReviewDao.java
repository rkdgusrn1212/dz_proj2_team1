package team1.mini2.dz3.model;

import java.util.Map;
import java.util.List;

public interface ReviewDao {
	List<ReviewDto> getList(Map<String, String> map);
	List<ReviewDto> getListWithRestaurant(Map<String, String> map);
	List<ReviewDto> getListWithWriter(Map<String, String> map);
	List<ReviewDto> getListWithStar(Map<String, String> map);
	List<ReviewDto> getListWithRegDate(Map<String, String> map);
	
	int getWithRestaurantCount(String key);
	int getWithWriterCount(String key);
	int getWithStarCount(String key);
	int getWithRegDateCount(String key);

	int getCount();
	ReviewDto get(int reviewNo);

	void add(Map<String, String> map);
	void remove(int reviewNo);
	void set(Map<String, String> map);
	double getAvg(int id);
}
