package team1.mini2.dz3.service;

import java.util.List;
import java.util.Map;

import team1.mini2.dz3.model.RestaurantDto;

public interface RestaurantService {
	List<RestaurantDto> getRestaurantPage(int page);
	List<RestaurantDto> getRestaurantPageWithName(int page, String key);
	List<RestaurantDto> getRestaurantPageWithCategory(int page, String key);
	int getRestaurantPageWithNameCount(String key);
	int getRestaurantPageWithCategoryCount(String key);
	RestaurantDto getRestaurant(int restaurantNo);
	void addRestaurant(Map<String,String> map);
	void removeRestaurant(int restaurantNo);
	void setRestaurant(Map<String,String> map);
	int getRestaurantCount();
	int getRestaurantPageCount();
}
