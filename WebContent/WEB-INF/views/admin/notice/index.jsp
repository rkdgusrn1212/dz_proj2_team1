<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD
=======
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${rootPath}/resources/css/reset.css">
<link rel="stylesheet" href="${rootPath}/resources/css/bootstrap.min.css">
>>>>>>> refs/remotes/origin/main
<meta charset="UTF-8">
<!-- CSS 초기화  -->
<%-- <script src="${root}/resources/css/reset.css"></script>
 --%>
<!-- 부트스트랩 연결 -->
 <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lkc.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- jQuery 라이브러리 호출 -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>

<<<<<<< HEAD
<title>Tasty Way : 공지 폼</title>
=======
const deleteNotice = (id)=>{
	 $.ajax({
	        url : "${rootPath}/api/notice/"+id,
	        type : "delete",
	        success: (response)=> {
                showToast("삭제 성공","방금",id+"번 공지사항이 삭제되었습니다");
                const page = $('#notice-pagination').find(".active").find(".page-link").text();
                getNoticeList(page);
	        },
	        error: (error)=>{
	        	showToast("삭제 실패","방금","알수 없는 오류 발생");
	        }
	    });
};
>>>>>>> refs/remotes/origin/main



<<<<<<< HEAD
=======
const getNoticeList = (page)=>{
	 $.ajax({
	        url : "${rootPath}/api/notice/page/count",		
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
	                url : "${rootPath}/api/notice/page/"+page,
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
	                                +notice.noticeTitle+"</td><td class='text-truncate'>"
	                                +notice.noticeContent+"</td><td class='text-truncate'>"
	                                +date.getFullYear()+"년 "+padDate(date.getMonth()+1)+"월 "+padDate(date.getDate())+"일 ("+day[date.getDay()]+") "+padDate(date.getHours())+":"+padDate(date.getMinutes())+"</td>"
	                                +"<td class='text-center text-truncate'><a style='text-decoration: none;' type='button' href='javascript:showModal("+notice.noticeNo+")'><span class='badge rounded-pill bg-danger'>삭제</span></a>"+
	                                "&nbsp;&nbsp; <a style='text-decoration:none;' type='button' href= '${rootPath}/admin/notice/form?id="+notice.noticeNo+"'><span class='badge rounded-pill bg-warning'>수정</span></a></td></tr>");
	                    }
	                    for(idx ; idx<10; idx++){
	                    	$("#notice-list").append("<tr rowspan='2'><th scope='row'>&nbsp;</th><td></td><td></td><td></td><td></td></tr>");
	                    }
	                },
	                error: ()=>{
	                    showToast("공지 목록 로드 실페","방금","알수 없는 오류 발생");
	                }
	            });
	        },
	        error: ()=>{
                showToast("공지 페이지네이션 로드 실페","방금","알수 없는 오류 발생");
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
>>>>>>> refs/remotes/origin/main
</head>
<body>
	<div class="container" style="float: none; margin: 0 auto; height:1300px;">
	
		
		<form action="./notice/form" method="post">
			<div class="row" style=" margin: 0 auto; width:800px" >
				<button style="background-color:transparent; width:100px; border: none; "><span class="material-symbols-outlined" style="font-size: 40px;">reply</span></button>
			</div>
		
			<div class="row" style="float: none; ">
				<span class="row" style="justify-content:center; margin:0  auto; background-color: orange; width:800px;height:150px; ">Tasty way</span>
			</div>
			
			<!-- input -->
			<div class = "col" style="float: none; margin: 0 auto; width: 800px; ">
				<div class="row" style="float: left; margin: 20px auto; width: 500px; height: 500px; border-bottom: 1px solid; ">
					<span id="title" style=" height: 30px;font-size: 20px; color: orange;" ><b>점포정보</b></span>
					<div class="row" style="float: left; margin: 20px auto; width: 220px; height: 55px;">
						<span id="title" style=" height: 50px;line-height: 50px; font-size: 20px;" ><b>홍콩반점</b></span>
					</div>
					<div class="row" style="float: left; margin: 20px auto; width: 100px; height: 55px;">
						<a id="title" style=" height: 50px;line-height: 50px; font-size: 20px;" >5.0</a>
					</div>
					<div class="row" style="float: left; margin: 20px auto; width: 180px; height: 55px; ">
						<span id="title" style=" height: 50px;line-height: 50px; font-size: 20px; " >
								<div class="star-rating space-x-4 mx-auto">
									<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
									<label for="5-stars" class="star pr-4">★</label>
									<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
									<label for="4-stars" class="star">★</label>
									<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
									<label for="3-stars" class="star">★</label>
									<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
									<label for="2-stars" class="star">★</label>
									<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
									<label for="1-star" class="star">★</label>
								</div>
						</span>
					</div>
					
					<div class="row" style="float: left; margin: 20px auto; width: 150px; height: 345px; ">
						<div style="text-align: center; " >
							<span class="badge bg-primary" id="title" style="text-align:center; width:110px; ">주소</span>
						</div>
						<div style="text-align: center;">
							<span class="badge bg-primary" id="title" style="text-align:center;  width:110px;">전화번호</span>
						</div>
						<div style="text-align: center;">
							<span class="badge bg-primary" id="title" style="text-align:center;  width:110px;">분류</span>
						</div>
						<div style="text-align: center;">
							<span class="badge bg-primary" id="title" style="text-align:center;  width:110px;">대표 메뉴</span>
						</div>
						<div style="text-align: center;">
							<span class="badge bg-primary" id="title" style="text-align:center;  width:110px;">영업시간</span>
						</div>
						<div style="text-align: center;">
							<span class="badge bg-primary" id="title" style="text-align:center;  width:110px;">메뉴</span>
						</div>
						
					</div>
					<div class="row" style="float: left; margin: 20px auto; width: 350px; height: 345px;  ">
						<div>
							<input type="text"  style="background-color: white; height: 30px;"class="form-control" id="titleinput" aria-describedby=" basic-addon3" readonly>
						</div> 
						<div>
							<input type="text"  style="background-color: white; height: 30px;"class="form-control" id="titleinput" aria-describedby=" basic-addon3" readonly>
						</div> 
						<div>
							<input type="text"  style="background-color: white; height: 30px;"class="form-control" id="titleinput" aria-describedby=" basic-addon3" readonly>
						</div> 
						<div class="row" style="float: left; margin: 0px auto; width: 350px; ">
							<input type="text"   style="background-color: white; height: 30px; width:120px;" class="form-control" id="titleinput" aria-describedby=" basic-addon3" readonly>
							<input type="text"   style="background-color: white; height: 30px; width:182px;"class="form-control" id="titleinput" aria-describedby=" basic-addon3" readonly>
						</div> 
						<div>
							<input type="text"  style="background-color: white; height: 30px;"class="form-control" id="titleinput" aria-describedby=" basic-addon3" readonly>
						</div> 
						<div class="row" style="float: left; margin: 0px auto; width: 350px; ">
							<input type="text"   style="background-color: white; height: 30px; width:120px;" class="form-control" id="titleinput" aria-describedby=" basic-addon3" readonly>
							<input type="text"   style="background-color: white; height: 30px; width:182px;"class="form-control" id="titleinput" aria-describedby=" basic-addon3" readonly>
						</div> 
					
					</div>
					
				</div>
				<div class="row" style="float: right; margin: 20px auto; width: 300px; height: 500px; border-bottom: 1px solid; ">
					<span id="title" style=" height: 30px;width: 200px; font-size: 20px; font-size: 20px; color: orange;" ><b>관련 사진</b></span>
					<button class="material-symbols-outlined" style=" height: 30px;width: 100px;background-color:transparent; font-size:30px; border: none;">add_circle</button>
					<div class="row" style="float: left; margin: 20px auto; width: 300px;height: 200px;">
						<img src ="../../resources/img/testimg.jpg" width="270" height="180" alt ="야옹이">
					</div>
					<span id="title" style=" height: 30px; width: 200px; font-size: 20px; color: orange; " ><b>지도</b></span>
					<button class="material-symbols-outlined" style=" height: 30px;width: 100px;background-color:transparent; font-size:30px; border: none;">zoom_in</button>
					<div class="row" style="float: left; margin: 20px auto; width: 300px;height: 200px;">
						<div id="map" style="width:270px;height:160px;"></div>
					</div>
				</div>
			</div>
		</form>
		
		<form action="./notice/form" method="post">
			
			<div class="row" style=" margin: 0 auto; width:800px; margin-bottom: 30px; " >
				<span style=" width:200px; border: none;  "><span  style="font-size: 20px; color: orange;"><b>사용자 리뷰</b></span></span>
			</div>
			<div class = "col" style="float: none; margin: 0 auto; width: 800px; height: 500px; ">
				<div class="row" style="width: 780px;height: 124px; margin: 20px 20px 20px 5px; border: 1px solid; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; border-color: orange; border-top-left-radius: 5px; border-top-right-radius: 5px; ">
					<div class="row" style="float: left; margin: 0 auto; width:170px" >
						<div style="text-align: center; " >
								<span class="badge bg-primary" id="title" style="text-align:center; width:100px; height: 20px; ">김밥나라</span>
							</div>
							<span id="title" style=" height: 40px;line-height: 50px; font-size: 20px; " >
									<div class="star-rating space-x-4 mx-auto">
										<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
										<label for="5-stars" class="star pr-4">★</label>
										<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
										<label for="4-stars" class="star">★</label>
										<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
										<label for="3-stars" class="star">★</label>
										<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
										<label for="2-stars" class="star">★</label>
										<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
										<label for="1-star" class="star">★</label>
									</div>
							</span>
							<div class="row" style=" margin: 20px auto; width: 190px; height: 20px;">
								<a id="title" style=" height: 20px;line-height: 10px; font-size: 20px; text-align: center;" >5.0</a>
							</div>
						
					</div>
					<div class="row" style="float: left; margin: 0 auto; width:360px;height: 120px;" >
										<!-- output -->
					         <div class="row" style="float: none; margin: 0 auto; width:360px;height: 120px;">
					            <textarea class="form-control" id="content"
					               style="margin-top: 10px; margin-bottom: 10px;"></textarea>
					         </div>
					</div>
					<div class="row" style="float: left; margin: 0 auto; width:180px;height: 120px;" >
						<img src ="../../resources/img/testimg.jpg" width="160" height="110" alt ="야옹이" style="border: 1px solid; border-color: orange; margin-top: 5px;">
					</div>
				</div>
				<div class="row" style="width: 780px;height: 124px; margin: 20px 20px 20px 5px; border: 1px solid; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; border-color: orange; border-top-left-radius: 5px; border-top-right-radius: 5px; ">
					<div class="row" style="float: left; margin: 0 auto; width:170px" >
						<div style="text-align: center; " >
								<span class="badge bg-primary" id="title" style="text-align:center; width:100px; height: 20px; ">김밥나라</span>
							</div>
							<span id="title" style=" height: 40px;line-height: 50px; font-size: 20px; " >
									<div class="star-rating space-x-4 mx-auto">
										<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
										<label for="5-stars" class="star pr-4">★</label>
										<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
										<label for="4-stars" class="star">★</label>
										<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
										<label for="3-stars" class="star">★</label>
										<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
										<label for="2-stars" class="star">★</label>
										<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
										<label for="1-star" class="star">★</label>
									</div>
							</span>
							<div class="row" style=" margin: 20px auto; width: 190px; height: 20px;">
								<a id="title" style=" height: 20px;line-height: 10px; font-size: 20px; text-align: center;" >5.0</a>
							</div>
						
					</div>
					<div class="row" style="float: left; margin: 0 auto; width:360px;height: 120px;" >
										<!-- output -->
					         <div class="row" style="float: none; margin: 0 auto; width:360px;height: 120px;">
					            <textarea class="form-control" id="content"
					               style="margin-top: 10px; margin-bottom: 10px;"></textarea>
					         </div>
					</div>
					<div class="row" style="float: left; margin: 0 auto; width:180px;height: 120px;" >
						<img src ="../../resources/img/testimg.jpg" width="160" height="110" alt ="야옹이" style="border: 1px solid; border-color: orange; margin-top: 5px;">
					</div>
				</div>
				<div class="row" style="width: 780px;height: 124px; margin: 20px 20px 20px 5px; border: 1px solid; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; border-color: orange; border-top-left-radius: 5px; border-top-right-radius: 5px; ">
					<div class="row" style="float: left; margin: 0 auto; width:170px" >
						<div style="text-align: center; " >
								<span class="badge bg-primary" id="title" style="text-align:center; width:100px; height: 20px; ">김밥나라</span>
							</div>
							<span id="title" style=" height: 40px;line-height: 50px; font-size: 20px; " >
									<div class="star-rating space-x-4 mx-auto">
										<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
										<label for="5-stars" class="star pr-4">★</label>
										<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
										<label for="4-stars" class="star">★</label>
										<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
										<label for="3-stars" class="star">★</label>
										<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
										<label for="2-stars" class="star">★</label>
										<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
										<label for="1-star" class="star">★</label>
									</div>
							</span>
							<div class="row" style=" margin: 20px auto; width: 190px; height: 20px;">
								<a id="title" style=" height: 20px;line-height: 10px; font-size: 20px; text-align: center;" >5.0</a>
							</div>
						
					</div>
					<div class="row" style="float: left; margin: 0 auto; width:360px;height: 120px;" >
										<!-- output -->
					         <div class="row" style="float: none; margin: 0 auto; width:360px;height: 120px;">
					            <textarea class="form-control" id="content"
					               style="margin-top: 10px; margin-bottom: 10px;"></textarea>
					         </div>
					</div>
					<div class="row" style="float: left; margin: 0 auto; width:180px;height: 120px;" >
						<!-- <span style=" width:168px; border: none; "><span  style="font-size: 20px; width: 160px;height: 120px;"><b>이미지</b></span></span> -->
						<img src ="../../resources/img/testimg.jpg" width="160" height="110" alt ="야옹이" style="border: 1px solid; border-color: orange; margin-top: 5px;">
					</div>
				</div>
				
				
				
				<div class="row" style=" margin: 0 auto; width:800px" >
					<button style=" margin: 0 auto; width:130px; background-color:transparent; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; border-color: orange; border-top-left-radius: 5px; border-top-right-radius: 5px;">
						<span class="material-symbols-outlined" style="font-size: 30px; line-height: 40px;width:40px;">keyboard_double_arrow_down</span>	
					
					</button>	
				</div>
				
				
			</div>
		
			
			
		</form>

<<<<<<< HEAD
=======
			</tbody>
		</table>
		<div class="row">
			<div class="d-flex justify-content-between align-items-baseline">
				<button class="btn btn-sm btn-outline-primary" type="button">뒤로</button>
				<ul class="pagination" id="notice-pagination">
				</ul>
				<button class="btn btn-sm btn-success" type="button" onclick = "javascript:location.href = '${rootPath}/admin/notice/form'">새 공지 등록</button>
			</div>
		</div>
>>>>>>> refs/remotes/origin/main
	</div>
<<<<<<< HEAD
=======
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
	<script src="${rootPath}/resources/js/bootstrap.bundle.min.js"></script>
>>>>>>> refs/remotes/origin/main
</body>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7cffb8c56abe7dd1e1df8469cd0acc35"></script>
<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.582374, 127.001914),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(37.582374, 127.001914); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리집</div>'
        });
        infowindow.open(map, marker);
</script>
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