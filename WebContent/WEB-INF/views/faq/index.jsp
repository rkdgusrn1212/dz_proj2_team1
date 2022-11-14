<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"   prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script defer="defer" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<br><br><br><br><br><br><br><br>

<h1 align="center">FAQ</h1>
<br><br><br><br><br><br>


<table border="1" width="850" align="center">
		<tr>
			<th>번호</th>			
			<th>제목</th>			
			<th>작성자</th>			
			<th>작성 날짜</th>			
			
		</tr>
		
		 <c:forEach  var="list"  items="${ list }">
			<tr>
				<td>${ list.FAQ_NO }</td>
				<td><a href = "javascript:location.href = 'faqdetail?id=${ list.FAQ_NO }'">${ list.FAQ_TITLE }</a></td>
				<td>관리자</td>
				<td><fmt:formatDate value="${list.FAQ_REGDATE}" pattern="yyyy-MM-dd"/></td>
				
		
			</tr>
		</c:forEach>
</table><br>






<!--       --------------------페이지 링크----------------------------------     -->

<table width="600" align="center">
<tr>
	<td align="center">
		<!-- 처음 이전 링크 -->
		<c:if test="${pg>block}">  <!-- 5>10 : false / 15>10 : true -->
			[<a href= "javascript:location.href = 'faq?page=1&opt=${opt}&key=${key}'">◀◀</a>]
			[<a href="javascript:location.href = 'faq?page=${fromPage-1}&opt=${opt}&key=${key}'">◀</a>]		
		</c:if>
		<c:if test="${pg<=block}"> <!-- 5<=10 :true / 15<=10:false -->
			[<span style="color:gray">◀◀</span>]	
			[<span style="color:gray">◀</span>]
		</c:if>
		
		<!-- 블록 범위 찍기 -->
		<c:forEach begin="${fromPage}" end="${toPage}" var="i">
			<c:if test="${i==pg}">[${i}]</c:if>
			<c:if test="${i!=pg}">
				[<a href="javascript:location.href = 'faq?page=${i}&opt=${opt}&key=${key}'">${i}</a>]
			</c:if>
		</c:forEach>
		
		<!-- 다음, 이후 -->
		<c:if test="${toPage<allPage}"> <!-- 20<21 : true -->
				[<a href="javascript:location.href = 'faq?page=${toPage+1}&opt=${opt}&key=${key}'">▶</a>]
				[<a href="javascript:location.href = 'faq?page=${allPage}&opt=${opt}&key=${key}'">▶▶</a>]
		
		</c:if>	
		<c:if test="${toPage>=allPage}"> <!-- 21>=21 :true -->
				[<span style="color:gray">▶</span>]
				[<span style="color:gray">▶▶</span>]
		
		</c:if>			
		
	</td>
</tr>
</table>
<br>

<!-- -------------------------------------검색기능-------------------------------------------------- -->

<div align="center">
<form action="./faq" method="GET" >
		<select name="opt" style="width: 120px" >
		<option value="faq_title">제목</option>
		<option value="faq_content">내용</option>
		
		</select>
		<input	type="text" name="key"> 
		<input type="submit" value="검색">

</form>
</div>


</body>
</html>