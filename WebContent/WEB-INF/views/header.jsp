<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${root}/resources/css/reset.css">
<link rel="stylesheet" href="${root}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${root}/resources/css/bootstrap-icons.css">
<link rel="stylesheet" href="${root}/resources/css/prism-okaidia.css">
<link rel="stylesheet" href="${root}/resources/css/custom.min.css">
</head>
<style>
#search-adjust img {
    content: url("${root}/resources/img/search_tune.svg")
}
#search-adjust:hover img {
	content: url("${root}/resources/img/search_tune_h.svg")
}
</style>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-lg">
			<a class="navbar-brand" href="${root}"><img width="60px"
				height="40px" src="${root}/resources/img/white_logo_trans.png"></a>
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
							src="${root}/resources/img/search_tune.svg" /></a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a> <a
								class="dropdown-item" href="#">Something else here</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Separated link</a>
						</div></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="#">로그인</a></li>
				</ul>
			</div>
		</div>
	</nav>
    <script src="${root}/resources/js/bootstrap.bundle.min.js"></script>
</body>
</html>