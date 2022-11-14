package team1.mini2.dz3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AppController {
	
	@RequestMapping("/")
	public String mainPage(Model model) {
		model.addAttribute("containerHeader", "header");
		model.addAttribute("innerPage", "index");
		return "pageContainer";
	}

	@RequestMapping("/error")
	public String errorPage(Model model) {
		model.addAttribute("containerHeader", "header");
		model.addAttribute("innerPage", "error");
		return "pageContainer";
	}
}
