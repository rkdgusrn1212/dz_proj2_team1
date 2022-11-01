<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>page container</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/bootstrap-icons.css">
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/prism-okaidia.css">
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/custom.min.css">
<body>

	<%@ include file="/WEB-INF/views/components/header.jsp"%>

    <%@ include file="/WEB-INF/views/components/footer.jsp"%>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/prism.js" data-manual></script>
    <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
</body>
</html>