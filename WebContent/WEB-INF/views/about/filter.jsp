<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filter view</title>
</head>
<body>

	<div class="container"
		style="float: none; margin: 0 auto; width: 500px;">
		<br>
		<div class="row" style="float: none; margin: 0 auto;">
			<div class="btn-group" role="group"
				aria-label="Basic radio toggle button group">
				<input type="radio" class="btn-check" name="btnradio" id="btnradio1"
					autocomplete="off" checked=""> <label
					class="btn btn-outline-primary" for="btnradio1">시</label> <input
					type="radio" class="btn-check" name="btnradio" id="btnradio2"
					autocomplete="off" checked=""> <label
					class="btn btn-outline-primary" for="btnradio2">군</label> <input
					type="radio" class="btn-check" name="btnradio" id="btnradio3"
					autocomplete="off" checked=""> <label
					class="btn btn-outline-primary" for="btnradio3">동</label> <input
					type="text" style="border-color: orange;"></input>

			</div>
		</div>
		<hr>

		<div class="row"
			style="float: none; margin: 0 auto; width: 500px;">
			<form name="searchform" method="GET">
				<div class="form-group" style="max-width: 1300px;">
					<select class="form-select" id="searchopt" name="opt"
						style="width: 100px; float: left;">
						<option value="noticeTitle">식당명</option>
						<option value="noticeTitle">메뉴명</option>
						<option value="noticeContent">분류</option>
					</select>


					<div
						style="margin: auto; align-content: center; margin-bottom: 10px; text-align: center;">
						<input type="text" name="key" id="searchdata"
							style="width: 250px; float: left; margin-left: 15px;"
							class="form-control"> <input type="button" value="검색" 
							class="btn btn-light"
							style="background-color: #d3d3d3; width: 70px; float: left; margin-left: 15px;"
							onclick="search()">
					</div>
				</div>
			</form>
		</div>
	</div><br><br>


</body>
</html>