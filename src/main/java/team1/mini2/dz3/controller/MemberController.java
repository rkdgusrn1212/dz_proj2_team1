package team1.mini2.dz3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@GetMapping("/login")
	public String forwardLoginPage(Model model) {
		model.addAttribute("innerPage", "auth/login");
		return "pageContainer";
	}
}
