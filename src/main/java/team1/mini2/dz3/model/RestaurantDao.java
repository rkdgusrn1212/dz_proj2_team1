package team1.mini2.dz3.model;

import java.util.Map;
import java.util.List;

public interface RestaurantDao {
	List<RestaurantDto> getList(Map<String, String> map);
	List<RestaurantDto> getListWithName(Map<String, String> map);
	List<RestaurantDto> getListWithCategory(Map<String, String> map);
	List<RestaurantDto> getListWithMenu(Map<String, String> map);
	List<RestaurantDto> getListWithSi(Map<String, String> map);
	List<RestaurantDto> getListWithGu(Map<String, String> map);
	List<RestaurantDto> getListWithDong(Map<String, String> map);

	int getWithNameCount(String key);
	int getWithCategoryCount(String key);
	int getWithMenuCount(String key);
	int getWithSiCount(String key);
	int getWithGuCount(String key);
	int getWithDongCount(String key);
	int getCount();
	RestaurantDto get(int restaurantNo);
	void add(Map<String, String> map);
	void remove(int restaurantNo);
	void set(Map<String,String> map);
	
	
}
