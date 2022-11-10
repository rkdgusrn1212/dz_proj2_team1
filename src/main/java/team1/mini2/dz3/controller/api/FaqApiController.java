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

import team1.mini2.dz3.model.FaqDto;
import team1.mini2.dz3.service.FaqServiceImpl;

@RestController
@RequestMapping("/faq")
public class FaqApiController {
	
	@Autowired
	private FaqServiceImpl faqService;

	@GetMapping("/page/{pNum}")
	public List<FaqDto> getList(@PathVariable(required=true) int pNum, @RequestParam(required=false) String opt, @RequestParam(required=false) String key){
		if(opt!=null&&key!=null) {
			switch(opt) {
			case "faqTitle":
				System.out.println("title");
				return faqService.getFaqPageWithTitle(pNum, key);
			case "faqContent":
				System.out.println("title");
				return faqService.getFaqPageWithContent(pNum, key);
				
			case "faqRegDate":
				System.out.println("title");
				return faqService.getFaqPageWithRegDate(pNum, key);
			}
		}
		return faqService.getFaqPage(pNum);
	}
	
	@GetMapping("/{faqNo}")
	public FaqDto getFaq(@PathVariable(required=true) int faqNo) {
		return faqService.getFaq(faqNo);
	}
	
	@PostMapping
	public void addFaq(@RequestBody(required=true) Map<String, String> map) {
		faqService.addFaq(map);
	}
	
	@PatchMapping("/{faqNo}")
	public void setFaq(@PathVariable(required=true) String faqNo, @RequestBody(required=true) Map<String, String> map) {
		map.put("faqNo", faqNo);
		faqService.setFaq(map);
	}
	
	@DeleteMapping("/{faqNo}")
	public void putFaq(@PathVariable(required=true)  int faqNo) {
		faqService.removeFaq(faqNo);
	}
	
	@GetMapping("/count")
	public int getFaqCount(@RequestParam(required=false) String opt, @RequestParam(required=false) String key){
		if(opt!=null&&key!=null) {
			switch(opt) {
			case "faqTitle":
				return faqService.getFaqWithTitleCount(key);
			case "faqContent":
				return faqService.getFaqWithContentCount(key);
			case "faqRegDate":
				return faqService.getFaqWithRegDateCount(key);
			}
		}
		return faqService.getFaqCount();
	}
	
	@GetMapping("/page/count")
	public int getFaqPageCount(@RequestParam(required=false) String opt, @RequestParam(required=false) String key){
		if(opt!=null&&key!=null) {
			switch(opt) {
			case "faqTitle":
				return faqService.getFaqPageWithTitleCount(key);
			case "faqContent":
				return faqService.getFaqPageWithContentCount(key);
			case "faqRegDate":
				return faqService.getFaqPageWithRegDateCount(key);
			}
		}
		return faqService.getFaqPageCount();
	}
}