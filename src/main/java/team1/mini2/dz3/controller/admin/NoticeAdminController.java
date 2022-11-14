package team1.mini2.dz3.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/notice")
public class NoticeAdminController {

	@RequestMapping
	public String noticeMainPage(Model model) {
		model.addAttribute("containerHeader", "admin/header");
		model.addAttribute("innerPage", "admin/notice/index");
		return "pageContainer";
	}

	@RequestMapping("/form")
	public String noticeFormPage(Model model, HttpServletRequest request) {
		String id = request.getParameter("id");
		if (id == null) {
			id = "0";
		}

		model.addAttribute("containerHeader", "admin/header");
		model.addAttribute("innerPage", "admin/notice/form");
		model.addAttribute("id", id);
		return "pageContainer";
	}
}