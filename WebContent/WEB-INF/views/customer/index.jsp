<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tasty Way : 고객센터 메인</title>
<script>
	function faqlist() {
		location.href = "${pageContext.request.contextPath}/customer/faq";
	}
	function noticelist() {
		location.href = "${pageContext.request.contextPath}/customer/notice";
	}
	function qnalist() {
		location.href = "${pageContext.request.contextPath}/customer/qna";
	}
</script>
</head>
<body>
	<div class="container" style="float: none; margin: 0 auto;">
		<div class="row"
			style="float: none; margin: 0 auto; width: 525px; margin-top: 50px; margin-bottom: 10px;">
			<p class="h2" style="text-align: center;">Tasty way 고객센터</p>
		</div>

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
				</div>
				<div
					style="margin: auto; align-content: center; margin-bottom: 10px; text-align: center; max-width: 2000px;">
					<input type="text" name="key" id="searchdata"
						placeholder="궁금한 점을 검색해보세요"
						style="width: 300px; float: left; margin-left: 15px;"
						class="form-control"> <input type="button" value="검색"
						class="btn btn-light"
						style="background-color: #d3d3d3; width: 70px; float: left; margin-left: 15px;"
						onclick="search()">
				</div>
			</form>
		</div>
		<div class="row"
			style="float: none; margin: 0; width: 525px; margin-bottom: 50px;">
			<div>
				<img alt="" src="${pageContext.request.contextPath}/resources/img/notice.png" style= "heigh:30px; width:30px; float:left;" onclick = "noticelist()">
				<p class="h4" style="text-align: center; float: left;" onclick = "noticelist()">공지</p>
				<div id="notice-head" style="float: left;" onclick = "noticelist()">공지 헤드라인을 띄울 div</div>
			</div>
		</div>
		<div style="margin-bottom: 30px;">
			<p class="h4" style="text-align: center; float: left;">자주 찾는 도움말</p>
			<p>
				<a style="margin-left: 20px;"
					href="${pageContext.request.contextPath}/customer/faq">FAQ 목록보기</a>
			</p>
		</div>
	</div>

	<div class="container text-center" style="float: none; margin: 0 auto;">
		<div class="row align-items-center">
			<div
				style="background-color: #f39c11; border-radius: 50px; width: 250px; height: 250px; float: left; margin: 0 auto;">FAQ1</div>
			<div
				style="background-color: #f39c11; border-radius: 50px; width: 250px; height: 250px; float: left; margin: 0 auto;">FAQ2</div>
			<div
				style="background-color: #f39c11; border-radius: 50px; width: 250px; height: 250px; float: left; margin: 0 auto;">FAQ3</div>
			<div
				style="background-color: #f39c11; border-radius: 50px; width: 250px; height: 250px; float: left; margin: 0 auto;">FAQ4</div>
			<div
				style="background-color: #f39c11; border-radius: 50px; width: 250px; height: 250px; float: left; margin: 0 auto;">FAQ5</div>
		</div>
	</div>
	<div class="container"
		style="float: none; margin: 0 auto; margin-top: 100px; margin-bottom: 200px;">
		<div style="float: left; margin: 0 auto;">
			<p class="h4" style="text-align: center; float: left;">다른 도움이
				필요하신가요?</p>
		</div>
		<div style="float: left; margin: 0 auto; margin-left: 50px;">
			<img alt=""
				src="${pageContext.request.contextPath}/resources/img/qna.png"
				style="width: 30px; height: 30px; float: left;" onclick = "qnalist()"/>
			<p class="h4"
				style="text-align: center; float: left; margin-left: 10px;"  onclick = "qnalist()">문의하기</p><br><br>
				<p class="h6"  onclick = "qnalist()">궁금한 사항을 문의해주시면 성실하게 답변드립니다.</p>
		</div>
	</div>
</body>
</html>