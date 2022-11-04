<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>



<meta charset="UTF-8">
<title>faq view page</title>

<script defer="defer"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>

<!-- css 초기화 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

<!-- css 연결 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lkc.css">

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


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/prism-okaidia.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/custom.min.css">

<script src="/static/js/bootstrap.bundle.js"></script>

</head>



<body onload="load()">
	<br>
	<br>
	<br>


	<div class="maintitle">FAQ</div>
	<br>
	<br>
	<br>
	<br>

	<div class="test">
		<table class="table table-hover" id="test">

		</table>
	</div>

	<br>










	<!--       --------------------페이지 링크----------------------------------     -->

	<div class="test">
		<ul class="pagination pagination-lg" id="button">

			<!-- 처음 이전 링크 -->
			<c:if test="${pg>block}">
				<!-- 5>10 : false / 15>10 : true -->
				<li class="page-item "><a class="page-link"
					href="javascript:location.href = 'faq?page=1&opt=${opt}&key=${key}'">&laquo;</a>
				</li>
				<li class="page-item "><a class="page-link"
					href="javascript:location.href = 'faq?page=${fromPage-1}&opt=${opt}&key=${key}'">&lt;</a>
				</li>
			</c:if>
			<c:if test="${pg<=block}">
				<!-- 5>10 : false / 15>10 : true -->
				<li class="page-item disabled "><a class="page-link"
					href="javascript:location.href = 'faq?page=1&opt=${opt}&key=${key}'">&laquo;</a>
				</li>
				<li class="page-item disabled"><a class="page-link"
					href="javascript:location.href = 'faq?page=${fromPage-1}&opt=${opt}&key=${key}'">&lt;</a>
				</li>
			</c:if>

			<!-- 블록 범위 찍기 -->
			<c:forEach begin="${fromPage}" end="${toPage}" var="i">
				<c:if test="${i==pg}">
					<li class="page-item  "><a class="page-link">${i}</a></li>
				</c:if>
				<c:if test="${i!=pg}">

					<li class="page-item  "><a class="page-link"
						href="javascript:location.href = 'faq?page=${i}&opt=${opt}&key=${key}'">${i}</a>
					</li>
				</c:if>
			</c:forEach>

			<!-- 다음, 이후 -->
			<c:if test="${toPage<allPage}">
				<!-- 20<21 : true -->
				<li class="page-item"><a class="page-link"
					href="javascript:location.href = 'faq?page=${toPage+1}&opt=${opt}&key=${key}'">&gt;</a>
				</li>
				<li class="page-item"><a class="page-link"
					href="javascript:location.href = 'faq?page=${allPage}&opt=${opt}&key=${key}'">&raquo;</a>
				</li>
			</c:if>
			<c:if test="${toPage>=allPage}">
				<!-- 20<21 : true -->
				<li class="page-item disabled"><a class="page-link"
					href="javascript:location.href = 'faq?page=${toPage+1}&opt=${opt}&key=${key}'">&gt;</a>
				</li>
				<li class="page-item disabled"><a class="page-link"
					href="javascript:location.href = 'faq?page=${allPage}&opt=${opt}&key=${key}'">&raquo;</a>
				</li>
			</c:if>
		</ul>
	</div>
	<br>




	<!-- -------------------------------------검색기능-------------------------------------------------- -->

	<form action="./faq" method="GET">
		<div class="textbox">

			<div class="text1">&nbsp;</div>

			<!-- text1 -->

			<div class="text2">
				<div class="form-group">

					<select class="form-select" id="exampleSelect1" name="opt"
						style="width: 120px">
						<!--  style="width: 120px" -->
						<option value="faq_title">제목</option>
						<option value="faq_content">내용</option>
					</select>
				</div>
			</div>

			<div class="text3">
				<input type="text" name="key"> <input type="submit"
					value="검색">
			</div>
		</div>

	</form>


	<form action="./faq" method="GET">
		<select class="form-select" id="exampleSelect1" name="opt"
			style="text-align: center;">
			<option value="faq_title">제목</option>
			<option value="faq_content">내용</option>
		</select> <input type="text" name="key"> <input type="submit"
			value="검색">

	</form>

	<button id="send-btn">send</button>
	<br>
	<p id="result-text">df</p>

</body>



<script type="text/javascript">
	function load() {

		$.ajax({
			url : "${pageContext.request.contextPath}/api/faq/page/1",
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
				"<tr><th>번호</th>"+
				"<th>제목</th>"+
				"<th>작성자</th>"+
				"<th>작성 날짜</th></tr>")
				for (idx in response) {

					//	console.log(response[idx].faqRegDate);

					$("#test").append(
							
							"<tr>" + "<td>" + response[idx].faqNo + "</td>" +
							//"<td><a href =javascript:location.href = 'faqdetail?id="+response[idx].faqNo + "'>" + response[idx].faqTitle+ "</a></td>"+
							"<td><a href = ${root}/tastyway/customer/faq/detail?id="
									+ response[idx].faqNo + ">"
									+ response[idx].faqTitle + "</a></td>"
									+ "<td>" + "관리자" + "</td>" + "<td>"
									+ new Date(response[idx].faqRegDate)
									+ "</td>" + "</tr>")

				}

			},

		});

		
				$.ajax({
					url : "${pageContext.request.contextPath}/api/faq/count",
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
							$("#button").append(
											"<li class='page-item'><a class='page-link'>&laquo;</a></li>"+											
											"<li class='page-item'><a class='page-link' href ='#' onclick='PageClick(this);'> 1</a></li>"+										
											"<li class='page-item'><a class='page-link' > &raquo;</a></li>"
							);
						} else if (count > 10 && count <= 20) {

							$("#button").append(
											"<li class='page-item'><a class='page-link' > &laquo;</a></li>"+											
											"<li class='page-item'><a class='page-link' href ='#' onclick='PageClick(this);'> 1</a></li>"+
											"<li class='page-item'><a class='page-link' href ='#' onclick='PageClick(this);'> 2</a></li>"+
											"<li class='page-item'><a class='page-link' > &raquo;</a></li>"
							);
						} else if (count > 20 && count <= 30) {

							$("#button").append(
											"<li class='page-item'><a class='page-link' > &laquo;</a></li>"+											
											"<li class='page-item'><a class='page-link' href ='#' onclick='PageClick(this);'> 1</a></li>"+
											"<li class='page-item'><a class='page-link' href ='#' onclick='PageClick(this);'> 2</a></li>"+
											"<li class='page-item'><a class='page-link' href ='#' onclick='PageClick(this);'> 3</a></li>"+
											"<li class='page-item'><a class='page-link' > &raquo;</a></li>"
							);
						} else if (count > 30 && count <= 40) {
							$("#button").append(
											"<li class='page-item'><a class='page-link' > &laquo;</a></li>"+
											"<li class='page-item'><a class='page-link' href ='#' onclick='PageClick(this);'> 1</a></li>"+
											"<li class='page-item'><a class='page-link' href ='#' onclick='PageClick(this);'> 2</a></li>"+
											"<li class='page-item'><a class='page-link' href ='#' onclick='PageClick(this);'> 3</a></li>"+
											"<li class='page-item'><a class='page-link' href ='#' onclick='PageClick(this);'> 4</a></li>"+
											
											"<li class='page-item'><a class='page-link' > &raquo;</a></li>"
							);
						} else if (count > 40 && count <= 50) {

							$("#button").append(
											"<li class='page-item'><a class='page-link' > &laquo;</a></li>"+
											"<li class='page-item'><a class='page-link' href ='#' onclick='PageClick(this);'> 1</a></li>"+
											"<li class='page-item'><a class='page-link' href ='#' onclick='PageClick(this);'> 2</a></li>"+
											"<li class='page-item'><a class='page-link' href ='#' onclick='PageClick(this);'> 3</a></li>"+
											"<li class='page-item'><a class='page-link' href ='#' onclick='PageClick(this);'> 4</a></li>"+
											"<li class='page-item'><a class='page-link' href ='#' onclick='PageClick(this);'> 5</a></li>"+
											"<li class='page-item'><a class='page-link' > &raquo;</a></li>"
							);

						}
					}
				});

	}
	
	
	function PageClick(pagebtn){
		var strText = $(pagebtn).text();
		console.log(strText);
		$.ajax({
			url : "${pageContext.request.contextPath}/api/faq/page/"+strText,
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
				$("#test").empty(); 
				$("#test").append(
				"<tr><th>번호</th>"+
				"<th>제목</th>"+
				"<th>작성자</th>"+
				"<th>작성 날짜</th></tr>")
				for (idx in response) {

					//	console.log(response[idx].faqRegDate);

					$("#test").append(
							
							"<tr>" + "<td>" + response[idx].faqNo + "</td>" +
							//"<td><a href =javascript:location.href = 'faqdetail?id="+response[idx].faqNo + "'>" + response[idx].faqTitle+ "</a></td>"+
							"<td><a href = ${root}/tastyway/customer/faq/detail?id="
									+ response[idx].faqNo + ">"
									+ response[idx].faqTitle + "</a></td>"
									+ "<td>" + "관리자" + "</td>" + "<td>"
									+ new Date(response[idx].faqRegDate)
									+ "</td>" + "</tr>")

				}

			},
			
		});
	}
	
	
	function PageChange(pagebtn){
		var strText = $(pagebtn).text();
		console.log(strText);
		$.ajax({
			url : "${pageContext.request.contextPath}/api/faq/page/"+strText,
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
				$("#test").empty(); 
				$("#test").append(
				"<tr><th>번호</th>"+
				"<th>제목</th>"+
				"<th>작성자</th>"+
				"<th>작성 날짜</th></tr>")
				for (idx in response) {

					//	console.log(response[idx].faqRegDate);

					$("#test").append(
							
							"<tr>" + "<td>" + response[idx].faqNo + "</td>" +
							//"<td><a href =javascript:location.href = 'faqdetail?id="+response[idx].faqNo + "'>" + response[idx].faqTitle+ "</a></td>"+
							"<td><a href = ${root}/tastyway/customer/faq/detail?id="
									+ response[idx].faqNo + ">"
									+ response[idx].faqTitle + "</a></td>"
									+ "<td>" + "관리자" + "</td>" + "<td>"
									+ new Date(response[idx].faqRegDate)
									+ "</td>" + "</tr>")

				}

			},
			
		});
	}
</script>
</html>