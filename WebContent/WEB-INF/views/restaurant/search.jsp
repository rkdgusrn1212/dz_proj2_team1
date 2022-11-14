<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


 <!-- jQuery 라이브러리 호출 -->
 <script src="${rootPath}/resources/js/jquery-3.6.1.min.js"></script>
<!-- 부트스트랩 연결 -->
 <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />


<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous"> -->
	
	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7cffb8c56abe7dd1e1df8469cd0acc35"></script>



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
	href="${rootPath}/resources/css/lkc.css">


</head>
<body onload="load()">

<!-- ------------------------maincontainer-------------------------------->
	<div class="container" style="float: none; margin: 0 auto; height:1000px;" id="maincontainer">
		<div class = "col" style="float: none; margin: 0 auto; width: 1250px;" id="storeinfo">
			<div class = "col" style="float: left; margin: 20px; auto; width: 700px; " id="storeinfo">
				
				<!-- --------------------------------------------Store1-------------------------------------------------------------------- -->
				
				
				<div class = "col" style="float: none; margin-top: 10px; margin-bottom:5px; width: 700px; height: 150px; border-bottom: 1px solid; border-top: 1px solid; border-color: orange; display: ; " id = "0_div">
					<div class="row" style="float: left; width:150px;">
						<img src ="../resources/img/testimg.jpg" width="150" height="140" alt ="야옹이" id="storepicture0" >
					</div>
					<div class="row"style="float: left; width:500px; margin-left: 20px; ">
						<a href = "${rootPath}/restaurant/detail" style="font-size: 25px; color: orange;  text-decoration: none;margin-bottom: 5px; font-weight:bold;" id="storetitle0"><b>홍콩반점 1954</b></a>
						
						<div class="col">
							<div class="row" style = "float: left; width:120px;">
								<span style="font-size: 17px; text-decoration: none; text-align: center;"><b>대표메뉴</b></a>
							</div>
							<div class="row" style = "float: left;width:380px;">
								<span style="font-size: 17px; text-decoration: none; font-weight:bold;" id="mainmenu0"><b>짜장면</b></a>
							</div>
							
						</div>
						<div class="col">
							<div class="row" style = "float: left; width:120px;">
								<span style="font-size: 17px; text-decoration: none; text-align: center;"><b>주소</b></a>
							</div>
							<div class="row" style = "float: left;width:380px;">
								<span style="font-size: 17px; text-decoration: none; font-weight:bold;" id="juso0"><b>경기도 부천시 상동</b></a>
							</div>
							<div class="col" style="margin-top: 30px;">
								<div class="row" style = "float: left;width:120px;">
									<span style="font-size: 17px; text-decoration: none; font-size: 23px; margin-left: 25px;" ><b>평점</b></a>
								</div>
								<div class="row" style = "float: left; width:200px;">
									<span style="font-size: 22px; text-decoration: none; text-align: center; color:orange; border:1px solid; margin-left: 10px;" id = "avgvalue0"><b>5.0</b></span>
								</div>
								
							</div>
							
						</div>
								
					</div>	
						
				</div>
				
				
				<!-- --------------------------------------------Store2-------------------------------------------------------------------- -->
				
				
				<div class = "col" style="float: none; margin-top: 10px; margin-bottom:5px; width: 700px; height: 150px; border-bottom: 1px solid; border-top: 1px solid; border-color: orange; display: ; " id = "1_div">
					<div class="row" style="float: left; width:150px;">
						<img src ="../resources/img/testimg.jpg" width="150" height="140" alt ="야옹이" id="storepicture1" >
					</div>
					<div class="row"style="float: left; width:500px; margin-left: 20px; ">
						<a href = "${rootPath}/restaurant/detail" style="font-size: 25px; color: orange;  text-decoration: none;margin-bottom: 5px; font-weight:bold;" id="storetitle1">홍콩반점 1954</a>
						
						<div class="col">
							<div class="row" style = "float: left; width:120px;">
								<span style="font-size: 17px; text-decoration: none; text-align: center;"><b>대표메뉴</b></a>
							</div>
							<div class="row" style = "float: left;width:380px;">
								<span style="font-size: 17px; text-decoration: none; font-weight:bold;" id="mainmenu1"><b>짜장면</b></a>
							</div>
							
						</div>
						<div class="col">
							<div class="row" style = "float: left; width:120px;">
								<span style="font-size: 17px; text-decoration: none; text-align: center; "><b>주소</b></a>
							</div>
							<div class="row" style = "float: left;width:380px;">
								<span style="font-size: 17px; text-decoration: none; font-weight:bold;" id="juso1" >경기도 부천시 상동</a>
							</div>
							<div class="col" style="margin-top: 30px;">
								<div class="row" style = "float: left;width:120px;">
									<span style="font-size: 17px; text-decoration: none; font-size: 23px; margin-left: 25px; font-weight:bold;" >평점</a>
								</div>
								<div class="row" style = "float: left; width:200px;">
									<span style="font-size: 22px; text-decoration: none; text-align: center; color:orange; border:1px solid; margin-left: 10px; font: bold;" id = "avgvalue1">5.0</span>
								</div>
								
							</div>
							
						</div>
								
					</div>	
						
				</div>
				
				
				
				
				<!-- --------------------------------------------Store3-------------------------------------------------------------------- -->
				
				
				<div class = "col" style="float: none; margin-top: 10px; margin-bottom:5px; width: 700px; height: 150px; border-bottom: 1px solid; border-top: 1px solid; border-color: orange; display: ; " id = "2_div">
					<div class="row" style="float: left; width:150px;">
						<img src ="../resources/img/testimg.jpg" width="150" height="140" alt ="야옹이" id="storepicture2" >
					</div>
					<div class="row"style="float: left; width:500px; margin-left: 20px; ">
						<a href = "${rootPath}/restaurant/detail" style="font-size: 25px; color: orange;  text-decoration: none;margin-bottom: 5px; font-weight:bold;" id="storetitle2">홍콩반점 1954</a>
						
						<div class="col">
							<div class="row" style = "float: left; width:120px;">
								<span style="font-size: 17px; text-decoration: none; text-align: center;"><b>대표메뉴</b></a>
							</div>
							<div class="row" style = "float: left;width:380px;">
								<span style="font-size: 17px; text-decoration: none; font-weight:bold;" id="mainmenu2"><b>짜장면</b></a>
							</div>
							
						</div>
						<div class="col">
							<div class="row" style = "float: left; width:120px;">
								<span style="font-size: 17px; text-decoration: none; text-align: center; "><b>주소</b></a>
							</div>
							<div class="row" style = "float: left;width:380px;">
								<span style="font-size: 17px; text-decoration: none; font-weight:bold;" id="juso2" >경기도 부천시 상동</a>
							</div>
							<div class="col" style="margin-top: 30px;">
								<div class="row" style = "float: left;width:120px;">
									<span style="font-size: 17px; text-decoration: none; font-size: 23px; margin-left: 25px; font-weight:bold;" >평점</a>
								</div>
								<div class="row" style = "float: left; width:200px;">
									<span style="font-size: 22px; text-decoration: none; text-align: center; color:orange; border:1px solid; margin-left: 10px; font: bold;" id = "avgvalue2">5.0</span>
								</div>
								
							</div>
							
						</div>
								
					</div>	
						
				</div>
				
				<!-- --------------------------------------------Store4-------------------------------------------------------------------- -->
				
				
				<div class = "col" style="float: none; margin-top: 10px; margin-bottom:5px; width: 700px; height: 150px; border-bottom: 1px solid; border-top: 1px solid; border-color: orange; display: ; " id = "3_div">
					<div class="row" style="float: left; width:150px;">
						<img src ="../resources/img/testimg.jpg" width="150" height="140" alt ="야옹이" id="storepicture3" >
					</div>
					<div class="row"style="float: left; width:500px; margin-left: 20px; ">
						<a href = "${rootPath}/restaurant/detail" style="font-size: 25px; color: orange;  text-decoration: none;margin-bottom: 5px; font-weight:bold;" id="storetitle3">홍콩반점 1954</a>
						
						<div class="col">
							<div class="row" style = "float: left; width:120px;">
								<span style="font-size: 17px; text-decoration: none; text-align: center;"><b>대표메뉴</b></a>
							</div>
							<div class="row" style = "float: left;width:380px;">
								<span style="font-size: 17px; text-decoration: none; font-weight:bold;" id="mainmenu3"><b>짜장면</b></a>
							</div>
							
						</div>
						<div class="col">
							<div class="row" style = "float: left; width:120px;">
								<span style="font-size: 17px; text-decoration: none; text-align: center; "><b>주소</b></a>
							</div>
							<div class="row" style = "float: left;width:380px;">
								<span style="font-size: 17px; text-decoration: none; font-weight:bold;" id="juso3" >경기도 부천시 상동</a>
							</div>
							<div class="col" style="margin-top: 30px;">
								<div class="row" style = "float: left;width:120px;">
									<span style="font-size: 17px; text-decoration: none; font-size: 23px; margin-left: 25px; font-weight:bold;" >평점</a>
								</div>
								<div class="row" style = "float: left; width:200px;">
									<span style="font-size: 22px; text-decoration: none; text-align: center; color:orange; border:1px solid; margin-left: 10px; font: bold;" id = "avgvalue3">5.0</span>
								</div>
								
							</div>
							
						</div>
								
					</div>	
						
				</div>
				
				
			<!-- --------------------------------------------Store5-------------------------------------------------------------------- -->
				
				
				<div class = "col" style="float: none; margin-top: 10px; margin-bottom:5px; width: 700px; height: 150px; border-bottom: 1px solid; border-top: 1px solid; border-color: orange; display: ; " id = "4_div">
					<div class="row" style="float: left; width:150px;">
						<img src ="../resources/img/testimg.jpg" width="150" height="140" alt ="야옹이" id="storepicture4" >
					</div>
					<div class="row"style="float: left; width:500px; margin-left: 20px; ">
						<a href = "${rootPath}/restaurant/detail" style="font-size: 25px; color: orange;  text-decoration: none;margin-bottom: 5px; font-weight:bold;" id="storetitle4">홍콩반점 1954</a>
						
						<div class="col">
							<div class="row" style = "float: left; width:120px;">
								<span style="font-size: 17px; text-decoration: none; text-align: center;"><b>대표메뉴</b></a>
							</div>
							<div class="row" style = "float: left;width:380px;">
								<span style="font-size: 17px; text-decoration: none; font-weight:bold;" id="mainmenu4"><b>짜장면</b></a>
							</div>
							
						</div>
						<div class="col">
							<div class="row" style = "float: left; width:120px;">
								<span style="font-size: 17px; text-decoration: none; text-align: center; "><b>주소</b></a>
							</div>
							<div class="row" style = "float: left;width:380px;">
								<span style="font-size: 17px; text-decoration: none; font-weight:bold;" id="juso4" >경기도 부천시 상동</a>
							</div>
							<div class="col" style="margin-top: 30px;">
								<div class="row" style = "float: left;width:120px;">
									<span style="font-size: 17px; text-decoration: none; font-size: 23px; margin-left: 25px; font-weight:bold;" >평점</a>
								</div>
								<div class="row" style = "float: left; width:200px;">
									<span style="font-size: 22px; text-decoration: none; text-align: center; color:orange; border:1px solid; margin-left: 10px; font: bold;" id = "avgvalue4">5.0</span>
								</div>
								
							</div>
							
						</div>
								
					</div>	
						
				</div>
				
				
				
				
				
				
			</div>
			
			
			<!-- --------------------------------------------지도 -------------------------------------------------------------------- -->
			
			
			<div class="row" style="float: left; margin: 20px auto; width: 500px;height: 810px;">
					<div id="map" style="width:480px;height:800px;" id="storeinfomap"></div>
			</div>
			
		</div>
		
		
		
		<!-- --------------------------------------------페이지 버튼-------------------------------------------------------------------- -->
		
		
		<div class="test">
			<ul class="pagination pagination-lg" id="button">

			
			</ul>
		</div>
	</div>
	</div>

	<!-- <div style ="width:200px;height: 200px;"><span style="color: orange; font-size: 20px; font-weight: bold;">이미지</span></div> -->
</body>



<script>
var map;
var markerPosition;
var marker;
var markers =[];
var container;
var options;
var infowindow;
/* --------------------------------------------------------------mapview---------------------------------------------------------- */
 

function storeinfo(title){
	
	infowindow = new kakao.maps.InfoWindow({
	    content: "<div style ='width:250px;height: 50px; border-color:orange; border: 2px;'><p style='color: orange; font-size: 17px; font-weight: bold; text-align: center; width:250px; line-height: 50px; vertical-align: middle; '>"+title+"</p></div>"
	});
	
	infowindow.open(map, marker);
}

function mapgeneration(){
	 container = document.getElementById('map');
}
function mapoption(latitude,longitude){
	options = {
			center: new kakao.maps.LatLng(latitude, longitude),
			level: 3
		};
	map = new kakao.maps.Map(container, options);
}
function markerinput(latitude,longitude){
	
	markerPosition  = new kakao.maps.LatLng(latitude, longitude); 
	
	// 마커를 생성합니다
	marker = new kakao.maps.Marker({
	    position: markerPosition,
	  //  content:'<div> </div> '
	    clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	// 생성된 마커를 배열에 추가합니다
    markers.push(marker);
}

//"마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
function showMarkers() {
    setMarkers(map) ;   
}
//배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
function setMarkers(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
    }            
}

/* --------------------------------------------------------------load---------------------------------------------------------- */

var optdata = "restaurantDong";
var keydata = "안양동";

function load(){

	
	//var optdata = ${opt};
	//var keydata = ${key};

	
	
	
	$.ajax({
		url : "${rootPath}/api/restaurant/count",
		type : "get",
		 data : {
			
			opt: optdata,
			key: keydata
			
		}, 
		dataType : "JSON",
		contentType : "applicaton/json; charset=utf-8",
		/* success: function(response) {
			$("#result-text").html(JSON.stringify(response));                    
		}, */

		success : function(response) {
			//console.log(response)
			var count = parseInt(response); //문자를 정수형 숫자로 변환해줌
			console.log(count)
			$("#button").empty();
			if (count <= 5) {
				$("#button").append(
								"<li class='page-item disabled' id='left'><a class='page-link' >&laquo;</a></li>"+											
								"<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"+										
								"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>"
				);
			} else if (count > 5 && count <= 10) {

				$("#button").append(
								"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"+											
								"<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"+
								"<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"+
								"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>"
				);
			} else if (count > 10 && count <= 15) {

				$("#button").append(
								"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"+											
								"<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"+
								"<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"+
								"<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'> 3</a></li>"+
								"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>"
				);
			} else if (count > 15 && count <= 20) {
				$("#button").append(
								"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"+
								"<li class='page-item active'id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"+
								"<li class='page-item'id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"+
								"<li class='page-item'id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'> 3</a></li>"+
								"<li class='page-item'id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'> 4</a></li>"+
								
								"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>"
				);
			} else if (count > 20 && count <= 25) {

				$("#button").append(
								"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"+
								"<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"+
								"<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"+
								"<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'> 3</a></li>"+
								"<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'> 4</a></li>"+
								"<li class='page-item' id='quinaryli'><a class='page-link' id = 'quinarybtn' href ='#' onclick='PageClick(this);'> 5</a></li>"+
								"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>"
				);

			}
			else{
				$("#button").append(
						"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"+
						"<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"+
						"<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"+
						"<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'> 3</a></li>"+
						"<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'> 4</a></li>"+
						"<li class='page-item' id='quinaryli'><a class='page-link' id = 'quinarybtn' href ='#' onclick='PageClick(this);'> 5</a></li>"+
						"<li class='page-item' id='right'><a class='page-link' href ='#' onclick='RightPageChange()';> &raquo;</a></li>"
		);
			}
		}
	});
	
	
	
	
	$.ajax({
		url : "${rootPath}/api/restaurant/page/1",
		type : "get",
		data : {
			
			opt: optdata,
			key: keydata
			
		},
		dataType : "JSON",
		contentType : "applicaton/json; charset=utf-8",
		/* success: function(response) {
			$("#result-text").html(JSON.stringify(response));                    
		}, */

		success : function(response) {
			
			 mapgeneration();
			 
			for (idx in response) {
				
					
			//	console.log(idx);
				if(idx==0)
				{
					mapoption(response[idx].restaurantLatitude,response[idx].restaurantLongtitude);
				}
				markerinput(response[idx].restaurantLatitude,response[idx].restaurantLongtitude);
				storeinfo(response[idx].restaurantName);
			//	storepicture1
			//	storetitle5
			//	mainmenu1
			//	juso1
			//	avgvalue1
				
				$('#storetitle'+idx).text(response[idx].restaurantName); // a태그 text변경
				$('#storetitle'+idx).attr("href", "${rootPath}/restaurant/detail?id="+response[idx].restaurantNo) // a 태그 href 변경
				$('#mainmenu'+idx ).text(response[idx].restaurantMenu);
				$('#juso'+idx ).text(response[idx].restaurantAddress);
				

			}
			setMarkers(map);
			map.relayout();
		}
		
	});

	
	
}





/* --------------------------------------------------------------페이지 클릭---------------------------------------------------------- */


function PageClick(pagebtn){
	var strText = $(pagebtn).text();
	console.log(strText);
	
	var getId=$(pagebtn).attr("id");
	console.log(getId);
	
	
	//--------------active  toggle---------------------------
	
	
	if(getId=="firstbtn")
	{
		$("#firstli").removeClass();$("#firstli").addClass('page-item active');
		$("#secondli").removeClass();$("#secondli").addClass('page-item ');
		$("#thirdli").removeClass();$("#thirdli").addClass('page-item');
		$("#fourthli").removeClass();$("#fourthli").addClass('page-item');
		$("#quinaryli").removeClass();$("#quinaryli").addClass('page-item');
	}
	else if(getId =='secondbtn')
	{
		$("#firstli").removeClass();$("#firstli").addClass('page-item');
		$("#secondli").removeClass();$("#secondli").addClass('page-item active');
		$("#thirdli").removeClass();$("#thirdli").addClass('page-item');
		$("#fourthli").removeClass();$("#fourthli").addClass('page-item');
		$("#quinaryli").removeClass();$("#quinaryli").addClass('page-item');
	}
	else if(getId =='thirdbtn')
	{
		$("#firstli").removeClass();$("#firstli").addClass('page-item ');
		$("#secondli").removeClass();$("#secondli").addClass('page-item ');
		$("#thirdli").removeClass();$("#thirdli").addClass('page-item active');
		$("#fourthli").removeClass();$("#fourthli").addClass('page-item');
		$("#quinaryli").removeClass();$("#quinaryli").addClass('page-item');
	}
	else if(getId =='fourthbtn')
	{
		$("#firstli").removeClass();$("#firstli").addClass('page-item ');
		$("#secondli").removeClass();$("#secondli").addClass('page-item ');
		$("#thirdli").removeClass();$("#thirdli").addClass('page-item');
		$("#fourthli").removeClass();$("#fourthli").addClass('page-item active');
		$("#quinaryli").removeClass();$("#quinaryli").addClass('page-item');
	}
	else if(getId =='quinarybtn')
	{
		$("#firstli").removeClass();$("#firstli").addClass('page-item ');
		$("#secondli").removeClass();$("#secondli").addClass('page-item ');
		$("#thirdli").removeClass();$("#thirdli").addClass('page-item');
		$("#fourthli").removeClass();$("#fourthli").addClass('page-item');
		$("#quinaryli").removeClass();$("#quinaryli").addClass('page-item active');
	}
	
	
	
	
	var strText = $(pagebtn).text();
	console.log(strText);
	
	
	console.log(optdata);
	console.log(keydata);
	
		$.ajax({
			url : "${rootPath}/api/restaurant/page/"+strText,
			type : "get",
			data : {
				
				opt: optdata,
				key: keydata
				
			},
			dataType : "JSON",
			contentType : "applicaton/json; charset=utf-8",
			/* success: function(response) {
				$("#result-text").html(JSON.stringify(response));                    
			}, */

			success : function(response) {
				//console.log(response)
				 
				 var idxcount;
				 
				 setMarkers(null);
				 markers = [];
					for (idx in response) {
						
						idxcount = idx;
						
						if(idx==0)
						{
							mapoption(response[idx].restaurantLatitude,response[idx].restaurantLongtitude);
						}
						markerinput(response[idx].restaurantLatitude,response[idx].restaurantLongtitude);
						storeinfo(response[idx].restaurantName);
					//	storepicture1
					//	storetitle5
					//	mainmenu1
					//	juso1
					//	avgvalue1
						
						$('#storetitle'+idx).text(response[idx].restaurantName); // a태그 text변경
						$('#storetitle'+idx).attr("href", "${rootPath}/restaurant/detail?id="+response[idx].restaurantNo) // a 태그 href 변경
						$('#mainmenu'+idx ).text(response[idx].restaurantMenu);
						$('#juso'+idx ).text(response[idx].restaurantAddress);
						

					}
					idxcount = Number(idxcount);
					if(idxcount <4)
					{
						for(var i=idxcount+1; i<=4; i++)
						{	
							console.log(i);
							document.getElementById(i+"_div").style.display = "none";
						}
					}
					else{
						for(var i=0; i<=4; i++)
						{
							document.getElementById(i+"_div").style.display = "";
						}
					}
					
					
					map.relayout();

			}

			
			
		});
	
	
}



// ---------------------------------페이징 (right)----------------------------------------------------------






function RightPageChange(){

	var tb = document.getElementById("firstbtn");
	console.log(tb);
	var  start =parseInt(parseInt(tb.innerText)/5);
	console.log(tb.innerText);
	var count;
	var btnindex;
	
		$.ajax({ 
			url : "${rootPath}/api/restaurant/count",
			type : "get",
			data : {
				
				opt: optdata,
				key: keydata
				
			},
			dataType : "JSON",
			contentType : "applicaton/json; charset=utf-8",

			success : function(response) {
				console.log(response);
				
			
				count = parseInt(response); //문자를 정수형 숫자로 변환해줌
				
				count -= parseInt((start+1)*25);
				console.log(count);
				console.log(start);
			    btnindex = (start+1)*5;
				
				console.log((start+1)*5);
				$("#button").empty();
				if (count <= 5) {
					$("#button").append(
									"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()'; >&laquo;</a></li>"+											
									"<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 1)+"</a></li>"+										
									"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>"
					);
				} else if (count > 5 && count <= 10) {

					$("#button").append(
									"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()';  > &laquo;</a></li>"+											
									"<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 1)+"</a></li>"+
									"<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 2)+"</a></li>"+
									"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>"
					);
				} else if (count > 10 && count <= 15) {

					$("#button").append(
									"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()';  > &laquo;</a></li>"+											
									"<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 1)+"</a></li>"+
									"<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 2)+"</a></li>"+
									"<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 3)+"</a></li>"+
									"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>"
					);
				} else if (count > 15 && count <= 20) {
					$("#button").append(
									"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()';  > &laquo;</a></li>"+
									"<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 1)+"</a></li>"+
									"<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 2)+"</a></li>"+
									"<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 3)+"</a></li>"+
									"<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 4)+"</a></li>"+
									
									"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>"
					);
				} else if (count > 20 && count <= 25) {

					$("#button").append(
									"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()';  > &laquo;</a></li>"+
									"<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 1)+"</a></li>"+
									"<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 2)+"</a></li>"+
									"<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 3)+"</a></li>"+
									"<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 4)+"</a></li>"+
									"<li class='page-item' id='quinaryli'><a class='page-link' id = 'quinarybtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 5)+"</a></li>"+
									"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>"
					);

				}
				else{
					$("#button").append(
							"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()';  > &laquo;</a></li>"+
							"<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 1)+"</a></li>"+
							"<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 2)+"</a></li>"+
							"<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 3)+"</a></li>"+
							"<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 4)+"</a></li>"+
							"<li class='page-item' id='quinaryli'><a class='page-link' id = 'quinarybtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 5)+"</a></li>"+
							"<li class='page-item' id='right'><a class='page-link' href ='#' onclick='RightPageChange()'; > &raquo;</a></li>"
					);
				}
			
			}
		
		});

		var  start =parseInt(parseInt(tb.innerText)/5);
		btnindex = (start+1)*5;
		console.log(tb.innerText);
		console.log(btnindex);
		$.ajax({
			url : "${rootPath}/api/restaurant/page/"+(btnindex+1),
			type : "get",
			data : {
				
				opt: optdata,
				key: keydata
				
			},
			dataType : "JSON",
			contentType : "applicaton/json; charset=utf-8",
			
			success : function(response) {
				
				 
				 var idxcount;
				 
				 setMarkers(null);
				 markers = [];
					for (idx in response) {
						
						idxcount = idx;
						
						if(idx==0)
						{
							mapoption(response[idx].restaurantLatitude,response[idx].restaurantLongtitude);
						}
						markerinput(response[idx].restaurantLatitude,response[idx].restaurantLongtitude);
						storeinfo(response[idx].restaurantName);
					//	storepicture1
					//	storetitle5
					//	mainmenu1
					//	juso1
					//	avgvalue1
						
						$('#storetitle'+idx).text(response[idx].restaurantName); // a태그 text변경
						$('#storetitle'+idx).attr("href", "${rootPath}/restaurant/detail?id="+response[idx].restaurantNo) // a 태그 href 변경
						$('#mainmenu'+idx ).text(response[idx].restaurantMenu);
						$('#juso'+idx ).text(response[idx].restaurantAddress);
						

					}
					idxcount = Number(idxcount);
					if(idxcount <4)
					{
						for(var i=idxcount+1; i<=4; i++)
						{	
							console.log(i);
							document.getElementById(i+"_div").style.display = "none";
						}
					}
					else{
						for(var i=0; i<=4; i++)
						{
							document.getElementById(i+"_div").style.display = "";
						}
					}
					
					
					map.relayout();
				
			},
			
		});
		
	
}








// ---------------------------------페이징 (left)----------------------------------------------------------






function LeftPageChange(){
	var optdata = $("#searchopt option:selected").val();
	var keydata = $("#searchdata").val();
	console.log(keydata);
	
	var tb = document.getElementById("firstbtn");
	var  start =parseInt(parseInt(tb.innerText)/5);
	var count;
	var btnindex;
	
	
	
	
	
	
	
		$.ajax({ 
			url : "${rootPath}/api/restaurant/count",
			type : "get",
			data : {
				
				opt: optdata,
				key: keydata
				
			},
			dataType : "JSON",
			contentType : "applicaton/json; charset=utf-8",

			success : function(response) {
				console.log(response);
				
			
				count = parseInt(response); //문자를 정수형 숫자로 변환해줌
				
				count -= parseInt((start+1)*50);
				console.log(count);
				console.log(start);
			    btnindex = ((start-1)*5);
			    console.log(btnindex);
				if(btnindex<0)
				{
					btnindex = 0;
				}
				console.log((start-1)*5);
				$("#button").empty();
				
				 console.log(btnindex);
				if(btnindex == 0)
				{
					$("#button").append("<li class='page-item disabled' id='left'><a class='page-link' onclick='LeftPageChange()';> &laquo;</a></li>");
				}
				else
				{
					$("#button").append("<li class='page-item' id='left'><a class='page-link' onclick='LeftPageChange()';> &laquo;</a></li>");
				}
					$("#button").append(
							
							
							"<li class='page-item ' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 1)+"</a></li>"+
							"<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 2)+"</a></li>"+
							"<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 3)+"</a></li>"+
							"<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 4)+"</a></li>"+
							"<li class='page-item active' id='quinaryli'><a class='page-link' id = 'quinarybtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 5)+"</a></li>"+
							"<li class='page-item' id='right'><a class='page-link' href ='#' onclick='RightPageChange()'; > &raquo;</a></li>"
					);
				
			
			}
		
		});

		var  start =parseInt(parseInt(tb.innerText)/5);
		btnindex = ((start-1)*5)+5;
		console.log(tb.innerText);
		console.log(btnindex);
		$.ajax({
			url : "${rootPath}/api/restaurant/page/"+btnindex,
			type : "get",
			data : {
				
				opt: optdata,
				key: keydata
				
			},
			dataType : "JSON",
			contentType : "applicaton/json; charset=utf-8",
			
			success : function(response) {
 				var idxcount;
				 
				 setMarkers(null);
				 markers = [];
					for (idx in response) {
						
						idxcount = idx;
						
						if(idx==0)
						{
							mapoption(response[idx].restaurantLatitude,response[idx].restaurantLongtitude);
						}
						markerinput(response[idx].restaurantLatitude,response[idx].restaurantLongtitude);
						storeinfo(response[idx].restaurantName);
					//	storepicture1
					//	storetitle5
					//	mainmenu1
					//	juso1
					//	avgvalue1
						
						$('#storetitle'+idx).text(response[idx].restaurantName); // a태그 text변경
						$('#storetitle'+idx).attr("href", "${rootPath}/restaurant/detail?id="+response[idx].restaurantNo) // a 태그 href 변경
						$('#mainmenu'+idx ).text(response[idx].restaurantMenu);
						$('#juso'+idx ).text(response[idx].restaurantAddress);
						

					}
					idxcount = Number(idxcount);
					if(idxcount <4)
					{
						for(var i=idxcount+1; i<=4; i++)
						{	
							console.log(i);
							document.getElementById(i+"_div").style.display = "none";
						}
					}
					else{
						for(var i=0; i<=4; i++)
						{
							document.getElementById(i+"_div").style.display = "";
						}
					}
					
					
					map.relayout();
				
				

			}
			
		});
		
		
	
	

		
}



</script>

</html>