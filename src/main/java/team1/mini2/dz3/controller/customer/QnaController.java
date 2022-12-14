package team1.mini2.dz3.controller.customer;

import java.net.HttpURLConnection;
import java.net.http.HttpRequest;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("customer/qna")
public class QnaController {

	@RequestMapping
	public String qnaMainPage(Model model) {
		model.addAttribute("containerHeader", "customer/header");
		model.addAttribute("innerPage", "customer/qna/index");
		return "pageContainer";
	}

	@GetMapping("/detail")
	public String qnaDetailPage(Model model, @RequestParam int id, @RequestParam(required=false) String pwd) {
		model.addAttribute("containerHeader", "customer/header");
		model.addAttribute("innerPage", "customer/qna/detail");
		model.addAttribute("id",id);
		model.addAttribute("pwd",pwd);
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
