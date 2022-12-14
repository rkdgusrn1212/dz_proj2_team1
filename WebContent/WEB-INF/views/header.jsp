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

const search = (keywork)=>{
	location.href="${rootPath}/restaurant";
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
					<button class="btn btn-secondary my-2 my-sm-0" type="button" onclick="search()">Search</button>
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
									<div class="form-group" style="max-width: 1300px;">
										<select class="form-select" id="location"
											style="width: 100px; float: left; text-align: center;">
											<option value="restaurantDong">???</option>
											<option value="restaurantGu">???</option>
											<option value="restaurantSi">???</option>
										</select> <input type="text" id="value1"
											style="width: 250px; float: left; margin-left: 15px;"
											class="form-control" placeholder="?????????">
									</div>
								</div>
								<hr>

								<div class="row"
									style="float: none; margin: 0 auto; width: 500px;">
									<div class="form-group" style="max-width: 1300px;">
										<select class="form-select" id="select"
											style="width: 100px; float: left;">
											<option value="restaurantCategory">??????</option>
											<option value="restaurantName">?????????</option>
											<option value="restaurantMenu">?????????</option>
										</select>

										<div
											style="margin: auto; align-content: center; margin-bottom: 10px; text-align: center;">
											<input type="text" id="value2"
												style="width: 250px; float: left; margin-left: 15px;"
												class="form-control"> <input type="button"
												value="??????" class="btn btn-light"
												style="background-color: #d3d3d3; width: 70px; float: left; margin-left: 15px;"
												onclick="load()">
										</div>
									</div>
								</div>
							</div>
							</div>
						</li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item"><sec:authorize access="isAnonymous()">
							<a class="nav-link" href="${rootPath}/member/login"> ????????? </a>
						</sec:authorize> <sec:authorize access="isAuthenticated()">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
								href="#" role="button" aria-haspopup="true"
								aria-expanded="false" id="header-user-link"></a>
								<div class="dropdown-menu" style="">
									<a class="dropdown-item" href="#">???????????????</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="javascript:logout()">????????????</a>
								</div></li>
						</sec:authorize></li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>