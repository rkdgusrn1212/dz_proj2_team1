package team1.mini2.dz3.controller.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import team1.mini2.dz3.model.qna.QuestionWithNoAuthDto;
import team1.mini2.dz3.model.qna.QuestionWithNoAuthWithIdDto;
import team1.mini2.dz3.model.qna.QnaDto;
import team1.mini2.dz3.model.qna.QnaSearchKeyDto;
import team1.mini2.dz3.service.QnaService;

@RestController
@RequestMapping("/qna")
public class QnaApiController {

	@Autowired
	private QnaService qnaService;

	
	@GetMapping("/{qnaNo}")
	public QnaDto get(@PathVariable(required=true) int qnaNo) {
		return qnaService.getQna(qnaNo);
	}
	
	@GetMapping("/count")
	public Map<String, Integer> getCount(@Valid QnaSearchKeyDto optKey) {
		Map<String, Integer> result = new HashMap<>();
		result.put("count", qnaService.getQnaCount(optKey));
		return result;
	}
	
	@GetMapping("/page/count")
	public Map<String, Integer> getPageCount(@Valid QnaSearchKeyDto optKey) {
		Map<String, Integer> result = new HashMap<>();
		result.put("pageCount", qnaService.getQnaPageCount(optKey));
		return result;
	}
	
	@GetMapping("/page/{page}")
	public List<QnaDto> getList(@PathVariable(required=true) int page, 
			@Valid QnaSearchKeyDto optKey){
		return qnaService.getQnaPage(page, optKey);
	}

	
	@PostMapping
	public boolean add(@Valid @RequestBody(required=true) QuestionWithNoAuthDto questionDto){
		return qnaService.addQuestionWithoutAuth(questionDto);
	}

	@PatchMapping("/{qnaNo}/question")
	public boolean setQuestionWithoutAuth(@PathVariable(required=true) int qnaNo,
			@Valid @RequestBody(required=true) QuestionWithNoAuthDto questionDto){
		QuestionWithNoAuthWithIdDto dto = new QuestionWithNoAuthWithIdDto();
		BeanUtils.copyProperties(questionDto, dto);
		dto.setQnaNo(qnaNo);
		return qnaService.setQuestionWithoutAuth(null);
	}
	
	@PatchMapping("/{qnaNo}/answer")
	public boolean setAnswer(@PathVariable(required=true) int qnaNo,
			@Valid @RequestBody(required=true) HashMap<String, String> jsonMap){
		return qnaService.setAnswer(qnaNo, jsonMap.get("qnaReply"));
	}

	@DeleteMapping("/{qnaNo}")
	public boolean removeQna(@PathVariable(required=true) int qnaNo) {
		return qnaService.removeQna(qnaNo);
	}
	
	@DeleteMapping("/{qnaNo}/answer")
	public boolean removeAnswer(@PathVariable(required=true) int qnaNo) {
		return qnaService.removeAnswer(qnaNo);
	}
}

