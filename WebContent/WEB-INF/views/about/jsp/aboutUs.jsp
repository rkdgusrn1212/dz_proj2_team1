<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us page</title>

<!-- css 초기화 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

<!-- css 연결 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jjh.css">

<!-- 부트스트랩 연결 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- 반응형 웹 연결 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<script src="./resources/js/jquery-3.5.1.min.js"></script>
<script src="./resources/js/bootstrap.bundle.min.js"></script>

</head>
<body>

<jsp:include page="/WEB-INF/views/components/header.jsp" />  <!-- ROOT로 나옴 -->

	<img class="mainphoto" src="${pageContext.request.contextPath}/resources/img/mainPhoto.PNG"> <!-- 서버경로 WEBCONTENT기준 / 상대경로 X ㅈ -->

	<div class="mainfontsize">전세계 맛집을 공유하는 플랫폼</div>
	<div class="basicfontsize">Tasty way의 다양한 서비스를 사용해보세요!</div>

    <img class="subphoto1" src="${pageContext.request.contextPath}/resources/img/good.PNG">
	<img class="subphoto1" src="${pageContext.request.contextPath}/resources/img/bag.PNG">
	<img class="subphoto1" src="${pageContext.request.contextPath}/resources/img/kakaotalk.PNG">
	<img class="subphoto1" src="${pageContext.request.contextPath}/resources/img/earth.PNG">

	<div class="textbox">
		<div class="basicfontsize">
		
		<div id="text1"> 최고의 맛집을 공유할 수 있도록 <br> 지원합니다.</div>
		<div id="text2"> 지속적인 운영을 위해 <br> 끊임없이 노력합니다.</div>
		<div id="text3"> 사용자간의 경험을 공유하여 <br> 함께 성장해 나가겠습니다.</div>
		<div id="text4"> 전세계 사용자와 <br> 소통합니다.</div>
			
		</div>	
	</div>

<jsp:include page="/WEB-INF/views/components/footer.jsp" />  <!-- ROOT로 나옴 -->


<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
  <button type="button" class="btn btn-primary">Primary</button>
  <div class="btn-group" role="group">
    <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1" style="">
      <a class="dropdown-item" href="#">Dropdown link</a>
      <a class="dropdown-item" href="#">Dropdown link</a>
    </div>
  </div>
</div>
<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
  <button type="button" class="btn btn-success">Success</button>
  <div class="btn-group" role="group">
    <button id="btnGroupDrop2" type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
    <div class="dropdown-menu" aria-labelledby="btnGroupDrop2" style="">
      <a class="dropdown-item" href="#">Dropdown link</a>
      <a class="dropdown-item" href="#">Dropdown link</a>
    </div>
  </div>
</div>
<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
  <button type="button" class="btn btn-info">Info</button>
  <div class="btn-group" role="group">
    <button id="btnGroupDrop3" type="button" class="btn btn-info dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
    <div class="dropdown-menu" aria-labelledby="btnGroupDrop3" style="">
      <a class="dropdown-item" href="#">Dropdown link</a>
      <a class="dropdown-item" href="#">Dropdown link</a>
    </div>
  </div>
</div>
<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
  <button type="button" class="btn btn-danger">Danger</button>
  <div class="btn-group" role="group">
    <button id="btnGroupDrop4" type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
    <div class="dropdown-menu" aria-labelledby="btnGroupDrop4" style="">
      <a class="dropdown-item" href="#">Dropdown link</a>
      <a class="dropdown-item" href="#">Dropdown link</a>
    </div>
  </div>
</div>



</body>
</html>