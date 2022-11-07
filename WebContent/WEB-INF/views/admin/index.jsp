<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#btn {
	background-color: #3598db;
	border-radius: 3px;
	border: 0px;
	color: white;
	height: 120px;
	width: 300px;
	font-size: 50px;
}

#ic {
	width: 100px;
	height: 100px;
	margin-bottom: 10px;
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css">

<!-- css 초기화 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1">


<meta charset="UTF-8">
<title>Tasty Way : 관리 메인</title>
</head>
<body>

	<div class="container text-center">
		<div class="col" style="float: none; margin-top: 10px;">
			<div class="row"
				style="float: none; margin: 0 auto; justify-content: flex-end">
				<div style="float: right; width: 70px;">
					<img
						src="${pageContext.request.contextPath}/resources/img/root.png" style = "width : 60px; height : 60px;">
				</div>
				<div
					style="float: right; width: 170px; display: flex; align-items: center;">
					<button type="button" class="btn btn-outline-secondary"
						style="width: 150px; height: 40px;"
						onclick="window.location = '${pageContext.request.contextPath}/admin/root'">루트
						관리자 설정</button>
				</div>
			</div>
		</div>
		<div class="row" style="margin-top: 50px;">
			<div class="col-sm" style="width: 300px; height: 300px;">
				<div class="col">
					<img id="ic"
						src="${pageContext.request.contextPath}/resources/img/restaurant.png">

				</div>
				<div class="col">
					<button type="button" id="btn"
						onclick="window.location = '${pageContext.request.contextPath}/admin/restaurant'">식당
						관리</button>
				</div>
			</div>
			<div class="col-sm" style="width: 300px; height: 300px;">
				<div class="col">
					<img id="ic"
						src="${pageContext.request.contextPath}/resources/img/report.png">

				</div>
				<div class="col">
					<button type="button" id="btn"
						onclick="window.location = '${pageContext.request.contextPath}/admin/report'">신고
						관리</button>
				</div>
			</div>

			<div class="col-sm" style="width: 300px; height: 300px;">
				<div class="col">
					<img id="ic"
						src="${pageContext.request.contextPath}/resources/img/qna.png">
				</div>

				<div class="col">
					<button type="button" id="btn"
						onclick="window.location = '${pageContext.request.contextPath}/admin/qna'">Q&A
						관리</button>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm" style="width: 300px; height: 300px;">
				<div class="col">
					<img id="ic"
						src="${pageContext.request.contextPath}/resources/img/member.png">
				</div>
				<div class="col">
					<button type="button" id="btn"
						onclick="window.location = '${pageContext.request.contextPath}/admin/member'">회원
						관리</button>
				</div>
			</div>
			<div class="col-sm" style="width: 300px; height: 300px;">
				<div class="col">
					<img id="ic"
						src="${pageContext.request.contextPath}/resources/img/faq.png">
				</div>
				<div class="col">
					<button type="button" id="btn"
						onclick="window.location = '${pageContext.request.contextPath}/admin/faq'">FAQ
						관리</button>
				</div>
			</div>
			<div class="col-sm" style="width: 300px; height: 300px;">
				<div class="col">
					<img id="ic"
						src="${pageContext.request.contextPath}/resources/img/notice.png">
				</div>
				<div class="col">
					<button type="button" id="btn"
						onclick="window.location = '${pageContext.request.contextPath}/admin/notice'">공지
						관리</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>