package team1.mini2.dz3.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/qna")
public class QnaAdminController {

	@RequestMapping
	public String qnaMainPage(Model model) {
		model.addAttribute("containerHeader", "admin/header");
		model.addAttribute("innerPage", "admin/qna/index");
		return "pageContainer";
	}

	@RequestMapping("/form")
	public String qnaFormPage(Model model) {
		model.addAttribute("containerHeader", "admin/header");
		model.addAttribute("innerPage", "admin/qna/form");
		return "pageContainer";
	}
}
