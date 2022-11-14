<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Tasty Way : 답변 작성</title>
<script>
const load = ()=>{
           $.ajax({
               url : "${rootPath}/api/qna/"+${id},
               type : "get",
               dataType : "JSON",
               contentType : "applicaton/json; charset=utf-8",          
               success: (response)=>{
                  $("#title").text(response.qnaTitle);
                  $("#content").text(response.qnaContent);
                  const date = new Date(response.qnaRegDate);
                  const options = {
                    year: '2-digit',
                    month: '2-digit',
                    day: '2-digit'
                  };
                  const americanDateTime = new Intl.DateTimeFormat('en-US', options).format;
                  $.ajax({
                	 url: "${rootPath}/api/user/"+${id},
                	 type:"get",
                	 dataType:"JSON",
                	 contentType:"applicaton/json; charset;utf-8",
                	 success : (member)=>{
                		 $("#ask-header").text(member.memberName+","+americanDateTime);
                	 }
                  });
               }
           });
       }

function addQnaList(){       
        const jobj = new Object();
        jobj.qnaTitle = $('#title').val();
        jobj.qnaContent = $('#content').val().replace(/\n/g,"<br>");

        const jArray = new Array();
        jArray.push(jobj);
        const result = JSON.stringify(jobj);
        
        $.ajax({
         url : "${rootPath}/api/qna",
         type : "post",
         data : result,
         dataType : "json",
         contentType : "application/json; charset=utf-8"
        });
        alert('답변이 등록 되었습니다.');
        location.href= "${rootPath}/admin/qna";
    }
    

    function update(){
        const id = ${id};
           const jobj = new Object();
           jobj.qnaTitle = $('#title').val();
           jobj.qnaContent = $('#content').val();

           const jArray = new Array();
           jArray.push(jobj);
           const result = JSON.stringify(jobj);
           
           console.log(result);
           $.ajax({
                 url : "${rootPath}/api/qna/"+id,
                 type : "patch",
                 data : result,
                 dataType : "json",
                 contentType : "application/json; charset=utf-8"
                 });
                 alert('답변이 수정 되었습니다.');
                 location.href= "${rootPath}/admin/qna";
           }
</script>
</head>
<body onload=load()>
	<div class="container-lg">
		<div class="col" style="float: none;">
			<h1 id="adqnatitle" class="row"
				style="justify-content: center; margin-top: 50px; margin-bottom: 50px;">Tasty
				way</h1>
		</div>
		<div class="row justify-content-center">
			<div class="col-8">
				<div class="card border-default mb-3">
					<div class="card-header" id="ask-header">
					</div>
					<div class="card-body">
						<h4 class="card-title" id="title"></h4>
						<p class="card-text" id="content"></p>
					</div>
				</div>
				<hr>
				<div class="row">
					<form>
						<fieldset>
							<div class="form-group">
								<label for="exampleTextarea" class="form-label mt-4">답변&nbsp;작성하기</label>
								<textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
							</div>
						</fieldset>
					</form>
					<div
						class="d-flex justify-content-between align-items-baseline mt-2 mb-5">
						<button class="btn btn-sm btn-outline-primary" type="button"
							onclick="javascript:location.replace('${rootPath}/admin/qna')">Q&amp;A&nbsp;목록</button>
						<button class="btn btn-sm btn-success" type="button"
							onclick="submitReply()">Q&amp;A&nbsp;등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>