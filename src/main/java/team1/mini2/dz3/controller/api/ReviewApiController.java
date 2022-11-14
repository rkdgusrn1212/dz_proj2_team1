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

import team1.mini2.dz3.model.ReviewDto;
import team1.mini2.dz3.service.ReviewServiceImpl;

@RestController
@RequestMapping("/review")
public class ReviewApiController {

	@Autowired
	private ReviewServiceImpl reviewService;

	@GetMapping("/page/{pNum}")
	public List<ReviewDto> getList(@PathVariable(required = true) int pNum, @RequestParam(required = false) String opt,
			@RequestParam(required = false) String key) {
		if (opt != null && key != null) {
			switch (opt) {
			case "reviewRestaurant":
				return reviewService.getReviewPageWithRestaurant(pNum, key);
			case "reviewWriter":
				return reviewService.getReviewPageWithWriter(pNum, key);
			case "reviewStar":
				return reviewService.getReviewPageWithStar(pNum, key);
			case "reviewRegDate":
				return reviewService.getReviewPageWithRegDate(pNum, key);
			}
		}
		return reviewService.getReviewPage(pNum);
	}

	@GetMapping("/{reviewNo}")
	public ReviewDto getReview(@PathVariable(required = true) int reviewNo) {
		return reviewService.getReview(reviewNo);
	}

	@PostMapping
	public void addReview(@RequestBody(required = true) Map<String, String> map) {
		reviewService.addReview(map);
	}

	@PatchMapping("/{reviewNo}")
	public void setReview(@PathVariable(required = true) String reviewNo,
			@RequestBody(required = true) Map<String, String> map) {
		map.put("reviewNo", reviewNo);
		reviewService.setReview(map);
	}

	@DeleteMapping("/{reviewNo}")
	public void putReview(@PathVariable(required = true) int reviewNo) {
		reviewService.removeReview(reviewNo);
	}

	@GetMapping("/count")
	public int getReviewCount(@RequestParam(required = false) String opt, @RequestParam(required = false) String key) {
		if (opt != null && key != null) {
			switch (opt) {
			case "reviewRestaurant":
				return reviewService.getReviewWithRestaurantCount(key);
			case "reviewWriter":
				return reviewService.getReviewWithWriterCount(key);
			case "reviewStar":
				return reviewService.getReviewWithStarCount(key);
			case "reviewRegDate":
				return reviewService.getReviewWithRegDateCount(key);
			}
		}
		return reviewService.getReviewCount();
	}

	@GetMapping("/page/count")
	public int getReviewPageCount(@RequestParam(required = false) String opt,
			@RequestParam(required = false) String key) {
		if (opt != null && key != null) {
			switch (opt) {
			case "reviewRestaurant":
				return reviewService.getReviewPageWithRestaurantCount(key);
			case "reviewWriter":
				return reviewService.getReviewPageWithWriterCount(key);
			case "reviewStar":
				return reviewService.getReviewPageWithStarCount(key);
			case "reviewRegDate":
				return reviewService.getReviewPageWithRegDateCount(key);
			}
		}

		return reviewService.getReviewPageCount();
	}
	
	
	@GetMapping("/avg/{restaurantid}")
	public double getReviewAvg(@PathVariable(required = true) int restaurantid) {
		
		return reviewService.getReviewAvg(restaurantid);
	}
}