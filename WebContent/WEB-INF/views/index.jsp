<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tasty Way : 마이페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- css 초기화 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" href="${rootPath}/resources/css/reset.css">
<link rel="stylesheet"
	href="${rootPath}/resources/css/bootstrap.min.css">
<script src="${rootPath}/resources/js/jquery-3.6.1.min.js"></script>
<!-- css 연결 -->

<link rel="stylesheet" href="${rootPath}/resources/css/star.css">
<script>
const drawStar = (target) => {
  	document.querySelector(`.star span`).style.width = target.value*10+"%";
  	const i = target.value * 0.5;
	document.getElementById("pointView").innerHTML = i;

}

function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
	</script>
</head>
<body>
	<div class="container"
		style="float: none; margin: 0 auto; margin-bottom: 100px;">
		<div class="row"
			style="float: none; margin: 0 auto; justify-content: center; margin-top: 100px;">
			<h1 style="justify-content: center; width: 700px; float: left;">리뷰
				작성</h1>
			<input type="submit" class="btn btn-info" value="등록"
				style="width: 150px; margin: 10px;" /> <input type="reset"
				class="btn btn-info" value="취소" style="width: 150px; margin: 10px;" />

			<div class="col" style="float:left;">
				<div class="row"
					style="float: none; margin: 0; justify-content: center; margin-bottom: 10px;">
					<div
						style="background-color: #50C785; width: 200px; height: 50px; float: left;'">
						<h2 class="form-label"
							style="text-align: center; color: #fff; line-height: 50px;">제목</h2>
					</div>
					<input type="text" id="title" style="float: left; width: 500px;"
						placeholder="리뷰 제목을 작성해주세요" />
				</div>
				<div class="row"
					style="float: none; margin: 0; justify-content: center; margin-bottom: 10px;">

					<input type="file" onchange="readURL(this);" class="form-control "
						style="width: 700px;">
				</div>
				<div class="row"
					style="float: none; margin: 0; justify-content: center; margin-bottom: 10px;">
					<div
						style="background-color: #50C785; width: 200px; height: 200px; float: left;'">
						<h2 style="text-align: center; color: #fff; line-height: 200px;">내용</h2>
					</div>
					<textarea rows="6" cols="20" style="float: left; width: 500px;"
						id="content"></textarea>
				</div>
				<div class="row"
					style="float: none; margin: 0 auto; justify-content: center;">
					<div
						style="background-color: #50C785; width: 200px; height: 50px; float: left;'">
						<h2 style="text-align: center; color: #fff; line-height: 50px;">평점</h2>
					</div>
					<div style="float: left; width: 200px;">
						<span class="star"> ★★★★★ <span id="after">★★★★★</span> <input
							type="range" id="ran" oninput="drawStar(this)" value="1" step="1"
							min="0" max="10">
						</span>
					</div>
					<div style="float: left; width: 300px; justify-content: center;">
						<h3 id="pointView"
							style="width: 100px; height: 50px; float: left; text-align: right; margin: 0; line-height: 50px;">0</h3>
						<h3
							style="width: 100px; height: 50px; float: left; text-align: left; margin: 0; line-height: 50px;">점</h3>
					</div>
				</div>
			</div>
			
				<img class= "col" alt="음식사진을 추가해 주세요" id="preview"  style="width:350px; height:350px;"/>
		
		</div>

	</div>




</body>

</html>