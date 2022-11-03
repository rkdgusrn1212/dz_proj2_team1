<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>managerNotice.jsp 관리자 공지사항 페이지</title>
<!-- 부트스트랩 연결 -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
   crossorigin="anonymous">
   
</head>
</head>
<body>
<h1> 관리자용 공지사항 </h1>

<table width = "800">
	<tr bgcolor ="gray">
		<th>No</th>
		<th>Content</th>
		<th>ID</th>
		<th>작성일</th>	
	</tr>
	<c:forEach  var="list"  items="${ list }">
			<tr>
				<td>${ list.notice_no }</td>
				<td>${ list.notice_title }</td>
				<td>${ list.notice_writer }</td>
				<td>${ list.notice_regdate }</td>
			</tr>
		</c:forEach>
</table>
	<a href="">글쓰기</a>
	<a href="modifyNotice.jsp">공지 수정</a>

</body>
</html>