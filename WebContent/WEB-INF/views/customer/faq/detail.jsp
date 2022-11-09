
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script defer="defer" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function load(){
   console.log(${id});
   var val1 = "";


   val1 = ${id};

    $.ajax({
        url : "${pageContext.request.contextPath}/api/faq/"+val1,
        type : "get",
        //data : {},
        dataType : "JSON",
        contentType : "applicaton/json; charset=utf-8",
   
        success: function(response){
           console.log(response);
           $("#title").append(response.faqTitle)
           $("#content").append(response.faqContent)
           
        }
    });
    

}
</script>

</head>
<body  onload = "load()">
      
      <p id="title"/>
      <p id="content"/>
      <table id="test"></table>
      ${id}
</body>

</html>