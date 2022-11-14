<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Tasty Way : 팀 소개</title>

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
	<font color="#E0E0E0">홈>ABOUT US></font>팀 소개
	<div class="container" style="float: none; margin: 0 auto;">
		<div class="row"
			style="float: none; margin: 0 auto; margin-top: 50px; margin-bottom: 10px;">
			<h1 style="text-align: center;">Tasty way 소개</h1>
		</div>
		<div class="row"
			style="float: none; margin: 0 auto; margin-top: 50px; margin-bottom: 50px; justify-content: center;">
			<img class="subphoto2" src="${rootPath}/resources/img/mainPhoto2.PNG">
		</div>
		<div class="row"
			style="float: none; margin: 0 auto; justify-content: center;">
			<div style="float: left; width: 200px;">
				<h2 style="float: left;">Tasty way</h2>
			</div>
			<div style="float: left; width: 900px;">
				<p>
					<b>Tasty way(주)</b>는 글로벌 맛집 포털 사이트 입니다. 사용자들이 가게명, 후기, 평점등을 공유할 수
					있도록 플랫폼을 제공합니다.<br> 또한 <font style="font-weight: bolder;">Tasty
						way(주)</font>는 지속적인 웹사이트 성장을 위해 많은 개발자와 함께 노력하고 있습니다.
				</p>
				<hr>
			</div>
		</div>
		<div class="row"
			style="float: none; margin: 0 auto; justify-content: center;">
			<div style="float: left; width: 200px;">
				<h2 style="float: left;">
					DEVELOPER<br>PROFILE
				</h2>
			</div>
			<div style="float: left; width: 900px; line-height: 85px;">
				<h3 style="width: 130px; float: left; line-height: 76px;">팀원소개</h3>
				<span style="float: left; margin-right: 10px;">강현구(팀장)</span> <span
					style="float: left; margin-right: 10px;">이기찬</span> <span
					style="float: left; margin-right: 10px;">류정수</span> <span
					style="float: left; margin-right: 10px;">전지현</span><br>
				<hr>
			</div>
		</div>
		<div class="row"
			style="float: none; margin: 0 auto; justify-content: center;">
			<div style="float: left; width: 200px;"></div>
			<div style="float: left; width: 900px;">
				<h3
					style="width: 130px; float: left; height: 100px; text-align: center;">프로젝트
					소개</h3>
				<p>모범음식점은 「식품위생법」제47조 및 같은법 시행규칙 제61조에 의거하며 모범업소의 지정·관리 된다.</p>
				<p>
					이번 프로젝트의 주제로 선정된 맛집 플랫폼 <b>테이스티 웨이(Tasty Way)</b>는 1년마다 정기적으로 심사되는
					모범 음식점들의 <b>위치</b>, <b>대표메뉴</b>, <b>평점</b> 등의 다양한 정보를 제공 하여 유저간
					음식점에 대한 평가를 공유하는 <b>모범음식점 플랫폼</b>을 만들고자한다.
				</p>
				<hr>
			</div>
		</div>
		<div class="row"
			style="float: none; margin: 0 auto; justify-content: center;">
			<div style="float: left; width: 200px;"></div>
			<div style="float: left; width: 900px; line-height: 85px;">
				<h3 style="width: 130px; float: left; line-height: 76px;">개발스택</h3>
				<span style="float: left; margin-right: 10px;">Spring
					Framework</span> <span style="float: left; margin-right: 10px;">Oracle</span>
				<span style="float: left; margin-right: 10px;">JS</span> <span
					style="float: left; margin-right: 10px;">Java</span> <span
					style="float: left; margin-right: 10px;">HTML</span> <span
					style="float: left; margin-right: 10px;">CSS</span> <br>
				<hr>
			</div>
		</div>
	</div>
</body>
</html>