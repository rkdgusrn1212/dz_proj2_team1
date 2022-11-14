<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="rootPath" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${rootPath}/resources/css/reset.css">
<link rel="stylesheet" href="${rootPath}/resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Tasty Way : 식당 관리</title>
<script
	src="${rootPath}/resources/js/jquery-3.6.1.min.js"></script>
<script>
const showToast = (title, time, message)=>{
    const toastElem = $('#liveToast');
    $(toastElem).find("#toast-title").text(title);
    $(toastElem).find("#toast-time").text(time);
    $(toastElem).find(".toast-body").text(message);
    const toast = new bootstrap.Toast($('#liveToast'));
    toast.show();
}
const deleteRestaurant = (id)=>{
	 $.ajax({
	        url : "${rootPath}/api/restaurant/"+id,
	        type : "delete",
	        success: (response)=> {
               showToast("삭제 성공","방금",id+"번 식당이 삭제되었습니다");
               const page = $('#restaurant-pagination').find(".active").find(".page-link").text();
               getRestaurantPage(page);
	        },
	        error: (error)=>{
	        	showToast("삭제 실패","방금","알수 없는 오류 발생");
	        }
	    });
};
$(".delete-restaurant-anchor").on("click", ()=>{
    const id = $(this).data("id");
    $("#delete-button").off().on("click #delete-button",  deleteRestaurant(id) );
});

function load() {

	$
			.ajax({
				url : "${rootPath}/api/restaurant/count",
				type : "get",
				
				dataType : "JSON",
				contentType : "applicaton/json; charset=utf-8",
				success : function(response) {

					var count = parseInt(response.count); //문자를 정수형 숫자로 변환해줌
					$("#button").empty();
					if (count <= 5) {
						$("#button")
								.append(
										"<li class='page-item disabled' id='left'><a class='page-link' >&laquo;</a></li>"
												+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn'  onclick='PageClick(this);'> 1</a></li>"
												+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
					} else if (count > 5 && count <= 10) {

						$("#button")
								.append(
										"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"
												+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn'  onclick='PageClick(this);'> 1</a></li>"
												+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn'  onclick='PageClick(this);'> 2</a></li>"
												+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
					} else if (count > 10 && count <= 15) {

						$("#button")
								.append(
										"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"
												+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' onclick='PageClick(this);'> 1</a></li>"
												+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn'  onclick='PageClick(this);'> 2</a></li>"
												+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn'  onclick='PageClick(this);'> 3</a></li>"
												+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
					} else if (count > 15 && count <= 20) {
						$("#button")
								.append(
										"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"
												+ "<li class='page-item active'id='firstli'><a class='page-link' id = 'firstbtn'  onclick='PageClick(this);'> 1</a></li>"
												+ "<li class='page-item'id='secondli'><a class='page-link' id = 'secondbtn' onclick='PageClick(this);'> 2</a></li>"
												+ "<li class='page-item'id='thirdli'><a class='page-link' id = 'thirdbtn'  onclick='PageClick(this);'> 3</a></li>"
												+ "<li class='page-item'id='fourthli'><a class='page-link' id = 'fourthbtn'  onclick='PageClick(this);'> 4</a></li>"
												+

												"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
					} else if (count > 20 && count <= 25) {

						$("#button")
								.append(
										"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"
												+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn'  onclick='PageClick(this);'> 1</a></li>"
												+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn'  onclick='PageClick(this);'> 2</a></li>"
												+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn'  onclick='PageClick(this);'> 3</a></li>"
												+ "<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' onclick='PageClick(this);'> 4</a></li>"
												+ "<li class='page-item' id='quinaryli'><a class='page-link' id = 'quinarybtn'  onclick='PageClick(this);'> 5</a></li>"
												+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");

					} else {
						$("#button")
								.append(
										"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"
												+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn'  onclick='PageClick(this);'> 1</a></li>"
												+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' onclick='PageClick(this);'> 2</a></li>"
												+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn'  onclick='PageClick(this);'> 3</a></li>"
												+ "<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn'  onclick='PageClick(this);'> 4</a></li>"
												+ "<li class='page-item' id='quinaryli'><a class='page-link' id = 'quinarybtn'  onclick='PageClick(this);'> 5</a></li>"
												+ "<li class='page-item' id='right'><a class='page-link' href ='#' onclick='RightPageChange()';> &raquo;</a></li>");
					}
				}
			});

	$.ajax({
		url : "${rootPath}/api/restaurant/page/1",
		type : "get",
	/* 	data : {
		}, */
		dataType : "JSON",
		contentType : "applicaton/json; charset=utf-8",
	
		success : function(response) {

			for (idx in response) {

				if (idx == 0) {
					mapoption(response[idx].restaurantLatitude,
							response[idx].restaurantLongtitude);
				}

				$('#storetitle' + idx).text(response[idx].restaurantName); // a태그 text변경
				$('#storetitle' + idx).attr(
						"href",
						"${rootPath}/restaurant/detail?id="
								+ response[idx].restaurantNo) // a 태그 href 변경
				$('#mainmenu' + idx).text(response[idx].restaurantMenu);
				$('#juso' + idx).text(response[idx].restaurantAddress);
				reviewavg(response[idx].restaurantNo, idx);

			}
			setMarkers(map);
			map.relayout();
		}

	});

}

/* --------------------------------------------------------------페이지 클릭---------------------------------------------------------- */

function PageClick(pagebtn) {
	const location = $("#location option:selected").val();
	const value1 = $("#value1").val();
	const select = $("#select option:selected").val();
	const value2 = $("#value2").val();
	var strText = $(pagebtn).text();

	var getId = $(pagebtn).attr("id");

	//--------------active  toggle---------------------------

	if (getId == "firstbtn") {
		$("#firstli").removeClass();
		$("#firstli").addClass('page-item active');
		$("#secondli").removeClass();
		$("#secondli").addClass('page-item ');
		$("#thirdli").removeClass();
		$("#thirdli").addClass('page-item');
		$("#fourthli").removeClass();
		$("#fourthli").addClass('page-item');
		$("#quinaryli").removeClass();
		$("#quinaryli").addClass('page-item');
	} else if (getId == 'secondbtn') {
		$("#firstli").removeClass();
		$("#firstli").addClass('page-item');
		$("#secondli").removeClass();
		$("#secondli").addClass('page-item active');
		$("#thirdli").removeClass();
		$("#thirdli").addClass('page-item');
		$("#fourthli").removeClass();
		$("#fourthli").addClass('page-item');
		$("#quinaryli").removeClass();
		$("#quinaryli").addClass('page-item');
	} else if (getId == 'thirdbtn') {
		$("#firstli").removeClass();
		$("#firstli").addClass('page-item ');
		$("#secondli").removeClass();
		$("#secondli").addClass('page-item ');
		$("#thirdli").removeClass();
		$("#thirdli").addClass('page-item active');
		$("#fourthli").removeClass();
		$("#fourthli").addClass('page-item');
		$("#quinaryli").removeClass();
		$("#quinaryli").addClass('page-item');
	} else if (getId == 'fourthbtn') {
		$("#firstli").removeClass();
		$("#firstli").addClass('page-item ');
		$("#secondli").removeClass();
		$("#secondli").addClass('page-item ');
		$("#thirdli").removeClass();
		$("#thirdli").addClass('page-item');
		$("#fourthli").removeClass();
		$("#fourthli").addClass('page-item active');
		$("#quinaryli").removeClass();
		$("#quinaryli").addClass('page-item');
	} else if (getId == 'quinarybtn') {
		$("#firstli").removeClass();
		$("#firstli").addClass('page-item ');
		$("#secondli").removeClass();
		$("#secondli").addClass('page-item ');
		$("#thirdli").removeClass();
		$("#thirdli").addClass('page-item');
		$("#fourthli").removeClass();
		$("#fourthli").addClass('page-item');
		$("#quinaryli").removeClass();
		$("#quinaryli").addClass('page-item active');
	}

	var strText = $(pagebtn).text();

	$
			.ajax({
				url : "${rootPath}/api/restaurant/page/" + strText,
				type : "get",
				data : {

					"location" : location,
					"value1" : value1,
					"select" : select,
					"value2" : value2

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

						if (idx == 0) {
							mapoption(response[idx].restaurantLatitude,
									response[idx].restaurantLongtitude);
						}
						markerinput(response[idx].restaurantLatitude,
								response[idx].restaurantLongtitude,
								response[idx].restaurantName);
						//   storepicture1
						//   storetitle5
						//   mainmenu1
						//   juso1
						//   avgvalue1

						$('#storetitle' + idx).text(
								response[idx].restaurantName); // a태그 text변경
						$('#storetitle' + idx).attr(
								"href",
								"${rootPath}/restaurant/detail?id="
										+ response[idx].restaurantNo) // a 태그 href 변경
						$('#mainmenu' + idx).text(
								response[idx].restaurantMenu);
						$('#juso' + idx).text(
								response[idx].restaurantAddress);
						reviewavg(response[idx].restaurantNo, idx);

					}
					idxcount = Number(idxcount);
					if (idxcount < 4) {
						for (var i = idxcount + 1; i <= 4; i++) {

							document.getElementById(i + "_div").style.display = "none";
						}
					} else {
						for (var i = 0; i <= 4; i++) {
							document.getElementById(i + "_div").style.display = "";
						}
					}

					map.relayout();

				}

			});

}

// ---------------------------------페이징 (right)----------------------------------------------------------

function RightPageChange() {
	const location = $("#location option:selected").val();
	const value1 = $("#value1").val();
	const select = $("#select option:selected").val();
	const value2 = $("#value2").val();
	var tb = document.getElementById("firstbtn");
	var start = parseInt(parseInt(tb.innerText) / 5);
	var count;
	var btnindex;

	$
			.ajax({
				url : "${rootPath}/api/restaurant/count",
				type : "get",
				data : {

					"location" : location,
					"value1" : value1,
					"select" : select,
					"value2" : value2

				},
				dataType : "JSON",
				contentType : "applicaton/json; charset=utf-8",

				success : function(response) {

					count = parseInt(response); //문자를 정수형 숫자로 변환해줌
					count -= parseInt((start + 1) * 25);
					btnindex = (start + 1) * 5;
					$("#button").empty();
					if (count <= 5) {
						$("#button")
								.append(
										"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()'; >&laquo;</a></li>"
												+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn'   onclick='PageClick(this);'>"
												+ (btnindex + 1)
												+ "</a></li>"
												+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
					} else if (count > 5 && count <= 10) {

						$("#button")
								.append(
										"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()';  > &laquo;</a></li>"
												+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' onclick='PageClick(this);'>"
												+ (btnindex + 1)
												+ "</a></li>"
												+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' onclick='PageClick(this);'>"
												+ (btnindex + 2)
												+ "</a></li>"
												+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
					} else if (count > 10 && count <= 15) {

						$("#button")
								.append(
										"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()';  > &laquo;</a></li>"
												+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn'  onclick='PageClick(this);'>"
												+ (btnindex + 1)
												+ "</a></li>"
												+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' onclick='PageClick(this);'>"
												+ (btnindex + 2)
												+ "</a></li>"
												+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' onclick='PageClick(this);'>"
												+ (btnindex + 3)
												+ "</a></li>"
												+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
					} else if (count > 15 && count <= 20) {
						$("#button")
								.append(
										"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()';  > &laquo;</a></li>"
												+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' onclick='PageClick(this);'>"
												+ (btnindex + 1)
												+ "</a></li>"
												+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn'  onclick='PageClick(this);'>"
												+ (btnindex + 2)
												+ "</a></li>"
												+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn'  onclick='PageClick(this);'>"
												+ (btnindex + 3)
												+ "</a></li>"
												+ "<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' onclick='PageClick(this);'>"
												+ (btnindex + 4)
												+ "</a></li>"
												+

												"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");
					} else if (count > 20 && count <= 25) {

						$("#button")
								.append(
										"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()';  > &laquo;</a></li>"
												+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn'  onclick='PageClick(this);'>"
												+ (btnindex + 1)
												+ "</a></li>"
												+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn'  onclick='PageClick(this);'>"
												+ (btnindex + 2)
												+ "</a></li>"
												+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn'  onclick='PageClick(this);'>"
												+ (btnindex + 3)
												+ "</a></li>"
												+ "<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' onclick='PageClick(this);'>"
												+ (btnindex + 4)
												+ "</a></li>"
												+ "<li class='page-item' id='quinaryli'><a class='page-link' id = 'quinarybtn' onclick='PageClick(this);'>"
												+ (btnindex + 5)
												+ "</a></li>"
												+ "<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>");

					} else {
						$("#button")
								.append(
										"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()';  > &laquo;</a></li>"
												+ "<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn'  onclick='PageClick(this);'>"
												+ (btnindex + 1)
												+ "</a></li>"
												+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn'  onclick='PageClick(this);'>"
												+ (btnindex + 2)
												+ "</a></li>"
												+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn'  onclick='PageClick(this);'>"
												+ (btnindex + 3)
												+ "</a></li>"
												+ "<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' onclick='PageClick(this);'>"
												+ (btnindex + 4)
												+ "</a></li>"
												+ "<li class='page-item' id='quinaryli'><a class='page-link' id = 'quinarybtn'  onclick='PageClick(this);'>"
												+ (btnindex + 5)
												+ "</a></li>"
												+ "<li class='page-item' id='right'><a class='page-link'  onclick='RightPageChange()'; > &raquo;</a></li>");
					}

				}

			});

	var start = parseInt(parseInt(tb.innerText) / 5);
	btnindex = (start + 1) * 5;
	$
			.ajax({
				url : "${rootPath}/api/restaurant/page/" + (btnindex + 1),
				type : "get",
				data : {

					"location" : location,
					"value1" : value1,
					"select" : select,
					"value2" : value2
				},
				dataType : "JSON",
				contentType : "applicaton/json; charset=utf-8",

				success : function(response) {

					var idxcount;

					setMarkers(null);
					markers = [];
					for (idx in response) {

						idxcount = idx;

						if (idx == 0) {
							mapoption(response[idx].restaurantLatitude,
									response[idx].restaurantLongtitude);
						}
						markerinput(response[idx].restaurantLatitude,
								response[idx].restaurantLongtitude,
								response[idx].restaurantName);
						//   storepicture1
						//   storetitle5
						//   mainmenu1
						//   juso1
						//   avgvalue1

						$('#storetitle' + idx).text(
								response[idx].restaurantName); // a태그 text변경
						$('#storetitle' + idx).attr(
								"href",
								"${rootPath}/restaurant/detail?id="
										+ response[idx].restaurantNo) // a 태그 href 변경
						$('#mainmenu' + idx).text(
								response[idx].restaurantMenu);
						$('#juso' + idx).text(
								response[idx].restaurantAddress);
						reviewavg(response[idx].restaurantNo, idx);

					}
					idxcount = Number(idxcount);
					if (idxcount < 4) {
						for (var i = idxcount + 1; i <= 4; i++) {
							document.getElementById(i + "_div").style.display = "none";
						}
					} else {
						for (var i = 0; i <= 4; i++) {
							document.getElementById(i + "_div").style.display = "";
						}
					}

					map.relayout();

				},

			});

}

// ---------------------------------페이징 (left)----------------------------------------------------------

function LeftPageChange() {
	const location = $("#location option:selected").val();
	const value1 = $("#value1").val();
	const select = $("#select option:selected").val();
	const value2 = $("#value2").val();
	var optdata = $("#searchopt option:selected").val();
	var keydata = $("#searchdata").val();

	var tb = document.getElementById("firstbtn");
	var start = parseInt(parseInt(tb.innerText) / 5);
	var count;
	var btnindex;

	$
			.ajax({
				url : "${rootPath}/api/restaurant/count",
				type : "get",
				data : {

					"location" : location,
					"value1" : value1,
					"select" : select,
					"value2" : value2
				},
				dataType : "JSON",
				contentType : "applicaton/json; charset=utf-8",

				success : function(response) {
					count = parseInt(response); //문자를 정수형 숫자로 변환해줌
					count -= parseInt((start + 1) * 50);
					btnindex = ((start - 1) * 5);
					if (btnindex < 0) {
						btnindex = 0;
					}
					$("#button").empty();

					if (btnindex == 0) {
						$("#button")
								.append(
										"<li class='page-item disabled' id='left'><a class='page-link' onclick='LeftPageChange()';> &laquo;</a></li>");
					} else {
						$("#button")
								.append(
										"<li class='page-item' id='left'><a class='page-link' onclick='LeftPageChange()';> &laquo;</a></li>");
					}
					$("#button")
							.append(

									"<li class='page-item ' id='firstli'><a class='page-link' id = 'firstbtn'  onclick='PageClick(this);'>"
											+ (btnindex + 1)
											+ "</a></li>"
											+ "<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn'  onclick='PageClick(this);'>"
											+ (btnindex + 2)
											+ "</a></li>"
											+ "<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn'  onclick='PageClick(this);'>"
											+ (btnindex + 3)
											+ "</a></li>"
											+ "<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn'  onclick='PageClick(this);'>"
											+ (btnindex + 4)
											+ "</a></li>"
											+ "<li class='page-item active' id='quinaryli'><a class='page-link' id = 'quinarybtn'  onclick='PageClick(this);'>"
											+ (btnindex + 5)
											+ "</a></li>"
											+ "<li class='page-item' id='right'><a class='page-link' href ='#' onclick='RightPageChange()'; > &raquo;</a></li>");

				}

			});

	var start = parseInt(parseInt(tb.innerText) / 5);
	btnindex = ((start - 1) * 5) + 5;
	$
			.ajax({
				url : "${rootPath}/api/restaurant/page/" + btnindex,
				type : "get",
				data : {
					"location" : location,
					"value1" : value1,
					"select" : select,
					"value2" : value2
				},
				dataType : "JSON",
				contentType : "applicaton/json; charset=utf-8",

				success : function(response) {
					var idxcount;

					setMarkers(null);
					markers = [];
					for (idx in response) {

						idxcount = idx;

						if (idx == 0) {
							mapoption(response[idx].restaurantLatitude,
									response[idx].restaurantLongtitude);
						}
						markerinput(response[idx].restaurantLatitude,
								response[idx].restaurantLongtitude,
								response[idx].restaurantName);
						//   storepicture1
						//   storetitle5
						//   mainmenu1
						//   juso1
						//   avgvalue1

						$('#storetitle' + idx).text(
								response[idx].restaurantName); // a태그 text변경
						$('#storetitle' + idx).attr(
								"href",
								"${rootPath}/restaurant/detail?id="
										+ response[idx].restaurantNo) // a 태그 href 변경
						$('#mainmenu' + idx).text(
								response[idx].restaurantMenu);
						$('#juso' + idx).text(
								response[idx].restaurantAddress);
						reviewavg(response[idx].restaurantNo, idx);

					}
					idxcount = Number(idxcount);
					if (idxcount < 4) {
						for (var i = idxcount + 1; i <= 4; i++) {
							document.getElementById(i + "_div").style.display = "none";
						}
					} else {
						for (var i = 0; i <= 4; i++) {
							document.getElementById(i + "_div").style.display = "";
						}
					}

					map.relayout();

				}

			});
}
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

<body onload="load()">

</body>
</html>