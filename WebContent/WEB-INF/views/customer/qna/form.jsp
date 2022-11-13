<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Tasty Way : 질문 작성</title>
<style>
#multiple-container {
   display: grid;
   grid-template-columns: 2fr 2fr 2fr;
}

.image {
   display: inline;
   width: 300px;
   height: 300px;
   border: 1px solid;
}

.image-label {
   position: relative;
   bottom: 22px;
   left: 5px;
   color: white;
   text-shadow: 2px 2px 2px black;
}
</style>
<!-- <link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
   crossorigin="anonymous"> -->
<!-- jQuery 라이브러리 호출 -->

<script defer="defer" src="${rootPath}/resources/js/jquery-3.6.1.min.js"></script>
</head>

<body onload="load()">



   <div class="container" style="float: none; margin: 0 auto;">
      <div class="row" style="float: none; margin: 50px auto; width: 800px;">
         <div class="input-group mb-3"
            style="width: 800px; justify-content: center;">
            <font size="10" , color="FFA07A" , style="font-weight: bolder;">Q&A
               등록</font>
         </div>
      </div>

      <form action="./faq/form" method="post" id="form">
         <hr>
         <br>
         <div class="row" style="float: none; margin: 0 auto; width: 800px;">
            <div class="input-group mb-3" style="width: 800px;">
               <span class="input-group-text" id="title"> &nbsp; <font
                  size="3" , style="font-weight: bolder;">제목</font>
               </span> <input type="text" style="background-color: white; width: 230px"
                  class="form-control" id="titleinput"
                  aria-describedby=" basic-addon3" > <span
                  class="input-group-text" id="writer"> &nbsp; <font size="3"
                  , style="font-weight: bolder;">작성자</font>
               </span> <input type="text" style="background-color: white;"
                  class="form-control" id="writerinput"
                  aria-describedby=" basic-addon3">
            </div>
         </div>
         <hr>
         <!-- output -->
         <div class="row" style="float: none; margin: 0 auto; width: 800px;">
            <textarea rows="20" cols="1000" class="form-control" id="content"
               style="margin-top: 10px; margin-bottom: 10px;"></textarea>
         </div>

         <hr>
         <br>
         <!-- input -->
         <div class="row" style="float: none; margin: 0 auto; width: 800px;">
            <div class="input-group mb-3" style="width: 800px;">
               <span class="input-group-text" id="title"> &nbsp;<font
                  size="3" , style="font-weight: bolder;">비밀번호</font>
               </span> <input type="text" class="form-control" id="passwordinput"
                  aria-describedby="basic-addon3">
            </div>
         </div>

         <hr>
         <br>
         <!-- input -->
         <div class="row" style="float: none; margin: 0 auto; width: 800px;">
            <div class="input-group mb-3" style="width: 800px;">
               <div class="form-check form-switch">
                  <input class="form-check-input" type="checkbox"
                     id="Checked" checked> <label
                     class="form-check-label" for="flexSwitchCheckChecked"><b>공개여부를
                        설정</b></label>
               </div>
            </div>
         </div>
         <hr>
         <br>
         <div class="row" style="float: none; margin: 0 auto; width: 800px;">
            <div style="float: right; margin-bottom: 30px;" id="areaBtn">
               <input type="reset" value="취소" class="btn btn-light reset"
                  onclick="listpage()"
                  style="background-color: #D3D3D3; width: 70px; float: right; margin-left: 15px;" />
               <input type='Button' value='등록' id='submitBtn'
                  onclick='input()' class='btn btn-light submit'
                  style='background-color: #5F5F5F; width: 70px; float: right; color: white;' />
            </div>
         </div>

      </form>

   </div>
</body>
<script type="text/javascript">
function load(){
	 //load 되면 page값도 받아옴
	
	 const id = "${id}";
	 console.log(id);
	 //document.write("id = " + id);
	 if(id !="" || id!=null )
	{
	//	 $('input[name=writerinput]').attr('value',id);
	//	 document.getElementsByName("writerinput").value = id;
	}  
	// $('input[name=writerinput]').attr('value',"anonymous");
	// document.getElementsByName("writerinput").value = "anonymous";
	
	 
	
	 
}
</script>

<script>
function input(){
	const id = "${id}";
	const titledata = String($("#titleinput").val());	
	//const writerdata = String(document.getElementsByName('writerinput').value);
	const writerdata =String($("#writerinput").val());
	const contentdata =String($("#content").val());
	let checkdata =String($("#Checked").val());
	const passworddata = String($("#passwordinput").val());
	
	
	console.log(titledata);
	console.log(writerdata);
	console.log(contentdata);
	console.log(checkdata);
	console.log(passworddata);
	if(checkdata == "on")
	{
		checkdata = "T";
	}
	else
	{
		checkdata = "F";
	}
	
	console.log(checkdata);
	console.log("${rootPath}/api/qna");
	console.log(JSON.stringify({
  	  
  	  qnaTitle: titledata,
  	  qnaContent: contentdata,
  	  qnaNonMember: writerdata,
  	  qnaPwd: passworddata,
  	  qnaPublic: checkdata
    }));
	
	const jobj = new Object();
	jobj.qnaTitle = titledata;
	jobj.qnaContent = contentdata;
	jobj.qnaNonMember = writerdata;
	jobj.qnaPwd = passworddata;
	jobj.qnaPublic = checkdata;
	
	const jArray = new Array();
	jArray.push(jobj);
	const result = JSON.stringify(jobj);
	
	console.log(result);
	
	  $.ajax({
       	  url : "${rootPath}/api/qna",   /* 수정 */
          type : "post",
          dataType : "json",
          contentType: "application/json", 
 		  data : result,
          success : function(response) { //값을 받아오면
          	listpage();
          }
       }); //end ajax   
	

}
</script>    
     
	 
<script>
   function listpage() {
      location.href = "${rootPath}/customer/qna";
   }
</script>
</html>


