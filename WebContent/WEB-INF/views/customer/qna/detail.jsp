
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${rootPath}/resources/css/reset.css">
<link rel="stylesheet"
	href="${rootPath}/resources/css/bootstrap.min.css">
<!-- css 초기화 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" href="${rootPath}/resources/css/lkc.css">

<link rel="stylesheet" href="${rootPath}/resources/css/reset.css">
<script
	src="${rootPath}/resources/js/jquery-3.6.1.min.js"></script>
<meta charsageConet="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function load(){
   console.log(${id});
   var val1 = "";


   val1 = ${id};

    $.ajax({
        url : "${rootPath}/api/qna/"+val1,
        type : "get",
        //data : {},
        dataType : "JSON",
        contentType : "applicaton/json; charset=utf-8",
   
        success: function(response){
           console.log(response);
    	   const date = new Date(response.qnaRegDate);
    	   const options = {
    			   year: '2-digit',
    			   month: '2-digit',
    			   day: '2-digit'
    			 
    			 };
    	   const americanDateTime = new Intl.DateTimeFormat('en-US', options).format;
    		 console.log(americanDateTime(date));
    		   $("#regdate").append('작성일 ' + americanDateTime(date))
           $("#title").append(response.qnaTitle)
           $("#content").append(response.qnaContent)
           console.log(response.qnaWr)
           if(response.qnaWriter != 0){
           $("#writer").append(response.qnaWriter)
           } else{
        	   $("#writer").append(response.qnaNonMember)
           }
        }
    });
    

}
function listpage(){
	location.href= "${rootPath}/customer/qna";
	}
</script>

</head>
<body  onload = "load()">
  <div class="container" style="float: none; margin: 0 auto;">
		<div class="row"
			style="float: none; margin: 0 auto; margin-top: 100px; border-bottom: 1px solid;     justify-content: space-between;">
			<h3 id="regdate" style="width:300px;;"></h3>
			<div style="width:500px;">
			<h3 style="float:left; width:200px; text-align: right;">작성자</h3>
			
			<h3 id="writer"style="float:right; width:200px; text-align: center;"></h3>
			</div>
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