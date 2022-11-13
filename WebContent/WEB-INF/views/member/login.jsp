<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="rootPage" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<title>Tasty Way : 로그인 페이지</title>
<link rel="stylesheet" href="${rootPage}/resources/css/reset.css">
<link rel="stylesheet" href="${rootPage}/resources/css/bootstrap.min.css">
<script src="${rootPage}/resources/js/jquery-3.6.1.min.js"></script>
<script>
const sendRequest = ()=>{
	$.ajax({
        url : "${rootPage}/auth/login",
        type : "post",
        contentType:"application/json;charset=utf-8",
        data:JSON.stringify({
            authId : $("#id-input").val(),
            authPwd : $("#pwd-input").val()
        }),
        dataType : "json",
        success: (response)=> {
        	console.log("성공");
            console.log(JSON.stringify(response));
        },
        error: (error)=>{
        	console.log(error);
        }
    })
}
</script>
</head>
<body>
	<div class="container-sm">
		<div class="row justify-content-center">
			<div class="col">
				<img src="${rootPage}/resources/img/TW.png" class="mx-auto d-block"
					width="250" height="250">
			</div>
		</div>
		<div class="row justify-content-center mb-5">
			<div class="col mb-5" style="max-width: 500px;">
				<form>
					<fieldset>
						<legend>로그인</legend>
						<div class="form-group">
							<label for="id-input" class="form-label mt-4">아이디</label> <input
								type="text" class="form-control" id="id-input"
								placeholder="아이디 입력">
						</div>
						<div class="form-group">
							<label for="pwd-input" class="form-label mt-4">비밀번호</label> <input
								type="password" class="form-control" id="pwd-input"
								placeholder="비밀번호 입력">
						</div>
						<hr>
						<div class="form-group row">
							<div class="col">
								<button type="button" class="btn btn-primary w-100"
									onclick="sendRequest()">로그인</button>
							</div>
						</div>
						<div class="form-group row justify-content-center mt-2">
							<div class="d-flex col-4">
								<a class="w-100 text-center">ID &amp; 비밀번호</a>
							</div>
							<div class="col-2">
								<p class="text-center">|</p>
							</div>
							<div class="d-flex col-4">
								<a class="w-100 text-center" href="${rootPage}/member/signup">회원가입</a>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>