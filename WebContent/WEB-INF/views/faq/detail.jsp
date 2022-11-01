
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <c:forEach  var="faqdetail"  items="${ faqdetail }">
				<br><br><br><br><br><br><br>
				<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ faqdetail.NOTICE_TITLE }</div>
				<hr>
				<br><br><br><br><br><br><br><br><br><br><br>
				<div align="center">${ faqdetail.NOTICE_CONTENT}</div>
				
		
			
		</c:forEach>
</body>
</html>