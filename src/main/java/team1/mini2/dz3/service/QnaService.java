package team1.mini2.dz3.service;

import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.validation.annotation.Validated;
import team1.mini2.dz3.model.qna.QuestionWithNoAuthDto;
import team1.mini2.dz3.model.qna.QuestionWithNoAuthWithIdDto;
import team1.mini2.dz3.model.qna.QnaDto;
import team1.mini2.dz3.model.qna.QnaSearchKeyDto;
import team1.mini2.dz3.model.qna.QuestionWithAuthDto;
import team1.mini2.dz3.model.qna.QuestionWithAuthWithIdDto;

@Validated
public interface QnaService {
	
	/**
	 * 전체 검색을 수행, {@code optKey}를 검색 조건에 추가할 수 있다. 검색 결과의 {@code page} 페이지만 반환된다.
	 * @param page 반환할 페이지
	 * @param optKey 검색 옵션, null이거나 제공하는 옵션 키 값이 하나도 없다면 조건 없이 검색된다.
	 * @return 검색 수행결과 리스트, 해당 페이지가 결과 목록을 벗어난다면 리스트가 비어있을 수 있다.
	 */
	List<QnaDto> getQnaPage(@Min(1) int  page, @Valid QnaSearchKeyDto optKey);
	
	
	/**
	 * 전체 검색을 수행한 결과 레코드의 페이지 수를 반환한다. 검색에 조건을 추가할 수 있다.
	 * @param optKey 검색 옵션, null이거나 제공하는 옵션 키 값이 하나도 없다면 조건 없이 검색된다.
	 * @return 비어있지 않은 페이지 수를 반환. 즉, 검색 결과의 페이지 수.
	 */
	int getQnaPageCount(@Valid QnaSearchKeyDto optKey);
	
	
	/**
	 * 전체 검색을 수행한 결과 레코드 수를 반환한다. 검색에 조건을 추가할 수 있다.
	 * @param optKey 검색 옵션, null이거나 제공하는 옵션 키 값이 하나도 없다면 조건 없이 검색된다.
	 * @return 검색 결과의 전체 항목 수를 반환.
	 */
	int getQnaCount(@Valid QnaSearchKeyDto optKey);
	
	
	/**
	 * 해당 번호의 Q&A 게시글을 반환
	 * @param qnaNo Q&A 게시글 번호
	 * @return Q&A 게시글, 해당 게시글이 없으면 null
	 */
	QnaDto getQna(@Min(1) int qnaNo);

	
	/**
	 * 관리자 답글 삭제
	 * @param qnaNo Q&A 번호
	 * @return 삭제 성공 여부 반환.
	 */
	boolean removeAnswer(@Min(1)int qnaNo);
	
	/**
	 * 답글 갱신
	 * @param qnaNo
	 * @param reply
	 * @return 성공 여부 반환, {@code qnaNo}를 가진 Q&A가 없으면 실패.
	 */
	boolean setAnswer(@Min(1) int qnaNo, @NotNull @Size(max=1000) String reply);
	
	/**
	 * 미인증 질문 글 작성
	 * @param questionDto 미인증 질문 글 내용.
	 * @return 질문 글 작성 성공여부. 알수 없는 이유로 실패할 수 있음.
	 */
	boolean addQuestionWithoutAuth(@Valid @NotNull QuestionWithNoAuthDto questionDto);
	
	/**
	 * 인증 질문 글 작성
	 * @param questionDto 인증 질문 글 내용
	 * @return 질문 글 작성 성공여부. 알수 없는 이유로 실패할 수 있음.
	 */
	boolean addQuestionWtihAuth(@Valid @NotNull QuestionWithAuthDto questionDto);
	
	/**
	 * 미인증 질문 글 수정
	 * @param questionDto 새로 갱신될 미인증 질문 글 내용
	 * @return 갱신 성공 여부 반환. 주로 {@code qnaNo}의 해당하는 개시글이 없어서 실패할 수 있다.
	 */
	boolean setQuestionWithoutAuth(@Valid @NotNull QuestionWithNoAuthWithIdDto questionDto);
	
	/**
	 * 인증 질문 글 수정
	 * @param questionDto 새로 갱신될 인증 글 내용
	 * @return 갱신 실패 여부 반환. 주로 {@code qnaNo}의 해당하는 개시글이 없어서 실패할 수 있다.
	 */
	boolean setQuestionWithAuth(@Valid @NotNull QuestionWithAuthWithIdDto questionDto);
	
	/**
	 * Q&A 게시글을 삭제
	 * @param qnaNo Q&A번호
	 * @return 삭제 성공 여부 반환. 주로 {@code qnaNo}의 해당하는 개시글이 없어서 실패할 수 있다.
	 */
	boolean removeQna(@Min(1) int qnaNo);
}