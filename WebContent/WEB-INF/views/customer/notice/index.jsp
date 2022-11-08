<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tasty Way : 공지 메인</title>
<style type="text/css">
#line {
	height: 50px;
	border-top: 1px solid #d3d3d3;
	border-bottom: 1px solid #d3d3d3;
}
</style>

<!-- css 초기화 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

<link rel="stylesheet" href="${root}/resources/css/reset.css">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>
<!-- jQuery 라이브러리 호출 -->
<!-- 반응형 웹 연결 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.5.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/prism-okaidia.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/custom.min.css">
</head>
<body onload="load()">
	<div class="container" style="float: none; margin: 0 auto;">
		<div class="col" style="float: none; margin-top: 10%">
			<h1 class="row" style="justify-content: center;">공지사항</h1>
			<div class="row" style="float: none; margin: 0 auto;">
				<table class="table table-hov	er" id="test" style="text-align: center;">
					<thead>
						<tr>

						</tr>
					</thead>
					<tbody>

					</tbody>

				</table>
			</div>

			<!--       --------------------페이지 링크----------------------------------     -->
			<div class="row" style="float: none; margin: 0 auto;">
				<div class="test">
					<ul class="pagination pagination-lg" id="button"
						style="justify-content: center;">


					</ul>
				</div>
			</div>
			<!-- -------------------------------------검색기능-------------------------------------------------- -->
			<div class="row"
				style="float: none; margin: 0 auto; width: 525px; margin-bottom: 50px;">
				<form name="searchform" method="GET">
					<div class="form-group" style="max-width: 2000px;">
						<select class="form-select" id="searchopt" name="opt"
							style="width: 100px; float: left;">
							<!--  style="width: 120px" -->
							<option value="noticeTitle">제목</option>
							<option value="noticeContent">내용</option>
						</select>


						<div
							style="margin: auto; align-content: center; margin-bottom: 10px; text-align: center; max-width: 2000px;">
							<input type="text" name="key" id="searchdata"
								style="width: 300px; float: left; margin-left: 15px;"
								class="form-control"> <input type="button" value="검색"
								class="btn btn-light"
								style="background-color: #d3d3d3; width: 70px; float: left; margin-left: 15px;"
								onclick="search()">
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
	</div>
</body>
<script>
	function load() {

		$.ajax({
			url : "${pageContext.request.contextPath}/api/notice/page/1",
			type : "get",
			//data : {},
			dataType : "JSON",
			contentType : "applicaton/json; charset=utf-8",
			/* success: function(response) {
				$("#result-text").html(JSON.stringify(response));                    
			}, */

			success : function(response) {
				//console.log(response)
				//테이블 비워주기
				$("#test > tbody").empty();
				$("#test").append(
						"<tr class='table-primary'><th scope='col'>번호</th>"
								+ "<th scope='col'>제목</th>"
								+ "<th scope='col'>작성자</th>"
								+ "<th scope='col'>작성 날짜</th></tr>")
				for (idx in response) {

					const date = new Date(response[idx].noticeRegDate);

					const options = {
						year : '2-digit',
						month : '2-digit',
						day : '2-digit'

					};
					const americanDateTime = new Intl.DateTimeFormat('en-US',
							options).format;
					console.log(americanDateTime(date));

					//	console.log(response[idx].noticeRegDate);

					$("#test").append(

							"<tr >" + "<td scope='row'>"
									+ response[idx].noticeNo + "</td>" +
									//"<td><a href =javascript:location.href = 'noticedetail?id="+response[idx].noticeNo + "'>" + response[idx].noticeTitle+ "</a></td>"+
									"<td><a href = ${root}/tastyway/customer/notice/detail?id="
									+ response[idx].noticeNo + ">"
									+ response[idx].noticeTitle + "</a></td>"
									+ "<td>" + "관리자" + "</td>" + "<td>"
									+ americanDateTime(date) + "</td>"
									+ "</tr>")

				}

			},

		});

		$
				.ajax({
					url : "${pageContext.request.contextPath}/api/notice/count",
					type : "get",
					//data : {},
					dataType : "JSON",
					contentType : "applicaton/json; charset=utf-8",
					/* success: function(response) {
						$("#result-text").html(JSON.stringify(response));                    
					}, */

					success : function(response) {
						console.log(response)
						var count = parseInt(response); //문자를 정수형 숫자로 변환해줌
						$("#button").empty();
						if (count <= 10) {
							$("#button")
									.append(
											"<li class='page-item disabled' id='left'><a class='page-link' >&laquo;</a></li>"
													+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"
													+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
						} else if (count > 10 && count <= 20) {

							$("#button")
									.append(
											"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"
													+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"
													+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"
													+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
						} else if (count > 20 && count <= 30) {

							$("#button")
									.append(
											"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"
													+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"
													+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"
													+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'> 3</a></li>"
													+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
						} else if (count > 30 && count <= 40) {
							$("#button")
									.append(
											"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"
													+ "<li class='page-item active'id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"
													+ "<li class='page-item'id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"
													+ "<li class='page-item'id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'> 3</a></li>"
													+ "<li class='page-item'id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'> 4</a></li>"
													+

													"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
						} else if (count > 40 && count <= 50) {

							$("#button")
									.append(
											"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"
													+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"
													+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"
													+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'> 3</a></li>"
													+ "<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'> 4</a></li>"
													+ "<li class='page-item' id='quinaryli'><a class='page-link' id = 'quinarybtn' href ='#' onclick='PageClick(this);'> 5</a></li>"
													+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");

						} else {
							$("#button")
									.append(
											"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"
													+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"
													+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"
													+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'> 3</a></li>"
													+ "<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'> 4</a></li>"
													+ "<li class='page-item' id='quinaryli'><a class='page-link' id = 'quinarybtn' href ='#' onclick='PageClick(this);'> 5</a></li>"
													+ "<li class='page-item' id='right'><a class='page-link' href ='#' onclick='RightPageChange()';> &raquo;</a></li>");
						}
					}
				});

	}

	// ---------------------------------페이지 클릭----------------------------------------------------------

	function PageClick(pagebtn) {
		var strText = $(pagebtn).text();
		console.log(strText);

		var getId = $(pagebtn).attr("id");
		console.log(getId);

		//--------------active  toggle---------------------------

		if (getId == "firstbtn") {
			$("#firstli").removeClass();
			$("#firstli").addClass('page-item active');
			$("#secondli").removeClass();
			$("#secondli").addClass('page-item ');
			$("#thirdli").removeClass();
			$("#thirdli").addClass('page-item');
			$("#fourthli").removeClass();
			$("#fourthli").addClass('page-item');
			$("#quinaryli").removeClass();
			$("#quinaryli").addClass('page-item');
		} else if (getId == 'secondbtn') {
			$("#firstli").removeClass();
			$("#firstli").addClass('page-item');
			$("#secondli").removeClass();
			$("#secondli").addClass('page-item active');
			$("#thirdli").removeClass();
			$("#thirdli").addClass('page-item');
			$("#fourthli").removeClass();
			$("#fourthli").addClass('page-item');
			$("#quinaryli").removeClass();
			$("#quinaryli").addClass('page-item');
		} else if (getId == 'thirdbtn') {
			$("#firstli").removeClass();
			$("#firstli").addClass('page-item ');
			$("#secondli").removeClass();
			$("#secondli").addClass('page-item ');
			$("#thirdli").removeClass();
			$("#thirdli").addClass('page-item active');
			$("#fourthli").removeClass();
			$("#fourthli").addClass('page-item');
			$("#quinaryli").removeClass();
			$("#quinaryli").addClass('page-item');
		} else if (getId == 'fourthbtn') {
			$("#firstli").removeClass();
			$("#firstli").addClass('page-item ');
			$("#secondli").removeClass();
			$("#secondli").addClass('page-item ');
			$("#thirdli").removeClass();
			$("#thirdli").addClass('page-item');
			$("#fourthli").removeClass();
			$("#fourthli").addClass('page-item active');
			$("#quinaryli").removeClass();
			$("#quinaryli").addClass('page-item');
		} else if (getId == 'quinarybtn') {
			$("#firstli").removeClass();
			$("#firstli").addClass('page-item ');
			$("#secondli").removeClass();
			$("#secondli").addClass('page-item ');
			$("#thirdli").removeClass();
			$("#thirdli").addClass('page-item');
			$("#fourthli").removeClass();
			$("#fourthli").addClass('page-item');
			$("#quinaryli").removeClass();
			$("#quinaryli").addClass('page-item active');
		}

		var optdata = $("#searchopt option:selected").val();
		var keydata = $("#searchdata").val();
		console.log(optdata);
		console.log(keydata);
		if (keydata == null) {
			$.ajax({
				url : "${pageContext.request.contextPath}/api/notice/page/"
						+ strText,
				type : "get",
				//data : {},
				dataType : "JSON",
				contentType : "applicaton/json; charset=utf-8",
				/* success: function(response) {
					$("#result-text").html(JSON.stringify(response));                    
				}, */

				success : function(response) {
					//console.log(response)
					//테이블 비워주기
					$("#test > tbody").empty();
					$("#test").append(
							"<tr  class='table-primary'><th scope='col'>번호</th>"
									+ "<th scope='col'>제목</th>"
									+ "<th scope='col'>작성자</th>"
									+ "<th scope='col'>작성 날짜</th></tr>")
					for (idx in response) {

						const date = new Date(response[idx].noticeRegDate);

						const options = {
							year : '2-digit',
							month : '2-digit',
							day : '2-digit'

						};
						const americanDateTime = new Intl.DateTimeFormat(
								'en-US', options).format;
						console.log(americanDateTime(date));

						//	console.log(response[idx].noticeRegDate);

						$("#test").append(

								"<tr >" + "<td scope='row'>"
										+ response[idx].noticeNo + "</td>" +
										//"<td><a href =javascript:location.href = 'noticedetail?id="+response[idx].noticeNo + "'>" + response[idx].noticeTitle+ "</a></td>"+
										"<td><a href = ${root}/tastyway/customer/notice/detail?id="
										+ response[idx].noticeNo + ">"
										+ response[idx].noticeTitle
										+ "</a></td>" + "<td>" + "관리자"
										+ "</td>" + "<td>"
										+ americanDateTime(date) + "</td>"
										+ "</tr>")

					}

				},

			});
		} else {
			$.ajax({
				url : "${pageContext.request.contextPath}/api/notice/page/"
						+ strText,
				type : "get",
				data : {

					opt : optdata,
					key : keydata

				},
				dataType : "JSON",
				contentType : "applicaton/json; charset=utf-8",
				/* success: function(response) {
					$("#result-text").html(JSON.stringify(response));                    
				}, */

				success : function(response) {
					//console.log(response)
					//테이블 비워주기
					$("#test > tbody").empty();
					$("#test").append(
							"<tr  class='table-primary'><th scope='col'>번호</th>"
									+ "<th scope='col'>제목</th>"
									+ "<th scope='col'>작성자</th>"
									+ "<th scope='col'>작성 날짜</th></tr>")
					for (idx in response) {

						const date = new Date(response[idx].noticeRegDate);

						const options = {
							year : '2-digit',
							month : '2-digit',
							day : '2-digit'

						};
						const americanDateTime = new Intl.DateTimeFormat(
								'en-US', options).format;
						console.log(americanDateTime(date));

						//	console.log(response[idx].noticeRegDate);

						$("#test").append(

								"<tr >" + "<td scope='row'>"
										+ response[idx].noticeNo + "</td>" +
										//"<td><a href =javascript:location.href = 'noticedetail?id="+response[idx].noticeNo + "'>" + response[idx].noticeTitle+ "</a></td>"+
										"<td><a href = ${root}/tastyway/customer/notice/detail?id="
										+ response[idx].noticeNo + ">"
										+ response[idx].noticeTitle
										+ "</a></td>" + "<td>" + "관리자"
										+ "</td>" + "<td>"
										+ americanDateTime(date) + "</td>"
										+ "</tr>")

					}

				},

			});
		}
	}

	// ---------------------------------검색----------------------------------------------------------

	function search() {
		var optdata = $("#searchopt option:selected").val();
		var keydata = $("#searchdata").val();
		console.log(optdata);
		console.log(keydata);
		$.ajax({
			url : "${pageContext.request.contextPath}/api/notice/page/1",
			type : "get",
			data : {

				opt : optdata,
				key : keydata

			},
			dataType : "JSON",
			contentType : "applicaton/json; charset=utf-8",

			success : function(response) {
				//console.log(response)
				//테이블 비워주기
				$("#test > tbody").empty();
				$("#test").append(
						"<tr  class='table-primary'><th scope='col'>번호</th>"
								+ "<th scope='col'>제목</th>"
								+ "<th scope='col'>작성자</th>"
								+ "<th scope='col'>작성 날짜</th></tr>")
				for (idx in response) {

					const date = new Date(response[idx].noticeRegDate);

					const options = {
						year : '2-digit',
						month : '2-digit',
						day : '2-digit'

					};
					const americanDateTime = new Intl.DateTimeFormat('en-US',
							options).format;
					console.log(americanDateTime(date));

					//	console.log(response[idx].noticeRegDate);

					$("#test").append(

							"<tr >" + "<td scope='row'>"
									+ response[idx].noticeNo + "</td>" +
									//"<td><a href =javascript:location.href = 'noticedetail?id="+response[idx].noticeNo + "'>" + response[idx].noticeTitle+ "</a></td>"+
									"<td><a href = ${root}/tastyway/customer/notice/detail?id="
									+ response[idx].noticeNo + ">"
									+ response[idx].noticeTitle + "</a></td>"
									+ "<td>" + "관리자" + "</td>" + "<td>"
									+ americanDateTime(date) + "</td>"
									+ "</tr>")

				}

			},

		});

		$
				.ajax({
					url : "${pageContext.request.contextPath}/api/notice/count",
					type : "get",
					data : {
						opt : optdata,
						key : keydata
					},
					dataType : "JSON",
					contentType : "applicaton/json; charset=utf-8",

					success : function(response) {
						console.log(response)
						var count = parseInt(response); //문자를 정수형 숫자로 변환해줌
						$("#button").empty();
						if (count <= 10) {
							$("#button")
									.append(
											"<li class='page-item disabled' id='left'><a class='page-link'>&laquo;</a></li>"
													+ "<li class='page-item' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"
													+ "<li class='page-item' id='right'><a class='page-link' > &raquo;</a></li>");
						} else if (count > 10 && count <= 20) {

							$("#button")
									.append(
											"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"
													+ "<li class='page-item' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"
													+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"
													+ "<li class='page-item' id='right'><a class='page-link' > &raquo;</a></li>");
						} else if (count > 20 && count <= 30) {

							$("#button")
									.append(
											"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"
													+ "<li class='page-item' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"
													+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"
													+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'> 3</a></li>"
													+ "<li class='page-item' id='right'><a class='page-link' > &raquo;</a></li>");
						} else if (count > 30 && count <= 40) {
							$("#button")
									.append(
											"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"
													+ "<li class='page-item' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"
													+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"
													+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'> 3</a></li>"
													+ "<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'> 4</a></li>"
													+

													"<li class='page-item' id='right'><a class='page-link' > &raquo;</a></li>");
						} else if (count > 40 && count <= 50) {

							$("#button")
									.append(
											"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"
													+ "<li class='page-item' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"
													+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"
													+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'> 3</a></li>"
													+ "<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'> 4</a></li>"
													+ "<li class='page-item' id='quinaryli'><a class='page-link' id = 'quinarybtn' href ='#' onclick='PageClick(this);'> 5</a></li>"
													+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");

						} else {
							$("#button")
									.append(
											"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"
													+ "<li class='page-item' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"
													+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"
													+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'> 3</a></li>"
													+ "<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'> 4</a></li>"
													+ "<li class='page-item' id='quinaryli'><a class='page-link' id = 'quinarybtn' href ='#' onclick='PageClick(this);'> 5</a></li>"
													+ "<li class='page-item' id='right'><a class='page-link' href ='#' onclick='RightPageChange()';> &raquo;</a></li>");
						}
					}
				});
	}

	// ---------------------------------페이징 (right)----------------------------------------------------------

	function RightPageChange() {
		var optdata = $("#searchopt option:selected").val();
		var keydata = $("#searchdata").val();
		console.log(keydata);

		var tb = document.getElementById("firstbtn");
		var start = parseInt(parseInt(tb.innerText) / 5);
		var count;
		var btnindex;

		if (keydata == "" || keydata == null) { // 검색이 아닌 경우

			$
					.ajax({
						url : "${pageContext.request.contextPath}/api/notice/count",
						type : "get",
						//data : {},
						dataType : "JSON",
						contentType : "applicaton/json; charset=utf-8",

						success : function(response) {
							console.log(response);

							count = parseInt(response); //문자를 정수형 숫자로 변환해줌

							count -= parseInt((start + 1) * 50);
							console.log(count);
							console.log(start);
							btnindex = (start + 1) * 5;

							console.log((start + 1) * 5);
							$("#button").empty();
							if (count <= 10) {
								$("#button")
										.append(
												"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()'; >&laquo;</a></li>"
														+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 1)
														+ "</a></li>"
														+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
							} else if (count > 10 && count <= 20) {

								$("#button")
										.append(
												"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()';  > &laquo;</a></li>"
														+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 1)
														+ "</a></li>"
														+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 2)
														+ "</a></li>"
														+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
							} else if (count > 20 && count <= 30) {

								$("#button")
										.append(
												"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()';  > &laquo;</a></li>"
														+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 1)
														+ "</a></li>"
														+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 2)
														+ "</a></li>"
														+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 3)
														+ "</a></li>"
														+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
							} else if (count > 30 && count <= 40) {
								$("#button")
										.append(
												"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()';  > &laquo;</a></li>"
														+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 1)
														+ "</a></li>"
														+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 2)
														+ "</a></li>"
														+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 3)
														+ "</a></li>"
														+ "<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 4)
														+ "</a></li>"
														+

														"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
							} else if (count > 40 && count <= 50) {

								$("#button")
										.append(
												"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()';  > &laquo;</a></li>"
														+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 1)
														+ "</a></li>"
														+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 2)
														+ "</a></li>"
														+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 3)
														+ "</a></li>"
														+ "<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 4)
														+ "</a></li>"
														+ "<li class='page-item' id='quinaryli'><a class='page-link' id = 'quinarybtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 5)
														+ "</a></li>"
														+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");

							} else {
								$("#button")
										.append(
												"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()';  > &laquo;</a></li>"
														+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 1)
														+ "</a></li>"
														+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 2)
														+ "</a></li>"
														+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 3)
														+ "</a></li>"
														+ "<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 4)
														+ "</a></li>"
														+ "<li class='page-item' id='quinaryli'><a class='page-link' id = 'quinarybtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 5)
														+ "</a></li>"
														+ "<li class='page-item' id='right'><a class='page-link' href ='#' onclick='RightPageChange()'; > &raquo;</a></li>");
							}

						}

					});

			var start = parseInt(parseInt(tb.innerText) / 5);
			btnindex = (start + 1) * 5;
			console.log(tb.innerText);
			console.log(btnindex);
			$.ajax({
				url : "${pageContext.request.contextPath}/api/notice/page/"
						+ (btnindex + 1),
				type : "get",
				//data : {},
				dataType : "JSON",
				contentType : "applicaton/json; charset=utf-8",

				success : function(response) {
					//console.log(response)
					//테이블 비워주기
					$("#test > tbody").empty();
					$("#test").append(
							"<tr  class='table-primary'><th scope='col'>번호</th>"
									+ "<th scope='col'>제목</th>"
									+ "<th scope='col'>작성자</th>"
									+ "<th scope='col'>작성 날짜</th></tr>")
					for (idx in response) {

						const date = new Date(response[idx].noticeRegDate);

						const options = {
							year : '2-digit',
							month : '2-digit',
							day : '2-digit'

						};
						const americanDateTime = new Intl.DateTimeFormat(
								'en-US', options).format;
						console.log(americanDateTime(date));

						//	console.log(response[idx].noticeRegDate);

						$("#test").append(

								"<tr >" + "<td scope='row'>"
										+ response[idx].noticeNo + "</td>" +
										//"<td><a href =javascript:location.href = 'noticedetail?id="+response[idx].noticeNo + "'>" + response[idx].noticeTitle+ "</a></td>"+
										"<td><a href = ${root}/tastyway/customer/notice/detail?id="
										+ response[idx].noticeNo + ">"
										+ response[idx].noticeTitle
										+ "</a></td>" + "<td>" + "관리자"
										+ "</td>" + "<td>"
										+ americanDateTime(date) + "</td>"
										+ "</tr>")

					}

				},

			});

		}

		else { // 검색버튼인 경우
			$
					.ajax({
						url : "${pageContext.request.contextPath}/api/notice/count",
						type : "get",
						data : {
							opt : optdata,
							key : keydata
						},
						dataType : "JSON",
						contentType : "applicaton/json; charset=utf-8",
						/* success: function(response) {
							$("#result-text").html(JSON.stringify(response));                    
						}, */

						success : function(response) {
							console.log(response);

							count = parseInt(response); //문자를 정수형 숫자로 변환해줌

							count -= parseInt((start + 1) * 50);
							console.log(count);
							btnindex = (start + 1) * 5;

							console.log((start + 1) * 5);
							$("#button").empty();
							if (count <= 10) {
								$("#button")
										.append(
												"<li class='page-item' id='left' href ='#' onclick='LeftPageChange()'; ><a class='page-link'>&laquo;</a></li>"
														+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 1)
														+ "</a></li>"
														+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
							} else if (count > 10 && count <= 20) {

								$("#button")
										.append(
												"<li class='page-item' id='left' href ='#' onclick='LeftPageChange()'; ><a class='page-link' > &laquo;</a></li>"
														+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 1)
														+ "</a></li>"
														+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 2)
														+ "</a></li>"
														+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
							} else if (count > 20 && count <= 30) {

								$("#button")
										.append(
												"<li class='page-item' id='left' href ='#' onclick='LeftPageChange()'; ><a class='page-link' > &laquo;</a></li>"
														+ "<li class='page-item active'id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 1)
														+ "</a></li>"
														+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 2)
														+ "</a></li>"
														+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 3)
														+ "</a></li>"
														+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
							} else if (count > 30 && count <= 40) {
								$("#button")
										.append(
												"<li class='page-item' id='left' href ='#' onclick='LeftPageChange()'; ><a class='page-link' > &laquo;</a></li>"
														+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 1)
														+ "</a></li>"
														+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 2)
														+ "</a></li>"
														+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 3)
														+ "</a></li>"
														+ "<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 4)
														+ "</a></li>"
														+

														"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
							} else if (count > 40 && count <= 50) {

								$("#button")
										.append(
												"<li class='page-item' id='left' href ='#' onclick='LeftPageChange()'; ><a class='page-link' > &laquo;</a></li>"
														+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 1)
														+ "</a></li>"
														+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 2)
														+ "</a></li>"
														+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 3)
														+ "</a></li>"
														+ "<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 4)
														+ "</a></li>"
														+ "<li class='page-item' id='quinaryli'><a class='page-link' id = 'quinarybtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 5)
														+ "</a></li>"
														+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");

							} else {
								$("#button")
										.append(
												"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()'; > &laquo;</a></li>"
														+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 1)
														+ "</a></li>"
														+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 2)
														+ "</a></li>"
														+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 3)
														+ "</a></li>"
														+ "<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 4)
														+ "</a></li>"
														+ "<li class='page-item' id='quinaryli'><a class='page-link' id = 'quinarybtn' href ='#' onclick='PageClick(this);'>"
														+ (btnindex + 5)
														+ "</a></li>"
														+ "<li class='page-item' id='right'><a class='page-link' href ='#' onclick='RightPageChange()'; > &raquo;</a></li>");
							}
						}

					});

			var start = parseInt(parseInt(tb.innerText) / 5);
			btnindex = (start + 1) * 5;
			console.log(tb.innerText);
			console.log(btnindex);

			$.ajax({
				url : "${pageContext.request.contextPath}/api/notice/page/"
						+ (btnindex + 1),
				type : "get",
				data : {

					opt : optdata,
					key : keydata

				},
				dataType : "JSON",
				contentType : "applicaton/json; charset=utf-8",

				success : function(response) {
					//console.log(response)
					//테이블 비워주기
					$("#test > tbody").empty();
					$("#test").append(
							"<tr  class='table-primary'><th scope='col'>번호</th>"
									+ "<th scope='col'>제목</th>"
									+ "<th scope='col'>작성자</th>"
									+ "<th scope='col'>작성 날짜</th></tr>")
					for (idx in response) {

						const date = new Date(response[idx].noticeRegDate);

						const options = {
							year : '2-digit',
							month : '2-digit',
							day : '2-digit'

						};
						const americanDateTime = new Intl.DateTimeFormat(
								'en-US', options).format;
						console.log(americanDateTime(date));

						//	console.log(response[idx].noticeRegDate);

						$("#test").append(

								"<tr >" + "<td scope='row'>"
										+ response[idx].noticeNo + "</td>" +
										//"<td><a href =javascript:location.href = 'noticedetail?id="+response[idx].noticeNo + "'>" + response[idx].noticeTitle+ "</a></td>"+
										"<td><a href = ${root}/tastyway/customer/notice/detail?id="
										+ response[idx].noticeNo + ">"
										+ response[idx].noticeTitle
										+ "</a></td>" + "<td>" + "관리자"
										+ "</td>" + "<td>"
										+ americanDateTime(date) + "</td>"
										+ "</tr>")

					}
				},

			});
		}

	}

	// ---------------------------------페이징 (left)----------------------------------------------------------

	function LeftPageChange() {
		var optdata = $("#searchopt option:selected").val();
		var keydata = $("#searchdata").val();
		console.log(keydata);

		var tb = document.getElementById("firstbtn");
		var start = parseInt(parseInt(tb.innerText) / 5);
		var count;
		var btnindex;

		if (keydata == "" || keydata == null) { // 검색이 아닌 경우

			$
					.ajax({
						url : "${pageContext.request.contextPath}/api/notice/count",
						type : "get",
						//data : {},
						dataType : "JSON",
						contentType : "applicaton/json; charset=utf-8",

						success : function(response) {
							console.log(response);

							count = parseInt(response); //문자를 정수형 숫자로 변환해줌

							count -= parseInt((start + 1) * 50);
							console.log(count);
							console.log(start);
							btnindex = ((start - 1) * 5);
							console.log(btnindex);
							if (btnindex < 0) {
								btnindex = 0;
							}
							console.log((start - 1) * 5);
							$("#button").empty();

							console.log(btnindex);
							if (btnindex == 0) {
								$("#button")
										.append(
												"<li class='page-item disabled' id='left'><a class='page-link' onclick='LeftPageChange()';> &laquo;</a></li>");
							} else {
								$("#button")
										.append(
												"<li class='page-item' id='left'><a class='page-link' onclick='LeftPageChange()';> &laquo;</a></li>");
							}
							$("#button")
									.append(

											"<li class='page-item ' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"
													+ (btnindex + 1)
													+ "</a></li>"
													+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"
													+ (btnindex + 2)
													+ "</a></li>"
													+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'>"
													+ (btnindex + 3)
													+ "</a></li>"
													+ "<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'>"
													+ (btnindex + 4)
													+ "</a></li>"
													+ "<li class='page-item active' id='quinaryli'><a class='page-link' id = 'quinarybtn' href ='#' onclick='PageClick(this);'>"
													+ (btnindex + 5)
													+ "</a></li>"
													+ "<li class='page-item' id='right'><a class='page-link' href ='#' onclick='RightPageChange()'; > &raquo;</a></li>");

						}

					});

			var start = parseInt(parseInt(tb.innerText) / 5);
			btnindex = ((start - 1) * 5) + 5;
			console.log(tb.innerText);
			console.log(btnindex);
			$.ajax({
				url : "${pageContext.request.contextPath}/api/notice/page/"
						+ btnindex,
				type : "get",
				//data : {},
				dataType : "JSON",
				contentType : "applicaton/json; charset=utf-8",

				success : function(response) {
					//console.log(response)
					//테이블 비워주기
					$("#test > tbody").empty();
					$("#test").append(
							"<tr  class='table-primary'><th scope='col'>번호</th>"
									+ "<th scope='col'>제목</th>"
									+ "<th scope='col'>작성자</th>"
									+ "<th scope='col'>작성 날짜</th></tr>")
					for (idx in response) {

						const date = new Date(response[idx].noticeRegDate);

						const options = {
							year : '2-digit',
							month : '2-digit',
							day : '2-digit'

						};
						const americanDateTime = new Intl.DateTimeFormat(
								'en-US', options).format;
						console.log(americanDateTime(date));

						//	console.log(response[idx].noticeRegDate);

						$("#test").append(

								"<tr >" + "<td scope='row'>"
										+ response[idx].noticeNo + "</td>" +
										//"<td><a href =javascript:location.href = 'noticedetail?id="+response[idx].noticeNo + "'>" + response[idx].noticeTitle+ "</a></td>"+
										"<td><a href = ${root}/tastyway/customer/notice/detail?id="
										+ response[idx].noticeNo + ">"
										+ response[idx].noticeTitle
										+ "</a></td>" + "<td>" + "관리자"
										+ "</td>" + "<td>"
										+ americanDateTime(date) + "</td>"
										+ "</tr>")

					}

				},

			});

		}

		else { // 검색버튼인 경우
			$
					.ajax({
						url : "${pageContext.request.contextPath}/api/notice/count",
						type : "get",
						data : {
							opt : optdata,
							key : keydata
						},
						dataType : "JSON",
						contentType : "applicaton/json; charset=utf-8",
						/* success: function(response) {
							$("#result-text").html(JSON.stringify(response));                    
						}, */

						success : function(response) {
							console.log(response);

							count = parseInt(response); //문자를 정수형 숫자로 변환해줌

							count -= parseInt((start + 1) * 50);
							console.log(count);
							console.log(start);
							btnindex = ((start - 1) * 5);
							console.log(btnindex);
							if (btnindex < 0) {
								btnindex = 0;
							}
							console.log((start - 1) * 5);
							$("#button").empty();

							console.log(btnindex);
							if (btnindex == 0) {
								$("#button")
										.append(
												"<li class='page-item disabled' id='left'><a class='page-link' onclick='LeftPageChange()';> &laquo;</a></li>");
							} else {
								$("#button")
										.append(
												"<li class='page-item' id='left'><a class='page-link' onclick='LeftPageChange()';> &laquo;</a></li>");
							}
							$("#button")
									.append(

											"<li class='page-item ' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"
													+ (btnindex + 1)
													+ "</a></li>"
													+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"
													+ (btnindex + 2)
													+ "</a></li>"
													+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'>"
													+ (btnindex + 3)
													+ "</a></li>"
													+ "<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'>"
													+ (btnindex + 4)
													+ "</a></li>"
													+ "<li class='page-item active' id='quinaryli'><a class='page-link' id = 'quinarybtn' href ='#' onclick='PageClick(this);'>"
													+ (btnindex + 5)
													+ "</a></li>"
													+ "<li class='page-item' id='right'><a class='page-link' href ='#' onclick='RightPageChange()'; > &raquo;</a></li>");

						}

					});

			var start = parseInt(parseInt(tb.innerText) / 5);
			btnindex = ((start - 1) * 5) + 4;
			console.log(tb.innerText);
			console.log(btnindex);

			$.ajax({
				url : "${pageContext.request.contextPath}/api/notice/page/"
						+ btnindex,
				type : "get",
				data : {

					opt : optdata,
					key : keydata

				},
				dataType : "JSON",
				contentType : "applicaton/json; charset=utf-8",

				success : function(response) {
					//console.log(response)
					//테이블 비워주기
					$("#test > tbody").empty();
					$("#test").append(
							"<tr  class='table-primary'><th scope='col'>번호</th>"
									+ "<th scope='col'>제목</th>"
									+ "<th scope='col'>작성자</th>"
									+ "<th scope='col'>작성 날짜</th></tr>")
					for (idx in response) {

						const date = new Date(response[idx].noticeRegDate);

						const options = {
							year : '2-digit',
							month : '2-digit',
							day : '2-digit'

						};
						const americanDateTime = new Intl.DateTimeFormat(
								'en-US', options).format;
						console.log(americanDateTime(date));

						//	console.log(response[idx].noticeRegDate);

						$("#test").append(

								"<tr >" + "<td scope='row'>"
										+ response[idx].noticeNo + "</td>" +
										//"<td><a href =javascript:location.href = 'noticedetail?id="+response[idx].noticeNo + "'>" + response[idx].noticeTitle+ "</a></td>"+
										"<td><a href = ${root}/tastyway/customer/notice/detail?id="
										+ response[idx].noticeNo + ">"
										+ response[idx].noticeTitle
										+ "</a></td>" + "<td>" + "관리자"
										+ "</td>" + "<td>"
										+ americanDateTime(date) + "</td>"
										+ "</tr>")

					}

				},

			});
		}

	}

	// test

	function change() {
		/* "<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"+	 */

		console.log($("#firstli").hasClass("page-item active"));
		if ($("#firstli").hasClass('page-item active') == true) {
			$("#firstli").removeClass();
			$("#firstli").addClass('page-item');
		}
		if ($("#firstbtn").hasClass('page-item active') == 1)
			if ($("#firstbtn").hasClass('page-item active') == 1)
				if ($("#firstbtn").hasClass('page-item active') == 1)
					if ($("#firstbtn").hasClass('page-item active') == 1)

						console
								.log($("#firstbtn")
										.hasClass("page-item active"));
		$("#left").removeClass();
		$("#left").addClass('page-item');
		var tb = document.getElementById("firstbtn");
		console.log(tb.innerText);
		var start = parseInt(parseInt(tb.innerText) / 5);

		console.log(start);
		console.log("1");
	}
</script>
</script>
</html>