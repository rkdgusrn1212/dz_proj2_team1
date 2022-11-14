<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tasty Way : 식당 관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- css 초기화 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" href="${rootPath}/resources/css/reset.css">
<link rel="stylesheet"
	href="${rootPath}/resources/css/bootstrap.min.css">
<script src="${rootPath}/resources/js/jquery-3.6.1.min.js"></script>
<!-- css 연결 -->
<link rel="stylesheet" href="${rootPath}/resources/css/jjh.css">
<script>
	$(document)
			.ready(
					function() {
						let i = 2;
						$("#plus")
								.click(
										function() {

											$("#menulist")
													.append(
															'<div class="greenbox" style="width: 250px;">음식명</div>'
																	+ '<input type="text" id = "menu'+i+'" style="width: 400px; height: 50px;"placeholder="메뉴'+ i +'">'
																	+ '<div class="greenbox" style="width: 250px;">가격</div>'
																	+ '<input type="text"  id = "price'+i+'"style="width: 400px; height: 50px; padding: 0;"	placeholder="10000"/>');
											i++;
											if (i > 5) {
												console.log(i);
												$("#plus").off("click");
												$("#menulist")
														.append(
																'<h3 style = "color : red; text-align : center;"> 메뉴 추가는 최대 5개 까지 가능합니다 </h3>')
											}
										});
					});
</script>
</head>
<body = onload="load()	">
	<div class="container"
		style="float: none; margin: 0 auto; margin-top: 100px;">
		<h2 style="text-align: center; margin-bottom: 50px;">점포 등록</h2>


		<div class="row" style="float: none; margin: 0 auto; width: 1300px;">
			<div class="greenbox" style="width: 250px;">점포명</div>
			<input type="text" style="width: 400px; height: 50px;" id="name"
				placeholder="홍콩반점">
			<div class="greenbox" style="width: 250px;">분류</div>
				<input type="text" id="category" style="width: 400px; height: 50px;"
				placeholder="한식">
		</div>	

		<div class="row"
			style="float: none; margin: 0 auto; width: 1300px; max-width: 101%">
			<div class="biggreenbox"
				style="width: 250px; height: 50px; float: left; line-height: 50px;">주소</div>
			<div class="row" style="float: left; width: 1074px;">
				<input type="text" id="address"
					style="width: 1050px; height: 50px; float: left; margin: 0;"
					placeholder="주소검색">
			</div>
		</div>
		<div class="row" style="float: none; margin: 0 auto; width: 1300px;">
			<div class="greenbox" style="width: 250px;">대표 메뉴</div>
			<input type="text" id="menu" style="width: 400px; height: 50px;"
				placeholder="짜장면">
			<div class="greenbox" style="width: 250px; float: left;">연락처</div>
			<input type="text" id="ph" style="width: 400px; height: 50px;"
				placeholder="031-000-0000">
		</div>

		<div class="row" id="menulist"
			style="float: none; margin: 0 auto; width: 1300px;">
			<div class="row"
				style="float: none; margin: 0 auto; width: 1300px; justify-content: space-between; align-items: center;">
				<h5 style="width: 300px;">메뉴 추가</h5>
				<img alt="" id="plus" src="${rootPath}/resources/img/plus.png"
					style="width: 50px; height: 25px;">
			</div>

			<div class="greenbox" style="width: 250px;">음식명</div>
			<input type="text" id="menu1" style="width: 400px; height: 50px;"
				placeholder="짬뽕">
			<div class="greenbox" style="width: 250px;">가격</div>
			<input type="text" id="price1"
				style="width: 400px; height: 50px; padding: 0;" placeholder="10000" />
		</div>

	</div>




	<div class="row"
		style="float: none; margin: 0 auto; width: 1300px; justify-content: center;">
		<input type="submit" class="btn btn-info" value="등록"
			style="width: 150px; height: 50px; float: left; margin: 25px;" onclick="update()"/> <input
			type="reset" class="btn btn-info" value="취소"
			style="width: 150px; height: 50px; float: left; margin: 25px;" />
	</div>


</body>
<script>
function load(){
	   
	 var id = "";
	   id = ${id};
	   if(id !=0 )
	   {
	      var id = "";
	      id = ${id};
	       $.ajax({
	           url : "${rootPath}/api/restaurant/"+id,
	           type : "get",
	           //data : {},
	           dataType : "JSON",
	           contentType : "application/json; charset=utf-8",
	      
	           success: function(response){
	              console.log(response);

	              
	              //$("#regdate").append('작성일 ' + americanDateTime(date))
	              $("#name").val(response.restaurantName);      //text
	              $("#address").val(response.restaurantAddress);      //text
	              $("#category").val(response.restaurantCategory);      //text
	              $("#ph").val(response.restaurantPh);      //text
	              $("#menu").val(response.restaurantMenu);      //text

/* 	              $("#areaBtn").append("<input type='Button' value='수정' id='updateBtn' onclick='update()'  class='btn btn-light submit' style='background-color: #5F5F5F; width: 70px; float: right; color: white;' />");
 */	           }
	       });

	   }
	}

	function update(){
	    const id = ${id};
	       const jobj = new Object();
	       jobj.restaurantName = $('#name').val();
			jobj.restaurantAddress = $('#address').val();
			jobj.restaurantCategory = $('#category').val();
			jobj.restaurantPh = $('#ph').val();
			jobj.restaurantContent = $('#menu').val();
			
	       const jArray = new Array();
	       jArray.push(jobj);
	       const result = JSON.stringify(jobj);
	       
	       console.log(result);
	       $.ajax({
	             url : "${rootPath}/api/restaurant/"+id,
	             type : "patch",
	             data : result,
	             dataType : "json",
	             contentType : "application/json; charset=utf-8"
	             });
	             alert('식당이 수정 되었습니다.');
	             location.href= "${rootPath}/admin/restaurant";
	       }
	
</script>
</html>