package team1.mini2.dz3.controller.customer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer/faq")
public class FaqController {
	
	@RequestMapping
	public String faqMainPage(Model model) {
		model.addAttribute("containerHeader", "customer/header");
		model.addAttribute("innerPage", "customer/faq/index");
		return "pageContainer";
	}

	@RequestMapping("/detail")
	public String faqDetailPage(Model model,HttpServletRequest request) {
		String a = request.getParameter("id");
		System.out.println(a);
		model.addAttribute("containerHeader", "customer/header");
		model.addAttribute("innerPage", "customer/faq/detail");
		model.addAttribute("id", a);
		return "pageContainer";
	}
}