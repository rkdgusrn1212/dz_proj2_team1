package team1.mini2.dz3.model.qna;

import lombok.Getter;

@Getter
public class PageVo {
	
	private int start;
	private int end;
	public static final int DEFAULF_PAGE_SIZE = 10;
	
	public PageVo(int page){
		this(page, DEFAULF_PAGE_SIZE);
	}
	/**
	 * 추후의 확장성(view에서 요구하는 단위 page 레코드 수의 변화)을 위해
	 * @param page 페이지 번호. 1보다 커야한다.
	 * @param pageSize 단위 페이지 크기. 1보다 커야한다.
	 */
	public PageVo(int page, int pageSize){
		start = (page*pageSize)-(pageSize -1);
		end = page*pageSize;
	}
	
	public int getPageSize(){
		return end-start;
	}
	
	public int getPageCount(int count) {
		return (int) Math.ceil(count/(double)(getPageSize()));
	} 
	
	/**
	 * {@count}크기의 레코드 목록이 이 페이지의 사이즈로 나뉘었을떄 몇 페이지가 나오는지 반환
	 * @param count 대상 레코드 목록. 1보다 커야한다.
	 * @param pageSize 대상 페이지 크기. 1보다 커야한다.
	 * @return 나눠진 페이지 수
	 */
	public static int calculatePageCount(int count, int pageSize) {
		return (int) Math.ceil(count/(double)(pageSize));
	}
	
	public static int calculatePageCount(int count) {
		return (int) Math.ceil(count/(double)(DEFAULF_PAGE_SIZE));
	}
}
