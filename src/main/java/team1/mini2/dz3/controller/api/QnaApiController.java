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

import team1.mini2.dz3.controller.api.exception.NotMatchMapException;
import team1.mini2.dz3.model.QnaDto;
import team1.mini2.dz3.service.QnaServiceImpl;

@RestController
@RequestMapping("/qna")
public class QnaApiController {
	
	@Autowired
	private QnaServiceImpl qnaService;

	@PostMapping
	public boolean add(@RequestBody(required=true) Map<String, String> questionDto) throws NotMatchMapException {
		return qnaService.addQuestionWithoutAuth(questionDto);
	}
	
	@GetMapping("/{qnaNo}")
	public QnaDto get(@PathVariable(required=true) int qnaNo) {
		return qnaService.getQna(qnaNo);
	}
	
	@PatchMapping("/{qnaNo}")
	public boolean setWithoutAuth(@PathVariable(required=true) int qnaNo,
			@RequestBody(required=true) Map<String, String> qnaMap) throws NotMatchMapException {
		return qnaService.setQuestionWithoutAuth(qnaNo, qnaMap);
	}


	@DeleteMapping("/{qnaNo}")
	public boolean removeQna(@PathVariable(required=true) int qnaNo) {
		return qnaService.removeQna(qnaNo);
	}
	
	@GetMapping("/page/{page}")
	public List<QnaDto> getList(@PathVariable(required=true) int page, 
			@RequestParam(required=false) Map<String, String> optMap) throws NotMatchMapException{	
		return qnaService.getQnaPage(page, optMap);
	}
}

