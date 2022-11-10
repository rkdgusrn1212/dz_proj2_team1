<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Q&A detail</title>

<!-- css 초기화 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

<!-- css 연결 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jjh.css">

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

</head>
<body>


	<div class="container" style="float: none; margin: 60px auto;">
		<div class="row" style="float: none; margin: 40px auto; width: 800px;">

			<div class="input-group mb-3"
				style="width: 800px; justify-content: center;">
				<font size="10" , color="FFA07A" , style="font-weight: bolder;">Tasty way</font>

				<div class="input-group mb-3"
					style="width: 800px; justify-content: center;">
					<font size="6" , style="font-weight: bolder;">Q&A</font>
				</div>

			</div>
		</div>

		<div class="row" style="float: none; margin: 0 auto; width: 2000px;">
			<div class="input-group mb-3"
				style="width: 800px; border-bottom: 1px solid;">
				<div>
					<span style="font-size: 6"><b>&nbsp;제목</b></span>&nbsp;&nbsp;&nbsp;
					<span style="font-size: 3">로그인이 안돼요.</span>
				</div>
			</div>

			<div class="input-group mb-3"
				style="width: 800px; border-bottom: 1px solid;">
				<div>
					<span style="font-size: 6"><b>작성자</b></span>&nbsp;&nbsp;&nbsp; <span>
						style="font-size: 3">전지현</span>
				</div>
			</div>



			<!--Read -->
			<div class="row"
				style="float: none; margin: 0 auto; width: 800px; margin-bottom: 50px;">
				<!--       <textarea rows="20" cols="1000"  readonly class=" form-control" id="content"
               style="margin-top: 10px; margin-bottom: 10px;"></textarea> -->

				<textarea rows="15" cols="1000" class="form-control-plaintext"
					id="content" type="textarea"
					style="background-color: white; font-size: 15px; font-style: oblique;"
					aria-label="readonly input example" readonly>Readonly input herefjdnkjfn kjsadnf jkasdnfkj naskjdfnkajsdnfkjasldnfjkalsndfjk alsndfjksaldnfjkalsdnfjksaldnfjklasndfjklasdjfnsajdkflnasjkdfnljaskdlfnjaskdlnfjkasldnfjkaslnfjksdalnfkslajd...</textarea>
			</div>

			<div class="row"
				style="float: none; margin: 0 auto; margin-top: 25px; margin-bottom: 25px; justify-content: center;">
				<input type="button" class="btn btn-warning" id="listpage"
					style="margin-top: 10px; color: white; width: 180px; heigh: 40px;"
					value="목록" onclick="listpage()" />

			</div>

		</div>
</body>
</html>