package team1.mini2.dz3.controller.restaurant;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/restaurant")
public class RestaurantController {

	@RequestMapping
	public String restaurantMainPage(Model model) {
		model.addAttribute("containerHeader", "header");
		model.addAttribute("innerPage", "restaurant/index");
		return "pageContainer";
	}

	@RequestMapping("/detail")
	public String restaurantDetailPage(Model model, @RequestParam(required = true) int id) {
		model.addAttribute("containerHeader", "header");
		model.addAttribute("innerPage", "restaurant/detail");
		model.addAttribute("id", id);
		return "pageContainer";
	}

	@RequestMapping("/review")
	public String reviewWritePage(Model model, @RequestParam(required = true) int id) {
		model.addAttribute("containerHeader", "header");
		model.addAttribute("innerPage", "restaurant/review");
		model.addAttribute("id", id);
		return "pageContainer";
	}
	
	@RequestMapping("/form")
	public String restaurantFormPage(Model model, HttpServletRequest request) {
		String id = request.getParameter("id");
		if (id == null) {
			id = "0";
		}

		model.addAttribute("containerHeader", "admin/header");
		model.addAttribute("innerPage", "admin/restaurant/form");
		model.addAttribute("id", id);
		return "pageContainer";
	}
}
