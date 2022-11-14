package team1.mini2.dz3.service;

import java.util.List;
import java.util.Map;

import team1.mini2.dz3.model.MenuDto;
import team1.mini2.dz3.model.MenuDao;
public interface MenuService {
	List<MenuDto> MenuListget(int restaurantId);
	int MenuCountget(int restaurantId);
}
