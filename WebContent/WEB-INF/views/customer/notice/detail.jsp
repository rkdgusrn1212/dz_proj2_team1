<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<script defer="defer" src="${rootPath}/resources/js/jquery-3.6.1.min.js"></script>

<head>
<meta charset="UTF-8">
<title>Notice 상세페이지</title>
<script type="text/javascript">
function load(){
console.log(${id});
const id = ${id};

$.ajax({
	url : "${rootPath}/api/notice/"+id,
	type : "get",
	//data : {},
	dataType : "JSON",
	contentType : "application/json; charset=utf-8",

	success: function(response){
	   console.log(response);
	   
	   const date = new Date(response.noticeRegDate);

	 const options = {
	   year: '2-digit',
	   month: '2-digit',
	   day: '2-digit'
	 
	 };
	 const americanDateTime = new Intl.DateTimeFormat('en-US', options).format;
	 console.log(americanDateTime(date));
	   
	   
	   $("#regdate").append('작성일 ' + americanDateTime(date))
	   $("#title").append(response.noticeTitle)
	   $("#content").append(response.noticeContent)
	   
	}
});

}

function listpage(){
location.href= "${rootPath}/customer/notice";
}
</script>

</head>
<body onload=load()>
	<div class="container" style="float: none; margin: 0 auto;">
		<div class="row"
			style="float: none; margin: 0 auto; border-bottom: 1px solid;">
			<h3 id="regdate" style="margin-top: 100px;"></h3>
		</div>

		<div class="row" style="float: none; margin: 0 auto;">
			<p class="fs-2 fw-bold" id="title"
				style="margin-top: 50px; text-align: center;" />
		</div>

		<div class="row"
			style="float: none; margin: 0 auto; border-bottom: 1px solid;">
			<p id="content" style="margin-top: 50px; margin-bottom: 50px;" />
		</div>
		<div class="row"
			style="float: none; margin: 0 auto; margin-top: 25px; margin-bottom: 25px; justify-content: center;">
			<input type="button" class="btn btn-warning"
				style="margin-top: 10px; color: white; width: 180px; heigh: 40px;"
				value="목록" onclick="listpage()" />
		</div>

	</div>
</body>
</html>