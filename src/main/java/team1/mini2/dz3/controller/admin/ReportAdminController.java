package team1.mini2.dz3.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/report")
public class ReportAdminController {

	@RequestMapping
	public String reportMainPage(Model model) {
		model.addAttribute("containerHeader", "admin/header");
		model.addAttribute("innerPage", "admin/report/index");
		return "pageContainer";
	}
}
