<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<sec:authentication property="principal" var="user" />
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

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
<script>
$(document).ready(()=>{
    <sec:authorize access="isAuthenticated()">
        $.ajax({
              url: "${rootPath}/api/member/${user}",
              type:"get",
                dataType:"json",
                success : (member)=>{
                    $("#writerinput").val(member.memberName);
                    }
                 });
        </sec:authorize>
});
</script>
</head>
<body>
	<div class="container" style="float: none; margin: 0 auto;">
        <div class="row" style="float: none; margin: 50px auto; width: 800px;">
            <div class="input-group mb-3"
                style="width: 800px; justify-content: center;">
                <font size="10" color="FFA07A" style="font-weight: bolder;">Q&amp;A등록</font>
            </div>
        </div>

		<form action="./faq/form" method="post" id="form">
			<hr>
			<br>
			<div class="row" style="float: none; margin: 0 auto; width: 800px;">
				<div class="input-group mb-3" style="width: 800px;">
					<span class="input-group-text" id="title"> &nbsp; <font
						size="3" style="font-weight: bolder;">제목</font>
					</span> <input type="text" style="background-color: white; width: 230px"
						class="form-control" id="titleinput"
						aria-describedby=" basic-addon3"> <span
						class="input-group-text" id="writer"> &nbsp; <font size="3"
						style="font-weight: bolder;">작성자</font>
					</span>

					<sec:authorize access="isAnonymous()">
						<input type="text" style="background-color: white;"
							class="form-control" id="writerinput"
							aria-describedby=" basic-addon3">
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<input type="text" style="background-color: white;"
							class="form-control" id="writerinput"
							aria-describedby=" basic-addon3" readonly>
					</sec:authorize>
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
			<sec:authorize access="isAnonymous">
				<div class="row" style="float: none; margin: 0 auto; width: 800px;">
					<div class="input-group mb-3" style="width: 800px;">
						<span class="input-group-text" id="title"> &nbsp;<font
							size="3" style="font-weight: bolder;">비밀번호</font>
						</span> <input type="text" class="form-control" id="passwordinput"
							aria-describedby="basic-addon3">
					</div>
				</div>

			</sec:authorize>
			<hr>
			<br>
			<!-- input -->
			<div class="row" style="float: none; margin: 0 auto; width: 800px;">
				<div class="input-group mb-3" style="width: 800px;">
					<div class="form-check form-switch">
						<input class="form-check-input" type="checkbox" id="Checked"
							checked> <label class="form-check-label"
							for="flexSwitchCheckChecked"><b>공개여부를 설정</b></label>
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
					<input type='Button' value='등록' id='submitBtn' onclick='input()'
						class='btn btn-light submit'
						style='background-color: #5F5F5F; width: 70px; float: right; color: white;' />
				</div>
			</div>

		</form>

	</div>
</body>

<script>
function input(){
	const id = "${id}";
	const titledata = String($("#titleinput").val());	
	//const writerdata = String(document.getElementsByName('writerinput').value);
	const writerdata =String($("#writerinput").val());
	const contentdata =String($("#content").val());
	let checkdata = $("#Checked").is(":checked");
	const passworddata = String($("#passwordinput").val());
	
	
	console.log(titledata);
	console.log(writerdata);
	console.log(contentdata);
	console.log(checkdata);
	console.log(passworddata);
	if(checkdata)
	{
		checkdata = "T";
	}
	else
	{
		checkdata = "F";
	}
	
	
	const jobj = new Object();
	let appendix = "anonymous";
	jobj.qnaTitle = titledata;
	jobj.qnaContent = contentdata;
    <sec:authorize access="isAnonymous()">
    jobj.qnaNonMember = writerdata;
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
    jobj.qnaWriter = ${user};
    appendix = "auth"
    </sec:authorize>
	jobj.qnaPwd = passworddata;
	jobj.qnaPublic = checkdata;
	
	const jArray = new Array();
	jArray.push(jobj);
	const result = JSON.stringify(jobj);
	
	console.log(result);
	
	 $.ajax({
       	  url : "${rootPath}/api/qna/"+appendix,  
          type : "post",
          dataType : "json",
          contentType: "application/json;charset=utf-8", 
 		  data : result,
          success : function(response) {
        	  //location.replace("${rootPath}/customer/qna/");
          },
          error : function(response){
        	  showToast("등록 실패", "now", "빈칸으로 등록할 순 없습니다. 비회원의 경우 비밀번호를 반드시 입력해주십쇼.")
          }
       });

}
</script>
</html>


