<%@page import="team1.mini2.dz3.auth.core.ValidationProperties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="rootPage" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/components/khgDefaultSet.jsp"%>
<script>
const sendSignUpRequest = ()=>{
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

const sendValidIdRequest = ()=>{
    $.ajax({
        url : "${rootPage}/auth/valid/id",
        type : "get",
        data:{
            authId : $("#id-input").val(),
        },
        dataType : "json",
        success: (response)=> {
            showToast("사용 가능한 아이디", "now", $("#id-input").val()+"는 사용가능합니다.");
        },
        error: (error)=>{
            showToast("이미 사용중인 아이디", "now", $("#id-input").val()+"는 현재 다른 사용자가 이용 중입니다.");
            resetInput("#id-input");
        }
    })
}

const sendValidEmailRequest = ()=>{
    $.ajax({
        url : "${rootPage}/auth/valid/email",
        type : "get",
        data:{
            authEmail : $("#email-input").val(),
        },
        dataType : "json",
        success: (response)=> {
        	$("#email-input").attr("readonly","");
        	$("#valid-input").focus();
        },
        error: (error)=>{
        	resetInput("#email-input");
        	$("#email-input").focus();
        }
    })
}

const cancelEmail = ()=>{
	resetInput("#email-input");
	$("#email-input").focus();
}

const checkValidPwdRequest = ()=>{
    $.ajax({
        url : "${rootPage}/auth/valid/pwd",
        type : "get",
        data:{
            authEmail : $("#pwd-input").val(),
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


const patternInputMap = {
		  "#id-input": new RegExp("${ValidationProperties.AUTH_ID_REGEX}"),
		  "#pwd-input": new RegExp("${ValidationProperties.AUTH_PWD_REGEX}"),
		  "#name-input": new RegExp("${ValidationProperties.NAME_REGEX}"),
          "#email-input": new RegExp("${ValidationProperties.AUTH_EMAIL_REGEX}")
		};
$(document).ready(()=>{
	
	$("#id-input").on('keyup', (e) => {
		if(patternInputMap["#"+e.target.id].test(e.target.value)){
			e.target.className = "form-control is-valid";
        }else{
        	e.target.className = "form-control is-invalid";
        }
	});
	
	$('#pwd-confirm-input').on('keyup', (e)=>{
		if($("#pwd-input").attr("class")==="form-control is-valid"){
			if($("#pwd-input").val()===e.target.value) {
				e.target.className = 'form-control is-valid';
			}else{
				e.target.className = 'form-control is-invalid';
			}
		}
	});
	$('#pwd-confirm-input').on('focus', (e)=>{
        if($("#pwd-input").attr("class")==="form-control is-invalid"){
        	resetInput("#pwd-confirm-input");
        	$("#pwd-input").focus();
        }
	})
	$('#pwd-input').on('keyup', (e)=>{
		if(patternInputMap["#"+e.target.id].test(e.target.value)){
			e.target.className = "form-control is-valid";
		}else{
			e.target.className = "form-control is-invalid";
		}
    })
    $('#name-input').on('keyup', (e)=>{
        if(patternInputMap["#"+e.target.id].test(e.target.value)){
        	e.target.className = 'form-control is-valid';
        }else{
            e.target.className = 'form-control is-invalid';
        }
    });
	
	$('#email-input').on('keyup', (e)=>{
        if(patternInputMap["#"+e.target.id].test(e.target.value)){
            e.target.className = 'form-control is-valid';
        }else{
            e.target.className = 'form-control is-invalid';
        }
    });
});

const resetInput = (id)=>{
	$(id).val("");
    $(id).attr("class","form-control");
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
							<label for="id-input" class="form-label mt-4">아이디</label> <input
								type="text" class="form-control" id="id-input"
								placeholder="아이디 입력">
							<div class="valid-feedback">
								<button class="btn btn-primary mt-2" type="button"
									id="button-addon1" onclick="sendValidIdRequest()">중복확인
								</button>
							</div>
							<div class="invalid-feedback">${ValidationProperties.AUTH_ID_REGEX_DESC}을
								입력하세요.</div>
						</div>
						<div class="form-group">
							<label for="pwd-input" class="form-label mt-4">비밀번호</label> <input
								type="password" class="form-control" id="pwd-input"
								placeholder="비밀번호 입력">
							<div class="valid-feedback">올바른 입력입니다.</div>
							<div class="invalid-feedback">${ValidationProperties.AUTH_PWD_REGEX_DESC}을
								입력하세요.</div>
						</div>
						<div class="form-group">
							<input type="password" class="form-control mt-2"
								id="pwd-confirm-input" placeholder="비밀번호 재입력">
							<div class="valid-feedback">일치합니다.</div>
							<div class="invalid-feedback">다시 입력한 비밀번호가 다릅니다.</div>
						</div>
						<div class="form-group">
							<label for="name-input" class="form-label mt-4">이름</label> <input
								type="text" class="form-control" id="name-input"
								placeholder="이름 입력">
							<div class="valid-feedback">올바른 입력입니다.</div>
							<div class="invalid-feedback">${ValidationProperties.NAME_REGEX_DESC}을
								입력하세요.</div>
						</div>
						<div class="form-group">
							<label for="email-input" class="form-label mt-4">이메일</label> <input
								type="email" class="form-control" id="email-input"
								placeholder="이메일 입력">
							<div class="valid-feedback">
							<div class="d-flex justify-content-start mt-2">
								<button class="btn btn-primary" type="button"
									 onclick="sendValidEmailRequest()">인증번호
									발송</button>
                                <button class="btn btn-outline-primary ms-2" type="button"
                                    onclick="cancelEmail()">이메일 초기화</button>
                                    </div>
								<input type="text" class="form-control mt-2" id="valid-input"
									placeholder="인증번호 입력">
							</div>
							<div class="invalid-feedback">${ValidationProperties.AUTH_EMAIL_REGEX_DESC}을
								입력하세요.</div>
						</div>
						<hr>
						<div class="form-group d-flex">
							<div class="pe-2 w-10">
								<a role="button" href="${rootPage}/member/login"
									class="btn btn-outline-primary w-100" onclick="">뒤로가기</a>
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