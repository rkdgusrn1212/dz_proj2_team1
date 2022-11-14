<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
    href="${root}/resources/css/reset.css">
<link rel="stylesheet"
    href="${root}/resources/css/bootstrap.min.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-lg">
			<a class="navbar-brand" href="${root}"><img width="60px" height="40px" src="${root}/resources/img/white_logo_trans.png"></a>
            <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarColor01"
                aria-controls="navbarColor01" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarColor01">
                <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link " href="${root}/customer">고객센터 메인</a>
                    </li>
                    <li class="nav-item"><a class="nav-link " href="${root}/customer/notice">공지사항</a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="${root}/customer/faq">FAQ</a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="${root}/customer/qna">Q&amp;A</a>
                    </li>
                </ul>
               <ul class="navbar-nav">
                    <li class="nav-item"><a  class="nav-link" href="#">로그인</a></li>    
                </ul>
            </div>
		</div>
	</nav>
    <script src="${root}/resources/js/bootstrap.bundle.min.js"></script>
</body>
</html>