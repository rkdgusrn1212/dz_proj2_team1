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
<style>
#search-adjust img {
	content: url("${rootPath}/resources/img/search_tune.svg")
}

#search-adjust:hover img {
	content: url("${rootPath}/resources/img/search_tune_h.svg")
}
</style>
<script>
const logout=()=>{
	location.replace("${rootPath}/logout");
}
</script>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-lg">
			<a class="navbar-brand" href="${rootPath}"><img width="60px"
				height="40px" src="${rootPath}/resources/img/white_logo_trans.png"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarColor01"
				aria-controls="navbarColor01" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarColor01">

				<form class="d-flex">
					<input class="form-control me-sm-2" type="text"
						placeholder="Search">
					<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
				</form>

				<ul class="navbar-nav me-auto">
					<li class="nav-item dropdown"><a class="nav-link"
						id="search-adjust" data-bs-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <img width="30px" height="30px"
							src="${rootPath}/resources/img/search_tune.svg" /></a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a> <a
								class="dropdown-item" href="#">Something else here</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Separated link</a>
						</div></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item"><sec:authorize access="isAnonymous()">
							<a class="nav-link" href="${rootPath}/member/login"> 로그인 </a>
						</sec:authorize> <sec:authorize access="isAuthenticated()">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
								href="#" role="button" aria-haspopup="true"
								aria-expanded="false"> ${user}</a>
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