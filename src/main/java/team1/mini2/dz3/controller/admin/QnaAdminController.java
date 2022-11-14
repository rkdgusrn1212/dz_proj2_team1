package team1.mini2.dz3.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("admin/qna")
public class QnaAdminController {

	@GetMapping
	public String qnaMainPage(Model model) {
		model.addAttribute("containerHeader", "admin/header");
		model.addAttribute("innerPage", "admin/qna/index");
		return "pageContainer";
	}

	@GetMapping("/form")
	public String qnaFormPage(Model model, @RequestParam int id) {
		model.addAttribute("containerHeader", "admin/header");
		model.addAttribute("innerPage", "admin/qna/form");
		model.addAttribute("id",id);
		return "pageContainer";
	}
}
