package team1.mini2.dz3.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/faq")
public class FaqAdminController {

	@RequestMapping
	public String faqMainPage(Model model) {
		model.addAttribute("containerHeader", "admin/header");
		model.addAttribute("innerPage", "admin/faq/index");
		return "pageContainer";
	}

	@RequestMapping("/form")
	public String faqFormPage(Model model,HttpServletRequest request) {
		String id = request.getParameter("id");
		System.out.println(id);
		if(id== null)
		{
			id="0";
		}
		System.out.println(id);
		model.addAttribute("containerHeader", "admin/header");
		model.addAttribute("innerPage", "admin/faq/form");
		model.addAttribute("id", id);
		return "pageContainer";
	}
}
