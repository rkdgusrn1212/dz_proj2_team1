<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="../notice/detail"   method="post">
		<h1>Tasty way 공지사항</h1>
		공지 번호 : ${ dto.notice_no }<br> 
		제목 : ${ dto.notice_title }<br> 
		작성자 : ${ dto.notice_writer }<br>
		내용 : ${ dto.notice_content }<br>
		작성일 : ${dto.notice_regdate }
</form>
</body>
</html>