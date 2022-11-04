<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS 초기화  -->
<script src="${root}/resources/css/reset.css"></script>
<!-- 부트스트랩 연결 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- jQuery 라이브러리 호출 -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>
<script>
//preview image 
var imgTarget = $('.preview-image .upload-hidden');

imgTarget.on('change', function(){
    var parent = $(this).parent();
    parent.children('.upload-display').remove();

    if(window.FileReader){
        //image 파일만
        if (!$(this)[0].files[0].type.match(/image\//)) return;
        
        var reader = new FileReader();
        reader.onload = function(e){
            var src = e.target.result;
            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
        }
        reader.readAsDataURL($(this)[0].files[0]);
    }

    else {
        $(this)[0].select();
        $(this)[0].blur();
        var imgSrc = document.selection.createRange().text;
        parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

        var img = $(this).siblings('.upload-display').find('img');
        img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
    }
});
</script>


<title>Tasty Way : 공지 폼</title>
</head>
<body>

	<div class="container" style="float: none; margin: 0 auto;">
		<div class="col" style="float: none;">
			<h1 class="row" style="justify-content: center;">Tasty way</h1>
		</div>

		<form action="./notice/form" method="post">
			<h5 class="row" style="float: none; margin: 0 auto; width: 800px;">작성자</h5>

			<div class="row" style="float: none; margin: 0 auto; width: 800px;">
				<input type="text" class="form-control" id="title" placeholder="제목" />
			</div>
			<!-- input -->
			<div class="row" style="float: none; margin: 0 auto; width: 800px;">
				<label for="formFileMultiple" class="form-label"></label> <input
					class="form-control" type="file" id="input"
					style="width: 800px; margin-bottom: 10px;">
			</div>
			
			<!-- output -->
			<div class="row" style="float: none; margin: 0 auto; width: 800px;">
				<div id="output" contenteditable="true" 
					style="padding: 16px 24px; height: 500px; border: 1px solid #D6D6D6; border-radius: 4px;"></div>

				<!-- <textarea rows="20" cols="1000" class="form-control" id="content"
					style="margin-top: 10px; margin-bottom: 10px;"></textarea> -->
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
</html>