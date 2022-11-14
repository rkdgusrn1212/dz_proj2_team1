package team1.mini2.dz3.model;

import java.util.List;
import java.util.Map;

public interface MenuDao {
	
	List<MenuDto> getMenuList(int restaurantId);
	int getMenuCount(int restaurantId); 
}
