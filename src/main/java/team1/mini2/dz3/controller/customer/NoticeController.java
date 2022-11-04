package team1.mini2.dz3.controller.customer;

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
	public String noticeDetailPage(Model model) {
		model.addAttribute("containerHeader", "customer/header");
		model.addAttribute("innerPage", "customer/notice/detail");
		return "pageContainer";
	}
}
