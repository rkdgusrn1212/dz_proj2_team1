<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  
 현구 코드 일부에서 쓸라고 만든 스크립트 파일.
 토스트를 띄워준다. showToast(title, time, message); + 부트스트랩 Css, js + ajax 설정
 -->
<!DOCTYPE html>
<html>
<head>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${rootPath}/resources/css/reset.css">
<link rel="stylesheet" href="${rootPath}/resources/css/bootstrap.min.css">
<script src="${rootPath}/resources/js/jquery-3.6.1.min.js"></script>
<script src="${rootPath}/resources/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<script>
const showToast = (title, time, message)=>{
    const toastElem = $("#liveToast");
    $(toastElem).find("#toast-title").text(title);
    $(toastElem).find("#toast-time").text(time);
    $(toastElem).find(".toast-body").text(message);
    const toast = new bootstrap.Toast($('#liveToast'));
    toast.show();
};
</script>
</head>
<body>
	<div
		class="toast-container position-fixed top-0 start-50 translate-middle-x p-3">
		<div id="liveToast" class="toast" role="alert" aria-live="assertive"
			aria-atomic="true">
			<div class="toast-header">
				<strong class="me-auto" id="toast-title"></strong> <small
					id="toast-time"></small>
				<button type="button" class="btn-close ms-2 mb-1"
					data-bs-dismiss="toast" aria-label="Close">
					<span aria-hidden="true"></span>
				</button>
			</div>
			<div class="toast-body"></div>
		</div>
	</div>
</body>
</html>