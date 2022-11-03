package team1.mini2.dz3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutController {
	
	@RequestMapping("/about")
	public String about(Model model) {
		return "about/jsp/aboutUs"; //자동 조립
	}
	
	@RequestMapping("/about/team")
	public String about1(Model model) {
		return "about/jsp/FeaturedServices"; //자동 조립
	}
	
	@RequestMapping("/about/service")
	public String about2(Model model) {
		return "about/jsp/TastyWayIntroduce"; //자동 조립
	}
}
