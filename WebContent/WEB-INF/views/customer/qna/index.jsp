<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<link rel="stylesheet" href="${rootPath}/resources/css/reset.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>

<meta charset="utf-8">
<title>Q&A 메인 page</title>


</head>

<!-- body타면 load 실행 -->

<body onload="load()">
	<div class="container" style="float: none; margin: 0 auto;">

		<script type="text/javascript">
			//중복되는 table
			function table() {

				$
						.ajax({
							url : "${rootPath}/api/qna/page/1", /* 수정 */
							type : "get",
							//data : {},
							dataType : "JSON",
							contentType : "applicaton/json; charset=utf-8",

							success : function(response) { //값을 받아오면
								$("#test > tbody").empty(); //일단 비워줌.
								$("#test")
										.append(
												"<tr class='table-primary'><th scope='col'>번호</th>"
														+ "<th scope='col'>제목</th>"
														+ "<th scope='col'>내용</th>"
														+ "<th scope='col'>작성자</th>"
														+ "<th scope='col'>작성 날짜</th></tr>")

								for (idx in response) {

									const date = new Date(
											response[idx].qnaRegDate);

									const options = {
										year : '2-digit',
										month : '2-digit',
										day : '2-digit'
									};

									const americanDateTime = new Intl.DateTimeFormat(
											'en-US', options).format;
									console.log(americanDateTime(date));

									//테이블 생성
									if (response[idx].qnaWriter == 0) {

										$("#test")
												.append(
														"<tr>"
																+ "<td scope='row'>"
																+ response[idx].qnaNo
																+ "</td>"
																+ "<td><a href = ${rootPath}/customer/qna/detail?id="
																+ response[idx].qnaNo
																+ ">"
																+ response[idx].qnaTitle
																+ "</a></td>" /* 번호와 제목에 하이퍼링크 */
																+ "<td>"
																+ response[idx].qnaContent
																+ "</td>"
																+ "<td>"
																+ response[idx].qnaNonMember
																+ "</td>"
																+ "<td>"
																+ americanDateTime(date)
																+ "</td>"
																+ "</tr>")
										/* console.log("비회원 데이터 들어감"); */
									} else {
										$("#test")
												.append(
														"<tr>"
																+ "<td scope='row'>"
																+ response[idx].qnaNo
																+ "</td>"
																+ "<td><a href = ${rootPath}/customer/qna/detail?id="
																+ response[idx].qnaNo
																+ ">"
																+ response[idx].qnaTitle
																+ "</a></td>" /* 번호와 제목에 하이퍼링크 */
																+ "<td>"
																+ response[idx].qnaContent
																+ "</td>"
																+ "<td>"
																+ response[idx].qnaWriter
																+ "</td>"
																+ "<td>"
																+ americanDateTime(date)
																+ "</td>"
																+ "</tr>")
										/* console.log("회원 데이터 들어감"); */
									}
								}
							}
						}); //end ajax   
			}

			//---------------------------load-----------------------
			// 시작할떄 작동

			function load() {

				//table 함수 호출
				table();

				//load 되면 page값도 받아옴
				$
						.ajax({
							url : "${rootPath}/api/qna/count",
							type : "get",
							//data : {},
							dataType : "JSON",
							contentType : "applicaton/json; charset=utf-8",

							success : function(response) {
								console.log("count값 받아옴");
								const count = parseInt(response); // 전체 qnaNo를 count에 저장
								$("button").empty(); //버튼 일단 비움
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
						}); //end ajax
			} //end load

			// --------------- 페이지 클릭 함수(PageClick) 페이지를 클릭하면 정보 넘어감 -------------------

			function PageClick(pagebtn) {
				const text = $(pagebtn).text();
				const getId = $(pagebtn).attr("id"); //id 속성값을 가져온다.

				// ----------------- 버튼 활성화 ----------------------

				if (getId == "firstbtn") {
					$("#firstli").removeClass();
					$("#firstli").addClass('page-item active'); //얘만 활성화
					$("#secondli").removeClass();
					$("#secondli").addClass('page-item ');
					$("#thirdli").removeClass();
					$("#thirdli").addClass('page-item');
					$("#fourthli").removeClass();
					$("#fourthli").addClass('page-item');
					$("#quinaryli").removeClass();
					$("#quinaryli").addClass('page-item');

				} else if (getId == "secondbtn") {
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

				} else if (getId == "thirdbtn") {
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

				} else if (getId == "fourthbtn") {
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

				} else if (getId == "quinarybtn") {
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
				} //불키고 정보 가져와야함 !

				const optdata = $("#searchopt option:selected").val();
				const keydata = $("#searchdata").val(); //값 가져옴

				//버튼을 눌렀을때, 검색 정보가 없을때는 전체를 출력
				if (keydata == null) {

					$
							.ajax({
								url : "${rootPath}/api/qna/page/" + text,
								type : "get",
								//data
								dataType : "JSON",
								contentType : "applicaton/json; charset=utf-8",

								success : function(response) { //값을 받아오면
									$("#test > tbody").empty(); //일단 비워줌.
									$("#test")
											.append(
													"<tr class='table-primary'><th scope='col'>번호</th>"
															+ "<th scope='col'>제목</th>"
															+ "<th scope='col'>내용</th>"
															+ "<th scope='col'>작성자</th>"
															+ "<th scope='col'>작성 날짜</th></tr>")

									for (idx in response) {

										const date = new Date(
												response[idx].qnaRegDate);

										const options = {
											year : '2-digit',
											month : '2-digit',
											day : '2-digit'
										};

										const americanDateTime = new Intl.DateTimeFormat(
												'en-US', options).format;
										console.log(americanDateTime(date));

										//테이블 생성
										if (response[idx].qnaWriter == 0) {

											$("#test")
													.append(
															"<tr>"
																	+ "<td scope='row'>"
																	+ response[idx].qnaNo
																	+ "</td>"
																	+ "<td><a href = ${rootPath}/customer/qna/detail?id="
																	+ response[idx].qnaNo
																	+ ">"
																	+ response[idx].qnaTitle
																	+ "</a></td>" /* 번호와 제목에 하이퍼링크 */
																	+ "<td>"
																	+ response[idx].qnaContent
																	+ "</td>"
																	+ "<td>"
																	+ response[idx].qnaNonMember
																	+ "</td>"
																	+ "<td>"
																	+ americanDateTime(date)
																	+ "</td>"
																	+ "</tr>")
										} else {
											$("#test")
													.append(
															"<tr>"
																	+ "<td scope='row'>"
																	+ response[idx].qnaNo
																	+ "</td>"
																	+ "<td><a href = ${rootPath}/customer/qna/detail?id="
																	+ response[idx].qnaNo
																	+ ">"
																	+ response[idx].qnaTitle
																	+ "</a></td>" /* 번호와 제목에 하이퍼링크 */
																	+ "<td>"
																	+ response[idx].qnaContent
																	+ "</td>"
																	+ "<td>"
																	+ response[idx].qnaWriter
																	+ "</td>"
																	+ "<td>"
																	+ americanDateTime(date)
																	+ "</td>"
																	+ "</tr>")
										}
									}
								}
							}); //end ajax   
				} else {
					$
							.ajax({
								url : "${rootPath}/api/qna/page/" + text,
								type : "get",
								data : {
									opt : optdata,
									key : keydata
								},
								dataType : "JSON",
								contentType : "applicaton/json; charset=utf-8",

								success : function(response) { //값을 받아오면
									$("#test > tbody").empty(); //일단 비워줌.
									$("#test")
											.append(
													"<tr class='table-primary'><th scope='col'>번호</th>"
															+ "<th scope='col'>제목</th>"
															+ "<th scope='col'>내용</th>"
															+ "<th scope='col'>작성자</th>"
															+ "<th scope='col'>작성 날짜</th></tr>")

									for (idx in response) {

										const date = new Date(
												response[idx].qnaRegDate);

										const options = {
											year : '2-digit',
											month : '2-digit',
											day : '2-digit'
										};

										const americanDateTime = new Intl.DateTimeFormat(
												'en-US', options).format;
										console.log(americanDateTime(date));

										//테이블 생성
										if (response[idx].qnaWriter == 0) {

											$("#test")
													.append(
															"<tr>"
																	+ "<td scope='row'>"
																	+ response[idx].qnaNo
																	+ "</td>"
																	+ "<td><a href = ${rootPath}/customer/qna/detail?id="
																	+ response[idx].qnaNo
																	+ ">"
																	+ response[idx].qnaTitle
																	+ "</a></td>" /* 번호와 제목에 하이퍼링크 */
																	+ "<td>"
																	+ response[idx].qnaContent
																	+ "</td>"
																	+ "<td>"
																	+ response[idx].qnaNonMember
																	+ "</td>"
																	+ "<td>"
																	+ americanDateTime(date)
																	+ "</td>"
																	+ "</tr>")
										} else {
											$("#test")
													.append(
															"<tr>"
																	+ "<td scope='row'>"
																	+ response[idx].qnaNo
																	+ "</td>"
																	+ "<td><a href = ${rootPath}/customer/qna/detail?id="
																	+ response[idx].qnaNo
																	+ ">"
																	+ response[idx].qnaTitle
																	+ "</a></td>" /* 번호와 제목에 하이퍼링크 */
																	+ "<td>"
																	+ response[idx].qnaContent
																	+ "</td>"
																	+ "<td>"
																	+ response[idx].qnaWriter
																	+ "</td>"
																	+ "<td>"
																	+ americanDateTime(date)
																	+ "</td>"
																	+ "</tr>")
										}
									}
								}
							}); //end ajax   
				}
			}//end pageclick();

			// --------------- 검색 -------------------   

			function search() {

				const optdata = $("#searchopt option:selected").val(); //선택값 저장
				const keydata = $("#searchdata").val(); //텍스트칸에 입력한 값 저장

				console.log(optdata); //제목
				console.log(keydata); //title11

				$.ajax({
							url : "${rootPath}/api/qna/page/1",
							type : "get",
							data : {

								opt : optdata, //제목 
								contentKey : keydata
							//title 11
							},
							dataType : "JSON",
							contentType : "applicaton/json; charset=utf-8",

							success : function(response) { //값을 받아오면
								/* console.log(contentKey); */
								$("#test > tbody").empty(); //일단 비워줌.
								$("#test")
										.append(
												"<tr class='table-primary'><th scope='col'>번호</th>"
														+ "<th scope='col'>제목</th>"
														+ "<th scope='col'>내용</th>"
														+ "<th scope='col'>작성자</th>"
														+ "<th scope='col'>작성 날짜</th></tr>")

								for (idx in response) {

									const date = new Date(
											response[idx].qnaRegDate);

									const options = {
										year : '2-digit',
										month : '2-digit',
										day : '2-digit'
									};

									const americanDateTime = new Intl.DateTimeFormat(
											'en-US', options).format;
									/* console.log(americanDateTime(date)); */

									//테이블 생성
									if (response[idx].qnaWriter == 0) {

										$("#test")
												.append(
														"<tr>"
																+ "<td scope='row'>"
																+ response[idx].qnaNo
																+ "</td>"
																+ "<td><a href = ${rootPath}/customer/qna/detail?id="
																+ response[idx].qnaNo
																+ ">"
																+ response[idx].qnaTitle
																+ "</a></td>" /* 번호와 제목에 하이퍼링크 */
																+ "<td>"
																+ response[idx].qnaContent
																+ "</td>"
																+ "<td>"
																+ response[idx].qnaNonMember
																+ "</td>"
																+ "<td>"
																+ americanDateTime(date)
																+ "</td>"
																+ "</tr>")
										/* console.log("비회원 데이터 들어감"); */
									} else {
										$("#test")
												.append(
														"<tr>"
																+ "<td scope='row'>"
																+ response[idx].qnaNo
																+ "</td>"
																+ "<td><a href = ${rootPath}/customer/qna/detail?id="
																+ response[idx].qnaNo
																+ ">"
																+ response[idx].qnaTitle
																+ "</a></td>" /* 번호와 제목에 하이퍼링크 */
																+ "<td>"
																+ response[idx].qnaContent
																+ "</td>"
																+ "<td>"
																+ response[idx].qnaWriter
																+ "</td>"
																+ "<td>"
																+ americanDateTime(date)
																+ "</td>"
																+ "</tr>")
										/* console.log("회원 데이터 들어감"); */
									}
								}
							}
						}); //end ajax   

				//선택된 데이터 값을 가져옴 

				//count
				//페이지 눌렀을때 ((검색한 값))중 10개만 나온다!

			}
		</script>


		
			<h1 class="row" style="justify-content: center; margin-top: 50px; margin-bottom: 50px;">Q&A</h1>

		<!-- 테이블 생성 부트스트랩-->

		<div class="test">
			<table class="table table-hover" id="test">
				<thead>
					<tr>

					</tr>
				</thead>
				<tbody>

				</tbody>

			</table>
		</div>


		<!-- 페이지 버튼 부트스트랩-->

		<div class="test">
			<ul class="pagination pagination-lg" id="button"
				style="justify-content: center;">
			</ul>
		</div>
		<br>


		<!-- 검색 -->

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
</body>


</html>