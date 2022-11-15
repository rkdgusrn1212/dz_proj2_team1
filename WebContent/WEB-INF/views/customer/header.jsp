<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<sec:authentication var="user" property="principal" />
<%@ include file="/WEB-INF/views/components/khgDefaultSet.jsp"%>
</head>
<script>

const logout=()=>{
    location.replace("${rootPath}/logout");
}

$(document).ready(()=>{
    <sec:authorize access="isAuthenticated()">
        $.ajax({
              url: "${rootPath}/api/member/"+${user},
              type:"get",
                dataType:"json",
                success : (member)=>{
                    $("#header-user-link").text(member.memberName);
                    }
                 });
        </sec:authorize>
});
</script>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-lg">
			<a class="navbar-brand" href="${rootPath}/customer"><img width="60px" height="40px" src="${rootPath}/resources/img/white_logo_trans.png"></a>
            <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarColor01"
                aria-controls="navbarColor01" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarColor01">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link " href="${rootPath}/customer/notice">공지사항</a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="${rootPath}/customer/faq">FAQ</a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="${rootPath}/customer/qna">Q&amp;A</a>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item"><sec:authorize access="isAnonymous()">
                            <a class="nav-link" href="${rootPath}/member/login"> 로그인 </a>
                        </sec:authorize> <sec:authorize access="isAuthenticated()">
                            <li class="nav-item dropdown"><a
                                class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
                                href="#" role="button" aria-haspopup="true"
                                aria-expanded="false" id="header-user-link"></a>
                                <div class="dropdown-menu" style="">
                                    <a class="dropdown-item" href="#">마이페이지</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="javascript:logout()">로그아웃</a>
                                </div></li>
                        </sec:authorize></li>
                </ul>
            </div>
		</div>
	</nav>
</body>
</html>