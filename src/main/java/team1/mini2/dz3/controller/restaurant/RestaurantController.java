package team1.mini2.dz3.controller.restaurant;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/restaurant")
public class RestaurantController {
	@RequestMapping
	public String noticeMainPage(Model model) {
		model.addAttribute("containerHeader", "header");
		model.addAttribute("innerPage", "restaurant/index");
		return "pageContainer";
	}

	@RequestMapping("/detail")
	public String noticeDetailPage(Model model, @RequestParam(required = true) int id) {
		model.addAttribute("containerHeader", "header");
		model.addAttribute("innerPage", "restaurant/detail");
		model.addAttribute("id", id);
		return "pageContainer";
	}
}
