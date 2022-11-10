<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS 초기화  -->
<%-- <script src="${root}/resources/css/reset.css"></script>
 --%>
 <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<!-- 부트스트랩 연결 -->
<style type="text/css">
#multiple-container {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
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

.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 400,
  'GRAD' 0,
  'opsz' 48
}
</style>
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- jQuery 라이브러리 호출 -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>

<title>Tasty Way : 공지 폼</title>
</head>
<body>
<span class="material-symbols-outlined">
	<div class="container" style="float: none; margin: 0 auto;">
		<div class="col" style="float: none;">
			<h1 class="row" style="justify-content: center;">Tasty way</h1>
		</div>
		<form action="./notice/form" method="post">
			<div class="row" style="float: none; margin: 0 auto; width: 800px;">
				<input type="text" class="form-control" id="title" placeholder="제목" />
			</div>
			<!-- input -->
			<div class="row" style="float: none; margin: 0 auto; width: 800px;">
				<label for="formFileMultiple" class="form-label"></label> <input
					class="form-control" type="file" id="input-multiple-image"
					style="width: 800px; margin-bottom: 10px; display: block;" multiple>
			</div>
			<!-- output -->
			<div class="row" style="float: none; margin: 0 auto; width: 800px;">
				<textarea rows="20" cols="1000" class="form-control" id="content"
					style="margin-top: 10px; margin-bottom: 10px;">
				</textarea>
			</div>
			<div class="row" style="float: none; margin: 0 auto; width: 800px;">
				<div id="multiple-container"></div>
				
			</div>
			<div class="row" style="float: none; margin: 0 auto; width: 800px;">
				<div style="float: right;">
					<input type="reset" value="취소" class="btn btn-light reset"
						style="background-color: #D3D3D3; width: 70px; float: right; margin-left: 15px;" />
					<input type="submit" value="등록" class="btn btn-light submit"
						style="background-color: #5F5F5F; width: 70px; float: right; color: white;" />
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

const inputMultipleImage = document.getElementById("input-multiple-image")
inputMultipleImage.addEventListener("change", e => {
    readMultipleImage(e.target)
})
</script>
</html>