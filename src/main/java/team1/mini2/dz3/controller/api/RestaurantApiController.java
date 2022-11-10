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
	public List<RestaurantDto> getList(@PathVariable(required=true) int pNum, @RequestParam(required=false) String opt, @RequestParam(required=false) String key){
		/*if(opt!=null&&key!=null) {
			switch(opt) {
			case "restaurantTitle":
				return restaurantService.getRestaurantPageWithTitle(pNum, key);
			case "restaurantContent":
				return restaurantService.getRestaurantPageWithContent(pNum, key);
			case "restaurantRegDate":
				return restaurantService.getRestaurantPageWithRegDate(pNum, key);
			}
		}*/
		return restaurantService.getRestaurantPage(pNum);
	}
	
	@GetMapping("/{restaurantNo}")
	public RestaurantDto getRestaurant(@PathVariable(required=true) int restaurantNo) {
		return restaurantService.getRestaurant(restaurantNo);
	}
	
	@PostMapping
	public void addRestaurant(@RequestBody(required=true) Map<String, String> map) {
		restaurantService.addRestaurant(map);
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

	@GetMapping("/count")
	public int getRestaurantCount(@RequestParam(required=false) String opt, @RequestParam(required=false) String key) {
		/*if(opt!=null&&key!=null) {
			switch(opt) {
			case "restaurantTitle":
				return restaurantService.getRestaurantWithTitleCount(key);
			case "restaurantContent":
				return restaurantService.getRestaurantWithContentCount(key);
			case "restaurantRegDate":
				return restaurantService.getRestaurantWithRegDateCount(key);
			}
		}*/
		return restaurantService.getRestaurantCount();
	}
	
	@GetMapping("/page/count")
	public int getRestaurantPageCount(@RequestParam(required=false) String opt, @RequestParam(required=false) String key){
		/*if(opt!=null&&key!=null) {
			switch(opt) {
			case "restaurantTitle":
				return restaurantService.getRestaurantPageWithTitleCount(key);
			case "restaurantContent":
				return restaurantService.getRestaurantPageWithContentCount(key);
			case "restaurantRegDate":
				return restaurantService.getRestaurantPageWithRegDateCount(key);
			}
		}*/
		return restaurantService.getRestaurantPageCount();
	}
}