package team1.mini2.dz3.controller.api;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import team1.mini2.dz3.model.RestaurantDto;
import team1.mini2.dz3.service.RestaurantServiceImpl;

@RestController
@RequestMapping("/restaurant")
public class RestaurantApiController {

	@Autowired
	private RestaurantServiceImpl restaurantService;

	@GetMapping("/page/{pNum}")
	public List<RestaurantDto> getList(@PathVariable(required = true) int pNum,
			@RequestParam(required = false) String opt, @RequestParam(required = false) String key) {
		if (opt != null && key != null) {
			switch (opt) {
			case "restaurantName":
				return restaurantService.getRestaurantPageWithName(pNum, key);
			case "restaurantCategory":
				return restaurantService.getRestaurantPageWithCategory(pNum, key);
			case "restaurantMenu":
				return restaurantService.getRestaurantPageWithMenu(pNum, key);
			case "restaurantSi":
				return restaurantService.getRestaurantPageWithSi(pNum, key);
			case "restaurantGu":
				return restaurantService.getRestaurantPageWithGu(pNum, key);
			case "restaurantDong":
				System.out.println("dsadas");
				return restaurantService.getRestaurantPageWithDong(pNum, key);
			}
		}
		return restaurantService.getRestaurantPage(pNum);
	}

	@GetMapping("/{restaurantNo}")
	public RestaurantDto getRestaurant(@PathVariable(required = true) int restaurantNo) {
		return restaurantService.getRestaurant(restaurantNo);
	}

	@PostMapping
	public void addRestaurant(@RequestBody(required = true) Map<String, String> map) {
		restaurantService.addRestaurant(map);
	}

	@PatchMapping("/{restaurantNo}")
	public void setRestaurant(@PathVariable(required = true) String restaurantNo,
			@RequestBody(required = true) Map<String, String> map) {
		map.put("restaurantNo", restaurantNo);
		restaurantService.setRestaurant(map);
	}

	@DeleteMapping("/{restaurantNo}")
	public void putRestaurant(@PathVariable(required = true) int restaurantNo) {
		restaurantService.removeRestaurant(restaurantNo);
	}

	@GetMapping("/count")
	public int getRestaurantCount(@RequestParam(required = false) String opt,
			@RequestParam(required = false) String key) {
		if (opt != null && key != null) {
			switch (opt) {
			case "restaurantName":
				return restaurantService.getRestaurantWithNameCount(key);
			case "restaurantCategory":
				return restaurantService.getRestaurantWithCategoryCount(key);
			case "restaurantMenu":
				return restaurantService.getRestaurantWithMenuCount(key);
			case "restaurantSi":
				return restaurantService.getRestaurantWithSiCount(key);
			case "restaurantGu":
				return restaurantService.getRestaurantWithGuCount(key);
			case "restaurantDong":
				return restaurantService.getRestaurantWithDongCount(key);
			}
		}
		return restaurantService.getRestaurantCount();
	}

	@GetMapping("/page/count")
	public int getRestaurantPageCount(@RequestParam(required = false) String opt,
			@RequestParam(required = false) String key) {
		if (opt != null && key != null) {
			switch (opt) {
			case "restaurantName":
				return restaurantService.getRestaurantPageWithNameCount(key);
			case "restaurantCategory":
				return restaurantService.getRestaurantPageWithCategoryCount(key);
			case "restaurantMenu":
				return restaurantService.getRestaurantPageWithMenuCount(key);
			case "restaurantSi":
				return restaurantService.getRestaurantPageWithSiCount(key);
			case "restaurantGu":
				return restaurantService.getRestaurantPageWithGuCount(key);
			case "restaurantDong":
				return restaurantService.getRestaurantPageWithDongCount(key);
			}
		}

		return restaurantService.getRestaurantPageCount();
	}
}