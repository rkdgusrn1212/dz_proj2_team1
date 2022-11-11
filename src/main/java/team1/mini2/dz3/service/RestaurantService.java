package team1.mini2.dz3.service;

import java.util.List;
import java.util.Map;

import javax.validation.constraints.Min;

import team1.mini2.dz3.model.RestaurantDto;

public interface RestaurantService {
	List<RestaurantDto> getRestaurantPage(int page, RestaurantDto dto);
	
	int getRestaurantCount(RestaurantDto dto);

	int getRestaurantPageCount(RestaurantDto dto);

	RestaurantDto getRestaurant(int restaurantNo);


	
}
