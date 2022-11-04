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
<title>Tasty Way : 공지 관리</title>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>
<script>
const showToast = (title, time, message)=>{
    const toastElem = $('#liveToast');
    $(toastElem).find("#toast-title").text(title);
    $(toastElem).find("#toast-time").text(time);
    $(toastElem).find(".toast-body").text(message);
    const toast = new bootstrap.Toast($('#liveToast'));
    toast.show();
}

const deleteNotice = (id)=>{
	 $.ajax({
	        url : "${root}/api/notice/"+id,
	        type : "delete",
	        success: (response)=> {
                showToast("삭제 성공","방금",id+"번 공지사항이 삭제되었습니다");
                const page = $('#notice-pagination').find(".active").find(".page-link").text()
                console.log(page);
                getNoticeList(page);
	        },
	        error: (error)=>{
	        	console.log(error);
	        	showToast("삭제 실패","방금","알수 없는 오류로 발생");
	        }
	    });
};

const padDate = (date)=>{
	return date.toString().padStart(2,'0');
}

$(".delete-notice-anchor").on("click", ()=>{
    const id = $(this).data("id");
    console.log(id);
    $("#delete-button").off().on("click #delete-button",  deleteNotice(id) );
});

const getNoticeList = (page)=>{
	 $.ajax({
	        url : "${root}/api/notice/page/count",
	        type : "get",
	        dataType : "JSON",
	        contentType : "applicaton/json; charset=utf-8",
	        success: (response)=> {//reponse는 count이다.
	            page = Math.min(response, page);//page가 전체 count보다 크면 count로 바꿔준다.
	        	$("#notice-pagination").empty();
	            const pStart = Math.floor((page-1)/5)*5+1;//보여지는 pagination 시작점.
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
	                    for(idx in response){
	                        const notice = response[idx];
	                        const day = ["일", "월", "화", "수", "목", "금", "토"];
	                        const date = new Date(notice.noticeRegDate)
	                        $("#notice-list").append(
	                                "<tr><th scope='row'>"
	                                +notice.noticeNo+"</th><td>"
	                                +notice.noticeTitle+"</td><td>"
	                                +notice.noticeContent+"</td><td>"
	                                +date.getFullYear()+"년 "+padDate(date.getMonth()+1)+"월 "+padDate(date.getDate())+"일 ("+day[date.getDay()]+") "+padDate(date.getHours())+":"+padDate(date.getMinutes())+"</td><td>"
	                                +"<a  type='button' href='javascript:showModal("+notice.noticeNo+")'><span class='badge rounded-pill bg-danger'>삭제</span></a></td></tr>");
	                    }
	                    for(++idx ; idx<10; idx++){
	                    	console.log(idx);
	                    	$("#notice-list").append("<tr rowspan='2'><th scope='row'>&nbsp;</th><td></td><td></td><td></td><td></td></tr>");
	                    }
	                },
	                error: ()=>{
	                    alert("공지 리스트를 가져오지 못했습니다.");
	                }
	            });
	        },
	        error: ()=>{
	            alert("공지 페이지네이션을 가져오지 못했습니다.");
	        }
	    });
};
const showModal = (id)=>{
	const $button = $("#delete-dialog").find("#delete-button");
	$button.on("click",()=>{
		$("#delete-dialog").modal("hide");
	    deleteNotice(id);
	});
    $("#delete-dialog").modal("show");
}

$(document).ready(getNoticeList(1));
</script>
</head>
<body>
	<div
		class="toast-container position-fixed top-0 start-50 translate-middle-x p-3">
		<div id="liveToast" class="toast" role="alert" aria-live="assertive"
			aria-atomic="true">
			<div class="toast-header">
				<strong class="me-auto" id="toast-title"></strong> <small
					id="toast-time">11 mins ago</small>
				<button type="button" class="btn-close ms-2 mb-1"
					data-bs-dismiss="toast" aria-label="Close">
					<span aria-hidden="true"></span>
				</button>
			</div>
			<div class="toast-body"></div>
		</div>
	</div>
	<div class="container-lg">
		<div class="d-flex justify-content-between mt-5">
		<h1>공지사항 관리</h1>
		<div class="align-self-end"><small><span class='badge rounded-pill bg-danger'>삭제</span> 버튼을 눌러 해당 공지사항을 삭제합니다.</small>
		</div>
		</div>
		<hr class="border border-primary border-3 opacity-75">
		<table class="table table-hover">
			<thead>
				<tr class="table-primary">
					<th scope="col">번호</th>
					<th scope="col">공지 제목</th>
					<th scope="col">공지 내용</th>
					<th scope="col">작성 시간</th>
					<th scope="col">작업</th>
				</tr>
			</thead>
			<tbody id="notice-list">

			</tbody>
		</table>
		<div class="row justify-content-md-center">
			<div class="col-auto">
				<ul class="pagination" style="" id="notice-pagination">
				</ul>
			</div>
		</div>
	</div>
	<div class="modal" id="delete-dialog">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">삭제 하시겠습니까?</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
				</div>
				<div class="modal-body">
					<p>한번 삭제한 공지사항은 되돌릴수 없습니다.</p>
				</div>
				<div class="modal-footer">
					<button id="delete-button" type="button" class="btn btn-primary">삭제</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<script src="${root}/resources/js/bootstrap.bundle.min.js"></script>
</body>
</html>