<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tasty Way : 공지 메인</title>
<style type="text/css">
#line {
	height: 50px;
	border-top: 1px solid #d3d3d3;
	border-bottom: 1px solid #d3d3d3;
}
</style>

<!-- css 초기화 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

<link rel="stylesheet" href="${root}/resources/css/reset.css">
<!-- 부트스트랩 연결 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>
<!-- jQuery 라이브러리 호출 -->
<script>
const padDate = (date)=>{
	return date.toString().padStart(2,'0');
}
 $(document).ready(()=>{
	$.ajax({
		url : "${pageContext.request.contextPath}/api/notice/page/1",
        type : "get",
        dataType : "JSON",
        contentType : "application/json; charset=utf-8",
        success: function(response) {
            $("#notice-list").empty();
            let idx=0;
            for(; idx < response.length; idx++){
        		const notice = response[idx];
                const day = ["일", "월", "화", "수", "목", "금", "토"];
                const date = new Date(notice.noticeRegDate)
                $("#notice-list").append("<tr id = 'line'><td align='center'>" 
                		+ notice.noticeNo + "</td>" 
                		+"<td><a href = ${pageContext.request.contextPath}/customer/notice/detail?id="+notice.noticeNo + ">"
                		+ notice.noticeTitle + "</a></td>"
                        + "<td>" + date.getFullYear()+"년 "+padDate(date.getMonth()+1)+"월 "+padDate(date.getDate())+"일 ("+day[date.getDay()]+") "+padDate(date.getHours())+":"+padDate(date.getMinutes())+"</td></tr>"); 
               
        	}
        }
	});
}); 
 
 
</script>

</head>
<body>
	<div class="container" style="float: none; margin: 0 auto;">
		<div class="col" style="float: none; margin-top: 10%">
			<h1 class="row" style="justify-content: center;">공지사항</h1>
			<div class="row" style="float: none; margin: 0 auto;">
				<table class = "table" width="800px" style="text-align: center; " id="notice-list">
					<tr class="table-secondary"
						style="height: 50px; ">
						<th>No</th>
						<th>Content</th>
						<th>작성일</th>
					</tr>
					<!-- jQuery로 출력 -->
				</table>
			</div>
			<!--  --------------------페이지 링크----------------------------------     -->
			<div class="row" style="float: none; margin: 0 auto;">
				<div class="test">
					<ul class="pagination pagination-lg"
						style="justify-content: center;">
						<!-- 처음 이전 링크 -->
						<c:if test="${pg>block}">
							<!-- 5>10 : false / 15>10 : true -->
							<li class="page-item "><a class="page-link"
								href="javascript:location.href = 'notice?page=1&opt=${opt}&key=${key}'">&laquo;</a>
							</li>
							<li class="page-item "><a class="page-link"
								href="javascript:location.href = 'notice?page=${fromPage-1}&opt=${opt}&key=${key}'">&lt;</a>
							</li>
						</c:if>
						<c:if test="${pg<=block}">
							<!-- 5>10 : false / 15>10 : true -->
							<li class="page-item disabled "><a class="page-link"
								href="javascript:location.href = 'notice?page=1&opt=${opt}&key=${key}'">&laquo;</a>
							</li>
							<li class="page-item disabled"><a class="page-link"
								href="javascript:location.href = 'notice?page=${fromPage-1}&opt=${opt}&key=${key}'">&lt;</a>
							</li>
						</c:if>

						<c:forEach begin="${fromPage}" end="${toPage}" var="i">
							<c:if test="${i==pg}">
								<li class="page-item  "><a class="page-link">${i}</a></li>
							</c:if>
							<c:if test="${i!=pg}">

								<li class="page-item  "><a class="page-link"
									href="javascript:location.href = 'notice?page=${i}&opt=${opt}&key=${key}'">${i}</a>
								</li>
							</c:if>
						</c:forEach>

						<!-- 다음, 이후 -->
						<c:if test="${toPage<allPage}">
							<!-- 20<21 : true -->
							<li class="page-item"><a class="page-link"
								href="javascript:location.href = 'notice?page=${toPage+1}&opt=${opt}&key=${key}'">&gt;</a>
							</li>
							<li class="page-item"><a class="page-link"
								href="javascript:location.href = 'notice?page=${allPage}&opt=${opt}&key=${key}'">&raquo;</a>
							</li>
						</c:if>
						<c:if test="${toPage>=allPage}">
							<!-- 20<21 : true -->
							<li class="page-item disabled"><a class="page-link"
								href="javascript:location.href = 'notice?page=${toPage+1}&opt=${opt}&key=${key}'">&gt;</a>
							</li>
							<li class="page-item disabled"><a class="page-link"
								href="javascript:location.href = 'notice?page=${allPage}&opt=${opt}&key=${key}'">&raquo;</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>


			<!-- -------------------------------------검색기능-------------------------------------------------- -->

			<div class="row" style="float: none; margin: 0 auto; width: 525px; margin-bottom: 50px;">
				<form action="./notice" method="GET">
					<select class="form-select" id="exampleSelect1" name="opt"
						style="width: 100px; float: left;">
						<option value="notice_title">제목</option>
						<option value="notice_content">내용</option>
					</select> <input type="text" name="key" class="form-control"
						style="width: 300px; float: left; margin-left: 15px;"> <input
						type="submit" value="검색" class="btn btn-light"
						style="background-color: #d3d3d3; width: 70px; float: left; margin-left: 15px;">
				</form>
			</div>
		</div>
	</div>
</body>
</html>