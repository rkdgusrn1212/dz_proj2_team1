package team1.mini2.dz3.controller.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import team1.mini2.dz3.model.member.MemberSearchKeyDto;
import team1.mini2.dz3.model.member.MemberVo;
import team1.mini2.dz3.service.MemberService;

@RestController
@RequestMapping("/member")
public class MemberApiController {
	
	@Autowired
	private MemberService memberService;

	
	@GetMapping("/{memberNo}")
	public MemberVo get(@PathVariable(required=true) int memberNo) {
		return memberService.getMember(memberNo);
	}
	
	@GetMapping("/count")
	public Map<String, Integer> getCount(@Valid MemberSearchKeyDto optKey) {
		Map<String, Integer> result = new HashMap<>();
		result.put("count", memberService.getMemberCount(optKey));
		return result;
	}
	
	@GetMapping("/page/count")
	public Map<String, Integer> getPageCount(@Valid MemberSearchKeyDto optKey) {
		Map<String, Integer> result = new HashMap<>();
		result.put("pageCount", memberService.getMemberPageCount(optKey));
		return result;
	}
	
	@GetMapping("/page/{page}")
	public List<MemberVo> getList(@PathVariable(required=true) int page, 
			@Valid MemberSearchKeyDto optKey){
		return memberService.getMemberPage(page, optKey);
	}
	

	@DeleteMapping("/{memberNo}")
	public boolean removeQna(@PathVariable(required=true) int memberNo) {
		return memberService.removeMember(memberNo);
	}
}
