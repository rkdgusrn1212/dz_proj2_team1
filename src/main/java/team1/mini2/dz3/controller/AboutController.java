package team1.mini2.dz3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/about")
public class AboutController {

	@RequestMapping
	public String aboutPage(Model model) {
		model.addAttribute("containerHeader", "about/header");
		model.addAttribute("innerPage", "about/index");
		return "pageContainer";
	}

	@RequestMapping("/team")
	public String teamPage(Model model) {
		model.addAttribute("containerHeader", "about/header");
		model.addAttribute("innerPage", "about/team");
		return "pageContainer";
	}
	

	@RequestMapping("/service")
	public String servicePage(Model model) {
		model.addAttribute("containerHeader", "about/header");
		model.addAttribute("innerPage", "about/service");
		return "pageContainer";
	}
}
