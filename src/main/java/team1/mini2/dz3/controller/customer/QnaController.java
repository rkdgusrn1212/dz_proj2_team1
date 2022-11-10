package team1.mini2.dz3.controller.customer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	public String qnaDetailPage(Model model,HttpServletRequest request) {
		String id = request.getParameter("id");
		model.addAttribute("containerHeader", "customer/header");
		model.addAttribute("innerPage", "customer/qna/detail");
		model.addAttribute("id",id);
		return "pageContainer";
	}
	

	@RequestMapping("/form")
	public String qnaFormPage(Model model,HttpServletRequest request) {
		String id = request.getParameter("id");
		model.addAttribute("containerHeader", "customer/header");
		model.addAttribute("innerPage", "customer/qna/form");
		model.addAttribute("id",id);
		return "pageContainer";
	}
}
