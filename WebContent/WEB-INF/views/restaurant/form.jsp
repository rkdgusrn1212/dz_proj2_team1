<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tasty Way : 식당 등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- css 초기화 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" href="${root}/resources/css/reset.css">
<link rel="stylesheet" href="${root}/resources/css/bootstrap.min.css">
<script src="${root}/resources/js/jquery-3.6.1.min.js"></script>
<!-- css 연결 -->
<link rel="stylesheet" href="${root}/resources/css/jjh.css">
<script>


	$(document).ready(function() {
		let i = 2;
		$("#plus").click(function() {

			$("#menulist").append('<div class="greenbox" style="width: 250px;">음식명</div>'
					+ '<input type="text" id = "menu'+i+'" style="width: 400px; height: 50px;"placeholder="메뉴'+ i +'">'
					+ '<div class="greenbox" style="width: 250px;">가격</div>'
					+ '<input type="text"  id = "price'+i+'"style="width: 400px; height: 50px; padding: 0;"	placeholder="10000"/>');
			i++;
			if(i>5){
				console.log(i);
				$("#plus").off("click");
				$("#menulist").append('<h3 style = "color : red; text-align : center;"> 메뉴 추가는 최대 5개 까지 가능합니다 </h3>')
			}
		});
	
		
		
	});
	
	
</script>


</head>
<body>
	<div class="container"
		style="float: none; margin: 0 auto; margin-top: 100px;">
		<h2 style="text-align: center; margin-bottom: 50px;">점포 등록</h2>
		
		
		<div class="row" style="float: none; margin: 0 auto; width: 1300px;">
			<div class="greenbox" style="width: 250px;">점포명</div>
			<input type="text" style="width: 400px; height: 50px;" id="name"
				placeholder="홍콩반점">
			<div class="greenbox" style="width: 250px;">분류</div>

			<select class="form-select" id="category"
				style="float: left; width: 400px; height: 50px; text-align: center;">
				<option>한식</option>
				<option>양식</option>
				<option>중식</option>
				<option>기타</option>
			</select>
		</div>

		<div class="row"
			style="float: none; margin: 0 auto; width: 1300px; max-width: 101%">
			<div class="biggreenbox"
				style="width: 250px; height: 110px; float: left;">주소</div>
			<div class="row" style="float: left; width: 1074px;">
				<input type="text" id="address"
					style="width: 1050px; height: 50px; float: left; margin: 0;"
					placeholder="주소검색"> <input type="text" id="addressDetail"
					style="width: 1050px; height: 50px; float: left; margin: 0;"
					placeholder="상세주소">
			</div>
		</div>
		<div class="row" style="float: none; margin: 0 auto; width: 1300px;">
			<div class="greenbox" style="width: 250px;">대표 메뉴</div>
			<input type="text" id="menu" style="width: 400px; height: 50px;"
				placeholder="짜장면">
			<div class="greenbox" style="width: 250px;">대표 가격</div>
			<input type="text" id="price"
				style="width: 400px; height: 50px; padding: 0;" placeholder="10000">
		</div>

		<div class="row" style="float: none; margin: 0 auto; width: 1300px;">
			<div class="greenbox" style="width: 250px;">연락처</div>
			<input type="text" id="ph" style="width: 400px; height: 50px;"
				placeholder="031-000-0000">
			<div class="greenbox" style="width: 250px;">영업시간</div>
			<div style="width: 400px; margin: 0 auto; padding: 0;">
				<input type="time" id="opentime"
					style="width: 150px; height: 50px; float: left; margin: 0; margin-left: 15px;">
				<h1
					style="width: 80px; height: 50px; float: left; margin: 0; text-align: center;">
					~</h1>
				<input type="time" id="closetime"
					style="width: 150px; height: 50px; float: left; margin: 0;">
			</div>
		</div>

		<div class="row" id="menulist"
			style="float: none; margin: 0 auto; width: 1300px;">
			<div class="row"
				style="float: none; margin: 0 auto; width: 1300px; justify-content: space-between; align-items: center;">
				<h5 style="width:300px;">메뉴 추가</h5>
				<img alt="" id="plus" src="${root}/resources/img/plus.png"
					style="width: 50px; height: 25px;">
			</div>

			<div class="greenbox" style="width: 250px;">음식명</div>
			<input type="text"  id="menu1" style="width: 400px; height: 50px;"
				placeholder="짬뽕">
			<div class="greenbox" style="width: 250px;">가격</div>
			<input type="text" id="price1" style="width: 400px; height: 50px; padding: 0;"
				placeholder="10000" />
		</div>

	</div>




	<div class="row"
		style="float: none; margin: 0 auto; width: 1300px; justify-content: center;">
		<input type="submit" class="btn btn-info" value="등록"
			style="width: 150px; height: 50px; float: left; margin: 25px;" /> <input
			type="reset" class="btn btn-info" value="취소"
			style="width: 150px; height: 50px; float: left; margin: 25px;" />
	</div>


</body>
</html>