<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩 연결 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- css 연결 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/auth.css">
</head>
<body>
	<form>
		<div class="container" style="float: none; margin: 0 auto;">
			<div class="col" style="float: none;">
				<img class="row"
					src="${pageContext.request.contextPath}/resources/img/TW.png"
					style="width: 250px; height: 250px; float: none; margin: 0 auto;">
				<div class="row" style="float: none; margin: 0 auto; width: 25%;">
					<input type="text" class="form-control" placeholder="User ID"
						id="inputDefault" style="margin-top: 10px;">
				</div>
				<div class="row" style="float: none; margin: 0 auto; width: 25%;">
					<input type="password" class="form-control" placeholder="Password"
						id="inputDefault" style="margin-top: 10px;">
				</div>
				<div class="row" style="float: none; margin: 0 auto; width: 25%;">
					<input type="submit" class="btn btn-dark" style="margin-top: 10px;"
						value="Login" />
				</div>
				<div class="row"
					style="float: none; margin: 0 auto; width: 25%; text-align: center">
					<span style="margin-top: 10px; width: 60%;">ID & 비밀번호 찾기</span> <span
						style="margin-top: 10px; width: 40%">회원가입</span>
				</div>
			</div>
		</div>
	</form>
</body>
<jsp:include page="/WEB-INF/views/footer.jsp" />  <!-- ROOT로 나옴 -->

</html>