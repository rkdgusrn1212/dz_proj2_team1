<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/components/khgDefaultSet.jsp"%>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-lg">
			<a class="navbar-brand" href="${rootPath}/admin/"><img width="60px" height="40px" src="${rootPath}/resources/img/blue_icon_trans.png"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarColor01"
				aria-controls="navbarColor01" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link" href="${rootPath}/admin/restaurant">식당 관리</a>
					</li>
                    <li class="nav-item"><a class="nav-link" href="${rootPath}/admin/member">회원 관리</a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="${rootPath}/admin/report">신고 관리</a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="${rootPath}/admin/notice">공지 관리</a>
                    </li>
					<li class="nav-item"><a class="nav-link" href="${rootPath}/admin/qna">Q&amp;A 관리</a>
					</li>
                    <li class="nav-item"><a class="nav-link" href="${rootPath}/admin/faq">FAQ 관리</a>
                    </li>
				</ul>
               <ul class="navbar-nav">
                    <li class="nav-item"><a  class="nav-link" href="${rootPath}/admin/root">관리자 설정</a></li>    
                </ul>
			</div>
		</div>
	</nav>
</body>
</html>