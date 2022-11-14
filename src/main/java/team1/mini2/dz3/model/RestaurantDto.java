package team1.mini2.dz3.model;

import lombok.Data;

@Data
public class RestaurantDto {
	private int restaurantNo;
	private String restaurantName;
	private String restaurantPh;
	private String restaurantCategory;
	private String restaurantMenu;
	private String restaurantSi;
	private String restaurantGu;
	private String restaurantDong;
	private String restaurantAddress;
	private double restaurantLatitude;
	private double restaurantLongtitude;
}
