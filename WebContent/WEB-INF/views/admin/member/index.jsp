<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tasty Way : Member 관리</title>
</head>
<body>
	<script>
const deleteMember = (id)=>{
     $.ajax({
            url : "${rootPath}/api/member/"+id,
            type : "delete",
            success: (response)=> {
                showToast("삭제 성공","방금",id+"번 Member이 삭제되었습니다");
                const page = $('#member-pagination').find(".active").find(".page-link").text();
                getMemberList(page);
            },
            error: (error)=>{
                showToast("삭제 실패","방금","알수 없는 오류 발생");
            }
        });
};

const padDate = (date)=>{
    return date.toString().padStart(2,'0');
}

$(".delete-member-anchor").on("click", ()=>{
    const id = $(this).data("id");
    $("#delete-button").off().on("click #delete-button",  deleteMember(id) );
});

const getMemberList = (page)=>{
     $.ajax({
            url : "${rootPath}/api/member/page/count",
            type : "get",
            dataType : "JSON",
            contentType : "applicaton/json; charset=utf-8",
            success: (response)=> {//reponse는 count이다.
            	const count = response.pageCount;
                page = Math.min(count, page);//page가 전체 count보다 크면 count로 바꿔준다.
                page = Math.max(page,1);//1보다 작을순 없다.
                $("#member-pagination").empty();
                const pStart = Math.max(Math.floor((page-1)/5)*5+1,1);//보여지는 pagination 시작점.
                $("#member-pagination").append("<li class='page-item"+(pStart<6?" disabled":"")+"'><a class='page-link' href='javascript:getMemberList("+(pStart-1)+")'>&laquo;</a>");
                for(let i = pStart; i<= Math.min(pStart+4,count) ; i++){
                     $("#member-pagination").append("<li class='page-item"+(i==page?" active":"")+"'><a class='page-link' href='javascript:getMemberList("+i+")'>"+i+"</a></li>");
                }
                $("#member-pagination").append("<li class='page-item"+(pStart+5>count?" disabled":"")+"'><a class='page-link' href='javascript:getMemberList("+(pStart+5)+")'>&raquo;</a></li>");

                /* 여기에서 page의 리스트 로드 */
                $.ajax({
                    url : "${rootPath}/api/member/page/"+page,
                    type : "get",
                    dataType : "JSON",
                    contentType : "applicaton/json; charset=utf-8",
                    success: (response)=> {
                        $("#member-list").empty();
                        let idx = 0;
                        for(; idx < response.length; idx++){
                            const member = response[idx];
                            $("#member-list").append(
                                    "<tr><th scope='row' class='text-center text-truncate'>"
                                    +member.memberNo+"</th><td class='text-truncate'>"
                                    +member.memberId+"</td><td class='text-truncate'>"
                                    +member.memberName+"</td><td class='text-truncate'>"
                                    +member.memberEmail+"</td><td class='text-center text-truncate'>"
                                    +"<a style='text-decoration:none;' type='button' href='javascript:showModal("+member.memberNo+")'><span class='badge rounded-pill bg-danger'>삭제</span></a>"
                                    +"</td></tr>");
                        }
                        for(idx ; idx<10; idx++){
                            $("#member-list").append("<tr rowspan='2'><th scope='row'>&nbsp;</th><td></td><td></td><td></td><td></td></tr>");
                        }
                    },
                    error: ()=>{
                        showToast("Member 목록 로드 실페","방금","알수 없는 오류 발생");
                    }
                });
            },
            error: ()=>{
                showToast("Member 페이지네이션 로드 실페","방금","알수 없는 오류 발생");
            }
        });
};
const showModal = (id)=>{
    const $button = $("#delete-dialog").find("#delete-button");
    $button.on("click",()=>{
        $("#delete-dialog").modal("hide");
        deleteMember(id);
    });
    $("#delete-dialog").modal("show");
}

$(document).ready(getMemberList(1));
</script>
</head>
<body>
	<div
		class="toast-container position-fixed top-0 start-50 translate-middle-x p-3">
		<div id="liveToast" class="toast" role="alert" aria-live="assertive"
			aria-atomic="true">
			<div class="toast-header">
				<strong class="me-auto" id="toast-title"></strong> <small
					id="toast-time"></small>
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
			<h1>Member 관리</h1>
			<div class="align-self-end">
				<small><span class='badge rounded-pill bg-danger'>삭제</span>
					버튼을 눌러 해당 Member을 삭제합니다.&nbsp;&nbsp;&nbsp;<span
					class='badge rounded-pill bg-warning'>수정</span> 버튼을 눌러 해당 Member를
					수정합니다.</small>
			</div>
		</div>
		<hr class="border border-primary border-3 opacity-75">
		<table class="table table-hover table-bordered"
			style="table-layout: fixed;">
			<thead>
				<tr class="table-primary">
					<th scope="col" class="col-1 text-center text-truncate">번호</th>
					<th scope="col" class="col-3 text-center text-truncate">아이디</th>
					<th scope="col" class="col-3 text-center text-truncate">이름</th>
					<th scope="col" class="col-4 text-center text-truncate">이메일</th>
					<th scope="col" class="col-1 text-center text-truncate">작업</th>
				</tr>
			</thead>
			<tbody id="member-list">

			</tbody>
		</table>
		<div class="row">
			<div class="d-flex justify-content-between align-items-baseline">
				<button class="btn btn-sm btn-outline-primary" type="button" onclick="javascript:location.replace('${rootPath}/admin/')">관리 메인</button>
				<ul class="pagination" id="member-pagination">
				</ul>
				<button class="btn btn-sm btn-success" type="button"
					onclick="javascript:location.href = '${rootPath}/admin/member/form'">새
					Member 등록</button>
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
					<p>한번 삭제한 Member은 되돌릴수 없습니다.</p>
				</div>
				<div class="modal-footer">
					<button id="delete-button" type="button" class="btn btn-primary">삭제</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<script src="${rootPath}/resources/js/bootstrap.bundle.min.js"></script>
</body>
</html>