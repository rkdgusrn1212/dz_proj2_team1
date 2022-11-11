<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tasty Way : Restaurant</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- css 초기화 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" href="${rootPath}/resources/css/reset.css">
<link rel="stylesheet"
	href="${rootPath}/resources/css/bootstrap.min.css">
<script src="${rootPath}/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
const getRestaurantList = (page)=>{
	 $.ajax({
	        url : "${rootPath}/api/restaurant/page/count",		
	        type : "get",
	        dataType : "JSON",
	        contentType : "applicaton/json; charset=utf-8",
	        success: (response)=> {//reponse는 count이다.
	            page = Math.min(response, page);//page가 전체 count보다 크면 count로 바꿔준다.
	            page = Math.max(page,1);//1보다 작을순 없다.
	        	$("#restaurant-pagination").empty();
	            const pStart = Math.max(Math.floor((page-1)/5)*5+1,1);//보여지는 pagination 시작점.
	            $("#restaurant-pagination").append("<li class='page-item"+(pStart<6?" disabled":"")+"'><a class='page-link' href='javascript:getRestaurantList("+(pStart-1)+")'>&laquo;</a>");
	            for(let i = pStart; i<= Math.min(pStart+4,response) ; i++){
	                 $("#restaurant-pagination").append("<li class='page-item"+(i==page?" active":"")+"'><a class='page-link' href='javascript:getRestaurantList("+i+")'>"+i+"</a></li>");
	            }
	            $("#restaurant-pagination").append("<li class='page-item"+(pStart+5>response?" disabled":"")+"'><a class='page-link' href='javascript:getRestaurantList("+(pStart+5)+")'>&raquo;</a></li>");
	            /* 여기에서 page의 리스트 로드 */
	            $.ajax({
	                url : "${rootPath}/api/restaurant/page/"+page,
	                type : "get",
	                dataType : "JSON",
	                contentType : "applicaton/json; charset=utf-8",
	                success: (response)=> {
	                    $("#restaurant-list").empty();
	                    let idx = 0;
	                    for(; idx < response.length; idx++){
	                        const restaurant = response[idx];
	                     
	                        $("#restaurant-list").append(
	                                "<tr><th scope='row' class='text-center text-truncate'>"
	                                +restaurant.restaurantNo+"</th><td class='text-truncate'>"
	                                +"<a href = ${rootPath}/restaurant/detail?id="+restaurant.restaurantNo+ ">"+restaurant.restaurantName+"</td><td class='text-truncate'>"
	                                +restaurant.restaurantPh+"</td><td class='text-truncate'>"+restaurant.restaurantCategory+"</td><td class='text-truncate'>"+restaurant.restaurantMenu
	                                +"</td><td class='text-truncate'>"+restaurant.restaurantSi+"</td><td class='text-truncate'>"+restaurant.restaurantGu+"</td><td class='text-truncate'>"+restaurant.restaurantDong+"</td><td class='text-truncate'>"
	                                +restaurant.restaurantAddress+"</td><td class='text-truncate'>"+restaurant.restaurantLatitude+"</td><td class='text-truncate'>"+restaurant.restaurantLongtitude+"</td>"
	                                
	                        );
	                    }
	                    for(idx ; idx<10; idx++){
	                    	$("#restaurant-list").append("<tr rowspan='2'><th scope='row'>&nbsp;</th><td></td><td></td></tr>");
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
$(document).ready(getRestaurantList(1));
</script>
</head>
<body>
	<div class="row" style="float: none; margin: 0 auto;">
		<table class="table table-hover" id="test" style="text-align: center;">
			<thead>
				<tr class="table-danger">
					<th scope="col" class="col-1 text-center text-truncate">번호</th>
					<th scope="col" class="col-3 text-center text-truncate">식당명</th>
					<th scope="col" class="col-1 text-center text-truncate">전화번호</th>
					<th scope="col" class="col-3 text-center text-truncate">분류</th>
					<th scope="col" class="col-2 text-center text-truncate">대표메뉴</th>
					<th scope="col" class="col-2 text-center text-truncate">시</th>
					<th scope="col" class="col-2 text-center text-truncate">구</th>
					<th scope="col" class="col-2 text-center text-truncate">동</th>
					<th scope="col" class="col-2 text-center text-truncate">주소</th>
					<th scope="col" class="col-2 text-center text-truncate">위도</th>
					<th scope="col" class="col-2 text-center text-truncate">경도</th>

				</tr>
			</thead>
			<tbody id="restaurant-list">

			</tbody>

		</table>
	</div>

	레스토랑 메인이요
	<div class="row" style="margin-top: 50px;">
		<div class="d-flex justify-content-center">
			<ul class="pagination" id="restaurant-pagination">
			</ul>
		</div>
	</div>
</body>
</html>