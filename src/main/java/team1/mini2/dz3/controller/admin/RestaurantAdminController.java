package team1.mini2.dz3.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/restaurant")
public class RestaurantAdminController {

	@RequestMapping
	public String restaurantMainPage(Model model) {
		model.addAttribute("containerHeader", "admin/header");
		model.addAttribute("innerPage", "admin/restaurant/index");
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
