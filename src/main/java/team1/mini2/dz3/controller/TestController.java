package team1.mini2.dz3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 테스트용 주소 매핑 컨트롤러입니다. 배포 전 삭제 필수.
 * WEB-INF/view/index.jsp에 테스트 원하는 페이지의 하이퍼링크 생성 후 테스트 가능.
 * @author khgkjg12
 *
 */
@Controller
public class TestController {
	
	@RequestMapping("/")
	public String test() {
		return "index";
	}
}