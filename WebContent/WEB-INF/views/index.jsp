<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Tasty Way : 메인</title>

<!-- css 초기화 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" href="${rootPath}/resources/css/reset.css">
<link rel="stylesheet"
	href="${rootPath}/resources/css/bootstrap.min.css">
<script src="${rootPath}/resources/js/jquery-3.6.1.min.js"></script>

</head>

<body>

	<!-- <h1>JQUERY AJAX TEST</h1>
<button id="send-btn">send</button><br>
<p id="result-text">df</p>
<script>
$("#send-btn").click(()=>{
        $.ajax({
            url : "${pageContext.request.contextPath}/api/notice/page/1",
            type : "get",
            //data : {},
            dataType : "JSON",
            contentType : "applicaton/json; charset=utf-8",
            success: function(response) {
            	$("#result-text").html(JSON.stringify(response));                    
            },
            
        });
    }
);
</script> -->

	<div class="container" style="float: none; margin: 0 auto;">

		<div class="row"
			style="float : none; margin : 0 auto; height: 350px;
		background-image: url('${rootPath}/resources/img/main_banner.jpg')">
			<h2
				style="font-weight: bolder; text-align: center; justify-content: center; padding-top: 130px;">
				<font color="FFFFFF">근처의 맛집을 찾아보세요 </font>
			</h2>

			<div class="row" style="float: none; margin: 0 auto;">
				<div
					style="width: 1300px; height: 100px; justify-content: center; padding-left: 450px; padding-right: 450px;">
					<form class="d-flex">
						<input class="form-control me-sm-2" type="text"
							placeholder="Search" width='5px;' height='5px;' "/>
						<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
					</form>
				</div>
			</div>
		</div>

		<div class="row"
			style="float: none; margin: 0 auto; margin-top: 13px; text-align: center;">
			<h3>
				<b>요즘 핫한 맛집들</b>
			</h3>
			<br> <br>
			<h4>▼</h4>
		</div>
		<br> <br>
		<div class="row"
			style="float: none; margin: 0 auto; margin-top: 13px; text-align: center;">
			<div
				style="border: 1px black; float: left; width: 33%; padding-right: 35px; padding-left: 35px;">
				<div class="selector">
					<a href="https://www.naver.com/"> <!-- 그림클릭하면 이동할 주소 --> <img
						src="${rootPath}/resources/img/food1.PNG">
						<h4 style="padding-bottom: 5px;">
							<b>엄청 맛있는 양식집</b></a>
					</h4>
					<h5 style="padding-bottom: 2px;">
						평점 : ★★★★★ <br> 메뉴 : 파스타 <br> 주소 : 서울시 강서구
				</div>
				<br>
				<hr>
			</div>
			<div
				style="border: 1px black; float: left; width: 33%; padding-right: 35px; padding-left: 35px;">
				<div class="selector">
					<a href="https://www.naver.com/"> <img
						src="${rootPath}/resources/img/food4.PNG">
						<h4 style="padding-bottom: 5px;">
							<b>엄청 맛있는 양식집</b></a>
					</h4>
					<h5 style="padding-bottom: 2px;">
						평점 : ★★★★★ <br> 메뉴 : 파스타2 <br> 주소 : 서울시 강서구
				</div>
				<br>
				<hr>
			</div>
			<div
				style="border: 1px black; float: left; width: 33%; padding-right: 35px; padding-left: 35px;">
				<div class="selector">
					<a href="https://www.naver.com/"> <img
						src="${rootPath}/resources/img/food3.PNG">
						<h4 style="padding-bottom: 5px; padding-top: 3px;">
							<b>엄청 맛있는 양식집</b></a>
					</h4>
					<h5 style="padding-bottom: 2px;">
						평점 : ★★★★★ <br> 메뉴 : 파스타3 <br> 주소 : 서울시 강서구
				</div>
				<br>
				<hr>
			</div>
		</div>
		<div class="row"
			style="float: none; margin: 0 auto; margin-top: 13px; text-align: center;">
			<div
				style="border: 1px black; float: left; width: 33%; padding-right: 35px; padding-left: 35px; padding-bottom: 3px;">
				<div class="selector">
					<a href="https://www.naver.com/"> <img
						src="${rootPath}/resources/img/food2.PNG">
						<h4 style="padding-bottom: 5px;">
							<b>엄청 맛있는 양식집</b></a>
					</h4>
					<h5 style="padding-bottom: 2px;">
						평점 : ★★★★★ <br> 메뉴 : 파스타4 <br> 주소 : 서울시 강서구
				</div>
				<br>
				<hr>
			</div>
			<div
				style="border: 1px black; float: left; width: 33%; padding-right: 35px; padding-left: 35px; padding-bottom: 3px;">
				<div class="selector">
					<a href="https://www.naver.com/"> <img
						src="${rootPath}/resources/img/food4.PNG">
						<h4 style="padding-bottom: 5px;">
							<b>엄청 맛있는 양식집</b></a>
					</h4>
					<h5 style="padding-bottom: 2px;">
						평점 : ★★★★★ <br> 메뉴 : 파스타5 <br> 주소 : 서울시 강서구
				</div>
				<br>
				<hr>
			</div>
			<div
				style="border: 1px black; float: left; width: 33%; padding-right: 35px; padding-left: 35px; padding-bottom: 3px;">
				<div class="selector">
					<a href="https://www.naver.com/"> <img
						src="${rootPath}/resources/img/food2.PNG">
						<h4 style="padding-bottom: 5px;">
							<b>엄청 맛있는 양식집</b></a>
					</h4>
					<h5 style="padding-bottom: 2px;">
						평점 : ★★★★★ <br> 메뉴 : 파스타6 <br> 주소 : 서울시 강서구
				</div>
				<br>
				<hr>
			</div>
		</div>
		<div class="row"
			style="float: none; margin: 0 auto; margin-top: 13px; text-align: center;">
			<div
				style="border: 1px black; float: left; width: 33%; padding-right: 35px; padding-left: 35px; padding-bottom: 3px;">
				<div class="selector">
					<a href="https://www.naver.com/"> <img
						src="${rootPath}/resources/img/food1.PNG">
						<h4 style="padding-bottom: 5px;">
							<b>엄청 맛있는 양식집</b></a>
					</h4>
					<h5 style="padding-bottom: 2px;">
						평점 : ★★★★★ <br> 메뉴 : 파스타7 <br> 주소 : 서울시 강서구
				</div>
				<br>
				<hr>
			</div>
			<div
				style="border: 1px black; float: left; width: 33%; padding-right: 35px; padding-left: 35px; padding-bottom: 3px;">
				<div class="selector">
					<a href="https://www.naver.com/"> <img
						src="${rootPath}/resources/img/food4.PNG">
						<h4 style="padding-bottom: 5px;">
							<b>엄청 맛있는 양식집</b></a>
					</h4>
					<h5 style="padding-bottom: 2px;">
						평점 : ★★★★★ <br> 메뉴 : 파스타8 <br> 주소 : 서울시 강서구
				</div>
				<br>
				<hr>
			</div>
			<div
				style="border: 1px black; float: left; width: 33%; padding-right: 35px; padding-left: 35px; padding-bottom: 3px;">
				<div class="selector">
					<a href="https://www.naver.com/"> <img
						src="${rootPath}/resources/img/food3.PNG">
						<h4 style="padding-bottom: 5px;">
							<b>엄청 맛있는 양식집</b></a>
					</h4>
					<h5 style="padding-bottom: 2px;">
						평점 : ★★★★★ <br> 메뉴 : 파스9 <br> 주소 : 서울시 강서구
				</div>
				<br>
				<hr>
			</div>
		</div>
	</div><br><br>

</body>
</html>