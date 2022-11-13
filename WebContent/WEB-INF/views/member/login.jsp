<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="rootPage" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<title>Tasty Way : 로그인 페이지</title>
<%@ include file="/WEB-INF/views/components/khgDefaultSet.jsp"%>
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
        	if(!response.success){
                showToast("로그인 실패", "now", "아이디 또는 비밀번호가 일치하지 않습니다.");
        		return;
        	}
            location.replace("${rootPage}/");
        },
        error: (error)=>{
        	if(error.status==422){
                showToast("로그인 실패", "now", "요청 양식이 맞지 않습니다.");
        	}else{
                showToast("접속 오류", "now", "인터넷 연결을 확인하세요.");	
        	}
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