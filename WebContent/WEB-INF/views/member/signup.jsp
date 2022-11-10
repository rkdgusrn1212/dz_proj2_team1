<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="rootPage" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css 연결 -->
<link rel="stylesheet" href="${rootPage}/resources/css/reset.css">
<link rel="stylesheet" href="${rootPage}/resources/css/bootstrap.min.css">
<script src="${rootPage}/resources/js/jquery-3.6.1.min.js"></script>
</head>
<script>
const sendSignUpRequest = (elem)=>{
    $.ajax({
        url : "${rootPage}/auth/signup",
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

const sendValidIdRequest = (elem)=>{
    $.ajax({
        url : "${rootPage}/auth/valid/id",
        type : "get",
        data:{
            authId : $("#id-input").val(),
        },
        dataType : "json",
        success: (response)=> {
            console.log(response);
        },
        error: (error)=>{
            console.log(error);
        }
    })
}

const sendValidEmailRequest = (elem)=>{
    $.ajax({
        url : "${rootPage}/auth/valid/email",
        type : "get",
        data:{
            authEmail : $("#email-input").val(),
        },
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
	<div class="container-sm mb-5">
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
						<legend>회원가입</legend>
						<div class="form-group">
							<label for="id-input" class="form-label mt-4">아이디</label>
							<div class="input-group">
								<input type="text" class="form-control" id="id-input"
									placeholder="아이디 입력" aria-describedby="button-addon1">
								<button class="btn btn-secondary" type="button"
									id="button-addon1" onclick="sendValidIdRequest()">중복확인</button>
							</div>
						</div>
						<div class="form-group">
							<label for="pwd-input" class="form-label mt-4">비밀번호</label> <input
								type="password" class="form-control" id="pwd-input"
								placeholder="비밀번호 입력"> <input type="password"
								class="form-control mt-2" id="pwd-input2" placeholder="비밀번호 재입력">
						</div>
						<div class="form-group">
							<label for="name-input" class="form-label mt-4">이름</label> <input
								type="password" class="form-control" id="name-input"
								placeholder="이름 입력">
						</div>
						<div class="form-group">
							<label for="email-input" class="form-label mt-4">이메일</label>
							<div class="input-group">
								<input type="email" class="form-control" id="email-input"
									placeholder="이메일 입력" aria-describedby="button-addon2">
								<button class="btn btn-secondary" type="button"
									id="button-addon2" onclick="sendValidEmailRequest()">인증번호 발송</button>
							</div>
							<input type="text" class="form-control mt-2" id="valid-input"
								placeholder="인증번호 입력">
						</div>
						<hr>
						<div class="form-group d-flex">
							<div class="pe-2 w-10">
								<a role="button" href="${rootPage}/member/login" class="btn btn-outline-primary w-100"
									onclick="">뒤로가기</a>
							</div>
                            <div class="ps-2 flex-fill">
                                <button type="submit" class="btn btn-primary w-100"
                                    onclick="sendRequest()">회원가입</button>
                            </div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>