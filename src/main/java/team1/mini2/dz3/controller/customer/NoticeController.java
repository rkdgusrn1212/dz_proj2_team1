package team1.mini2.dz3.controller.customer;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer/notice")
public class NoticeController {
	@RequestMapping
	public String noticeMainPage(Model model) {
		model.addAttribute("containerHeader", "customer/header");
		model.addAttribute("innerPage", "customer/notice/index");
		return "pageContainer";
	}
	
	@RequestMapping("/form")
	public String noticeFormPage(Model model) {
		model.addAttribute("containerHeader", "customer/header");
		model.addAttribute("innerPage", "customer/notice/form");
		return "pageContainer";
	}
	

	@RequestMapping("/detail")
	public String noticeDetailPage(Model model, HttpServletRequest request) {
		String id = request.getParameter("id");
		model.addAttribute("containerHeader", "customer/header");
		model.addAttribute("innerPage", "customer/notice/detail");
		model.addAttribute("id", id);
		return "pageContainer";
	}
}
