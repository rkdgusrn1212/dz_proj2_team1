package team1.mini2.dz3.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team1.mini2.dz3.model.NoticeDAO;
import team1.mini2.dz3.model.NoticeDTO;


@WebServlet("/notice")
public class NoticeController extends HttpServlet {

	public NoticeController() {
	}

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");

		String page = request.getParameter("page"); // ~~?page=list
		System.out.println("page : " + page);

		if (page.equals("list")) {
			noticeList(request, response);
		} else if (page.equals("detail")) {
			noticeDetail(request, response);
		}
		/*else if (page.equals("write")) {
		write(request, response);
		} else if (page.equals("update")) {
		update(request, response);
		} else if (page.equals("delete")) {
		delete(request, response);
		} else if (page.equals("search")) {
		search(request, response);
		}
		*/	} // service end

	public void noticeList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		NoticeDAO dao = new NoticeDAO();
		List<NoticeDTO> list = dao.noticeList();
		if (list != null) {
			request.setAttribute("list", list); // data save
			request.getRequestDispatcher("/WEB-INF/views/notice/notice.jsp").forward(request, response);
		} else {
			response.sendRedirect("/WEB-INF/views/notice/error.jsp");
		}
	} // list end

	public void noticeDetail(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String seq = request.getParameter("seq");
		NoticeDAO dao = new NoticeDAO();
		NoticeDTO dto = dao.detailNotice(Integer.parseInt(seq));
		System.out.println(dto);
		if( dto != null ) {
			request.setAttribute("dto", dto);
			request.getRequestDispatcher("/WEB-INF/views/noticeDetail.jsp").forward(request, response);
		} else {
			response.sendRedirect("views/error.jsp");
		}
	} // detail end
	
	
	
	/*	public void write(HttpServletRequest request, 
				HttpServletResponse response) throws IOException {
			
			System.out.println("write page ������� �Դ���?");
			
			request.setCharacterEncoding("utf-8");
			String title = request.getParameter("title");
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			System.out.println(title + ",\t" + writer +",\t" + content );
			
			NoticeDAO dao = new NoticeDAO();
			NoticeDTO dto = new NoticeDTO(title, writer, content);
			
			int rowcount = dao.insert(dto);   // db insert ó��
			
			if( rowcount > 0 ) {
				response.sendRedirect("board?cmd=list");
			} else {
				response.sendRedirect("views/error.jsp");
			}
		} // write end
	
		public void delete(HttpServletRequest request, 
				HttpServletResponse response) throws ServletException, IOException {
			
			String seq = request.getParameter("seq");
			NoticeDAO dao = new NoticeDAO();
			int rowcount = dao.delete(Integer.parseInt(seq));
			if( rowcount > 0 ) {
				noticeList(request, response);   // response.sendRedirect("board?cmd=list");
			} 
		} // delete end
		
	
		// update
		public void update(HttpServletRequest request, 
				HttpServletResponse response) throws ServletException, IOException {
			String seq = request.getParameter("seq");
			String writer = request.getParameter("writer");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			NoticeDTO dto =  new NoticeDTO( title,  writer, content );  
			NoticeDAO dao = new NoticeDAO();
			
			int rowcount = dao.update(dto);
			if (rowcount > 0) {
				response.sendRedirect("board?cmd=list");  //list(request, response);
			}
		} // end update
	
		// search
		public void search(HttpServletRequest request, 
				HttpServletResponse response) throws ServletException, IOException {
			// �÷���
			String column = request.getParameter("column");
			String keyvalue = request.getParameter("keyvalue");
			System.out.println(column + " / " + keyvalue);
	
			Map<String, String> map = new HashMap<>(); // collection
			map.put("column", column); // column : title or writer or contnet
			map.put("keyvalue", keyvalue); // keyvalue : �迬��
	
			NoticeDAO dao = new NoticeDAO();
			List<NoticeDTO> list = dao.getSearchList(map);
			if (list != null) {
				request.setAttribute("list", list);
				request.getRequestDispatcher("/views/searchList.jsp").forward(request, response);
			} else {
				response.sendRedirect("views/error.jsp");
			}
	
		}
	
		public void search2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			String writer = request.getParameter("writer");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String keyvalue = request.getParameter("keyvalue");
	
			Map<String, String> map = new HashMap<>(); // collection
			map.put("title", title);
			map.put("writer", writer);
			map.put("content", content);
			map.put("keyvalue", keyvalue);
	
			NoticeDAO dao = new NoticeDAO();
			List<NoticeDTO> list = dao.getSearchList2(map);
			
			if (list != null) {
				request.setAttribute("list", list);
				request.getRequestDispatcher("/views/searchList.jsp").forward(request, response);
			} else {
				response.sendRedirect("views/error.jsp");
			}*/
}
