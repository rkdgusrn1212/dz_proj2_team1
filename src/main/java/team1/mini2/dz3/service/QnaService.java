package team1.mini2.dz3.service;

import java.util.List;
import java.util.Map;

import lombok.NonNull;
import team1.mini2.dz3.controller.api.exception.NotMatchMapException;
import team1.mini2.dz3.model.QnaDto;

public interface QnaService {
	
	/**
	 * 해당 페이지의 Q&A 목록을 반환
	 * @param page 결과중 반환해야할 페이지. 수없이 많은 데이터중, 몇 번째 페이지 데이터를 반환할지를 가리킨다.
	 * @param optMap 검색 옵션, null이거나 제공하는 옵션과 일치하는 키 값이 없다면, 옵션 없이 검색된다.
	 * @return Q&A 목록을 반환, 존재하지 않는 페이지(음수이거나 전체 페이지수보다 높은 페이지)는 EmptyList. 
	 * @throws NotMatchMapException 
	 */
	List<QnaDto> getQnaPage(int  page, Map<String, String> optMap) throws NotMatchMapException;
	
	/**
	 * 해당 검색 조건에 해당하는 결과의 전체 페이지 수.
	 * @param optMap 검색 옵션, null이거나 제공하는 옵션 키 값이 하나도 없다면 옵션 없이 검색된다.
	 * @return 목록의 아이템이 1개라도 있는 페이지 수를 반환한다. 즉, 전체 Q&A가 0개일때는 0을 반환한다.
	 * @throws NotMatchMapException 
	 */
	int getQnaPageCount(Map<String, String> optMap) throws NotMatchMapException;
	
	
	/**
	 * 해당 검색 조건에 해당하는 결과의 수.
	 * @param optMap 검색 옵션, null이거나 제공하는 옵션 키 값이 하나도 없다면 옵션 없이 검색된다.
	 * @return 검색 결과의 전체 항목 수를 반환.
	 * @throws NotMatchMapException 
	 */
	int getQnaCount(Map<String, String> optMap) throws NotMatchMapException;
	
	
	/**
	 * 해당 번호의 Q&A 게시글을 반환
	 * @param qnaNo Q&A 게시글 번호
	 * @return Q&A 게시글, 해당 게시글이 없으면 null
	 */
	QnaDto getQna(int qnaNo);
	
	/**
	 * 관리자의 답글 작성
	 * @param qnaNo Q&A 번호 
	 * @param reply 답변, non-null이다.
	 * @return 트랜잭션 성공 여부 반환.
	 */
	boolean addAnswer(int qnaNo, @NonNull String reply);
	
	/**
	 * 관리자 답글 삭제
	 * @param qnaNo
	 * @return 트랜잭션 성공 여부 반환.
	 */
	boolean removeAnswer(int qnaNo);
	
	/**
	 * 답글 갱신
	 * @param qnaNo
	 * @param reply
	 * @return 트랜잭션 성공 여부 반환.
	 */
	boolean setAnswer(int qnaNo, @NonNull String reply);
	
	/**
	 * 미인증 Q&A 글을 작성.
	 * @param questionMap. 필수 키값 qnaTitle, qnaContent, qnaPublic, qnaNoMember, qnaPwd
	 * @return 트랜잭션 성공 여부 반환. 필수 키값들이 없으면 false.
	 * @throws NotMatchMapException 
	 */
	boolean addQuestionWithoutAuth(@NonNull Map<String, String> questionMap) throws NotMatchMapException;
	/**
	 * 인증 Q&A 글을 작성.
	 * @param questionMap. 필수 키값 qnaTitle, qnaContent, qnaPublic, qnaWriter
	 * @return 트랜잭션 성공 여부 반환.
	 * @throws NotMatchMapException 
	 */
	boolean addQuestionWtihAuth(@NonNull Map<String, String> questionMap) throws NotMatchMapException;
	/**
	 * 미인증 Q&A 글을 수정.
	 * @param qnaNo 대상 Q&A 번호
	 * @param valMap 업데이트할 컬럼-값의 맵.
	 *  qnaTitle, qnaContent, qnaPublic, qnaNonMember, qnaPwd 이외의 컬럼은 갱신하지 않는다. Non-null
	 * @return 트랜잭션 성공 여부 반환.
	 * @throws NotMatchMapException 
	 */
	boolean setQuestionWithoutAuth(int qnaNo, @NonNull Map<String, String> valMap) throws NotMatchMapException;
	/**
	 * 인증 Q&A 글을 수정.
	 * @param qnaNo 대상 Q&A 번호
	 * @param map 업데이트할 컬럼-값의 맵. qnaTitle, qnaContent, qnaPublic 이외의 컬럼은 갱신되지 않는다. Non-null
	 * @return 트랜잭션 성공 여부 반환.
	 * @throws NotMatchMapException 
	 */
	boolean setQuestionWithAuth(int qnaNo, @NonNull Map<String, String> valMap) throws NotMatchMapException;
	
	/**
	 * Q&A 게시글을 삭제
	 * @param qnaNo Q&A번호
	 * @return 트랜잭션 성공 여부 반환
	 */
	boolean removeQna(int qnaNo);
}