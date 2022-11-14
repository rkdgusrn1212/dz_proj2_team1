package team1.mini2.dz3.model;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDto {
	private int reviewNo;
	private String reviewContent;
	private int reviewRestaurant;
	private int reviewWriter;
	private double reviewStar;
	private Date reviewRegDate;

}
