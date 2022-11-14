<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<sec:authentication var="user" property="principal" />
<!DOCTYPE html>
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
    href="${root}/resources/css/reset.css">
<link rel="stylesheet"
    href="${root}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
    href="${root}/resources/css/bootstrap-icons.css">
<link rel="stylesheet"
    href="${root}/resources/css/prism-okaidia.css">
<link rel="stylesheet"
    href="${root}/resources/css/custom.min.css">
    <script>
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
                    <li class="nav-item"><a class="nav-link " href="${root}/about">ABOUT US</a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="${root}/about/team">팀 소개</a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="${root}/about/service">서비스 소개</a>
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