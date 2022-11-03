package team1.mini2.dz3.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import team1.mini2.dz3.model.NoticeDao;
import team1.mini2.dz3.model.NoticeDto;

@Controller
public class NoticeController {

	@Autowired
	private NoticeDao noticeDao;

	@RequestMapping("/notice")
	public String noticeList(HttpServletRequest request) {

		int pg = 1;
		String page = request.getParameter("page");
		String key = request.getParameter("key");
		String opt = request.getParameter("opt");

		if (key == "" || key == null) {
			System.out.println(opt);
			System.out.println(key);
			System.out.println("1");
			if (page != null) {
				pg = Integer.parseInt(page);
			}
			int rowSize = 10;
			int start = (pg * rowSize) - (rowSize - 1);
			int end = pg * rowSize;

			int total = noticeDao.getCount(); //총 게시물수
			System.out.println("시작 : " + start + " 끝 : " + end);
			System.out.println("글의 수 : " + total);

			int allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수
			System.out.println("페이지 수 : " + allPage);

			int block = 10; // 한 페이지에 보여줄 범위
			int fromPage = ((pg - 1) / block * block) + 1; // 보여줄 페이지의 시작
			int toPage = ((pg - 1) / block * block) + block; // 보여줄 페이지의 끝
			if (toPage > allPage) {
				toPage = allPage;
			}
			HashMap map = new HashMap();
			map.put("start", start);
			map.put("end", end);

			List<NoticeDto> list = noticeDao.getList(map);
			System.out.println("넣기전 : "  +list);
			request.setAttribute("list", list);
			request.setAttribute("pg", pg);
			request.setAttribute("allPage", allPage);
			request.setAttribute("block", block);
			request.setAttribute("fromPage", fromPage);
			request.setAttribute("toPage", toPage);
			request.setAttribute("opt", opt);
			request.setAttribute("key", key);
		} else {
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

			int total = noticeDao.getCount(); // 총 게시물수
			System.out.println("시작 : " + start + " 끝:" + end);
			System.out.println("글의 수 : " + total);
			int allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수
			// int totalPage = total/rowSize+ (total%rowSize==0?0:1);
			System.out.println("페이지수 : " + allPage);

			int block = 10; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>
			int fromPage = ((pg - 1) / block * block) + 1; // 보여줄 페이지의 시작
			// ((1-1)/10*10)
			int toPage = ((pg - 1) / block * block) + block; // 보여줄 페이지의 끝
			if (toPage > allPage) { // 예) 20>17
				toPage = allPage;
			}

			System.out.println(map.get("opt"));
			System.out.println(map.get("key"));
			List<NoticeDto> list = noticeDao.getList(map);

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

		return "notice/noticeBoard"; // noticeboard.jsp
	}

}
