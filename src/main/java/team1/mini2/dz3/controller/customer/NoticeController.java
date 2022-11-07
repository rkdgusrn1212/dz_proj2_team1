package team1.mini2.dz3.controller.customer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/customer/notice")
public class NoticeController {
	@RequestMapping
	public String noticeMainPage(Model model) {
		model.addAttribute("containerHeader", "customer/header");
		model.addAttribute("innerPage", "customer/notice/index");
		return "pageContainer";
	}

	@RequestMapping("/detail")
	public String noticeDetailPage(Model model, @RequestParam(required = true) int id) {
		model.addAttribute("containerHeader", "customer/header");
		model.addAttribute("innerPage", "customer/notice/detail");
		model.addAttribute("id", id);
		return "pageContainer";
	}
}
