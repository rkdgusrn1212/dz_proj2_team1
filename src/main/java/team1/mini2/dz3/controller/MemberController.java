package team1.mini2.dz3.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@GetMapping("/login")
	public String forwardLoginPage(Model model, Principal principal) {
		if(principal!=null) {
			return "redirect:/";
		}else {
			model.addAttribute("innerPage", "member/login");
		}
		return "pageContainer";
	}
	
	@GetMapping("/signup")
	public String forwardSignUpPage(Model model){
		model.addAttribute("innerPage", "member/signup");
		return "pageContainer";
	}
}
