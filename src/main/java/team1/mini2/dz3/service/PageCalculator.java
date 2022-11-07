package team1.mini2.dz3.service;

import java.util.HashMap;
import java.util.Map;

public class PageCalculator {
	
	/**
	 * page의 시작 인덱스와 끝 인덱스를 반환. 음수 입력도 계산된다.
	 * @param page
	 * @return start는 시작인덱스 end는 끝 인덱스를 나타낸다.
	 */
	static Map<String, String> getPageIdx(int page) {
		int rowSize = 10;
		int start = (page*rowSize)-(rowSize -1);
		int end = page*rowSize;
		HashMap<String, String> map = new HashMap<>();
		map.put("start", Integer.toString(start));
		map.put("end", Integer.toString(end));
		return map;
	}
	
	/**
	 * 전체 목록 수를 페이지 크기로 나누어 전체 페이지 수를 반환한다.
	 * count가 0이상 일때만 정상 동작한다.
	 * @param count 전체 목록 수
	 * @return 전체 페이지 수.
	 */
	static int getPageCount(int count){
		return (int) Math.ceil(count/10.);
	}
}
