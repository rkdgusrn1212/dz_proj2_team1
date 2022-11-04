
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script defer="defer"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<!-- css 초기화 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

<link rel="stylesheet" href="${root}/resources/css/reset.css">
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
   var val1 = "";


   val1 = ${id};

    $.ajax({
        url : "${pageContext.request.contextPath}/api/faq/3",
        type : "get",
        //data : {},
        dataType : "JSON",
        contentType : "applicaton/json; charset=utf-8",
   
        success: function(response){
           console.log(response);
           $("#title").append(response.faqTitle)
           $("#content").append(response.faqContent)
           
        }
    });
    

}
</script>

</head>
<body>
ssss
	<p id="title" />
	<p id="content" />
	<table id="test"></table>
	${id}
</body>

</html>