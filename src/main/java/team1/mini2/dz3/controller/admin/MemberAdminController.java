package team1.mini2.dz3.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/member")
public class MemberAdminController {

	@RequestMapping
	public String memberMainPage(Model model) {
		model.addAttribute("containerHeader", "admin/header");
		model.addAttribute("innerPage", "admin/member/index");
		return "pageContainer";
	}
}