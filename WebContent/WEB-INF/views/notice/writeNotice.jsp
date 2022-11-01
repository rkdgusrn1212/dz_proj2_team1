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
   
</head>
</head>
<body>
	gd
	<a href="javascript:location.href='notice?page=list'  "><input
		type="button" value="이동" /></a>
	<form action="">
		<div>
		<p>Tasty way</p>
				<p>공지 사항</p>
		</div>
		<div>
			<div>
				공지 제목 : <input type="text" /><br>
			</div>
			<div>
				공지 내용 :<br>
				<textarea rows="20" cols="100"></textarea>
			</div>
		</div>
		<div>
			<input type= "submit" value = "등록"/>
			<input type= "reset" value = "취소"/>
		</div>
	</form>
</body>
</html>