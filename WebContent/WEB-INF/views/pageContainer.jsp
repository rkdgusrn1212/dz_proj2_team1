<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<c:if test="${containerHeader ne null}"><!-- null 호출은 header 없음 -->
		<jsp:include page="/WEB-INF/views/${containerHeader}.jsp"></jsp:include>
	</c:if>
	<jsp:include page="/WEB-INF/views/${innerPage}.jsp"></jsp:include>
	<!--재귀호출 조심 -->
	<%@ include file="/WEB-INF/views/footer.jsp"%>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/prism.js"
		data-manual></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
</body>
</html>