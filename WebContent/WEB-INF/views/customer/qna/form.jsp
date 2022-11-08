<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Tasty Way : 질문 작성</title>
<style>
#multiple-container {
	display: grid;
	grid-template-columns: 2fr 2fr 2fr;
}

.image {
	display: inline;
	width: 300px;
	height: 300px;
	border: 1px solid;
}

.image-label {
	position: relative;
	bottom: 22px;
	left: 5px;
	color: white;
	text-shadow: 2px 2px 2px black;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- jQuery 라이브러리 호출 -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>



	<div class="container" style="float: none; margin: 0 auto;">
		<div class="row" style="float: none; margin: 50px auto; width: 800px;">
			<div class="input-group mb-3"
				style="width: 800px; justify-content: center;">
				<font size="10" , color="FFA07A" , style="font-weight: bolder;">Q&A
					등록</font>
			</div>
		</div>

		<form action="./faq/form" method="post" id="form">
			<hr>
			<br>
			<div class="row" style="float: none; margin: 0 auto; width: 800px;">
				<div class="input-group mb-3" style="width: 800px;">
					<span class="input-group-text" id="title"> &nbsp; <font
						size="3" , style="font-weight: bolder;">제목</font>
					</span> <input type="text" style="background-color: white; width: 230px"
						class="form-control" id="titleinput"
						aria-describedby=" basic-addon3" readonly> <span
						class="input-group-text" id="writer"> &nbsp; <font size="3"
						, style="font-weight: bolder;">작성자</font>
					</span> <input type="text" style="background-color: white;"
						class="form-control" id="writerinput"
						aria-describedby=" basic-addon3" readonly>
				</div>
			</div>
			<hr>
			<!-- output -->
			<div class="row" style="float: none; margin: 0 auto; width: 800px;">
				<textarea rows="20" cols="1000" class="form-control" id="content"
					style="margin-top: 10px; margin-bottom: 10px;"></textarea>
			</div>

			<hr>
			<br>
			<!-- input -->
			<div class="row" style="float: none; margin: 0 auto; width: 800px;">
				<div class="input-group mb-3" style="width: 800px;">
					<span class="input-group-text" id="title"> &nbsp;<font
						size="3" , style="font-weight: bolder;">비밀번호</font>
					</span> <input type="text" class="form-control" id="writerinput"
						aria-describedby="basic-addon3">
				</div>
			</div>

			<hr>
			<br>
			<!-- input -->
			<div class="row" style="float: none; margin: 0 auto; width: 800px;">
				<div class="input-group mb-3" style="width: 800px;">
					<div class="form-check form-switch">
						<input class="form-check-input" type="checkbox"
							id="flexSwitchCheckChecked" checked> <label
							class="form-check-label" for="flexSwitchCheckChecked"><b>공개여부를
								설정</b></label>
					</div>
				</div>
			</div>
			<hr>
			<br>
			<div class="row" style="float: none; margin: 0 auto; width: 800px;">
				<div style="float: right; margin-bottom: 30px;" id="areaBtn">
					<input type="reset" value="취소" class="btn btn-light reset"
						onclick="listpage()"
						style="background-color: #D3D3D3; width: 70px; float: right; margin-left: 15px;" />
					<input type='Button' value='등록' id='submitBtn'
						onclick='addFaqList()' class='btn btn-light submit'
						style='background-color: #5F5F5F; width: 70px; float: right; color: white;' />
				</div>
			</div>

		</form>

	</div>
</body>

<script>
	function listpage() {
		location.href = "${pageContext.request.contextPath}/customer/faq";
	}
</script>
</html>



