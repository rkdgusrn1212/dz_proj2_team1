<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${root}/resources/css/reset.css">
<link rel="stylesheet" href="${root}/resources/css/bootstrap.min.css">
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

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
const padDate = (date)=>{
	return date.toString().padStart(2,'0');
}

const getNoticeList = (page)=>{
	 $.ajax({
	        url : "${root}/api/notice/page/count",		
	        type : "get",
	        dataType : "JSON",
	        contentType : "applicaton/json; charset=utf-8",
	        success: (response)=> {//reponse는 count이다.
	            page = Math.min(response, page);//page가 전체 count보다 크면 count로 바꿔준다.
	            page = Math.max(page,1);//1보다 작을순 없다.
	        	$("#notice-pagination").empty();
	            const pStart = Math.max(Math.floor((page-1)/5)*5+1,1);//보여지는 pagination 시작점.
	            $("#notice-pagination").append("<li class='page-item"+(pStart<6?" disabled":"")+"'><a class='page-link' href='javascript:getNoticeList("+(pStart-1)+")'>&laquo;</a>");
	            for(let i = pStart; i<= Math.min(pStart+4,response) ; i++){
	                 $("#notice-pagination").append("<li class='page-item"+(i==page?" active":"")+"'><a class='page-link' href='javascript:getNoticeList("+i+")'>"+i+"</a></li>");
	            }
	            $("#notice-pagination").append("<li class='page-item"+(pStart+5>response?" disabled":"")+"'><a class='page-link' href='javascript:getNoticeList("+(pStart+5)+")'>&raquo;</a></li>");

	            /* 여기에서 page의 리스트 로드 */
	            $.ajax({
	                url : "${root}/api/notice/page/"+page,
	                type : "get",
	                dataType : "JSON",
	                contentType : "applicaton/json; charset=utf-8",
	                success: (response)=> {
	                    $("#notice-list").empty();
	                    let idx = 0;
	                    for(; idx < response.length; idx++){
	                        const notice = response[idx];
	                        const day = ["일", "월", "화", "수", "목", "금", "토"];
	                        const date = new Date(notice.noticeRegDate)
	                        $("#notice-list").append(
	                                "<tr><th scope='row' class='text-center text-truncate'>"
	                                +notice.noticeNo+"</th><td class='text-truncate'>"
	                                +"<a href = ${pageContext.request.contextPath}/customer/notice/detail?id="+notice.noticeNo+ ">"+notice.noticeTitle+"</td><td class='text-truncate'>"
	                                +date.getFullYear()+"년 "+padDate(date.getMonth()+1)+"월 "+padDate(date.getDate())+"일 ("+day[date.getDay()]+") "+padDate(date.getHours())+":"+padDate(date.getMinutes())+"</td>");
	                    }
	                    for(idx ; idx<10; idx++){
	                    	$("#notice-list").append("<tr rowspan='2'><th scope='row'>&nbsp;</th><td></td><td></td></tr>");
	                    }
	                },
	                error: ()=>{
	                    showToast("공지 목록 로드 실패","방금","알수 없는 오류 발생");
	                }
	            });
	        },
	        error: ()=>{
                showToast("공지 페이지네이션 로드 실패","방금","알수 없는 오류 발생");
	        }
	    });
};

$(document).ready(getNoticeList(1));
</script>



</head>
<body>
	<div class="container" style="float: none; margin: 0 auto;">
		<div class="col" style="float: none; margin-top: 50px;">
			<h1 class="row" style="justify-content: center;">공지사항</h1>
			<div class="row" style="float: none; margin: 0 auto;">
				<table class="table table-hover" id="test"
					style="text-align: center;">
					<thead>
						<tr class="table-danger">
							<th scope="col" class="col-1 text-center text-truncate">번호</th>
							<th scope="col" class="col-4 text-center text-truncate">공지
								제목</th>
							<th scope="col" class="col-1 text-center text-truncate">작성
								시간</th>
						</tr>
					</thead>
					<tbody id="notice-list">

					</tbody>

				</table>
			</div>

			<!--       --------------------페이지 링크----------------------------------     -->
			<div class="test">
				<ul class="pagination pagination-lg" id="button"
					style="justify-content: center;">
				</ul>
			</div>

			<!-- -------------------------------------검색기능-------------------------------------------------- -->
			<div class="row"
				style="float: none; margin: 0 auto; width: 525px; margin-bottom: 50px;">
				<form name="searchform" method="GET">
					<div class="form-group" style="max-width: 2000px;">
						<select class="form-select" id="searchopt" name="opt"
							style="width: 100px; float: left;">
							<!--  style="width: 120px" -->
							<option value="noticeTitle">제목</option>
							<option value="noticeContent">내용</option>
						</select>


						<div
							style="margin: auto; align-content: center; margin-bottom: 10px; text-align: center; max-width: 2000px;">
							<input type="text" name="key" id="searchdata"
								style="width: 300px; float: left; margin-left: 15px;"
								class="form-control"> <input type="button" value="검색"
								class="btn btn-light"
								style="background-color: #d3d3d3; width: 70px; float: left; margin-left: 15px;"
								onclick="search()">
						</div>
					</div>
				</form>

				<div class="row" style="margin-top: 50px;">
					<div class="d-flex justify-content-center">
						<ul class="pagination" id="notice-pagination">
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
const search = (page)=>{
	 $.ajax({
	        url : "${root}/api/notice/page/count",		
	        type : "get",
	        dataType : "JSON",
	        contentType : "applicaton/json; charset=utf-8",
	        success: (response)=> {//reponse는 count이다.
	            page = Math.min(response, page);//page가 전체 count보다 크면 count로 바꿔준다.
	            page = Math.max(page,1);//1보다 작을순 없다.
	        	$("#notice-pagination").empty();
	            const pStart = Math.max(Math.floor((page-1)/5)*5+1,1);//보여지는 pagination 시작점.
	            $("#notice-pagination").append("<li class='page-item"+(pStart<6?" disabled":"")+"'><a class='page-link' href='javascript:getNoticeList("+(pStart-1)+")'>&laquo;</a>");
	            for(let i = pStart; i<= Math.min(pStart+4,response) ; i++){
	                 $("#notice-pagination").append("<li class='page-item"+(i==page?" active":"")+"'><a class='page-link' href='javascript:getNoticeList("+i+")'>"+i+"</a></li>");
	            }
	            $("#notice-pagination").append("<li class='page-item"+(pStart+5>response?" disabled":"")+"'><a class='page-link' href='javascript:getNoticeList("+(pStart+5)+")'>&raquo;</a></li>");

	            /* 여기에서 page의 리스트 로드 */
	            $.ajax({
	                url : "${root}/api/notice/page/"+page,
	                type : "get",
	                dataType : "JSON",
	                contentType : "applicaton/json; charset=utf-8",
	                success: (response)=> {
	                    $("#notice-list").empty();
	                    let idx = 0;
	                    for(; idx < response.length; idx++){
	                        const notice = response[idx];
	                        const day = ["일", "월", "화", "수", "목", "금", "토"];
	                        const date = new Date(notice.noticeRegDate)
	                        $("#notice-list").append(
	                                "<tr><th scope='row' class='text-center text-truncate'>"
	                                +notice.noticeNo+"</th><td class='text-truncate'>"
	                                +"<a href = ${pageContext.request.contextPath}/customer/notice/detail?id="+notice.noticeNo+ ">"+notice.noticeTitle+"</td><td class='text-truncate'>"
	                                +date.getFullYear()+"년 "+padDate(date.getMonth()+1)+"월 "+padDate(date.getDate())+"일 ("+day[date.getDay()]+") "+padDate(date.getHours())+":"+padDate(date.getMinutes())+"</td>");
	                    }
	                    for(idx ; idx<10; idx++){
	                    	$("#notice-list").append("<tr rowspan='2'><th scope='row'>&nbsp;</th><td></td><td></td></tr>");
	                    }
	                },
	                error: ()=>{
	                    showToast("공지 목록 로드 실패","방금","알수 없는 오류 발생");
	                }
	            });
	        },
	        error: ()=>{
               showToast("공지 페이지네이션 로드 실패","방금","알수 없는 오류 발생");
	        }
	    });
};

</script>
</html>