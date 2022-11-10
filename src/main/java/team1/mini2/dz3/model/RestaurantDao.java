package team1.mini2.dz3.model;

import java.util.Map;
import java.util.List;

public interface RestaurantDao {
	List<RestaurantDto> getList(Map<String, String> map);
	List<RestaurantDto> getListWithName(Map<String, String> map);
	List<RestaurantDto> getListWithCategory(Map<String, String> map);
	int getWithNameCount(String key);
	int getWithCategoryCount(String key);

	RestaurantDto get(int restaurantNo);
	void add(Map<String, String> map);
	void remove(int restaurantNo);
	void set(Map<String,String> map);
	int getCount();
	
	
}
