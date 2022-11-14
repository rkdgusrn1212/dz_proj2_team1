package team1.mini2.dz3.service;

import java.util.List;
import java.util.Map;

import team1.mini2.dz3.model.ReviewDto;

public interface ReviewService {
	List<ReviewDto> getReviewPage(int page);
	List<ReviewDto> getReviewPageWithRestaurant(int page, String key);
	List<ReviewDto> getReviewPageWithWriter(int page, String key);
	List<ReviewDto> getReviewPageWithStar(int page, String key);
	List<ReviewDto> getReviewPageWithRegDate(int page, String key);
	
	int getReviewPageWithRestaurantCount(String key);
	int getReviewPageWithWriterCount(String key);
	int getReviewPageWithStarCount(String key);
	int getReviewPageWithRegDateCount(String key);
	
	int getReviewWithRestaurantCount(String key);
	int getReviewWithWriterCount(String key);
	int getReviewWithStarCount(String key);
	int getReviewWithRegDateCount(String key)
	;
	ReviewDto getReview(int reviewNo);
	
	void addReview(Map<String, String> map);
	void removeReview(int reviewNo);
	void setReview(Map<String, String> map);
	
	int getReviewCount();
	int getReviewPageCount();
	double getReviewAvg(int id);
}
