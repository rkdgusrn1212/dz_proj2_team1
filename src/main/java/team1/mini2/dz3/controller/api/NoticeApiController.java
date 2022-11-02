package team1.mini2.dz3.controller.api;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import team1.mini2.dz3.model.NoticeDto;
import team1.mini2.dz3.service.NoticeServiceImpl;

@RestController
@RequestMapping("/notice")
public class NoticeApiController {
	
	@Autowired
	private NoticeServiceImpl noticeService;

	@GetMapping("/page/{pNum}")
	public List<NoticeDto> getList(@PathVariable(required=true) int pNum, @RequestParam(required=false) String opt, @RequestParam(required=false) String key){
		if(opt!=null&&key!=null) {
			switch(opt) {
			case "noticeTitle":
				return noticeService.getNoticePageWithTitle(pNum, key);
			case "noticeContent":
				return noticeService.getNoticePageWithContent(pNum, key);
			case "noticeRegDate":
				return noticeService.getNoticePageWithRegDate(pNum, key);
			}
		}
		return noticeService.getNoticePage(pNum);
	}
	
	@GetMapping("/{noticeNo}")
	public NoticeDto getNotice(@PathVariable(required=true) int noticeNo) {
		return noticeService.getNotice(noticeNo);
	}
	
	@PostMapping
	public void addNotice(@RequestBody(required=true) Map<String, String> map) {
		noticeService.addNotice(map);
	}
	
	@PatchMapping("/{noticeNo}")
	public void setNotice(@PathVariable(required=true) String noticeNo, @RequestBody(required=true) Map<String, String> map) {
		map.put("noticeNo", noticeNo);
		noticeService.setNotice(map);
	}
	
	@DeleteMapping("/{noticeNo}")
	public void putNotice(@PathVariable(required=true)  int noticeNo) {
		noticeService.removeNotice(noticeNo);
	}
}