<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Q&A 메인 page</title>

<script defer="defer"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>

<!-- css 초기화 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

<!-- css 연결 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lkc.css">

<!-- 부트스트랩 연결 -->
<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous"> -->

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
<link rel="stylesheet"
	href="${rootPath}/resources/css/custom.min.css">

</head>

<!-- body타면 load 실행 -->

<body onload="load()">
	<script type="text/javascript">
		
	
		//---------------------------load-----------------------
		// 시작할떄 작동
		function load() {
			$.ajax({
				url : "${rootPath}/api/qna/page/1", 
				type : "get",
				//data : {},
				dataType : "JSON",
				contentType : "applicaton/json; charset=utf-8",
				success : function(response) { //값을 받아오면
					$("#test > tbody").empty(); //일단 비워줌.
					$("#test").append(
									"<tr class='table-primary'><th scope='col'>번호</th>"
											+ "<th scope='col'>제목</th>"
											+ "<th scope='col'>내용</th>"
											+ "<th scope='col'>작성자</th>"
											+ "<th scope='col'>작성 날짜</th></tr>")
					for (idx in response) {
						const date = new Date(response[idx].qnaRegDate);
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
							$("#test").append(
									"<tr>"+ "<td scope='row'>"+ response[idx].qnaNo+ "</td>"
									
									+ "<td><button class='' style='height: 30px;width: 100px;background-color:transparent; color:orange;font-size:20px; border: none;' data-bs-toggle='modal' data-bs-target='#modalimg' data-bs-whatever='@mdo' id='"+response[idx].qnaNo+"' onclick = 'qnanosubmit(this.id)' >"+ response[idx].qnaTitle+  "</button></td>" /* 번호와 제목에 하이퍼링크 */
									+ "<td>"+ response[idx].qnaContent+ "</td>"
									+ "<td>"+ response[idx].qnaNonMember+ "</td>"
									+ "<td>"+ americanDateTime(date)+ "</td>" + "</tr>")
							/* console.log("비회원 데이터 들어감"); */
						} else {
							$("#test").append(
									"<tr>"+ "<td scope='row'>"+ response[idx].qnaNo+ "</td>"
									+ "<td><button class='' style='height: 30px;width: 100px;background-color:transparent; color:orange;font-size:20px; border: none;' data-bs-toggle='modal' data-bs-target='#modalimg' data-bs-whatever='@mdo' id='"+response[idx].qnaNo+"' onclick = 'qnanosubmit(this.id)' >"+ response[idx].qnaTitle+  "</button></td>" /* 번호와 제목에 하이퍼링크 */
									+ "<td>"+ response[idx].qnaContent+ "</td>"
									+ "<td>"+ response[idx].qnaWriter+ "</td>"
									+ "<td>"+ americanDateTime(date)+ "</td>" + "</tr>")
							/* console.log("회원 데이터 들어감"); */
						}
					}
				}
			}); //end ajax	
			//load 되면 page값도 받아옴
			$.ajax({
						url : "${rootPath}/api/qna/count",
						type : "get",
						//data : {},
						dataType : "JSON",
						contentType : "applicaton/json; charset=utf-8",
						success : function(response) {
							
							const count = parseInt(response.count); // 전체 qnaNo를 count에 저장
						
							$("#button").empty(); //버튼 초기화
							
							if (count <= 10) {
								$("#button").append(
												"<li class='page-item disabled' id='left'><a class='page-link' >&laquo;</a></li>"
														+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"
														+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
							} else if (count > 10 && count <= 20) {
								$("#button").append(
												"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"
														+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"
														+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"
														+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
							} else if (count > 20 && count <= 30) {
								$("#button").append(
												"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"
														+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"
														+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"
														+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'> 3</a></li>"
														+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
							} else if (count > 30 && count <= 40) {
								$("#button").append(
												"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"
														+ "<li class='page-item active'id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"
														+ "<li class='page-item'id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"
														+ "<li class='page-item'id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'> 3</a></li>"
														+ "<li class='page-item'id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'> 4</a></li>"
														+"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
							} else if (count > 40 && count <= 50) {
								$("#button").append(
												"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"
														+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"
														+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"
														+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'> 3</a></li>"
														+ "<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'> 4</a></li>"
														+ "<li class='page-item' id='quinaryli'><a class='page-link' id = 'quinarybtn' href ='#' onclick='PageClick(this);'> 5</a></li>"
														+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
							} else {
								$("#button").append(
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
			const optdata = $("#searchopt option:selected").val(); //옵션 값
			const keydata = $("#searchdata").val(); //텍스트 칸 값
			//버튼을 눌렀을때, 검색 정보가 없을때는 전체를 출력
			if (keydata == null) {
				$.ajax({
							url : "${rootPath}/api/qna/page/" + text, //text = page button값
							type : "get",
							//data
							dataType : "JSON",
							contentType : "applicaton/json; charset=utf-8",
							success : function(response) { //값을 받아오면
								$("#test > tbody").empty(); //일단 비워줌.
								$("#test").append(
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
										$("#test").append(
														"<tr>"+ "<td scope='row'>"+ response[idx].qnaNo+ "</td>"
														+ "<td><button class='' style='height: 30px;width: 100px;background-color:transparent; color:orange;font-size:20px; border: none;' data-bs-toggle='modal' data-bs-target='#modalimg' data-bs-whatever='@mdo' id='"+response[idx].qnaNo+"' onclick = 'qnanosubmit(this.id)' >"+ response[idx].qnaTitle+  "</button></td>" /* 번호와 제목에 하이퍼링크 */
														+ "<td>"+ response[idx].qnaContent+ "</td>"
														+ "<td>"+ response[idx].qnaNonMember+ "</td>"
														+ "<td>"+ americanDateTime(date)+ "</td>"+ "</tr>")
									} else {
										$("#test").append(
														"<tr>"+ "<td scope='row'>"+ response[idx].qnaNo+ "</td>"
														+ "<td><button class='' style='height: 30px;width: 100px;background-color:transparent; color:orange;font-size:20px; border: none;' data-bs-toggle='modal' data-bs-target='#modalimg' data-bs-whatever='@mdo' id='"+response[idx].qnaNo+"' onclick = 'qnanosubmit(this.id)' >"+ response[idx].qnaTitle+  "</button></td>" /* 번호와 제목에 하이퍼링크 */
																+ "<td>"+ response[idx].qnaContent+ "</td>"
																+ "<td>"+ response[idx].qnaWriter	+ "</td>"
																+ "<td>"+ americanDateTime(date)+ "</td>"+ "</tr>")
									}
								}
							}
						}); //end ajax	
			} else { //받아온 내용이 있다면
				$.ajax({
							url : "${rootPath}/api/qna/page/" + text,
							type : "get",
							data : {
								opt : optdata,
								key : keydata
							},
							dataType : "JSON",
							contentType : "applicaton/json; charset=utf-8",
							success : function(response) { 
								$("#test > tbody").empty(); //비움
								$("#test").append(
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
										$("#test").append(
														"<tr>"+ "<td scope='row'>"+ response[idx].qnaNo+ "</td>"
														+ "<td><button class='' style='height: 30px;width: 100px;background-color:transparent; color:orange;font-size:20px; border: none;' data-bs-toggle='modal' data-bs-target='#modalimg' data-bs-whatever='@mdo' id='"+response[idx].qnaNo+"' onclick = 'qnanosubmit(this.id)' >"+ response[idx].qnaTitle+  "</button></td>" /* 번호와 제목에 하이퍼링크 */
																+ "<td>"+ response[idx].qnaContent+ "</td>"
																+ "<td>"+ response[idx].qnaNonMember+ "</td>"
																+ "<td>"+ americanDateTime(date)+ "</td>"+ "</tr>")
									} else {
										$("#test").append(
														"<tr>"+ "<td scope='row'>"+ response[idx].qnaNo+ "</td>"
														+ "<td><button class='' style='height: 30px;width: 100px;background-color:transparent; color:orange;font-size:20px; border: none;' data-bs-toggle='modal' data-bs-target='#modalimg' data-bs-whatever='@mdo' id='"+response[idx].qnaNo+"' onclick = 'qnanosubmit(this.id)' >"+ response[idx].qnaTitle+  "</button></td>" /* 번호와 제목에 하이퍼링크 */
																+ "<td>"+ response[idx].qnaContent+ "</td>"
																+ "<td>"+ response[idx].qnaWriter	+ "</td>"
																+ "<td>"+ americanDateTime(date)+ "</td>"+ "</tr>")
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
			//console.log(optdata); //제목
			//console.log(keydata); //title11
			$.ajax({
						url : "${rootPath}/api/qna/page/1",
						type : "get",
						data : {
							opt : optdata, //항목
							contentKey : keydata //내용
						},
						dataType : "JSON",
						contentType : "applicaton/json; charset=utf-8",
						success : function(response) { //값을 받아오면
							/* console.log(contentKey); */
							$("#test > tbody").empty(); //일단 비워줌.
							$("#test").append(
											"<tr class='table-primary'><th scope='col'>번호</th>"
													+ "<th scope='col'>제목</th>"
													+ "<th scope='col'>내용</th>"
													+ "<th scope='col'>작성자</th>"
													+ "<th scope='col'>작성 날짜</th></tr>")
							for (idx in response) {
								const date = new Date(response[idx].qnaRegDate);
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
									$("#test").append(
													"<tr>"+ "<td scope='row'>"+ response[idx].qnaNo+ "</td>"
													+ "<td><button class='' style='height: 30px;width: 100px;background-color:transparent; color:orange;font-size:20px; border: none;' data-bs-toggle='modal' data-bs-target='#modalimg' data-bs-whatever='@mdo' id='"+response[idx].qnaNo+"' onclick = 'qnanosubmit(this.id)' >"+ response[idx].qnaTitle+  "</button></td>" /* 번호와 제목에 하이퍼링크 */
															+ "<td>"+ response[idx].qnaContent+ "</td>"
															+ "<td>"+ response[idx].qnaNonMember+ "</td>"
															+ "<td>"+ americanDateTime(date)+ "</td>" + "</tr>")
									/* console.log("비회원 데이터 들어감"); */
								} else {
									$("#test").append(
													"<tr>"+ "<td scope='row'>"+ response[idx].qnaNo+ "</td>"
													+ "<td><button class='' style='height: 30px;width: 100px;background-color:transparent; color:orange;font-size:20px; border: none;' data-bs-toggle='modal' data-bs-target='#modalimg' data-bs-whatever='@mdo' id='"+response[idx].qnaNo+"' onclick = 'qnanosubmit(this.id)' >"+ response[idx].qnaTitle+  "</button></td>" /* 번호와 제목에 하이퍼링크 */
															+ "<td>"+ response[idx].qnaContent	+ "</td>"
															+ "<td>"+ response[idx].qnaWriter+ "</td>"
															+ "<td>"+ americanDateTime(date)+ "</td>" + "</tr>")
									/* console.log("회원 데이터 들어감"); */
								}//end if
							}//end for
						}
					}); //end ajax	
			//선택된 데이터 값을 가져옴 
			//count
			//페이지 눌렀을때 ((검색한 값))중 10개만 나온다!
			$.ajax({
						url : "${rootPath}/api/qna/count",
						type : "get",
						//data
						dataType : "JSON",
						contentType : "applicaton/json; charset=utf-8",
						success : function(response) {
							console.log("count값 받아옴");
							const count = parseInt(response);
							console.log(count);
							$("#button").empty(); //비운다
							if (count <= 10) {
								$("#button").append(
												"<li class='page-item disabled' id='left'><a class='page-link'>&laquo;</a></li>"
														+ "<li class='page-item' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"
														+ "<li class='page-item' id='right'><a class='page-link' > &raquo;</a></li>");
							} else if (count > 10 && count <= 20) {
								$("#button").append(
												"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"
														+ "<li class='page-item' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"
														+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"
														+ "<li class='page-item' id='right'><a class='page-link' > &raquo;</a></li>");
							} else if (count > 20 && count <= 30) {
								$("#button").append(
												"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"
														+ "<li class='page-item' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"
														+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"
														+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'> 3</a></li>"
														+ "<li class='page-item' id='right'><a class='page-link' > &raquo;</a></li>");
							} else if (count > 30 && count <= 40) {
								$("#button").append(
												"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"
														+ "<li class='page-item' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"
														+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"
														+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'> 3</a></li>"
														+ "<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'> 4</a></li>"
														+
														"<li class='page-item' id='right'><a class='page-link' > &raquo;</a></li>");
							} else if (count > 40 && count <= 50) {
								$("#button").append(
												"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"
														+ "<li class='page-item' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"
														+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"
														+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'> 3</a></li>"
														+ "<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'> 4</a></li>"
														+ "<li class='page-item' id='quinaryli'><a class='page-link' id = 'quinarybtn' href ='#' onclick='PageClick(this);'> 5</a></li>"
														+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
							} else {
								$("#button").append(
												"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"
														+ "<li class='page-item' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"
														+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"
														+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'> 3</a></li>"
														+ "<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'> 4</a></li>"
														+ "<li class='page-item' id='quinaryli'><a class='page-link' id = 'quinarybtn' href ='#' onclick='PageClick(this);'> 5</a></li>"
														+ "<li class='page-item' id='right'><a class='page-link' href ='#' onclick='RightPageChange()';> &raquo;</a></li>");
								}
					  	}
				})
		}
		// -----------------------  페이징 (right) ---------------------------
		function RightPageChange() {
			const optdata = $("#searchopt option:selected").val();
			const keydata = $("searchdata").val();
			//console.log(keydata);
			const tb = document.getElementById("firstbtn"); //page 1
			var start = parseInt(parseInt(tb.innerText) / 5); // 0
			var count;
			var btnindex;
			if (keydata == "" || keydata == null) { // 검색이 아닌 경우
				
				$.ajax({
							url : "${rootPath}/api/qna/count",
							type : "get",
							dataType : "JSON",
							contentType : "applicaton/json; charset=utf-8",
							success : function(response) {
													
								count = parseInt(response.count); //문자를 정수형 숫자로 변환해줌
								
								
								//console.log("여기입니다.");
								//console.log(count);
				
								
								count -= parseInt((start + 1) * 50);
								console.log(count);
								console.log(start);
								btnindex = (start + 1) * 5;
								console.log((start + 1) * 5);
								$("#button").empty();
								if (count <= 10) {
									$("#button").append(
													"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()'; >&laquo;</a></li>"
															+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"
															+ (btnindex + 1)
															+ "</a></li>"
															+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
								} else if (count > 10 && count <= 20) {
									$("#button").append(
													"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()';  > &laquo;</a></li>"
															+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"
															+ (btnindex + 1)
															+ "</a></li>"
															+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"
															+ (btnindex + 2)
															+ "</a></li>"
															+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
								} else if (count > 20 && count <= 30) {
									$("#button").append(
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
									$("#button").append(
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
									$("#button").append(
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
									$("#button").append(
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
								}//end if
							}
						})//end ajax
				var start = parseInt(parseInt(tb.innerText) / 5);
				btnindex = (start + 1) * 5;
				$.ajax({
							url : "${rootPath}/api/qna/page/" + (btnindex + 1),
							type : "get",
							dataType : "JSON",
							contentType : "applicaton/json; charset=utf-8",
							success : function(response) { //값을 받아오면
								/* console.log(contentKey); */
								$("#test > tbody").empty(); //일단 비워줌.
								$("#test").append(
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
										$("#test").append(
														"<tr>"+ "<td scope='row'>"+ response[idx].qnaNo+ "</td>"
														+ "<td><button class='' style='height: 30px;width: 100px;background-color:transparent; color:orange;font-size:20px; border: none;' data-bs-toggle='modal' data-bs-target='#modalimg' data-bs-whatever='@mdo' id='"+response[idx].qnaNo+"' onclick = 'qnanosubmit(this.id)' >"+ response[idx].qnaTitle+  "</button></td>" /* 번호와 제목에 하이퍼링크 */
														+ "<td>"+ response[idx].qnaContent+ "</td>"
														+ "<td>"+ response[idx].qnaNonMember+ "</td>"
														+ "<td>"+ americanDateTime(date)+ "</td>"+ "</tr>")
										/* console.log("비회원 데이터 들어감"); */
									} else {
										$("#test").append(
														"<tr>"+ "<td scope='row'>"+ response[idx].qnaNo+ "</td>"
														+ "<td><button class='' style='height: 30px;width: 100px;background-color:transparent; color:orange;font-size:20px; border: none;' data-bs-toggle='modal' data-bs-target='#modalimg' data-bs-whatever='@mdo' id='"+response[idx].qnaNo+"' onclick = 'qnanosubmit(this.id)' >"+ response[idx].qnaTitle+  "</button></td>" /* 번호와 제목에 하이퍼링크 */
																+ "<td>"+ response[idx].qnaContent+ "</td>"
																+ "<td>"+ response[idx].qnaWriter+ "</td>"
																+ "<td>"+ americanDateTime(date)+ "</td>"+ "</tr>")
										/* console.log("회원 데이터 들어감"); */
									}//end if
								}//end for
							},//END SUCCESS
						})//end ajax
			}//end if
		}//end change();
		// -----------------------  페이징 (left) ---------------------------		
		function LeftPageChange() {
			const optdata = $("#searchopt option:selected").val();
			const keydata = $("searchdata").val();
			//console.log(keydata);
			const tb = document.getElementById("firstbtn");
			var start = parseInt(parseInt(tb.innerText) / 5);
			var count;
			var btnindex;
			if (keydata == "" || keydata == null) { // 검색이 아닌 경우
				$.ajax({
							url : "${rootPath}/api/qna/count",
							type : "get",
							dataType : "JSON",
							contentType : "applicaton/json; charset=utf-8",
							success : function(response) {
								console.log(response);
								count = parseInt(response); //문자를 정수형 숫자로 변환해줌
								count -= parseInt((start + 1) * 50);
								console.log(count);
								console.log(start);
								btnindex = (start - 1) * 5;
								if (btnindex < 0) {
									btnindex = 0;
								}
								console.log((start - 1) * 5);
								$("#button").empty();
								//
								if (btnindex == 0) {
									$("#button").append(
													"<li class='page-item disabled' id='left'><a class='page-link' onclick='LeftPageChange()';> &laquo;</a></li>");
								} else {
									$("#button").append(
													"<li class='page-item' id='left'><a class='page-link' onclick='LeftPageChange()';> &laquo;</a></li>");
								}
								$("#button").append(
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
							}//end success
						});//end ajax
				var start = parseInt(parseInt(tb.innerText) / 5);
				btnindex = ((start - 1) * 5) + 5;
				$.ajax({
							url : "${rootPath}/api/qna/page/" + btnindex,
							type : "get",
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
										$("#test").append(
														"<tr>"+ "<td scope='row'>"+ response[idx].qnaNo+ "</td>"
														+ "<td><button class='' style='height: 30px;width: 100px;background-color:transparent; color:orange;font-size:20px; border: none;' data-bs-toggle='modal' data-bs-target='#modalimg' data-bs-whatever='@mdo' id='"+response[idx].qnaNo+"' onclick = 'qnanosubmit(this.id)' >"+ response[idx].qnaTitle+  "</button></td>" /* 번호와 제목에 하이퍼링크 */
																+ "<td>"+ response[idx].qnaContent+ "</td>"
																+ "<td>"+ response[idx].qnaNonMember+ "</td>"
																+ "<td>"+ americanDateTime(date)+ "</td>"+ "</tr>")
										/* console.log("비회원 데이터 들어감"); */
									} else {
										$("#test").append(
														"<tr>"+ "<td scope='row'>"+ response[idx].qnaNo	+ "</td>"
														+ "<td><button class='' style='height: 30px;width: 100px;background-color:transparent; color:orange;font-size:20px; border: none;' data-bs-toggle='modal' data-bs-target='#modalimg' data-bs-whatever='@mdo' id='"+response[idx].qnaNo+"' onclick = 'qnanosubmit(this.id)' >"+ response[idx].qnaTitle+  "</button></td>" /* 번호와 제목에 하이퍼링크 */
																+ "<td>"+ response[idx].qnaContent+ "</td>"
																+ "<td>"+ response[idx].qnaWriter+ "</td>"
																+ "<td>"+ americanDateTime(date)+ "</td>"+ "</tr>")
										/* console.log("회원 데이터 들어감"); */
									}//end if
								}//end for
							},//END SUCCESS
						});//end ajax
			} else {
				$.ajax({
							url : "${rootPath}/api/qna/count",
							type : "get",
							data : {
								opt : optdata,
								key : keydata
							},
							dataType : "JSON",
							contentType : "applicaton/json; charset=utf-8",
							//success
							success : function(response) {
								console.log(response);
								count = parseInt(response); //문자를 정수형 숫자로 변환해줌
								count -= parseInt((start + 1) * 50);
								/* console.log(count);
								console.log(start); */
								btnindex = (start - 1) * 5;
								if (btnindex < 0) {
									btnindex = 0;
								}
								console.log((start - 1) * 5);
								$("#button").empty(); //비운다
								//
								if (btnindex == 0) {
									$("#button").append(
													"<li class='page-item disabled' id='left'><a class='page-link' onclick='LeftPageChange()';> &laquo;</a></li>");
								} else {
									$("#button").append(
													"<li class='page-item' id='left'><a class='page-link' onclick='LeftPageChange()';> &laquo;</a></li>");
								}
								$("#button").append(
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
							}//end success
						}); //end ajax
				var start = parseInt(parseInt(tb.innerText) / 5);
				btnindex = ((start - 1) * 5) + 4;
				$.ajax({
					url : "${rootPath}/api/qna/page/" + btnindex,
					type : "get",
					data : {
						opt : optdata,
						key : keydata
					},
					dataType : "JSON",
					contentType : "applicaton/json; charset=utf-8",
					success : function(response) { //값을 받아오면
						/* console.log(contentKey); */
						$("#test > tbody").empty(); //일단 비워줌.
						$("#test").append(
								"<tr class='table-primary'><th scope='col'>번호</th>"
										+ "<th scope='col'>제목</th>"
										+ "<th scope='col'>내용</th>"
										+ "<th scope='col'>작성자</th>"
										+ "<th scope='col'>작성 날짜</th></tr>")
						for (idx in response) {
							const date = new Date(response[idx].qnaRegDate);
							const options = {
								year : '2-digit',
								month : '2-digit',
								day : '2-digit'
							};
							const americanDateTime = new Intl.DateTimeFormat(
									'en-US', options).format;
						}
					},
				}); //end ajax
			}//end else
		}//end leftchange();
		
		
		
	
	</script>
<script>
function writetext(){
	
	 location.href = "${rootPath}/customer/qna/form?id=";
}
</script>

	<br>
	<br>
	<br>

	<div class="maintitle">Q&A</div>
	<br>
	<br>
	<div class="container">
		<div class="row" style="margin-bottom:  10px; text-align: left; width: 1200px; text-align: left; float: left">
			<span>&nbsp;</span>
		</div>
		<div class="row" style="margin-bottom:  10px; text-align: left; width: 120px; text-align: left;">
			<button type="button" class="btn btn-primary" onclick = "writetext()" >글쓰기</button>
		</div>
	</div>
	
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


	<!-- 페이지 버튼 -->
	<div>
		<ul class="pagination" id="button"style="justify-content: center;" >
		</ul>
	</div>
	<br>



	<form name="searchform" method="GET">

		<div class="form-group" style="float: none; margin: 0 auto; width: 525px; margin-bottom: 50px;">
			<select class="form-select" id="searchopt"
				style="width: 100px; float:left;">

				<option value="titleKey">제목</option>
				<option value="contentKey">내용</option>
			</select>

				<input type="text" id="searchdata" style="width: 300px; float: left; height: 37px; margin-left: 15px;">
				<input type="button" value="검색" class="btn btn-light" style="background-color: #d3d3d3; width: 70px; float: left; margin-left: 15px;" onclick="search()">
				<!-- search를 누르면! --> <br>
			</div>

	</form>
	
	
	
			
		<div class="modal modal fade" id="modalimg" tabindex="-1" aria-labelledby="mdalLabelimg" aria-hidden="true" >
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="modalLabelimg">NOTICE</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						      	<div class="container" style="float: none; margin: 0 auto; height:200px;width:420px;" >
						      		<div class = "col" style="float: none; margin: 0 auto; width: 400px; height: 200px;" >
										<div class="row" style="float: left; margin: 0 auto; width:420px" >	
											<span style="font-size: 20px; text-align: center; margin-bottom: 30px; margin-top: 60px;  width:420px""><b>비밀글 입니다.</b></span>		
											<span style="font-size: 15px;" ><b>비밀번호를 입력하세요</b></span>
											<input type="password" style="background-color: white; width:420px;" class="form-control" id="passwordmatch" aria-describedby=" basic-addon3">		    
							        		
							         	</div>
							         	
						         	</div>
						        </div>       
						      </div>
						      <div class="modal-footer">
						      		<button type="button" class="btn btn-primary" onclick="pwmatch()" data-bs-dismiss="modal">제출하기</button>
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
     						 </div>
						      
						    </div>
						  </div>
						</div>

</body>


<script type="text/javascript">
let qnonotemp;


function qnanosubmit(qnono){
	qnonotemp = qnono;
	console.log(qnonotemp);
}
function pwmatch(){
	
	$.ajax({
     	  url : "${rootPath}/api/qna/"+qnonotemp,   /* 수정 */
        type : "get",
        dataType : "json",
        contentType: "application/json; charset=utf-8", 
		// data : result,
        success : function(response) { //값을 받아오면
        	
        	
        	const result = $('#passwordmatch').val();
        	const qnopwd = response.qnaPwd;
        	
        	console.log(result);
        	console.log(qnopwd);
        	console.log(qnonotemp);
	
        	// 삭제 필요 비밀번호 비교 - 서버 요청-
        	if(qnopwd.localeCompare(result))
        	{
        		location.href = "${rootPath}/customer/qna/detail?id="+qnonotemp;
        	
        	}
        }
        
     }); //end ajax 
	
}



function listpage() {
	   location.href = "${rootPath}/customer/qna";
}
</script>

</html>