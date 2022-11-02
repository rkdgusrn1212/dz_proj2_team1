package team1.mini2.dz3.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team1.mini2.dz3.model.NoticeDto;
import team1.mini2.dz3.model.NoticeDao;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

//Controller를 상속또는 implements를 앋고 POJO방식으로 작성

@Controller
public class NoticeController {

	@Resource
	private NoticeDao dao;

	/*
	 * @RequestMapping("/writeform.htm") public String writeform(){ return
	 * "writeform"; // /WEB-INF/views/ + writeform + .jsp }//ModelAndView를 리턴하는것과 같음
	 */
	/*
	 * @RequestMapping("/write.htm") public String write(FaqBoardDTO dto){
	 * dao.insertBoard(dto); return "redirect:/list.htm"; }
	 */

	@RequestMapping("/notice")
	public String faqlist(HttpServletRequest request) {

		int pg = 1;
		String page = request.getParameter("page");
		String key = request.getParameter("key");
		String opt = request.getParameter("opt");
		if(key =="" || key == null)
		{
			System.out.println(opt);
			System.out.println(key);
			System.out.println("1");
			if (page != null) {
				pg = Integer.parseInt(page);
			}
			int rowSize = 10;
			int start = (pg * rowSize) - (rowSize - 1);
			int end = pg * rowSize;
	
			int total = dao.noticegetBoardCount(); // 총 게시물수
			System.out.println("시작 : " + start + " 끝:" + end);
			System.out.println("글의 수 : " + total);
	
			int allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수
			// int totalPage = total/rowSize + (total%rowSize==0?0:1);
			System.out.println("페이지수 : " + allPage);
	
			int block = 10; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>
			int fromPage = ((pg - 1) / block * block) + 1; // 보여줄 페이지의 시작
			// ((1-1)/10*10)
			int toPage = ((pg - 1) / block * block) + block; // 보여줄 페이지의 끝
			if (toPage > allPage) { // 예) 20>17
				toPage = allPage;
			}
	
			HashMap map = new HashMap();
	
			map.put("start", start);
			map.put("end", end);
	
			List<NoticeDto> list = dao.noticegetBoardList(map);
			System.out.println(list);
			request.setAttribute("list", list);
			request.setAttribute("pg", pg);
			request.setAttribute("allPage", allPage);
			request.setAttribute("block", block);
			request.setAttribute("fromPage", fromPage);
			request.setAttribute("toPage", toPage);
			request.setAttribute("opt", opt);
			request.setAttribute("key", key);
		}
		else
		{
			System.out.println("2");
			if (page != null) {
				pg = Integer.parseInt(page);
			}
			int rowSize = 10;
			int start = (pg * rowSize) - (rowSize - 1);
			int end = pg * rowSize;

			HashMap map = new HashMap();

			map.put("start", start);
			map.put("end", end);

			System.out.println(opt);
			System.out.println(key);

			map.put("opt", opt);
			map.put("key", key);
			System.out.println(map.get("opt"));
			System.out.println(map.get("key"));
			
			  int total = dao.noticeselectSearchCount(map); // 총 게시물수 
			  System.out.println("시작 : " + start+ " 끝:" + end); 
			  System.out.println("글의 수 : " + total); 
			  int allPage = (int)Math.ceil(total / (double) rowSize); // 페이지수 
			  // int totalPage = total/rowSize+ (total%rowSize==0?0:1); 
			  System.out.println("페이지수 : " + allPage);
			  
			  int block = 10; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >> 
			  int fromPage = ((pg - 1) / block * block) + 1; // 보여줄 페이지의 시작 
			  //((1-1)/10*10) 
			  int toPage = ((pg - 1) / block * block) + block; // 보여줄 페이지의 끝
			  if (toPage > allPage) { // 예) 20>17 
				  toPage = allPage; 
			  }
			  
			  System.out.println(map.get("opt"));
			  System.out.println(map.get("key")); 
			  List<NoticeDto> list = dao.noticegetselectSearch(map);
			  
			  System.out.println(list); 
			  request.setAttribute("list", list);
			  request.setAttribute("pg", pg); 
			  request.setAttribute("allPage", allPage);
			  request.setAttribute("block", block); 
			  request.setAttribute("fromPage",fromPage); 
			  request.setAttribute("toPage", toPage);
			  request.setAttribute("opt", opt);
			  request.setAttribute("key", key);
			  
			  
				
			
		}
		return "/notice/index"; // list.jsp
		
	}

	@RequestMapping("/noticesearch")
	public String faqsearch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		int pg = 1;
		String page = request.getParameter("page");

		if (page != null) {
			pg = Integer.parseInt(page);
		}
		int rowSize = 10;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;

		HashMap map = new HashMap();

		map.put("start", start);
		map.put("end", end);

		String opt = request.getParameter("opt");
		String key = request.getParameter("key");

		System.out.println(opt);
		System.out.println(key);

		map.put("opt", opt);
		map.put("key", key);

		
		  int total = dao.noticeselectSearchCount(map); // 총 게시물수 
		  System.out.println("시작 : " + start+ " 끝:" + end); 
		  System.out.println("글의 수 : " + total); 
		  int allPage = (int)Math.ceil(total / (double) rowSize); // 페이지수 
		  // int totalPage = total/rowSize+ (total%rowSize==0?0:1); 
		  System.out.println("페이지수 : " + allPage);
		  
		  int block = 10; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >> 
		  int fromPage = ((pg - 1) / block * block) + 1; // 보여줄 페이지의 시작 
		  //((1-1)/10*10) 
		  int toPage = ((pg - 1) / block * block) + block; // 보여줄 페이지의 끝
		  if (toPage > allPage) { // 예) 20>17 
			  toPage = allPage; 
		  }
		  
		  System.out.println(map.get("opt"));
		  System.out.println(map.get("key")); 
		  List<NoticeDto> list = dao.noticegetselectSearch(map);
		  
		  System.out.println(list); request.setAttribute("list", list);
		  request.setAttribute("pg", pg); request.setAttribute("allPage", allPage);
		  request.setAttribute("block", block); request.setAttribute("fromPage",
		  fromPage); request.setAttribute("toPage", toPage);
		 
		return "/notice/index";

	}

	@RequestMapping("/noticedetail")
	public String faqdetail(HttpServletRequest request) {
		String NOTICE_NO = request.getParameter("id");
		System.out.println(NOTICE_NO);
		NoticeDto noticedetail = dao.noticegetdetail(Integer.parseInt(NOTICE_NO));
		System.out.println(noticedetail);

		request.setAttribute("noticedetail", noticedetail);

		return "/notice/detail";
	}

	/*
	 * @RequestMapping("/reply.htm") public String reply(FaqBoardDTO dto, int pg){
	 * System.out.println("reply=>"+dto); dto.setSort(dto.getSort()+1);
	 * dto.setTab(dto.getTab()+1);
	 * 
	 * boardService.insertReply(dto); return "redirect:/list.htm?pg="+pg; }
	 */
}
