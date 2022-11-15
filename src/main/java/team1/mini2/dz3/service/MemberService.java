package team1.mini2.dz3.service;

import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.Min;

import org.springframework.validation.annotation.Validated;

import team1.mini2.dz3.model.member.MemberSearchKeyDto;
import team1.mini2.dz3.model.member.MemberVo;

@Validated
public interface MemberService {
	/**
	 * 전체 검색을 수행, {@code optKey}를 검색 조건에 추가할 수 있다. 검색 결과의 {@code page} 페이지만 반환된다.
	 * @param page 반환할 페이지
	 * @param optKey 검색 옵션, null이거나 제공하는 옵션 키 값이 하나도 없다면 조건 없이 검색된다.
	 * @return 검색 수행결과 리스트, 해당 페이지가 결과 목록을 벗어난다면 리스트가 비어있을 수 있다.
	 */
	List<MemberVo> getMemberPage(@Min(1) int  page, @Valid MemberSearchKeyDto optKey);
	
	
	/**
	 * 전체 검색을 수행한 결과 레코드의 페이지 수를 반환한다. 검색에 조건을 추가할 수 있다.
	 * @param optKey 검색 옵션, null이거나 제공하는 옵션 키 값이 하나도 없다면 조건 없이 검색된다.
	 * @return 비어있지 않은 페이지 수를 반환. 즉, 검색 결과의 페이지 수.
	 */
	int getMemberPageCount(@Valid MemberSearchKeyDto optKey);
	
	
	/**
	 * 전체 검색을 수행한 결과 레코드 수를 반환한다. 검색에 조건을 추가할 수 있다.
	 * @param optKey 검색 옵션, null이거나 제공하는 옵션 키 값이 하나도 없다면 조건 없이 검색된다.
	 * @return 검색 결과의 전체 항목 수를 반환.
	 */
	int getMemberCount(@Valid MemberSearchKeyDto optKey);
	
	
	/**
	 * 해당 번호의 Member 게시글을 반환
	 * @param memberNo Member 게시글 번호
	 * @return Member 게시글, 해당 게시글이 없으면 null
	 */
	MemberVo getMember(@Min(1) int memberNo);
	/**
	 * Member 게시글을 삭제
	 * @param memberNo Member번호
	 * @return 삭제 성공 여부 반환. 주로 {@code memberNo}의 해당하는 개시글이 없어서 실패할 수 있다.
	 */
	boolean removeMember(@Min(1) int memberNo);
}
