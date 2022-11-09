<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<title>Tasty Way : 로그인 페이지</title>
<link rel="stylesheet" href="${root}/resources/css/reset.css">
<link rel="stylesheet" href="${root}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${root}/resources/css/auth.css">
<script
    src="${root}/resources/js/jquery-3.6.1.min.js"></script>
<script>
const sendRequest = (elem)=>{
	$.ajax({
        url : "${root}/auth/login",
        type : "post",
        contentType:"application/json;charset=utf-8",
        data:JSON.stringify({
            authId : $("#id-input").val(),
            authPwd : $("#pwd-input").val()
        }),
        dataType : "json",
        success: (response)=> {

            console.log(response);
        },
        error: (error)=>{
        	console.log(error);
        }
    })
}
</script>
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
						id="id-input" style="margin-top: 10px;">
				</div>
				<div class="row" style="float: none; margin: 0 auto; width: 25%;">
					<input type="password" class="form-control" placeholder="Password"
						id="pwd-input" style="margin-top: 10px;">
				</div>
				<div class="row" style="float: none; margin: 0 auto; width: 25%;">
					<button type="button" class="btn btn-dark" style="margin-top: 10px;" onclick="sendRequest()">Login</button>
				</div>
				<div class="row"
					style="float: none; margin: 0 auto; width: 25%; text-align: center">
					<span style="margin-top: 10px; width: 60%;">ID &amp; 비밀번호 찾기</span>
					<span style="margin-top: 10px; width: 40%">회원가입</span>
				</div>
			</div>
		</div>
	</form>
</body>
</html>