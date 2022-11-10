<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Tasty Way : ABOUT US 메인</title>

<!-- css 초기화 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

<!-- css 연결 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jjh.css">

<!-- 부트스트랩 연결 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- 반응형 웹 연결 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<script src="./resources/js/jquery-3.5.1.min.js"></script>
<script src="./resources/js/bootstrap.bundle.min.js"></script>

</head>
<body>

	<div class="container" style="float: none; margin: 0 auto;">

		<div class="row" style="float: none; margin: 0 auto;">

			<img src="${rootPath}/resources/img/mainPhoto.PNG"
				style="width: 1400px; height: 500px; margin-top: 10px;">
		</div>

		<div class="mainfontsize">전세계 맛집을 공유하는 플랫폼</div>
		<div class="basicfontsize">Tasty way의 다양한 서비스를 사용해보세요!</div>

		<br>
		<br>
		<div class="row" style="float: none; margin: 0 auto;">

			<img src="${rootPath}/resources/img/good.PNG"
				style="width: 230px; height: 200px; margin-left: 60px; margin-right: 85px;">

			<img src="${rootPath}/resources/img/bag.PNG"
				style="width: 230px; height: 200px; margin-right: 85px;"> <img
				src="${rootPath}/resources/img/kakaotalk.PNG"
				style="width: 230px; height: 200px; margin-right: 85px;"> <img
				src="${rootPath}/resources/img/earth.PNG"
				style="width: 230px; height: 200px; margin-right: 60px;">
				
				
		</div><br><br>
		
		<div class="row" style="float: none; margin: 0 auto;">
			<h5 style="float: left; width: 335px; text-align: center; padding-right: 44px;">
				최고의 맛집을 공유할 수 있도록 <br> 지원합니다.
			</h5>
			<h5 style="float: left; width: 330px; text-align: center; padding-right: 44px;">
				지속적인 운영을 위해 <br> 끊임없이 노력합니다.
			</h5>
			<h5 style="float: left; width: 330px; text-align: center; padding-right: 44px;">
				사용자간의 경험을 공유하여 <br> 함께 성장해 나가겠습니다.
			</h5>
			<h5 style="float: left; width: 290px; text-align: center; padding-right: 44px;">
				전세계 사용자와 <br> 소통합니다.
			</h5>
		</div>
	</div>
	<br><br><br><br><br>

</body>
</html>