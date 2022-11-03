<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Tasty Way : 메인</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>
<h1>JQUERY AJAX TEST</h1>
<button id="send-btn">send</button><br>
<p id="result-text">df</p>
<script>
$("#send-btn").click(()=>{
        $.ajax({
            url : "${pageContext.request.contextPath}/api/notice/page/1",
            type : "get",
            //data : {},
            dataType : "JSON",
            contentType : "applicaton/json; charset=utf-8",
            success: function(response) {
            	$("#result-text").html(JSON.stringify(response));                    
            },
            
        });
    }
);
</script>
</body>
</html>