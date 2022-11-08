package team1.mini2.dz3.controller.customer;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("customer/qna")
public class QnaController {

	@RequestMapping
	public String qnaMainPage(Model model) {
		model.addAttribute("containerHeader", "customer/header");
		model.addAttribute("innerPage", "customer/qna/index");
		return "pageContainer";
	}

	@RequestMapping("/detail")
	public String qnaDetailPage(Model model) {
		model.addAttribute("containerHeader", "customer/header");
		model.addAttribute("innerPage", "customer/qna/detail");
		return "pageContainer";
	}
	

	@RequestMapping("/form")
	public String qnaFormPage(Model model) {
		model.addAttribute("containerHeader", "customer/header");
		model.addAttribute("innerPage", "customer/qna/form");
		return "pageContainer";
	}
}