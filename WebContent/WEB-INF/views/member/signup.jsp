<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css 연결 -->
<link rel="stylesheet" href="${root}/resources/css/reset.css">
<link rel="stylesheet" href="${root}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${root}/resources/css/auth.css">
</head>
<script>
const sendRequest = (elem)=>{
    $.ajax({
        url : "${root}/auth/signup",
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
			<div class="col" style="float: none; margin-top: 0%">
				<img class="row"
					src="${pageContext.request.contextPath}/resources/img/TW.png"
					style="width: 250px; height: 250px; float: none; margin: 0 auto;">
				<div class="row"
					style="float: none; margin: 0 auto; width: 25%; text-align: center">
					<span style="margin-top: 10px;">회원 가입</span>
				</div>

				<div class="row" style="float: none; margin: 0 auto; width: 25%;">
					<input type="text" class="form-control" placeholder="아이디 입력"
						id="id" style="margin-top: 10px; float: left; width: 62%;">
					<input type="submit" class="btn btn-light"
						style="margin-top: 10px; float: left; margin-left: 6%; width: 32%; background-color: #D3D3D3; color: #000;"
						value="중복 확인" />
				</div>

				<div class="row" style="float: none; margin: 0 auto; width: 25%;">
					<input type="password" class="form-control" placeholder="비밀번호 입력"
						id="pwd" style="margin-top: 10px;">
				</div>
				<div class="row" style="float: none; margin: 0 auto; width: 25%;">
					<input type="password" class="form-control" placeholder="비밀번호 재입력"
						id="pwd2" style="margin-top: 10px;">
				</div>

				<div class="row" style="float: none; margin: 0 auto; width: 25%;">
					<input type="text" class="form-control" placeholder="성명" id="name"
						style="margin-top: 10px;">
				</div>

				<div class="row" style="float: none; margin: 0 auto; width: 25%;">
					<input type="text" class="form-control" placeholder="생년월일" id="mid"
						style="margin-top: 10px;">
				</div>

				<div class="row" style="float: none; margin: 0 auto; width: 25%;">
					<input type="email" class="form-control" placeholder="이메일 주소"
						id="email" style="margin-top: 10px;">
				</div>
				<div class="row" style="float: none; margin: 0 auto; width: 25%;">
					<input type="submit" class="btn btn-warning"
						style="margin-top: 10px; color: white;" value="이메일 인증" />
				</div>
				<div class="row" style="float: none; margin: 0 auto; width: 25%;">
					<input type="text" class="form-control" placeholder="인증번호 입력"
						id="check" style="margin-top: 10px;">
				</div>
				<div class="row" style="float: none; margin: 0 auto; width: 25%;">
					<input type="text" class="form-control" placeholder="주소 입력"
						id="addr" style="margin-top: 10px;">
				</div>
				<div class="row" style="float: none; margin: 0 auto; width: 25%;">
					<input type="text" class="form-control"
						placeholder="휴대폰 번호 입력 (-제외 11자리)" id="mid"
						style="margin-top: 10px;">
				</div>

				<div class="row" style="float: none; margin: 0 auto; width: 15%;">
					<input type="submit" class="btn btn-light"
						style="margin-top: 10px; background-color: #d3d3d3; color: #000;"
						value="가입하기" />
				</div>
			</div>
		</div>
	</form>
</body>
</html>