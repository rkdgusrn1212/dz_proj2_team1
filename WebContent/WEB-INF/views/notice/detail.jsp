
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <c:forEach  var="noticedetail"  items="${ noticedetail }">
				<br><br><br><br><br><br><br>
				<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ noticedetail.NOTICE_TITLE }</div>
				<hr>
				<br><br><br><br><br><br><br><br><br><br><br>
				<div align="center">${ noticedetail.NOTICE_CONTENT}</div>
				
		
			
		</c:forEach>
</body>
</html>