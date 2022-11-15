<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>faq 메인</title>

<script defer="defer"
   src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>

<!-- css 초기화 -->
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

<!-- css 연결 -->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/lkc.css">

<!-- 반응형 웹 연결 -->
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.5.2/dist/css/bootstrap.min.css"
   integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
   crossorigin="anonymous">


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="${rootPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
   href="${rootPath}/resources/css/bootstrap-icons.css">
<link rel="stylesheet"
   href="${rootPath}/resources/css/prism-okaidia.css">
<link rel="stylesheet" href="${rootPath}/resources/css/custom.min.css">
</head>

<body onload="load()">



   <div class="container" style="float: none; margin: 0 auto;">
      <div class="row"
         style="float: none; margin: 0 auto; width: 525px; margin-top: 50px; margin-bottom: 10px;">
         <p class="h1" style="text-align: center;"><b>Tasty way 고객센터</b></p>
      </div><br>
      

      <div class="row"
         style="float: none; margin: 0; width: 525px; margin-bottom: 50px;">
         <div>
            <img alt="" src="${rootPath}/resources/img/notice.png" style= "heigh:30px; width:30px; float:left;" onclick = "noticelist()">
            <p class="h5" style="text-align: center; float: left;" onclick = "noticelist()"><b>공지&nbsp;&nbsp;</b></a></p>
            <div id="mainNotice" style="float: left;" onclick = "noticemainlist()" class="notice"></div>
         </div>
      </div>
      <div style="margin-bottom: 30px;">
         <p class="h5" style="text-align: center; float: left;">&nbsp; 자주 찾는 도움말</p>
         <p>
            <a style="margin-left: 20px;"
               href="${rootPath}/customer/faq">FAQ 목록보기</a>
         </p>
      </div>
   </div>

   <div class="container text-center" style="float: none; margin: 0 auto; font-size: 23px; font-weight: bolder; text-align: center;" >
      <div class="row align-items-center">
         <div 
            style="background-color: #f39c11; border-radius: 50px; width: 250px; height: 250px; float: left; margin: 0 auto;" >
             <div class="faq" id="question1" style="padding-top: 100px;" onclick="faq1()";></div>
            </div>
         <div
            style="background-color: #f39c11; border-radius: 50px; width: 250px; height: 250px; float: left; margin: 0 auto;">
            <div class="faq" id="question2" style="padding-top: 100px;" onclick="faq2()";></div>
            </div>
         <div
            style="background-color: #f39c11; border-radius: 50px; width: 250px; height: 250px; float: left; margin: 0 auto;">
            <div class="faq" id="question3" style="padding-top: 100px;" onclick="faq3()";></div>
            </div>
         <div
            style="background-color: #f39c11; border-radius: 50px; width: 250px; height: 250px; float: left; margin: 0 auto;">
            <div class="faq" id="question4" style="padding-top: 100px;" onclick="faq4()";></div>
            </div>
         <div
            style="background-color: #f39c11; border-radius: 50px; width: 250px; height: 250px; float: left; margin: 0 auto;">
            <div class="faq" id="question5" style="padding-top: 100px;" onclick="faq5()";></div>
            </div>
      </div>
   </div>
   <div class="container"
      style="float: none; margin: 0 auto; margin-top: 100px; margin-bottom: 200px;">
      <div style="float: left; margin: 0 auto;">
         <p class="h4" style="text-align: center; float: left;">다른 도움이
            필요하신가요?</p>
      </div>
      <div style="float: left; margin: 0 auto; margin-left: 50px;">
         <img alt=""
            src="${rootPath}/resources/img/qna.png"
            style="width: 30px; height: 30px; float: left;" onclick = "qnalist()"/>
         <p class="h4"
            style="text-align: center; float: left; margin-left: 10px;"  onclick = "qnalist()">문의하기</p><br><br>
            <p class="h6"  onclick = "qnalist()">궁금한 사항을 문의해주시면 성실하게 답변드립니다.</p>
      </div>
   </div>
  
</body>

<script>
   function faqlist() {
      location.href = "${rootPath}/customer/faq";
   }
   
   function noticelist(){
      location.href = "${rootPath}/customer/notice";
   }
   
   function noticemainlist(){
        location.href = "${rootPath}/customer/notice/detail?id=100";
     
   }
   
   function qnalist() {
      location.href = "${rootPath}/customer/qna";
   }
   
   function faq1() {
         location.href = "${rootPath}/customer/faq/detail?id=100";
   }
   
   function faq2() {
         location.href = "${rootPath}/customer/faq/detail?id=101";
   }
   
   function faq3() {
         location.href = "${rootPath}/customer/faq/detail?id=102";
   }
   
   function faq4() {
         location.href = "${rootPath}/customer/faq/detail?id=103";
   }
   
   function faq5() {
         location.href = "${rootPath}/customer/faq/detail?id=104";
   }
   
   
function load(){
      
         $.ajax({
             url : "${rootPath}/api/faq/100", //faq No.100의 값
             type : "get",
             dataType : "JSON",
             contentType : "applicaton/json; charset=utf-8",
             success : function(response) { //값을 받아오면
                //console.log(response)
                $("#question1").append(response.faqTitle)
             }
          });
         
         $.ajax({
             url : "${rootPath}/api/faq/101", //faq No.101의 값
             type : "get",
             dataType : "JSON",
             contentType : "applicaton/json; charset=utf-8",
             success : function(response) { //값을 받아오면
                //console.log(response)
                $("#question2").append(response.faqTitle)
             }
          });
         
         $.ajax({
             url : "${rootPath}/api/faq/102", //faq No.102의 값
             type : "get",
             dataType : "JSON",
             contentType : "applicaton/json; charset=utf-8",
             success : function(response) { //값을 받아오면
                //console.log(response)
                $("#question3").append(response.faqTitle)
             }
          });
         
         $.ajax({
             url : "${rootPath}/api/faq/103", //faq No.103의 값
             type : "get",
             dataType : "JSON",
             contentType : "applicaton/json; charset=utf-8",
             success : function(response) { //값을 받아오면
                //console.log(response)
                $("#question4").append(response.faqTitle)
             }
          });
         
         $.ajax({
             url : "${rootPath}/api/faq/104", //faq No.104의 값
             type : "get",
             dataType : "JSON",
             contentType : "applicaton/json; charset=utf-8",
             success : function(response) { //값을 받아오면
                //console.log(response)
                $("#question5").append(response.faqTitle)
             }
          });
         
         $.ajax({
             url : "${rootPath}/api/notice/100", //공지사항 No.100의 값
             type : "get",
             dataType : "JSON",
             contentType : "applicaton/json; charset=utf-8",
             success : function(response) { //값을 받아오면
                //console.log(response)
                $("#mainNotice").append(response.noticeTitle)
             }
          });
   }

   
</script>


</html>