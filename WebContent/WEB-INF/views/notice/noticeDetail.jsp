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
<body>

<button type="button" class="btn btn-primary">Primary</button>
<button type="button" class="btn btn-secondary">Secondary</button>
<button type="button" class="btn btn-success">Success</button>
<button type="button" class="btn btn-danger">Danger</button>
<button type="button" class="btn btn-warning">Warning</button>
<button type="button" class="btn btn-info">Info</button>
<button type="button" class="btn btn-light">Light</button>
<button type="button" class="btn btn-dark">Dark</button>

<button type="button" class="btn btn-link">Link</button>

<form action="../notice/detail"   method="post">
		<h1>Tasty way 공지사항</h1>
		공지 번호 : ${ dto.notice_no }<br> 
		제목 : ${ dto.notice_title }<br> 
		작성자 : ${ dto.notice_writer }<br>
		내용 : ${ dto.notice_content }<br>
		작성일 : ${dto.notice_regdate }
		
		<div>
		<input type = "submit" value="수정"/>
		<input type = "submit" value = "삭제"/>
		</div>
</form>
</body>
</html>