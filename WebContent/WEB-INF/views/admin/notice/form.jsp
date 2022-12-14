<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- css 초기화 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" href="${rootPath}/resources/css/reset.css">
<link rel="stylesheet"
	href="${rootPath}/resources/css/bootstrap.min.css">
<script src="${rootPath}/resources/js/jquery-3.6.1.min.js"></script>

<style>
#multiple-container {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
}

.image {
	display: inline;
	width: 250px;
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

<script src="${rootPath}/resources/js/jquery-3.6.1.min.js"></script>

<title>Tasty Way : 공지 폼</title>

</head>
<body onload=load()>
	<div class="container" style="float: none; margin: 0 auto;">
		<div class="col" style="float: none;">
			<h1 id="adnoticetitle" class="row"
				style="justify-content: center; margin-top: 50px; margin-bottom: 50px;">Tasty
				way</h1>
		</div>
		<form action="./notice/form" method="post" id="form">
			<div class="row" style="float: none; margin: 0 auto; width: 800px;">
				<input type="text" class="form-control" id="title" placeholder="제목"
					name="title" />
			</div>
			<!-- input -->
			<div class="row" style="float: none; margin: 0 auto; width: 800px;">
				<label for="formFileMultiple" class="form-label"></label> <input
					class="form-control" type="file" id="input-multiple-image"
					style="width: 800px; margin-bottom: 10px; display: block;">
			</div>
			<!-- output -->
			<div class="row" style="float: none; margin: 0 auto; width: 800px;">
			</div>
			<div class="row" style="float: none; margin: 0 auto; width: 800px;">
				<textarea rows="20" cols="1000" class="form-control" id="content"
					style="margin-top: 10px; margin-bottom: 10px;"></textarea>
			</div>

			<div class="row" style="float: none; margin: 0 auto; width: 800px;">
				<div style="float: right; margin-bottom: 30px;" id="areaBtn">
					<input type="reset" value="취소" class="btn btn-light reset"
						onclick="${rootPath}/api/notice"
						style="background-color: #D3D3D3; width: 70px; float: right; margin-left: 15px;" />
				</div>
			</div>

		</form>
	</div>
</body>
<script>

function readMultipleImage(input) {

    const multipleContainer = document.getElementById("multiple-container")
    
    // 인풋 태그에 파일들이 있는 경우
    if(input.files) {
        // 이미지 파일 검사 (생략)

        console.log(input.files)

        // 유사배열을 배열로 변환 (forEach문으로 처리하기 위해)
        const fileArr = Array.from(input.files)

        const $colDiv1 = document.createElement("div")
         const $colDiv2 = document.createElement("div")
         $colDiv1.classList.add("column")
       $colDiv2.classList.add("column")
 
        fileArr.forEach((file, index) => {
            const reader = new FileReader()

            const $imgDiv = document.createElement("div")   
            const $img = document.createElement("img")
            $img.classList.add("image")

            const $label = document.createElement("label")
            $label.classList.add("image-label")
/*             $label.textContent = file.name
 */
            $imgDiv.appendChild($img)
            $imgDiv.appendChild($label)

            reader.onload = e => {
                $img.src = e.target.result
                
                $imgDiv.style.width = ($img.naturalWidth) * 0.2 + 'px'
                $imgDiv.style.height = ($img.naturalHeight) * 0.2 + 'px'
            }
            
            console.log(file.name)
            if(index % 2 == 0) {
                $colDiv1.appendChild($imgDiv)
            } else {
                $colDiv2.appendChild($imgDiv)
            }
            
            reader.readAsDataURL(file)
        })

        multipleContainer.appendChild($colDiv1)
        multipleContainer.appendChild($colDiv2)

    }
}
function load(){
	   
	   var id = "";
	   id = ${id};
	   if(id !=0 )
	   {
	      var id = "";
	      id = ${id};

	       $.ajax({
	           url : "${rootPath}/api/notice/"+id,
	           type : "get",
	           //data : {},
	           dataType : "JSON",
	           contentType : "applicaton/json; charset=utf-8",
	      
	           success: function(response){
	              console.log(response);
	              
	              const date = new Date(response.noticeRegDate);

	            const options = {
	              year: '2-digit',
	              month: '2-digit',
	              day: '2-digit'
	            
	            };
	            const americanDateTime = new Intl.DateTimeFormat('en-US', options).format;
	            console.log(americanDateTime(date));
	              
	              
	              //$("#regdate").append('작성일 ' + americanDateTime(date))
	              $("#adnoticetitle").text("공지사항 수정");
	              $("#title").val(response.noticeTitle);      //text
	              $("#content").html(response.noticeContent); // textarea
	              $("#areaBtn").append("<input type='Button' value='수정' id='updateBtn' onclick='update()'  class='btn btn-light submit' style='background-color: #5F5F5F; width: 70px; float: right; color: white;' />");
	           }
	       });
	   }
	   else
	   {
	      $("#adnoticetitle").text("공지사항 등록");
	       $("#areaBtn").append("<input type='Button' value='등록' id='submitBtn' onclick = 'addNoticeList()' class='btn btn-light submit' style='background-color: #5F5F5F; width: 70px; float: right; color: white;' />");
	   }
	}


function addNoticeList(){		
		const jobj = new Object();
		jobj.noticeTitle = $('#title').val();
		jobj.noticeContent = $('#content').val().replace(/\n/g,"<br>");

		const jArray = new Array();
		jArray.push(jobj);
		const result = JSON.stringify(jobj);
		
		$.ajax({
         url : "${rootPath}/api/notice",
         type : "post",
         data : result,
         dataType : "json",
         contentType : "application/json; charset=utf-8"
		});
		alert('공지사항이 등록 되었습니다.');
		location.href= "${rootPath}/admin/notice";
	}
	

	function update(){
	    const id = ${id};
	       const jobj = new Object();
	       jobj.noticeTitle = $('#title').val();
	       jobj.noticeContent = $('#content').val();

	       const jArray = new Array();
	       jArray.push(jobj);
	       const result = JSON.stringify(jobj);
	       
	       console.log(result);
	       $.ajax({
	             url : "${rootPath}/api/notice/"+id,
	             type : "patch",
	             data : result,
	             dataType : "json",
	             contentType : "application/json; charset=utf-8"
	             });
	             alert('공지사항이 수정 되었습니다.');
	             location.href= "${rootPath}/admin/notice";
	       }
	const inputMultipleImage = document.getElementById("input-multiple-image")
	inputMultipleImage.addEventListener("change", e => {
	    readMultipleImage(e.target)
	})

</script>
</html>