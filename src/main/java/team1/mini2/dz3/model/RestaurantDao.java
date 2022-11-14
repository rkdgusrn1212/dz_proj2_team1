package team1.mini2.dz3.model;

import java.util.List;
import java.util.Map;

public interface RestaurantDao {
	List<RestaurantDto> getList(RestaurantDto dto);
	int getCount(RestaurantDto dto);
	RestaurantDto get(int restaurantNo);
	void set(Map<String, String> map);

}
