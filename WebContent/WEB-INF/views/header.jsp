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

							<div class="container"
								style="float: none; margin: 0 auto; width: 500px;">
								<br>
								<div class="row" style="float: none; margin: 0 auto;">
									<div class="btn-group" role="group"
										aria-label="Basic radio toggle button group">
										<input type="radio" class="btn-check" name="btnradio"
											id="btnradio1" autocomplete="off" checked=""> <label
											class="btn btn-outline-primary" for="btnradio1">시</label> <input
											type="radio" class="btn-check" name="btnradio" id="btnradio2"
											autocomplete="off" checked=""> <label
											class="btn btn-outline-primary" for="btnradio2">군</label> <input
											type="radio" class="btn-check" name="btnradio" id="btnradio3"
											autocomplete="off" checked=""> <label
											class="btn btn-outline-primary" for="btnradio3">동</label> <input
											type="text" style="border-color: orange;"></input>

									</div>
								</div>
								<hr>

								<div class="row"
									style="float: none; margin: 0 auto; width: 500px;">
									<form name="searchform" method="GET">
										<div class="form-group" style="max-width: 1300px;">
											<select class="form-select" id="searchopt" name="opt"
												style="width: 100px; float: left;">
												<option value="noticeTitle">식당명</option>
												<option value="noticeTitle">메뉴명</option>
												<option value="noticeContent">분류</option>
											</select>


											<div
												style="margin: auto; align-content: center; margin-bottom: 10px; text-align: center;">
												<input type="text" name="key" id="searchdata"
													style="width: 250px; float: left; margin-left: 15px;"
													class="form-control"> <input type="button"
													value="검색" class="btn btn-light"
													style="background-color: #d3d3d3; width: 70px; float: left; margin-left: 15px;"
													onclick="search()">
											</div>
										</div>
									</form>
								</div>
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