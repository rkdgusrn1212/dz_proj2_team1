<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS 초기화  -->
<%-- <script src="${root}/resources/css/reset.css"></script>
 --%>



<!-- jQuery 라이브러리 호출 -->
<script src="${rootPath}/resources/js/jquery-3.6.1.min.js"></script>
<!-- 부트스트랩 연결 -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">


<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7cffb8c56abe7dd1e1df8469cd0acc35"></script>



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
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 48
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lkc.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/star2.css">

<script>
const drawStar = (target) => {
     document.querySelector(`.star span`).style.width = target.value*10+"%";
     const i = target.value * 0.5;
   document.getElementById("pointView").innerHTML = i;
}
</script>






<title>Tasty Way : 공지 폼</title>



</head>
<body onload="load()">


	<!-- ------------------------maincontainer-------------------------------->
	<div class="container"
		style="float: none; margin: 0 auto; height: 810px;" id="maincontainer">







			<!--------------------------detailheader-------------------------------->
			<div class="row" style="float: none;">
				<span class="row"
					style="justify-content: center; margin: 0 auto; background-color: orange; width: 800px; height: 150px;"
					id="detailheader">Tasty way</span>
			</div>




			<!--------------------------storeinfo(container)-------------------------------->
			<!-- input -->
			<div class="col" style="float: none; margin: 0 auto; width: 800px;"
				id="storeinfo">
				<div class="row"
					style="float: left; margin: 20px auto; width: 500px; height: 500px; border-bottom: 1px solid;">
					<span id="title"
						style="height: 30px; font-size: 20px; color: orange;"><b>점포정보</b></span>
					<div class="row"
						style="float: left; width: 300px; height: 55px; margin-top: 20px; margin-bottom: 20px;">
						<span
							style="height: 55px; line-height: 55px; font-size: 20px; border-bottom: 2px solid; border-top: 2px solid; border-color: orange; font-weight: bold;"
							id="storetitle"></span>
					</div>
					<div class="row"
						style="float: left; width: 100px; height: 55px; margin-top: 20px; margin-bottom: 20px; border-bottom: 2px solid; border-top: 2px solid; border-color: orange;">
						<div class="star-rating space-x-4 mx-auto"
							style="border-left: 2px solid; border-right: 2px solid; border-color: orange;">
							<input type="radio" id="5-stars" name="rating" value="5"
								v-model="ratings" /> <label for="5-stars" class="star pr-4"
								style="-webkit-text-fill-color: gold;">★</label>
						</div>
					</div>
					<div class="row"
						style="float: left; width: 150px; height: 55px; margin-top: 20px; margin-bottom: 20px;">
						<span
							style="height: 55px; line-height: 55px; font-size: 20px; border-bottom: 2px solid; border-top: 2px solid; border-color: orange;"
							id="storestar"> <a
							style="height: 50px; line-height: 50px; font-size: 23px; font-weight: bold; color: #ff3366;"
							id="storescore">5.0</a>
						</span>
					</div>

					<div class="row"
						style="float: left; margin: 20px auto; width: 150px; height: 345px;">
						<div style="text-align: center;">
							<span class="badge bg-primary"
								style="text-align: center; width: 110px;">주소</span>
						</div>
						<div style="text-align: center;">
							<span class="badge bg-primary"
								style="text-align: center; width: 110px;">전화번호</span>
						</div>
						<div style="text-align: center;">
							<span class="badge bg-primary"
								style="text-align: center; width: 110px;">분류</span>
						</div>
						<div style="text-align: center;">
							<span class="badge bg-primary"
								style="text-align: center; width: 110px;">대표 메뉴</span>
						</div>
						<div style="text-align: center;">
							<span class="badge bg-primary"
								style="text-align: center; width: 110px;">영업시간</span>
						</div>
						<div style="text-align: center;">
							<span class="badge bg-primary"
								style="text-align: center; width: 110px;">메뉴</span>
						</div>

					</div>
					<div class="row"
						style="float: left; margin: 20px auto; width: 350px; height: 345px;"
						id="storeinfodetail">
						<div>
							<input type="text"
								style="background-color: white; height: 30px; font-weight: bold; font-size: 15px;"
								class="form-control" id="juso" aria-describedby=" basic-addon3"
								readonly>
						</div>
						<div>
							<input type="text"
								style="background-color: white; height: 30px; font-weight: bold; font-size: 15px;"
								class="form-control" id="tel" aria-describedby=" basic-addon3"
								readonly>
						</div>
						<div>
							<input type="text"
								style="background-color: white; height: 30px; font-weight: bold; font-size: 15px;"
								class="form-control" id="category"
								aria-describedby=" basic-addon3" readonly>
						</div>
						<div class="row"
							style="float: left; margin: 0px auto; width: 350px;">
							<input type="text"
								style="background-color: white; height: 30px; width: 120px; font-weight: bold; font-size: 15px;"
								class="form-control" id="representativemenu"
								aria-describedby=" basic-addon3" readonly> <input
								type="text"
								style="background-color: white; height: 30px; width: 182px; font-weight: bold; font-size: 15px;"
								class="form-control" id="representativeprice"
								aria-describedby=" basic-addon3" readonly>
						</div>
						<div>
							<input type="text"
								style="background-color: white; height: 30px; font-weight: bold; font-size: 15px;"
								class="form-control" id="Openinghours"
								aria-describedby=" basic-addon3" readonly>
						</div>
						<div class="row"
							style="float: left; margin: 0px auto; width: 350px;">
							<input type="text"
								style="background-color: white; height: 30px; width: 120px; font-weight: bold; font-size: 15px;"
								class="form-control" id="menu" aria-describedby=" basic-addon3"
								readonly> <input type="text"
								style="background-color: white; height: 30px; width: 182px; font-weight: bold; font-size: 15px;"
								class="form-control" id="menuprice"
								aria-describedby=" basic-addon3" readonly>
						</div>

					</div>

				</div>

				<!-- --------------------------------------storeimg------------------------------------------- -->

				<div class="row"
					style="float: right; margin: 20px auto; width: 300px; height: 500px; border-bottom: 1px solid;"
					id="storeinfoimg">
					<span id="title"
						style="height: 30px; width: 200px; font-size: 20px; font-size: 20px; color: orange;"><b>관련
							사진</b></span>


					<button class="material-symbols-outlined"
						style="height: 30px; width: 100px; background-color: transparent; font-size: 30px; border: none;"
						data-bs-toggle="modal" data-bs-target="#modalimg"
						data-bs-whatever="@mdo" id="storeimgclick">add_box</button>

					<div class="row"
						style="float: left; margin: 20px auto; width: 300px; height: 200px;">
						<img src="${rootPath }/resources/img/none.png	" width="270" height="180"
							alt="야옹이" id="storepicture1">
					</div>

					<!-- --------------------------------------storeimgmodal------------------------------------------- -->


					<div class="modal modal-lg fade" id="modalimg" tabindex="-1"
						aria-labelledby="mdalLabelimg" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="modalLabelimg">image</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="container"
										style="float: none; margin: 0 auto; height: 400px; width: 800px;">
										<div class="col"
											style="float: none; margin: 0 auto; width: 800px; height: 400px;">
											<div class="row"
												style="float: left; margin: 0 auto; width: 50px">
												<button class="material-symbols-outlined"
													style="font-size: 40px; background-color: transparent; border: none; line-height: 380px;">arrow_back_ios_new</button>
											</div>
											<div class="row"
												style="float: left; margin: 0 auto; width: 650px">
												<img src="../resources/img/testimg.jpg" width="550"
													height="400" alt="야옹이">
											</div>
											<div class="row"
												style="float: left; margin: 0 auto; width: 50px">
												<button class="material-symbols-outlined"
													style="font-size: 40px; background-color: transparent; border: none; line-height: 380px;">arrow_forward_ios</button>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>


					<!-- ------------------------------------------------------------------------------------------------- -->





					<!-- --------------------------------------map------------------------------------------- -->

					<span id="title"
						style="height: 30px; width: 200px; font-size: 20px; color: orange;"><b>지도</b></span>
					<button class="material-symbols-outlined"
						style="height: 30px; width: 100px; background-color: transparent; font-size: 30px; border: none;"
						data-bs-toggle="modal" data-bs-target="#modalmap"
						data-bs-whatever="@mdo" id="zoom">zoom_in</button>


					<div class="row"
						style="float: left; margin: 20px auto; width: 300px; height: 200px;">
						<div id="map" style="width: 270px; height: 160px;"
							id="storeinfomap"></div>
					</div>


					<!-- -----------------------------------------------modal------------------------------------------------------ -->




					<div class="modal modal-lg fade" id="modalmap" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">상세위치</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div id="mapmodal" style="width: 765px; height: 400px;"></div>
								</div>

							</div>
						</div>
					</div>


					<!-- ---------------------------------------------------------------------------------------------------------- -->


				</div>
			</div>
		</div>

		<!-- --------------------------------------review----------------------------------------------------------------------------------- -->

		<div>




			<div class="row"
				style="margin: 0 auto; width: 800px; margin-bottom: 30px;">
				<span style="width: 600px; border: none;"><span
					style="font-size: 20px; color: orange;" id="reviewtitle"><b>사용자
							리뷰</b></span></span>
				<button
					style="width: 190px; border: none; color: white; background-color: orange; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; border-top-left-radius: 5px; border-top-right-radius: 5px;"
					id="reviewbtn" onclick="reviewwritebtn()">리뷰 작성</button>
			</div>



			<div class="col"
				style="float: none; margin: 0 auto; width: 800px; height: 500px;"
				id="reviewcontainer"></div>




		</div>

	</div>

	<div class="row"
		style="margin: 0 auto; width: 800px; margin-bottom: 20px;">
		<button id="reviewaddbtn"
			style="margin: 0 auto; width: 130px; background-color: transparent; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; border-color: orange; border-top-left-radius: 5px; border-top-right-radius: 5px; display: block;"
			onclick="review()">
			<span class="material-symbols-outlined"
				style="font-size: 30px; line-height: 40px; width: 40px;">keyboard_double_arrow_down</span>

		</button>
	</div>
</body>














<!-- -------------------------------------functionscript--------------------------------------------------------- -->




<script>
function reviewwritebtn() {
    location.href = "${rootPath}/restaurant/review/?id="+${id};
}

var page = 1;
var idtemp = ${id};
var opttemp = "reviewRestaurant";


function load(){
   
   $.ajax({
      url : "${rootPath}/api/restaurant/"+${id},
      type : "get",
      dataType : "JSON",
      contentType : "applicaton/json; charset=utf-8",

      success : function(response) {

         $('#storetitle').text(response.restaurantName);
         $('#juso').val(response.restaurantAddress);
         $('#tel').val(response.restaurantPh);
         $('#category').val(response.restaurantCategory);
         $('#representativemenu').val('원하는 값');
         $('#representativeprice').val('원하는 값');
         $('#Openinghours').val('원하는 값');
         $('#menu').val('원하는 값');
         $('#menuprice').val('원하는 값');
         //
          var Latitude = eval(response.restaurantLatitude);
          var Longtitude = eval(response.restaurantLongtitude);
         //restaurantLatitude: 37.6576893
         //restaurantLongtitude: 126.7713555
         
         map(Latitude,Longtitude,response.restaurantName);
      }
   });
   
   reviewavg();
   
   review();
}
function reviewavg(){
   var restuarantid =Number(${id});
   
   $.ajax({
      url : "${rootPath}/api/review/avg/"+restuarantid,
      type : "get",
      dataType : "JSON",
      contentType : "applicaton/json; ",
      
      success : function(response) {
         
         $("#storescore").text(response.toFixed(1));
         
      }
   });
   
   
}
function review(){
   $.ajax({
      url : "${rootPath}/api/review/count",
      type : "get",
      data: {
         opt: opttemp,
         key: idtemp
      },
      dataType : "JSON",
      contentType : "applicaton/json; charset=utf-8",

      success : function(response) {

         var count = Number(response);
         
         if(count<=(page-1)*3)
         {
            // 토글 할 버튼 선택 (btn1)
            const btn = document.getElementById("reviewaddbtn");
               
            btn.style.display = 'none';

         }
      
      }
   });
   
   $.ajax({
      url : "${rootPath}/api/review/page/"+page,
      type : "get",
      data: {
         opt: opttemp,
         key: idtemp
      },
      dataType : "JSON",
      contentType : "applicaton/json; charset=utf-8",


      success : function(response) {
         
         for( idx in response)
         {
            var height_1; // 변수선언
            height_1 = document.getElementById("maincontainer").offsetHeight;
            height_1 = height_1 +144;
            height_1 = height_1 + 'px';
            document.getElementById("maincontainer").style.height = height_1;
            height_1 = document.getElementById("maincontainer").offsetHeight;
            
            
            var star= Number(response[idx].reviewStar)*2;
            switch(star)
            {
               case 1:
                  $("#reviewcontainer").append(
                         "<div class='row' style='width: 780px;height: 124px; margin: 20px 20px 20px 5px; border: 1px solid; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; border-color: orange; border-top-left-radius: 5px; border-top-right-radius: 5px; '>"+
                           "<div class='row' style='float: left; margin: 0 auto; width:170px' >"+
                           "<div style='text-align: center; '>"+
                           "<span class='badge bg-primary' id='title' style='text-align:center; width:100px; height: 20px;'>"+response[idx].reviewWriter +"</span>"+
                           "</div>"+
                           "<span id='title' style=' height: 40px;line-height: 50px; font-size: 20px; ' >"+
                           '<div style="float: left; width: 200px;">'+
                           '<span class="star"> ★★★★★ <span id="after1" style = "color : #ffd400 ; width : = 10%; ">★★★★★</span>'+ 
                           '<input type="range" id="ran" oninput="drawStar(this)" value="1" step="1"   min="1" max="1">'+
                           '</span>'+
                        	'</div>'+
                           "</span>"+
                           "<div class='row' style=' margin: 20px auto; width: 190px; height: 20px;'>"+
                           "<a id='title' style=' height: 20px;line-height: 10px; font-size: 20px; text-align: center;'>"+response[idx].reviewStar +"</a>"+
                           "</div>"+            
                           "</div>"+
                           "<div class='row' style='float: left; margin: 0 auto; width:360px;height: 120px;' >"+
                                    <!-- output -->
                           " <div class='row' style='float: none; margin: 0 auto; width:360px;height: 120px;'>"+
                           " <textarea class='form-control' id='content' style='margin-top: 10px; margin-bottom: 10px; background: transparent;' readonly>"+response[idx].reviewContent +"</textarea>"+           
                           " </div>"+
                           "</div>"+
                           "<div class='row' style='float: left; margin: 0 auto; width:180px;height: 120px;' >"+
                           "<img src ='${rootPath}/resources/img/none.png' width='160' height='110' alt ='야옹이' style='border: 1px solid; border-color: orange; margin-top: 5px;'>"+
                           "</div>"+
                           "</div>"
                     

                  );   
                  break;
               case 2:
                  $("#reviewcontainer").append(
                         "<div class='row' style='width: 780px;height: 124px; margin: 20px 20px 20px 5px; border: 1px solid; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; border-color: orange; border-top-left-radius: 5px; border-top-right-radius: 5px; '>"+
                           "<div class='row' style='float: left; margin: 0 auto; width:170px' >"+
                           "<div style='text-align: center; '>"+
                           "<span class='badge bg-primary' id='title' style='text-align:center; width:100px; height: 20px;'>"+response[idx].reviewWriter +"</span>"+
                           "</div>"+
                           "<span id='title' style=' height: 40px;line-height: 50px; font-size: 20px; ' >"+
                           '<div style="float: left; width: 200px;">'+
                           '<span class="star"> ★★★★★ <span id="after2">★★★★★</span>'+ 
                           '<input type="range" id="ran" oninput="drawStar(this)" value="2" step="1"   min="2" max="2">'+
                           '</span>'+
                           "</div>"+
                           "</span>"+
                           "<div class='row' style=' margin: 20px auto; width: 190px; height: 20px;'>"+
                           "<a id='title' style=' height: 20px;line-height: 10px; font-size: 20px; text-align: center;'>"+response[idx].reviewStar +"</a>"+
                           "</div>"+            
                           "</div>"+
                           "<div class='row' style='float: left; margin: 0 auto; width:360px;height: 120px;' >"+
                                    <!-- output -->
                           " <div class='row' style='float: none; margin: 0 auto; width:360px;height: 120px;'>"+
                           " <textarea class='form-control' id='content' style='margin-top: 10px; margin-bottom: 10px;background: transparent;' readonly>"+response[idx].reviewContent +"</textarea>"+           
                           " </div>"+
                           "</div>"+
                           "<div class='row' style='float: left; margin: 0 auto; width:180px;height: 120px;' >"+
                           "<img src ='${rootPath}/resources/img/none.png' width='160' height='110' alt ='야옹이' style='border: 1px solid; border-color: orange; margin-top: 5px;'>"+
                           "</div>"+
                           "</div>"
                           

                  );   
                  break;
               case 3:
                   $("#reviewcontainer").append(
                          "<div class='row' style='width: 780px;height: 124px; margin: 20px 20px 20px 5px; border: 1px solid; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; border-color: orange; border-top-left-radius: 5px; border-top-right-radius: 5px; '>"+
                            "<div class='row' style='float: left; margin: 0 auto; width:170px' >"+
                            "<div style='text-align: center; '>"+
                            "<span class='badge bg-primary' id='title' style='text-align:center; width:100px; height: 20px;'>"+response[idx].reviewWriter +"</span>"+
                            "</div>"+
                            "<span id='title' style=' height: 40px;line-height: 50px; font-size: 20px; ' >"+
                            '<div style="float: left; width: 200px;">'+
                            '<span class="star"> ★★★★★ <span id="after3">★★★★★</span>'+ 
                            '<input type="range" id="ran" oninput="drawStar(this)" value="3" step="1"   min="3" max="3">'+
                            '</span>'+
                            "</div>"+
                            "</span>"+
                            "<div class='row' style=' margin: 20px auto; width: 190px; height: 20px;'>"+
                            "<a id='title' style=' height: 20px;line-height: 10px; font-size: 20px; text-align: center;'>"+response[idx].reviewStar +"</a>"+
                            "</div>"+            
                            "</div>"+
                            "<div class='row' style='float: left; margin: 0 auto; width:360px;height: 120px;' >"+
                                     <!-- output -->
                            " <div class='row' style='float: none; margin: 0 auto; width:360px;height: 120px;'>"+
                            " <textarea class='form-control' id='content' style='margin-top: 10px; margin-bottom: 10px;background: transparent;' readonly>"+response[idx].reviewContent +"</textarea>"+           
                            " </div>"+
                            "</div>"+
                            "<div class='row' style='float: left; margin: 0 auto; width:180px;height: 120px;' >"+
                            "<img src ='${rootPath}/resources/img/none.png' width='160' height='110' alt ='야옹이' style='border: 1px solid; border-color: orange; margin-top: 5px;'>"+
                            "</div>"+
                            "</div>"
                            

                   );   
                   break;
               case 4:
                   $("#reviewcontainer").append(
                          "<div class='row' style='width: 780px;height: 124px; margin: 20px 20px 20px 5px; border: 1px solid; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; border-color: orange; border-top-left-radius: 5px; border-top-right-radius: 5px; '>"+
                            "<div class='row' style='float: left; margin: 0 auto; width:170px' >"+
                            "<div style='text-align: center; '>"+
                            "<span class='badge bg-primary' id='title' style='text-align:center; width:100px; height: 20px;'>"+response[idx].reviewWriter +"</span>"+
                            "</div>"+
                            "<span id='title' style=' height: 40px;line-height: 50px; font-size: 20px; ' >"+
                            '<div style="float: left; width: 200px;">'+
                            '<span class="star"> ★★★★★ <span id="after4">★★★★★</span>'+ 
                            '<input type="range" id="ran" oninput="drawStar(this)" value="4" step="1"   min="4" max="4">'+
                            '</span>'+
                            "</div>"+
                            "</span>"+
                            "<div class='row' style=' margin: 20px auto; width: 190px; height: 20px;'>"+
                            "<a id='title' style=' height: 20px;line-height: 10px; font-size: 20px; text-align: center;'>"+response[idx].reviewStar +"</a>"+
                            "</div>"+            
                            "</div>"+
                            "<div class='row' style='float: left; margin: 0 auto; width:360px;height: 120px;' >"+
                                     <!-- output -->
                            " <div class='row' style='float: none; margin: 0 auto; width:360px;height: 120px;'>"+
                            " <textarea class='form-control' id='content' style='margin-top: 10px; margin-bottom: 10px;background: transparent;' readonly>"+response[idx].reviewContent +"</textarea>"+           
                            " </div>"+
                            "</div>"+
                            "<div class='row' style='float: left; margin: 0 auto; width:180px;height: 120px;' >"+
                            "<img src ='${rootPath}/resources/img/none.png' width='160' height='110' alt ='야옹이' style='border: 1px solid; border-color: orange; margin-top: 5px;'>"+
                            "</div>"+
                            "</div>"
                            

                   );   
                   break;
               case 5:
                   $("#reviewcontainer").append(
                          "<div class='row' style='width: 780px;height: 124px; margin: 20px 20px 20px 5px; border: 1px solid; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; border-color: orange; border-top-left-radius: 5px; border-top-right-radius: 5px; '>"+
                            "<div class='row' style='float: left; margin: 0 auto; width:170px' >"+
                            "<div style='text-align: center; '>"+
                            "<span class='badge bg-primary' id='title' style='text-align:center; width:100px; height: 20px;'>"+response[idx].reviewWriter +"</span>"+
                            "</div>"+
                            "<span id='title' style=' height: 40px;line-height: 50px; font-size: 20px; ' >"+
                            '<div style="float: left; width: 200px;">'+
                            '<span class="star"> ★★★★★ <span id="after5">★★★★★</span>'+ 
                            '<input type="range" id="ran" oninput="drawStar(this)" value="5" step="1"   min="5" max="5">'+
                            '</span>'+
                            "</div>"+
                            "</span>"+
                            "<div class='row' style=' margin: 20px auto; width: 190px; height: 20px;'>"+
                            "<a id='title' style=' height: 20px;line-height: 10px; font-size: 20px; text-align: center;'>"+response[idx].reviewStar +"</a>"+
                            "</div>"+            
                            "</div>"+
                            "<div class='row' style='float: left; margin: 0 auto; width:360px;height: 120px;' >"+
                                     <!-- output -->
                            " <div class='row' style='float: none; margin: 0 auto; width:360px;height: 120px;'>"+
                            " <textarea class='form-control' id='content' style='margin-top: 10px; margin-bottom: 10px;background: transparent;' readonly>"+response[idx].reviewContent +"</textarea>"+           
                            " </div>"+
                            "</div>"+
                            "<div class='row' style='float: left; margin: 0 auto; width:180px;height: 120px;' >"+
                            "<img src ='${rootPath}/resources/img/none.png' width='160' height='110' alt ='야옹이' style='border: 1px solid; border-color: orange; margin-top: 5px;'>"+
                            "</div>"+
                            "</div>"
                            

                   );   
                   break;
             
                        case 6:
                            $("#reviewcontainer").append(
                                    "<div class='row' style='width: 780px;height: 124px; margin: 20px 20px 20px 5px; border: 1px solid; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; border-color: orange; border-top-left-radius: 5px; border-top-right-radius: 5px; '>"+
                                      "<div class='row' style='float: left; margin: 0 auto; width:170px' >"+
                                      "<div style='text-align: center; '>"+
                                      "<span class='badge bg-primary' id='title' style='text-align:center; width:100px; height: 20px;'>"+response[idx].reviewWriter +"</span>"+
                                      "</div>"+
                                      "<span id='title' style=' height: 40px;line-height: 50px; font-size: 20px; ' >"+
                                      '<div style="float: left; width: 200px;">'+
                                      '<span class="star"> ★★★★★ <span id="after6">★★★★★</span>'+ 
                                      '<input type="range" id="ran" oninput="drawStar(this)" value="6" step="1"   min="6" max="6">'+
                                      '</span>'+
                                      "</div>"+
                                      "</span>"+
                                      "<div class='row' style=' margin: 20px auto; width: 190px; height: 20px;'>"+
                                      "<a id='title' style=' height: 20px;line-height: 10px; font-size: 20px; text-align: center;'>"+response[idx].reviewStar +"</a>"+
                                      "</div>"+            
                                      "</div>"+
                                      "<div class='row' style='float: left; margin: 0 auto; width:360px;height: 120px;' >"+
                                               <!-- output -->
                                      " <div class='row' style='float: none; margin: 0 auto; width:360px;height: 120px;'>"+
                                      " <textarea class='form-control' id='content' style='margin-top: 10px; margin-bottom: 10px;background: transparent;' readonly>"+response[idx].reviewContent +"</textarea>"+           
                                      " </div>"+
                                      "</div>"+
                                      "<div class='row' style='float: left; margin: 0 auto; width:180px;height: 120px;' >"+
                                      "<img src ='${rootPath}/resources/img/none.png' width='160' height='110' alt ='야옹이' style='border: 1px solid; border-color: orange; margin-top: 5px;'>"+
                                      "</div>"+
                                      "</div>"
                                      

                             );   
                             break;
                             case 7:
                                 $("#reviewcontainer").append(
                                         "<div class='row' style='width: 780px;height: 124px; margin: 20px 20px 20px 5px; border: 1px solid; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; border-color: orange; border-top-left-radius: 5px; border-top-right-radius: 5px; '>"+
                                           "<div class='row' style='float: left; margin: 0 auto; width:170px' >"+
                                           "<div style='text-align: center; '>"+
                                           "<span class='badge bg-primary' id='title' style='text-align:center; width:100px; height: 20px;'>"+response[idx].reviewWriter +"</span>"+
                                           "</div>"+
                                           "<span id='title' style=' height: 40px;line-height: 50px; font-size: 20px; ' >"+
                                           '<div style="float: left; width: 200px;">'+
                                           '<span class="star"> ★★★★★ <span id="after7">★★★★★</span>'+ 
                                           '<input type="range" id="ran" oninput="drawStar(this)" value="7" step="1"   min="7" max="7">'+
                                           '</span>'+
                                           "</div>"+
                                           "</span>"+
                                           "<div class='row' style=' margin: 20px auto; width: 190px; height: 20px;'>"+
                                           "<a id='title' style=' height: 20px;line-height: 10px; font-size: 20px; text-align: center;'>"+response[idx].reviewStar +"</a>"+
                                           "</div>"+            
                                           "</div>"+
                                           "<div class='row' style='float: left; margin: 0 auto; width:360px;height: 120px;' >"+
                                                    <!-- output -->
                                           " <div class='row' style='float: none; margin: 0 auto; width:360px;height: 120px;'>"+
                                           " <textarea class='form-control' id='content' style='margin-top: 10px; margin-bottom: 10px;background: transparent;' readonly>"+response[idx].reviewContent +"</textarea>"+           
                                           " </div>"+
                                           "</div>"+
                                           "<div class='row' style='float: left; margin: 0 auto; width:180px;height: 120px;' >"+
                                           "<img src ='${rootPath}/resources/img/none.png' width='160' height='110' alt ='야옹이' style='border: 1px solid; border-color: orange; margin-top: 5px;'>"+
                                           "</div>"+
                                           "</div>"
                                           

                                  );   
                                  break;
                                  case 8:
                                      $("#reviewcontainer").append(
                                              "<div class='row' style='width: 780px;height: 124px; margin: 20px 20px 20px 5px; border: 1px solid; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; border-color: orange; border-top-left-radius: 5px; border-top-right-radius: 5px; '>"+
                                                "<div class='row' style='float: left; margin: 0 auto; width:170px' >"+
                                                "<div style='text-align: center; '>"+
                                                "<span class='badge bg-primary' id='title' style='text-align:center; width:100px; height: 20px;'>"+response[idx].reviewWriter +"</span>"+
                                                "</div>"+
                                                "<span id='title' style=' height: 40px;line-height: 50px; font-size: 20px; ' >"+
                                                '<div style="float: left; width: 200px;">'+
                                                '<span class="star"> ★★★★★ <span id="after8">★★★★★</span>'+ 
                                                '<input type="range" id="ran" oninput="drawStar(this)" value="8" step="1"   min="8" max="8">'+
                                                '</span>'+
                                                "</div>"+
                                                "</span>"+
                                                "<div class='row' style=' margin: 20px auto; width: 190px; height: 20px;'>"+
                                                "<a id='title' style=' height: 20px;line-height: 10px; font-size: 20px; text-align: center;'>"+response[idx].reviewStar +"</a>"+
                                                "</div>"+            
                                                "</div>"+
                                                "<div class='row' style='float: left; margin: 0 auto; width:360px;height: 120px;' >"+
                                                         <!-- output -->
                                                " <div class='row' style='float: none; margin: 0 auto; width:360px;height: 120px;'>"+
                                                " <textarea class='form-control' id='content' style='margin-top: 10px; margin-bottom: 10px;background: transparent;' readonly>"+response[idx].reviewContent +"</textarea>"+           
                                                " </div>"+
                                                "</div>"+
                                                "<div class='row' style='float: left; margin: 0 auto; width:180px;height: 120px;' >"+
                                                "<img src ='${rootPath}/resources/img/none.png' width='160' height='110' alt ='야옹이' style='border: 1px solid; border-color: orange; margin-top: 5px;'>"+
                                                "</div>"+
                                                "</div>"
                                                

                                       );   
                                       break;
                                  case 9:
                                      $("#reviewcontainer").append(
                                             "<div class='row' style='width: 780px;height: 124px; margin: 20px 20px 20px 5px; border: 1px solid; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; border-color: orange; border-top-left-radius: 5px; border-top-right-radius: 5px; '>"+
                                               "<div class='row' style='float: left; margin: 0 auto; width:170px' >"+
                                               "<div style='text-align: center; '>"+
                                               "<span class='badge bg-primary' id='title' style='text-align:center; width:100px; height: 20px;'>"+response[idx].reviewWriter +"</span>"+
                                               "</div>"+
                                               "<span id='title' style=' height: 40px;line-height: 50px; font-size: 20px; ' >"+
                                               '<div style="float: left; width: 200px;">'+
                                               '<span class="star"> ★★★★★ <span id="after9">★★★★★</span>'+ 
                                               '<input type="range" id="ran" oninput="drawStar(this)" value="9" step="1"   min="9" max="9">'+
                                               '</span>'+
                                               "</div>"+
                                               "</span>"+
                                               "<div class='row' style=' margin: 20px auto; width: 190px; height: 20px;'>"+
                                               "<a id='title' style=' height: 20px;line-height: 10px; font-size: 20px; text-align: center;'>"+response[idx].reviewStar +"</a>"+
                                               "</div>"+            
                                               "</div>"+
                                               "<div class='row' style='float: left; margin: 0 auto; width:360px;height: 120px;' >"+
                                                        <!-- output -->
                                               " <div class='row' style='float: none; margin: 0 auto; width:360px;height: 120px;'>"+
                                               " <textarea class='form-control' id='content' style='margin-top: 10px; margin-bottom: 10px;background: transparent;' readonly>"+response[idx].reviewContent +"</textarea>"+           
                                               " </div>"+
                                               "</div>"+
                                               "<div class='row' style='float: left; margin: 0 auto; width:180px;height: 120px;' >"+
                                               "<img src ='${rootPath}/resources/img/none.png' width='160' height='110' alt ='야옹이' style='border: 1px solid; border-color: orange; margin-top: 5px;'>"+
                                               "</div>"+
                                               "</div>"
                                               

                                      );   
                                      break;
                                      case 10:
                                          $("#reviewcontainer").append(
                                                  "<div class='row' style='width: 780px;height: 124px; margin: 20px 20px 20px 5px; border: 1px solid; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; border-color: orange; border-top-left-radius: 5px; border-top-right-radius: 5px; '>"+
                                                    "<div class='row' style='float: left; margin: 0 auto; width:170px' >"+
                                                    "<div style='text-align: center; '>"+
                                                    "<span class='badge bg-primary' id='title' style='text-align:center; width:100px; height: 20px;'>"+response[idx].reviewWriter +"</span>"+
                                                    "</div>"+
                                                    "<span id='title' style=' height: 40px;line-height: 50px; font-size: 20px; ' >"+
                                                    '<div style="float: left; width: 200px;">'+
                                                    '<span class="star"> ★★★★★ <span id="after10">★★★★★</span>'+ 
                                                    '<input type="range" id="ran" oninput="drawStar(this)" value="10" step="1"   min="10" max="10">'+
                                                    '</span>'+
                                                    "</div>"+
                                                    "</span>"+
                                                    "<div class='row' style=' margin: 20px auto; width: 190px; height: 20px;'>"+
                                                    "<a id='title' style=' height: 20px;line-height: 10px; font-size: 20px; text-align: center;'>"+response[idx].reviewStar +"</a>"+
                                                    "</div>"+            
                                                    "</div>"+
                                                    "<div class='row' style='float: left; margin: 0 auto; width:360px;height: 120px;' >"+
                                                             <!-- output -->
                                                    " <div class='row' style='float: none; margin: 0 auto; width:360px;height: 120px;'>"+
                                                    " <textarea class='form-control' id='content' style='margin-top: 10px; margin-bottom: 10px;background: transparent;' readonly>"+response[idx].reviewContent +"</textarea>"+           
                                                    " </div>"+
                                                    "</div>"+
                                                    "<div class='row' style='float: left; margin: 0 auto; width:180px;height: 120px;' >"+
                                                    "<img src ='${rootPath}/resources/img/none.png' width='160' height='110' alt ='야옹이' style='border: 1px solid; border-color: orange; margin-top: 5px;'>"+
                                                    "</div>"+
                                                    "</div>"
                                                    

                                           );   
                                           break;
                   
                   
                   
            }
                  
         }
         
      }
   });
   
   page += 1;
   
}






<!-- -------------------------------------mapscript--------------------------------------------------------- -->

function map(latitude,longtitude,title){
var map;
var mapmodal;



$('#modalmap').on('show.bs.modal', function (e) {   
   mapmodal.relayout();
});
$('#modalmap').on('shown.bs.modal', function (e) {
mapmodal.relayout();
});
$('#modalmap').on('hide.bs.modal', function (e) {
});
$('#modalmap').on('hidden.bs.modal', function (e) {
});


var container = document.getElementById('map');
var options = {
   center: new kakao.maps.LatLng(latitude, longtitude),
   level: 3
};

map = new kakao.maps.Map(container, options);

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(latitude, longtitude); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);




var containermodal = document.getElementById('mapmodal');
var options1 = {
      center: new kakao.maps.LatLng(latitude, longtitude),
      level: 3
   };
mapmodal = new kakao.maps.Map(containermodal, options1);
//마커가 표시될 위치입니다 
var markerPositionmodal  = new kakao.maps.LatLng(latitude, longtitude); 

//마커를 생성합니다
var markermodal = new kakao.maps.Marker({
    position: markerPositionmodal
});

//마커가 지도 위에 표시되도록 설정합니다
markermodal.setMap(mapmodal);


containermodal.style.width = '765px';
containermodal.style.height = '400px'; 


}



</script>




















<script>

var reviewcount = 1;
var testtoggle = 0;

/* function reviewwritebtn(){
   
   if(testtoggle == 1)
   {
       $("#reviewtitle").show();   
       testtoggle = 0;
   }
   else
   {
       $("#reviewtitle").hide();
       testtoggle= 1;
   }
   
   
} */




</script>



</html>