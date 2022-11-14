<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>Tasty Way : 메인</title>

<script defer="defer" src="${rootPath}/resources/js/jquery-3.6.1.min.js"></script>

<!-- css 초기화 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

<!-- css 연결 -->
<link rel="stylesheet" href="${rootPath}/resources/css/lkc.css">

<!-- 반응형 웹 연결 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.5.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${rootPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${rootPath}/resources/css/bootstrap-icons.css">
<link rel="stylesheet"
	href="${rootPath}/resources/css/prism-okaidia.css">
<link rel="stylesheet" href="${rootPath}/resources/css/custom.min.css">
</head>

<body onload="load()">


	<div class="container"
		style="float: none; margin: 0 auto; margin-bottom: 50px;">

		<div class="row"
			style="float : none; margin : 0 auto; height: 600px;
      background-image: url('${rootPath}/resources/img/main_banner.png')">
			<h1
				style="font-weight: bolder; text-align: center; justify-content: center; padding-top: 240px; text-decoration-line: underline;">
				<font color="FFFFFF"> 근처의 맛집을 찾아보세요</font>
			</h1>

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
			style="float: none; margin: 0 auto; margin-top: 13px; margin-bottom: 50px; text-align: center;">


			<div class="col-4" style="border: 1px black; float: left;">
				<a href="${rootPath}/restaurant/detail?id=1"> <!-- 그림클릭하면 이동할 주소 -->
					<img src="${rootPath}/resources/img/food31.PNG" style="width: 90%;">
					<h4
						style="padding-bottom: 5px; text-align: left; padding-bottom: 10px;">
						<div class="memu" id="storename" style="text-align: center;"></div></a>
				</h4>
				<h5 style="text-align: left;">
					<div class="storereview" id="storereview"
						style="padding-bottom: 2px;">
						<b>리뷰 :</b> (☞ﾟヮﾟ)☞
					</div>
					<div class="storemenu" id="storemenu" style="padding-bottom: 2px;"></div>
					<div class="storeaddress" id="storeaddress"
						style="padding-bottom: 2px;"></div>
				</h5>
				<br>
				<hr>
			</div>



			<div class="col-4" style="border: 1px black; float: left;">
				<a href="${rootPath}/restaurant/detail?id=2"> <!-- 그림클릭하면 이동할 주소 -->
					<img src="${rootPath}/resources/img/food32.PNG" style="width: 90%;">
					<h4
						style="padding-bottom: 5px; text-align: left; padding-bottom: 10px;">
						<div class="memu" id="storename2" style="text-align: center;"></div></a>
				</h4>
				<h5 style="text-align: left;">
					<div class="storereview2" id="storereview2"
						style="padding-bottom: 2px;">
						<b>리뷰 :</b> (☞ﾟヮﾟ)☞
					</div>
					<div class="storemenu2" id="storemenu2"
						style="padding-bottom: 2px;"></div>
					<div class="storeaddress2" id="storeaddress2"
						style="padding-bottom: 2px;"></div>
				</h5>
				<br>
				<hr>
			</div>

			<div class="col-4" style="border: 1px black; float: left;">
				<a href="${rootPath}/restaurant/detail?id=3"> <!-- 그림클릭하면 이동할 주소 -->
					<img src="${rootPath}/resources/img/food33.PNG" style="width: 90%;">
					<h4
						style="padding-bottom: 5px; text-align: left; padding-bottom: 10px;">
						<div class="memu" id="storename3" style="text-align: center;"></div></a>
				</h4>
				<h5 style="text-align: left;">
					<div class="storereview3" id="storereview3"
						style="padding-bottom: 2px;">
						<b>리뷰 :</b> (☞ﾟヮﾟ)☞
					</div>
					<div class="storemenu3" id="storemenu3"
						style="padding-bottom: 2px;"></div>
					<div class="storeaddress3" id="storeaddress3"
						style="padding-bottom: 2px;"></div>
				</h5>
				<br>
				<hr>
			</div>



			<div class="col-4" style="border: 1px black; float: left;">
				<a href="${rootPath}/restaurant/detail?id=4"> <!-- 그림클릭하면 이동할 주소 -->
					<img src="${rootPath}/resources/img/food34.PNG" style="width: 90%;">
					<h4
						style="padding-bottom: 5px; text-align: left; padding-bottom: 10px;">
						<div class="memu" id="storename4" style="text-align: center;"></div></a>
				</h4>
				<h5 style="text-align: left;">
					<div class="storereview4" id="storereview4"
						style="padding-bottom: 2px;">
						<b>리뷰 :</b> (☞ﾟヮﾟ)☞
					</div>
					<div class="storemenu4" id="storemenu4"
						style="padding-bottom: 2px;"></div>
					<div class="storeaddress4" id="storeaddress4"
						style="padding-bottom: 2px;"></div>
				</h5>
				<br>
				<hr>
			</div>



			<div class="col-4" style="border: 1px black; float: left;">
				<a href="${rootPath}/restaurant/detail?id=5"> <!-- 그림클릭하면 이동할 주소 -->
					<img src="${rootPath}/resources/img/food35.PNG" style="width: 90%;">
					<h4
						style="padding-bottom: 5px; text-align: left; padding-bottom: 10px;">
						<div class="memu" id="storename5"  style="text-align: center;"></div></a>
				</h4>
				<h5 style="text-align: left;">
					<div class="storereview5" id="storereview5"
						style="padding-bottom: 2px;">
						<b>리뷰 :</b> (☞ﾟヮﾟ)☞
					</div>
					<div class="storemenu5" id="storemenu5"
						style="padding-bottom: 2px;"></div>
					<div class="storeaddress5" id="storeaddress5"
						style="padding-bottom: 2px;"></div>
				</h5>
				<br>
				<hr>
			</div>

			<div class="col-4" style="border: 1px black; float: left;">
				<a href="${rootPath}/restaurant/detail?id=6"> <!-- 그림클릭하면 이동할 주소 -->
					<img src="${rootPath}/resources/img/food36.PNG" style="width: 90%;">
					<h4
						style="padding-bottom: 5px; text-align: left; padding-bottom: 10px;">
						<div class="memu" id="storename6"  style="text-align: center;"></div></a>
				</h4>
				<h5 style="text-align: left;">
					<div class="storereview6" id="storereview6"
						style="padding-bottom: 2px;">
						<b>리뷰 :</b> (☞ﾟヮﾟ)☞
					</div>
					<div class="storemenu6" id="storemenu6"
						style="padding-bottom: 2px;"></div>
					<div class="storeaddress6" id="storeaddress6"
						style="padding-bottom: 2px;"></div>
				</h5>
				<br>
				<hr>
			</div>

			<div class="col-4" style="border: 1px black; float: left;">
				<a href="${rootPath}/restaurant/detail?id=7"> <!-- 그림클릭하면 이동할 주소 -->
					<img src="${rootPath}/resources/img/food37.PNG" style="width: 90%;">
					<h4
						style="padding-bottom: 5px; text-align: left; padding-bottom: 10px;">
						<div class="memu" id="storename7"  style="text-align: center;"></div></a>
				</h4>
				<h5 style="text-align: left;">
					<div class="storereview7" id="storereview7"
						style="padding-bottom: 2px;">
						<b>리뷰 :</b> (☞ﾟヮﾟ)☞
					</div>
					<div class="storemenu7" id="storemenu7"
						style="padding-bottom: 2px;"></div>
					<div class="storeaddress7" id="storeaddress7"
						style="padding-bottom: 2px;"></div>
				</h5>
				<br>
				<hr>
			</div>



			<div class="col-4" style="border: 1px black; float: left;">
				<a href="${rootPath}/restaurant/detail?id=8"> <!-- 그림클릭하면 이동할 주소 -->
					<img src="${rootPath}/resources/img/food38.PNG" style="width: 90%;">
					<h4
						style="padding-bottom: 5px; text-align: left; padding-bottom: 10px;">
						<div class="memu" id="storename8"  style="text-align: center;"></div></a>
				</h4>
				<h5 style="text-align: left;">
					<div class="storereview8" id="storereview8"
						style="padding-bottom: 2px;">
						<b>리뷰 :</b> (☞ﾟヮﾟ)☞
					</div>
					<div class="storemenu8" id="storemenu8"
						style="padding-bottom: 2px;"></div>
					<div class="storeaddress8" id="storeaddress8"
						style="padding-bottom: 2px;"></div>
				</h5>
				<br>
				<hr>
			</div>

			<div class="col-4" style="border: 1px black; float: left;">
				<a href="${rootPath}/restaurant/detail?id=9"> <!-- 그림클릭하면 이동할 주소 -->
					<img src="${rootPath}/resources/img/food39.PNG" style="width: 90%;">
					<h4
						style="padding-bottom: 5px; text-align: left; padding-bottom: 10px;">
						<div class="memu" id="storename9"  style="text-align: center;"></div></a>
				</h4>
				<h5 style="text-align: left;">
					<div class="storereview9" id="storereview9"
						style="padding-bottom: 2px;">
						<b>리뷰 :</b> (☞ﾟヮﾟ)☞
					</div>
					<div class="storemenu9" id="storemenu9"
						style="padding-bottom: 2px;"></div>
					<div class="storeaddress9" id="storeaddress9"
						style="padding-bottom: 2px;"></div>
				</h5>
				<br>
				<hr>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	function load() {

		//------------값 불러오기 -----------

		/*       const count = (int)(Math.random() * 2945) + 1;
		 console.log(count);
		 */

		$.ajax({
			url : "${rootPath}/api/restaurant/1768", //식당 No.1768의 값
			type : "get",
			dataType : "JSON",
			contentType : "applicaton/json; charset=utf-8",
			success : function(response) { //값을 받아오면
				//console.log(response)
				$("#storename").append(response.restaurantName)
				$("#storemenu").append(
						"<b>" + "메뉴 : " + "</b>" + response.restaurantMenu)
				$("#storeaddress").append(
						"<b>" + "주소 :" + "</b>" + response.restaurantAddress)
			}
		});

		$.ajax({
			url : "${rootPath}/api/restaurant/1766", //식당 No.1766의 값
			type : "get",
			dataType : "JSON",
			contentType : "applicaton/json; charset=utf-8",
			success : function(response) { //값을 받아오면
				//console.log(response)
				$("#storename2").append(response.restaurantName)
				$("#storemenu2").append(
						"<b>" + "메뉴 : " + "</b>" + response.restaurantMenu)
				$("#storeaddress2").append(
						"<b>" + "주소 :" + "</b>" + response.restaurantAddress)
			}
		});

		$.ajax({
			url : "${rootPath}/api/restaurant/1914", //식당 No.1914의 값
			type : "get",
			dataType : "JSON",
			contentType : "applicaton/json; charset=utf-8",
			success : function(response) { //값을 받아오면
				//console.log(response)
				$("#storename3").append(response.restaurantName)
				$("#storemenu3").append(
						"<b>" + "메뉴 : " + "</b>" + response.restaurantMenu)
				$("#storeaddress3").append(
						"<b>" + "주소 :" + "</b>" + response.restaurantAddress)
			}
		});

		$.ajax({
			url : "${rootPath}/api/restaurant/1871", //식당 No.1871의 값
			type : "get",
			dataType : "JSON",
			contentType : "applicaton/json; charset=utf-8",
			success : function(response) { //값을 받아오면
				//console.log(response)
				$("#storename4").append(response.restaurantName)
				$("#storemenu4").append(
						"<b>" + "메뉴 : " + "</b>" + response.restaurantMenu)
				$("#storeaddress4").append(
						"<b>" + "주소 :" + "</b>" + response.restaurantAddress)
			}
		});

		$.ajax({
			url : "${rootPath}/api/restaurant/1855", //식당 No.1855의 값
			type : "get",
			dataType : "JSON",
			contentType : "applicaton/json; charset=utf-8",
			success : function(response) { //값을 받아오면
				//console.log(response)
				$("#storename5").append(response.restaurantName)
				$("#storemenu5").append(
						"<b>" + "메뉴 : " + "</b>" + response.restaurantMenu)
				$("#storeaddress5").append(
						"<b>" + "주소 :" + "</b>" + response.restaurantAddress)
			}
		});

		$.ajax({
			url : "${rootPath}/api/restaurant/1857", //식당 No.1857의 값
			type : "get",
			dataType : "JSON",
			contentType : "applicaton/json; charset=utf-8",
			success : function(response) { //값을 받아오면
				//console.log(response)
				$("#storename6").append(response.restaurantName)
				$("#storemenu6").append(
						"<b>" + "메뉴 : " + "</b>" + response.restaurantMenu)
				$("#storeaddress6").append(
						"<b>" + "주소 :" + "</b>" + response.restaurantAddress)
			}
		});

		$.ajax({
			url : "${rootPath}/api/restaurant/1859", //식당 No.1859의 값
			type : "get",
			dataType : "JSON",
			contentType : "applicaton/json; charset=utf-8",
			success : function(response) { //값을 받아오면
				//console.log(response)
				$("#storename7").append(response.restaurantName)
				$("#storemenu7").append(
						"<b>" + "메뉴 : " + "</b>" + response.restaurantMenu)
				$("#storeaddress7").append(
						"<b>" + "주소 :" + "</b>" + response.restaurantAddress)
			}
		});

		$.ajax({
			url : "${rootPath}/api/restaurant/1861", //식당 No.1861의 값
			type : "get",
			dataType : "JSON",
			contentType : "applicaton/json; charset=utf-8",
			success : function(response) { //값을 받아오면
				//console.log(response)
				$("#storename8").append(response.restaurantName)
				$("#storemenu8").append(
						"<b>" + "메뉴 : " + "</b>" + response.restaurantMenu)
				$("#storeaddress8").append(
						"<b>" + "주소 :" + "</b>" + response.restaurantAddress)
			}
		});

		$.ajax({
			url : "${rootPath}/api/restaurant/1864", //식당 No.1864의 값
			type : "get",
			dataType : "JSON",
			contentType : "applicaton/json; charset=utf-8",
			success : function(response) { //값을 받아오면
				//console.log(response)
				$("#storename9").append(response.restaurantName)
				$("#storemenu9").append(
						"<b>" + "메뉴 : " + "</b>" + response.restaurantMenu)
				$("#storeaddress9").append(
						"<b>" + "주소 :" + "</b>" + response.restaurantAddress)
			}
		});

		//------------검색 기능 미정 -----------
	}
</script>

</html>