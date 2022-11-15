package team1.mini2.dz3.controller.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

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

import com.fasterxml.jackson.databind.util.JSONPObject;

import team1.mini2.dz3.model.RestaurantDto;
import team1.mini2.dz3.model.qna.QnaDto;
import team1.mini2.dz3.model.qna.QnaSearchKeyDto;
import team1.mini2.dz3.service.RestaurantServiceImpl;

@RestController
@RequestMapping("/restaurant")
public class RestaurantApiController {

	@Autowired
	private RestaurantServiceImpl restaurantService;

	@GetMapping("/{restaurantNo}")
	public RestaurantDto getRestaurant(@PathVariable(required = true) int restaurantNo) {
		return restaurantService.getRestaurant(restaurantNo);
	}

	@GetMapping("/count")
	public Map<String, Integer> getCount(@Valid @RequestParam(required = false) String location,
			@RequestParam(required = false) String value1, @RequestParam(required = false) String select,
			@RequestParam(required = false) String value2, RestaurantDto dto) {
		if (location.equals("restaurantDong")) {
			dto.setRestaurantDong(value1);
		} else if (location.equals("restaurantGu")) {
			dto.setRestaurantGu(value1);
		} else if (location.equals("restaurantSi")) {
			dto.setRestaurantSi(value1);
		}
		if (select.equals("restaurantMenu")) {
			dto.setRestaurantMenu(value2);
		} else if (select.equals("restaurantCategory")) {
			dto.setRestaurantCategory(value2);
		} else if (select.equals("restaurantName")) {
			dto.setRestaurantName(value2);
		}
		Map<String, Integer> result = new HashMap<>();
		result.put("count", restaurantService.getRestaurantCount(dto));
		return result;
	}

	@GetMapping("/page/count")
	public Map<String, Integer> getPageCount(@Valid @RequestParam(required = false) String location,
			@RequestParam(required = false) String value1, @RequestParam(required = false) String select,
			@RequestParam(required = false) String value2, RestaurantDto dto) {
		if (location.equals("restaurantDong")) {
			dto.setRestaurantDong(value1);
		} else if (location.equals("restaurantGu")) {
			dto.setRestaurantGu(value1);
		} else if (location.equals("restaurantSi")) {
			dto.setRestaurantSi(value1);
		}
		if (select.equals("restaurantMenu")) {
			dto.setRestaurantMenu(value2);
		} else if (select.equals("restaurantCategory")) {
			dto.setRestaurantCategory(value2);
		} else if (select.equals("restaurantName")) {
			dto.setRestaurantName(value2);
		}
		Map<String, Integer> result = new HashMap<>();
		result.put("pageCount", restaurantService.getRestaurantPageCount(dto));
		return result;
	}

	@GetMapping("/page/{page}")
	public List<RestaurantDto> getList(@PathVariable(required = true) int page,
			@RequestParam(required = false) String location, @RequestParam(required = false) String value1,
			@RequestParam(required = false) String select, @RequestParam(required = false) String value2,
			@Valid RestaurantDto dto) {
		if (location.equals("restaurantDong")) {
			dto.setRestaurantDong(value1);
		} else if (location.equals("restaurantGu")) {
			dto.setRestaurantGu(value1);
		} else if (location.equals("restaurantSi")) {
			dto.setRestaurantSi(value1);
		}
		if (select.equals("restaurantMenu")) {
			dto.setRestaurantMenu(value2);
		} else if (select.equals("restaurantCategory")) {
			dto.setRestaurantCategory(value2);
		} else if (select.equals("restaurantName")) {
			dto.setRestaurantName(value2);
		}
		return restaurantService.getRestaurantPage(page, dto);
	}
	
	@PatchMapping("/{restaurantNo}")
	public void setRestaurant(@PathVariable(required=true) String restaurantNo, @RequestBody(required=true) Map<String, String> map) {
		map.put("restaurantNo", restaurantNo);
		restaurantService.setRestaurant(map);
	}
	@DeleteMapping("/{restaurantNo}")
	public void putRestaurant(@PathVariable(required=true)  int restaurantNo) {
		restaurantService.removeRestaurant(restaurantNo);
	}
}