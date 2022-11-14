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
</head>
<body>
	<footer id="footer">
		<div class="row">
			<div class="col-lg-12" style="background-color: #cccccc">
				<div class="container-lg">
					<div class="row">
						<div class="col-lg-2 col-md-4 col-sm-4">
						<a href="${root}">						  
							<img
								src="${root}/resources/img/logo_trans.png"
								width="128px" height="128px" /></a>
						</div>
						<div class="col-lg-5 col-md-4 col-sm-4">
							<div style="margin-top: 50px;">
								<a style="text-decoration-line: none;"
									href="${root}/about"><h2>ABOUT
										US</h2></a> <a style="text-decoration-line: none;"
									href="${root}/about/team"><p>팀
										소개</p></a> <a style="text-decoration-line: none;"
									href="${root}/about/service"><p>서비스
										소개</p></a>
							</div>
						</div>
						<div class="col-lg-5 col-md-4 col-sm-4">

							<div style="margin-top: 50px;">
								<a style="text-decoration-line: none;"
									href="${root}/customer"><h2>고객센터</h2></a>
								<a style="text-decoration-line: none;"
									href="${root}/customer/faq"><p>FAQ</p></a> <a
									style="text-decoration-line: none;"
									href="${root}/customer/notice"><p>공지사항</p></a>
								<a style="text-decoration-line: none;"
									href="${root}/customer/qna"><p>Q&A</p></a>
							</div>
						</div>
					</div>
					<hr>
					<div class="row" style="margin-bottom : 20px">
						<p>
						<b>Tasty Way</b>
                        </p>
						<p>
							더존 3기, 미니 프로젝트 2, 1팀
						</p>
						<p>
							팀장 강현구 | 팀원 류정수 | 팀원 이기찬 | 팀원 전지현
						</p>
						<p>
						 Git Hub 링크 : <a href="https://github.com/rkdgusrn1212/dz_proj2_team1">https://github.com/rkdgusrn1212/dz_proj2_team1</a>
						</p>
						<p>
						대표 이메일 : <a href="mailto:khgkjg12@naver.com">khgkjg12@naver.com</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>