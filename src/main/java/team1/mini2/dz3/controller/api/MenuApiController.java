package team1.mini2.dz3.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import team1.mini2.dz3.model.MenuDto;

import team1.mini2.dz3.service.MenuServiceImpl;



@RestController
@RequestMapping("/menu")
public class MenuApiController {
	@Autowired
	private MenuServiceImpl menuService;
	
	@GetMapping("/{restaurantNo}")
	public List<MenuDto> getMenu(@PathVariable(required = true) int restaurantNo) {
		return menuService.MenuListget(restaurantNo);
	}
	
	@PostMapping("/{restaurantNo}")
	public int getCount(@PathVariable(required = true) int restaurantNo) {
		return menuService.MenuCountget(restaurantNo);
	}
}
