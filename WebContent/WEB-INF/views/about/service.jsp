<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Tasty Way : Service 소개</title>

<!-- css 초기화 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" href="${rootPath}/resources/css/reset.css">
<link rel="stylesheet"
	href="${rootPath}/resources/css/bootstrap.min.css">
<script src="${rootPath}/resources/js/jquery-3.6.1.min.js"></script>
<!-- css 연결 -->

</head>
<body>


	<font color="#E0E0E0">홈>ABOUT US></font>서비스
	<div class="container" style="float: none; margin: 0 auto;">
		<div class="row"
			style="float: none; margin: 0 auto; margin-top: 50px; margin-bottom: 10px;">
			<h1 style="text-align: center;">FEATURED SERVICES</h1>
			<div class="row" style="float: none; margin: 0 auto">
				<h6 style="text-align: center;">
					Tasty way는 누구나 쉽게 접근할 수 있는 맛집 플랫폼을 제공하기 위해 <br> 새로운 변화를 추구하고,
					항상 새롭게 도전합니다.
				</h6>
			</div>
		</div>


		<div class="row"
			style="float: none; margin: 0 auto; margin-top: 50px;">
			<div style="float: left;">
				<font size="8" color="coral">Tasty way</font>
				<h5>국내 최대 맛집 검색 포털 서비스</h5>
			</div>
			<div style="width: 250px; float: left; height: 250px;">
				<img src="${rootPath}/resources/img/twLogo.png"
					style="width: 200px;; height: 160px;">
			</div>

			<div style="width: 900px; float: left;">
				<div>
					<h5>
						<span style="font-weight: bolder;">Tasty way(주)</span>는 소비자들이 보다
						쉽고 빠르게 맛집을 찾을 수 있도록 도와주는 웹사이트입니다.
						<p>매년 정기적으로 심사되어 인증된 모범 음식점만을 기준으로 음식점에 대한 정보를 제공하며, 기본적으로 가게의
							위치, 대표메뉴, 가격 등이 제공됩니다.</p>
						<ul>
							<p>
							<h6>
								<li style="margin-bottom: 5px;">실제 음식점을 방문한 고객들은 해당 음식점에 대한
									솔직한 리뷰와 평점을 남길 수 있습니다.</li>
								<li style="margin-bottom: 5px;">음식점은 GPS를 통해 현재 자신이 위치하고 있는
									장소를 기준으로 가까운 음식점을 화면상에 출력해 드립니다.</li>
								<li style="margin-bottom: 5px;">필터 기능을 통해 먹고싶은 음식의 종류를
									선택해보세요.</li>
								<li style="margin-bottom: 5px;">현재 필터는 양식, 중식, 한식 등의 카테고리로
									설정되어 있습니다.</li>
							</h6>
							</p>
						</ul>
						사용자간 음식점에 대한 정보를 공유하면서 오늘도 맛있는 하루되세요 :)
					</h5>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<div class="container" style="float: none; margin: 0 auto;">
		<img src="${rootPath}/resources/img/food1.PNG"
			style="height: 340px; width: 370px; margin: 5px;"> <img
			src="${rootPath}/resources/img/food2.PNG"
			style="height: 340px; width: 370px; margin: 5px;"> <img
			src="${rootPath}/resources/img/food3.PNG"
			style="height: 340px; width: 370px; margin: 5px;">

	</div>
</body>
</html>