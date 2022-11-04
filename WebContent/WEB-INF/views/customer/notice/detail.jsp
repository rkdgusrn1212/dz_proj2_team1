
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<script defer="defer"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>

<!-- 부트스트랩 연결 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<title>Insert title here</title>
<script type="text/javascript">
function load(){
	   console.log(${id});
	   var id = "";
	
	   id = ${id};

	    $.ajax({
	        url : "${pageContext.request.contextPath}/api/notice/"+id,
	        type : "get",
	        //data : {},
	        dataType : "JSON",
	        contentType : "applicaton/json; charset=utf-8",
	   
	        success: function(response){
	           console.log(response);
	           $("#regdate").append('작성일 ' + new Date(response.noticeRegDate))
	           $("#title").append(response.noticeTitle)
	           $("#content").append(response.noticeContent)
	           
	        }
	    });
	}

</script>

</head>
<body onload=load()>
	<div class="container" style="float: none; margin: 0 auto;">
		<div class="row" style="float: none; margin: 0 auto; border-bottom: 1px solid; ">
			<h3 id="regdate" style="margin-top: 100px;"></h3>
		</div>

		<div class="row" style="float: none; margin: 0 auto;">
			<p class="fs-2 fw-bold" id="title"
				style="margin-top: 50px; text-align: center;" />
		</div>

		<div class="row" style="float: none; margin: 0 auto; border-bottom: 1px solid; ">
			<p id="content"  style = "margin-top: 50px; margin-bottom: 50px;"/>
		</div>
				<div class="row" style="float: none; margin: 0 auto;  margin-top:25px; margin-bottom: 25px; justify-content: center;">
				<input type="button" class="btn btn-warning"
						style="margin-top: 10px; color: white; width : 180px; heigh: 40px;" value="목록" onclick="history.back()" />
				</div>
		
	</div>
</body>

</html>