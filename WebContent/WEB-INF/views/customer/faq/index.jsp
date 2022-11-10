<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>



<meta charset="UTF-8">
<title>faq view page</title>

<script defer="defer"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>

<!-- css 초기화 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

<!-- css 연결 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lkc.css">

<!-- 부트스트랩 연결 -->
<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous"> -->



<!-- 반응형 웹 연결 -->
 <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.5.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/prism-okaidia.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/custom.min.css">



</head>



<body onload="load()">
	<br>
	<br>
	<br>


	<div class="maintitle">FAQ</div>
	<br>
	<br>
	<br>
	<br>

	<div class="test">
		<table class="table table-hover" id = "test">
  	<thead>
    <tr>
     
    </tr>
  </thead>
  <tbody>
    
   </tbody>
   
  </table>
	</div>
	
	
	

	<br>










	<!--       --------------------페이지 링크----------------------------------     -->

	<div class="test">
		<ul class="pagination pagination-lg" id="button">

			
		</ul>
	</div>
	<br>




	<!-- -------------------------------------검색기능-------------------------------------------------- -->
   <form name="searchform" method="GET">

      <div class="form-group" style="float: none; margin: 0 auto; width: 525px; margin-bottom: 50px;">
         <select class="form-select" id="searchopt"
            style="width: 100px; float:left;">

            <option value="faqTitle">제목</option>
            <option value="faqContent">내용</option>
         </select>

            <input type="text" id="searchdata" style="width: 300px; float: left; height: 37px; margin-left: 15px;">
            <input type="button" value="검색" class="btn btn-light" style="background-color: #d3d3d3; width: 70px; float: left; margin-left: 15px;" onclick="search()">
            <!-- search를 누르면! --> <br>
         </div>

   </form>
	
	
	<input type="button" onclick="change()" value = "test">

</body>



<script type="text/javascript">






//---------------------------------로드----------------------------------------------------------
















	function load() {

		$.ajax({
			url : "${pageContext.request.contextPath}/api/faq/page/1",
			type : "get",
			//data : {},
			dataType : "JSON",
			contentType : "applicaton/json; charset=utf-8",
			/* success: function(response) {
				$("#result-text").html(JSON.stringify(response));                    
			}, */

			success : function(response) {
				//console.log(response)
				//테이블 비워주기
				$("#test > tbody").empty(); 
				$("#test").append(
				"<tr class='table-primary'><th scope='col'>번호</th>"+
				"<th scope='col'>제목</th>"+
				"<th scope='col'>작성자</th>"+
				"<th scope='col'>작성 날짜</th></tr>")
				for (idx in response) {
					
					
					const date = new Date(response[idx].faqRegDate);

					const options = {
					  year: '2-digit',
					  month: '2-digit',
					  day: '2-digit'
					
					};
					const americanDateTime = new Intl.DateTimeFormat('en-US', options).format;
					console.log(americanDateTime(date));
					
					
					
					//	console.log(response[idx].faqRegDate);

					$("#test").append(
							
							"<tr >" + "<td scope='row'>" + response[idx].faqNo + "</td>" +
							//"<td><a href =javascript:location.href = 'faqdetail?id="+response[idx].faqNo + "'>" + response[idx].faqTitle+ "</a></td>"+
							"<td><a href = ${root}/tastyway/customer/faq/detail?id="
									+ response[idx].faqNo + ">"
									+ response[idx].faqTitle + "</a></td>"
									+ "<td>" + "관리자" + "</td>" + "<td>"
									+ americanDateTime(date)
									+ "</td>" + "</tr>")

				}

			},

		});

		
				$.ajax({
					url : "${pageContext.request.contextPath}/api/faq/count",
					type : "get",
					//data : {},
					dataType : "JSON",
					contentType : "applicaton/json; charset=utf-8",
					/* success: function(response) {
						$("#result-text").html(JSON.stringify(response));                    
					}, */

					success : function(response) {
						console.log(response)
						var count = parseInt(response); //문자를 정수형 숫자로 변환해줌
						$("#button").empty();
						if (count <= 10) {
							$("#button").append(
											"<li class='page-item disabled' id='left'><a class='page-link' >&laquo;</a></li>"+											
											"<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"+										
											"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>"
							);
						} else if (count > 10 && count <= 20) {

							$("#button").append(
											"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"+											
											"<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"+
											"<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"+
											"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>"
							);
						} else if (count > 20 && count <= 30) {

							$("#button").append(
											"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"+											
											"<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"+
											"<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"+
											"<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'> 3</a></li>"+
											"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>"
							);
						} else if (count > 30 && count <= 40) {
							$("#button").append(
											"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"+
											"<li class='page-item active'id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"+
											"<li class='page-item'id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"+
											"<li class='page-item'id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'> 3</a></li>"+
											"<li class='page-item'id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'> 4</a></li>"+
											
											"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>"
							);
						} else if (count > 40 && count <= 50) {

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

	}
	
	
	
	
	
	
	
	
	// ---------------------------------페이지 클릭----------------------------------------------------------
	
	
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
		
		
		
		
		
		
		var optdata = $("#searchopt option:selected").val();
		var keydata = $("#searchdata").val();
		console.log(optdata);
		console.log(keydata);
		if(keydata == null)
		{
			$.ajax({
				url : "${pageContext.request.contextPath}/api/faq/page/"+strText,
				type : "get",
				//data : {},
				dataType : "JSON",
				contentType : "applicaton/json; charset=utf-8",
				/* success: function(response) {
					$("#result-text").html(JSON.stringify(response));                    
				}, */
	
				success : function(response) {
					//console.log(response)
					//테이블 비워주기
					$("#test > tbody").empty(); 
					$("#test").append(
					"<tr  class='table-primary'><th scope='col'>번호</th>"+
					"<th scope='col'>제목</th>"+
					"<th scope='col'>작성자</th>"+
					"<th scope='col'>작성 날짜</th></tr>")
					for (idx in response) {
					
					
					const date = new Date(response[idx].faqRegDate);

					const options = {
					  year: '2-digit',
					  month: '2-digit',
					  day: '2-digit'
					
					};
					const americanDateTime = new Intl.DateTimeFormat('en-US', options).format;
					console.log(americanDateTime(date));
					
					
					
					//	console.log(response[idx].faqRegDate);

					$("#test").append(
							
							"<tr >" + "<td scope='row'>" + response[idx].faqNo + "</td>" +
							//"<td><a href =javascript:location.href = 'faqdetail?id="+response[idx].faqNo + "'>" + response[idx].faqTitle+ "</a></td>"+
							"<td><a href = ${root}/tastyway/customer/faq/detail?id="
									+ response[idx].faqNo + ">"
									+ response[idx].faqTitle + "</a></td>"
									+ "<td>" + "관리자" + "</td>" + "<td>"
									+ americanDateTime(date)
									+ "</td>" + "</tr>")

				}

				},
				
			});
		}
		else{
			$.ajax({
				url : "${pageContext.request.contextPath}/api/faq/page/"+strText,
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
					//테이블 비워주기
					$("#test > tbody").empty(); 
					$("#test").append(
					"<tr  class='table-primary'><th scope='col'>번호</th>"+
					"<th scope='col'>제목</th>"+
					"<th scope='col'>작성자</th>"+
					"<th scope='col'>작성 날짜</th></tr>")
					for (idx in response) {
					
					
					const date = new Date(response[idx].faqRegDate);

					const options = {
					  year: '2-digit',
					  month: '2-digit',
					  day: '2-digit'
					
					};
					const americanDateTime = new Intl.DateTimeFormat('en-US', options).format;
					console.log(americanDateTime(date));
					
					
					
					//	console.log(response[idx].faqRegDate);

					$("#test").append(
							
							"<tr >" + "<td scope='row'>" + response[idx].faqNo + "</td>" +
							//"<td><a href =javascript:location.href = 'faqdetail?id="+response[idx].faqNo + "'>" + response[idx].faqTitle+ "</a></td>"+
							"<td><a href = ${root}/tastyway/customer/faq/detail?id="
									+ response[idx].faqNo + ">"
									+ response[idx].faqTitle + "</a></td>"
									+ "<td>" + "관리자" + "</td>" + "<td>"
									+ americanDateTime(date)
									+ "</td>" + "</tr>")

				}

				},
				
			});
		}
	}

	
	
	
	
	
	
	
	
	
	
	// ---------------------------------검색----------------------------------------------------------
	
	
	
	
	
	
	function search(){
		var optdata = $("#searchopt option:selected").val();
		var keydata = $("#searchdata").val();
		console.log(optdata);
		console.log(keydata);
		$.ajax({
			url : "${pageContext.request.contextPath}/api/faq/page/1",
			type : "get",
			data : {
				
				opt: optdata,
				key: keydata

			},
			dataType : "JSON",
			contentType : "applicaton/json; charset=utf-8",
			
			success : function(response) {
				//console.log(response)
				//테이블 비워주기
				$("#test > tbody").empty(); 
				$("#test").append(
				"<tr  class='table-primary'><th scope='col'>번호</th>"+
				"<th scope='col'>제목</th>"+
				"<th scope='col'>작성자</th>"+
				"<th scope='col'>작성 날짜</th></tr>")
				for (idx in response) {
					
					
					const date = new Date(response[idx].faqRegDate);

					const options = {
					  year: '2-digit',
					  month: '2-digit',
					  day: '2-digit'
					
					};
					const americanDateTime = new Intl.DateTimeFormat('en-US', options).format;
					console.log(americanDateTime(date));
					
					
					
					//	console.log(response[idx].faqRegDate);

					$("#test").append(
							
							"<tr >" + "<td scope='row'>" + response[idx].faqNo + "</td>" +
							//"<td><a href =javascript:location.href = 'faqdetail?id="+response[idx].faqNo + "'>" + response[idx].faqTitle+ "</a></td>"+
							"<td><a href = ${root}/tastyway/customer/faq/detail?id="
									+ response[idx].faqNo + ">"
									+ response[idx].faqTitle + "</a></td>"
									+ "<td>" + "관리자" + "</td>" + "<td>"
									+ americanDateTime(date)
									+ "</td>" + "</tr>")

				}

			},
			
		});
		
		
		$.ajax({
			url : "${pageContext.request.contextPath}/api/faq/count",
			type : "get",
			data : {
				opt: optdata,
				key: keydata
				},
			dataType : "JSON",
			contentType : "applicaton/json; charset=utf-8",


			success : function(response) {
				console.log(response)
				var count = parseInt(response); //문자를 정수형 숫자로 변환해줌
				$("#button").empty();
				if (count <= 10) {
					$("#button").append(
									"<li class='page-item disabled' id='left'><a class='page-link'>&laquo;</a></li>"+											
									"<li class='page-item' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"+										
									"<li class='page-item' id='right'><a class='page-link' > &raquo;</a></li>"
					);
				} else if (count > 10 && count <= 20) {

					$("#button").append(
									"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"+											
									"<li class='page-item' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"+
									"<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"+
									"<li class='page-item' id='right'><a class='page-link' > &raquo;</a></li>"
					);
				} else if (count > 20 && count <= 30) {

					$("#button").append(
									"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"+											
									"<li class='page-item' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"+
									"<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"+
									"<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'> 3</a></li>"+
									"<li class='page-item' id='right'><a class='page-link' > &raquo;</a></li>"
					);
				} else if (count > 30 && count <= 40) {
					$("#button").append(
									"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"+
									"<li class='page-item' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"+
									"<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"+
									"<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'> 3</a></li>"+
									"<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'> 4</a></li>"+
									
									"<li class='page-item' id='right'><a class='page-link' > &raquo;</a></li>"
					);
				} else if (count > 40 && count <= 50) {

					$("#button").append(
									"<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"+
									"<li class='page-item' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"+
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
							"<li class='page-item' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'> 1</a></li>"+
							"<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'> 2</a></li>"+
							"<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'> 3</a></li>"+
							"<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'> 4</a></li>"+
							"<li class='page-item' id='quinaryli'><a class='page-link' id = 'quinarybtn' href ='#' onclick='PageClick(this);'> 5</a></li>"+
							"<li class='page-item' id='right'><a class='page-link' href ='#' onclick='RightPageChange()';> &raquo;</a></li>"
					);
				}
			}
		});
	}
	
	
	
	
	
	
	// ---------------------------------페이징 (right)----------------------------------------------------------
	
	
	
	
	
	
	function RightPageChange(){
		var optdata = $("#searchopt option:selected").val();
		var keydata = $("#searchdata").val();
		console.log(keydata);
		
		var tb = document.getElementById("firstbtn");
		console.log(tb);
		var  start =parseInt(parseInt(tb.innerText)/5);
		console.log(tb.innerText);
		var count;
		var btnindex;
		
		
	
		

		if(keydata == "" || keydata ==null){  // 검색이 아닌 경우
		
			$.ajax({ 
				url : "${pageContext.request.contextPath}/api/faq/count",
				type : "get",
				//data : {},
				dataType : "JSON",
				contentType : "applicaton/json; charset=utf-8",

				success : function(response) {
					console.log(response);
					
				
					count = parseInt(response); //문자를 정수형 숫자로 변환해줌
					
					count -= parseInt((start+1)*50);
					console.log(count);
					console.log(start);
				    btnindex = (start+1)*5;
					
					console.log((start+1)*5);
					$("#button").empty();
					if (count <= 10) {
						$("#button").append(
										"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()'; >&laquo;</a></li>"+											
										"<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 1)+"</a></li>"+										
										"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>"
						);
					} else if (count > 10 && count <= 20) {
	
						$("#button").append(
										"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()';  > &laquo;</a></li>"+											
										"<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 1)+"</a></li>"+
										"<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 2)+"</a></li>"+
										"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>"
						);
					} else if (count > 20 && count <= 30) {
	
						$("#button").append(
										"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()';  > &laquo;</a></li>"+											
										"<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 1)+"</a></li>"+
										"<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 2)+"</a></li>"+
										"<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 3)+"</a></li>"+
										"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>"
						);
					} else if (count > 30 && count <= 40) {
						$("#button").append(
										"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()';  > &laquo;</a></li>"+
										"<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 1)+"</a></li>"+
										"<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 2)+"</a></li>"+
										"<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 3)+"</a></li>"+
										"<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 4)+"</a></li>"+
										
										"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>"
						);
					} else if (count > 40 && count <= 50) {
	
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
				url : "${pageContext.request.contextPath}/api/faq/page/"+(btnindex+1),
				type : "get",
				//data : {},
				dataType : "JSON",
				contentType : "applicaton/json; charset=utf-8",
				
				success : function(response) {
					//console.log(response)
					//테이블 비워주기
					$("#test > tbody").empty(); 
					$("#test").append(
					"<tr  class='table-primary'><th scope='col'>번호</th>"+
					"<th scope='col'>제목</th>"+
					"<th scope='col'>작성자</th>"+
					"<th scope='col'>작성 날짜</th></tr>")
					for (idx in response) {
					
					
					const date = new Date(response[idx].faqRegDate);

					const options = {
					  year: '2-digit',
					  month: '2-digit',
					  day: '2-digit'
					
					};
					const americanDateTime = new Intl.DateTimeFormat('en-US', options).format;
					console.log(americanDateTime(date));
					
					
					
					//	console.log(response[idx].faqRegDate);

					$("#test").append(
							
							"<tr >" + "<td scope='row'>" + response[idx].faqNo + "</td>" +
							//"<td><a href =javascript:location.href = 'faqdetail?id="+response[idx].faqNo + "'>" + response[idx].faqTitle+ "</a></td>"+
							"<td><a href = ${root}/tastyway/customer/faq/detail?id="
									+ response[idx].faqNo + ">"
									+ response[idx].faqTitle + "</a></td>"
									+ "<td>" + "관리자" + "</td>" + "<td>"
									+ americanDateTime(date)
									+ "</td>" + "</tr>")

				}

				},
				
			});
			
			
		}
		
		
		
		
		else{ // 검색버튼인 경우
			$.ajax({
				url : "${pageContext.request.contextPath}/api/faq/count",
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
					console.log(response);
					
				
					count = parseInt(response); //문자를 정수형 숫자로 변환해줌
					
					count -= parseInt((start+1)*50);
					console.log(count);
					btnindex = (start+1)*5;
					
					console.log((start+1)*5);
					$("#button").empty();
					if (count <= 10) {
						$("#button").append(
										"<li class='page-item' id='left' href ='#' onclick='LeftPageChange()'; ><a class='page-link'>&laquo;</a></li>"+											
										"<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 1)+"</a></li>"+										
										"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>"
						);
					} else if (count > 10 && count <= 20) {
	
						$("#button").append(
										"<li class='page-item' id='left' href ='#' onclick='LeftPageChange()'; ><a class='page-link' > &laquo;</a></li>"+											
										"<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 1)+"</a></li>"+
										"<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 2)+"</a></li>"+
										"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>"
						);
					} else if (count > 20 && count <= 30) {
	
						$("#button").append(
										"<li class='page-item' id='left' href ='#' onclick='LeftPageChange()'; ><a class='page-link' > &laquo;</a></li>"+											
										"<li class='page-item active'id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 1)+"</a></li>"+
										"<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 2)+"</a></li>"+
										"<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 3)+"</a></li>"+
										"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>"
						);
					} else if (count > 30 && count <= 40) {
						$("#button").append(
										"<li class='page-item' id='left' href ='#' onclick='LeftPageChange()'; ><a class='page-link' > &laquo;</a></li>"+
										"<li class='page-item active' id='firstli'><a class='page-link' id = 'firstbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 1)+"</a></li>"+
										"<li class='page-item' id='secondli'><a class='page-link' id = 'secondbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 2)+"</a></li>"+
										"<li class='page-item' id='thirdli'><a class='page-link' id = 'thirdbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 3)+"</a></li>"+
										"<li class='page-item' id='fourthli'><a class='page-link' id = 'fourthbtn' href ='#' onclick='PageClick(this);'>"+(btnindex + 4)+"</a></li>"+
										
										"<li class='page-item disabled' id='right'><a class='page-link' > &raquo;</a></li>"
						);
					} else if (count > 40 && count <= 50) {
	
						$("#button").append(
										"<li class='page-item' id='left' href ='#' onclick='LeftPageChange()'; ><a class='page-link' > &laquo;</a></li>"+
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
								"<li class='page-item' id='left'><a class='page-link' href ='#' onclick='LeftPageChange()'; > &laquo;</a></li>"+
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
				url : "${pageContext.request.contextPath}/api/faq/page/" +(btnindex+1),
				type : "get",
				data : {
					
					opt: optdata,
					key: keydata

				},
				dataType : "JSON",
				contentType : "applicaton/json; charset=utf-8",
				
				success : function(response) {
					//console.log(response)
					//테이블 비워주기
					$("#test > tbody").empty(); 
					$("#test").append(
					"<tr  class='table-primary'><th scope='col'>번호</th>"+
					"<th scope='col'>제목</th>"+
					"<th scope='col'>작성자</th>"+
					"<th scope='col'>작성 날짜</th></tr>")
					for (idx in response) {
					
					
					const date = new Date(response[idx].faqRegDate);

					const options = {
					  year: '2-digit',
					  month: '2-digit',
					  day: '2-digit'
					
					};
					const americanDateTime = new Intl.DateTimeFormat('en-US', options).format;
					console.log(americanDateTime(date));
					
					
					
					//	console.log(response[idx].faqRegDate);

					$("#test").append(
							
							"<tr >" + "<td scope='row'>" + response[idx].faqNo + "</td>" +
							//"<td><a href =javascript:location.href = 'faqdetail?id="+response[idx].faqNo + "'>" + response[idx].faqTitle+ "</a></td>"+
							"<td><a href = ${root}/tastyway/customer/faq/detail?id="
									+ response[idx].faqNo + ">"
									+ response[idx].faqTitle + "</a></td>"
									+ "<td>" + "관리자" + "</td>" + "<td>"
									+ americanDateTime(date)
									+ "</td>" + "</tr>")

				}
				},
				
			});
		}
		
		
	
			
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
		
		
		
		
		
		if(keydata == "" || keydata ==null){  // 검색이 아닌 경우
		
			$.ajax({ 
				url : "${pageContext.request.contextPath}/api/faq/count",
				type : "get",
				//data : {},
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
				url : "${pageContext.request.contextPath}/api/faq/page/"+btnindex,
				type : "get",
				//data : {},
				dataType : "JSON",
				contentType : "applicaton/json; charset=utf-8",
				
				success : function(response) {
					//console.log(response)
					//테이블 비워주기
					$("#test > tbody").empty(); 
					$("#test").append(
					"<tr  class='table-primary'><th scope='col'>번호</th>"+
					"<th scope='col'>제목</th>"+
					"<th scope='col'>작성자</th>"+
					"<th scope='col'>작성 날짜</th></tr>")
					for (idx in response) {
					
					
					const date = new Date(response[idx].faqRegDate);

					const options = {
					  year: '2-digit',
					  month: '2-digit',
					  day: '2-digit'
					
					};
					const americanDateTime = new Intl.DateTimeFormat('en-US', options).format;
					console.log(americanDateTime(date));
					
					
					
					//	console.log(response[idx].faqRegDate);

					$("#test").append(
							
							"<tr >" + "<td scope='row'>" + response[idx].faqNo + "</td>" +
							//"<td><a href =javascript:location.href = 'faqdetail?id="+response[idx].faqNo + "'>" + response[idx].faqTitle+ "</a></td>"+
							"<td><a href = ${root}/tastyway/customer/faq/detail?id="
									+ response[idx].faqNo + ">"
									+ response[idx].faqTitle + "</a></td>"
									+ "<td>" + "관리자" + "</td>" + "<td>"
									+ americanDateTime(date)
									+ "</td>" + "</tr>")

				}

				},
				
			});
			
			
		}
		
		
		
		
		else{ // 검색버튼인 경우
			$.ajax({
				url : "${pageContext.request.contextPath}/api/faq/count",
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
			btnindex = ((start-1)*5)+4;
			console.log(tb.innerText);
			console.log(btnindex);
			
			$.ajax({
				url : "${pageContext.request.contextPath}/api/faq/page/"+btnindex,
				type : "get",
				data : {
					
					opt: optdata,
					key: keydata

				},
				dataType : "JSON",
				contentType : "applicaton/json; charset=utf-8",
				
				success : function(response) {
					//console.log(response)
					//테이블 비워주기
					$("#test > tbody").empty(); 
					$("#test").append(
					"<tr  class='table-primary'><th scope='col'>번호</th>"+
					"<th scope='col'>제목</th>"+
					"<th scope='col'>작성자</th>"+
					"<th scope='col'>작성 날짜</th></tr>")
					for (idx in response) {
					
					
					const date = new Date(response[idx].faqRegDate);

					const options = {
					  year: '2-digit',
					  month: '2-digit',
					  day: '2-digit'
					
					};
					const americanDateTime = new Intl.DateTimeFormat('en-US', options).format;
					console.log(americanDateTime(date));
					
					
					
					//	console.log(response[idx].faqRegDate);

					$("#test").append(
							
							"<tr >" + "<td scope='row'>" + response[idx].faqNo + "</td>" +
							//"<td><a href =javascript:location.href = 'faqdetail?id="+response[idx].faqNo + "'>" + response[idx].faqTitle+ "</a></td>"+
							"<td><a href = ${root}/tastyway/customer/faq/detail?id="
									+ response[idx].faqNo + ">"
									+ response[idx].faqTitle + "</a></td>"
									+ "<td>" + "관리자" + "</td>" + "<td>"
									+ americanDateTime(date)
									+ "</td>" + "</tr>")

				}

				},
				
			});
		}
		
		
	
			
	}
	
	
	
	
	
	
	// test
	
	function change(){
		/* "<li class='page-item disabled' id='left'><a class='page-link' > &laquo;</a></li>"+	 */
		
		console.log($("#firstli").hasClass("page-item active"));
		if($("#firstli").hasClass('page-item active') == true)
		{
			$("#firstli").removeClass();
			$("#firstli").addClass('page-item');
		}
		if($("#firstbtn").hasClass('page-item active') == 1)
		if($("#firstbtn").hasClass('page-item active') == 1)
		if($("#firstbtn").hasClass('page-item active') == 1)
		if($("#firstbtn").hasClass('page-item active') == 1)
		
			console.log($("#firstbtn").hasClass("page-item active"));
		$("#left").removeClass();
		$("#left").addClass('page-item');
		var tb = document.getElementById("firstbtn");
		console.log(tb.innerText);
		var  start =parseInt(parseInt(tb.innerText)/5);
		
		
		
		console.log(start);
		console.log("1");
	}
</script>
</html>