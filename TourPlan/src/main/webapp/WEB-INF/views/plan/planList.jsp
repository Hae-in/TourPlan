<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정 조회</title>
<link rel="stylesheet"
	href='<c:url value='/'/>resources/js/jquery-ui.min.css'>
<link rel="stylesheet" href="/resources/demos/style.css">
<script src='<c:url value='/'/>resources/js/jquery-3.2.1.min.js'></script>
<script src='<c:url value='/'/>resources/js/jquery-ui.min.js'></script>
<script>
	$(function() {
		$("#slider-range").slider({
			range : true,
			min : 1,
			max : 31,
			values : [ 1, 7 ],
			slide : function(event, ui) {
				$("#amount").val("day" + ui.values[0] + " - day" + ui.values[1]);
			}
		});
		$("#amount").val(
				"day" + $("#slider-range").slider("values", 0) + " - day"
						+ $("#slider-range").slider("values", 1));
		
	//검색버튼 ajax요청
	/* $("#search").on('click','',function(){
		var param = $("form").serialize();
		$.getJSON("../planAjax/selectAll", param, function(data,status){
			if(status =="success" ) {
				if( data.length > 0) {
					$("#contentDiv").hide();
					$("#searchDiv").empty();
					for(i=0; i<data.length; i++) {
						var div = "<div class=\"col-lg-4 portfolio-item\">"
				          + "<div class=\"card h-100\">"
				          + "<a href=\"#\"><img class=\"card-img-top\" src=\"http://placehold.it/700x400\" alt=\"\"></a>"
			              + "<div class=\"card-body\">"
			              + "<h4 class=\"card-title\">"
			              + "<a href=\"#\">" + data[i].planname + "</a>"
			              + "</h4>"
			              + "<p class=\"card-text\">test plan</p>"
			              + "</div></div></div>";
						$(div).appendTo($("#searchDiv"));
					}
				}
			} else {
				alert(status);
			}
		})*/	
	}); 
	
</script>
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
}

/* Style the side navigation */
.sidenav {
	height: 100%;
	width: 270px;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #cccccc;
	overflow-x: hidden;
}

.outContainer {
	position: absolute;
	margin: 25% auto;
}

/* Side navigation links */
.sidenav a {
	color: white;
	padding: 16px;
	text-decoration: none;
	display: block;
}

/* Change color on hover */
.sidenav a:hover {
	background-color: #ddd;
	color: black;
}

/* Style the content */
.content {
	margin-left: 270px;
	padding: 20px;
}

.searchDiv {
	margin-left: 300px;
	padding-left: 20px;
}
.navTable {
	width: 240px;
	margin: 5%;
}
.navTable td {
	width: 200px;
	padding: 5px;
	border: 1px solid #666666;
	background-color : #f2f2f2;
}
</style>
</head>
<body>

	<div class="sidenav">
		<div class="outContainer">
		<form action="../plan/selectAll.do">
			<table class="navTable">
				<tr>
					<td colspan="2"><h4>정렬</h4></td>
				</tr>
				<tr>
					<td><input type="radio" name="plan_sort" value=""
						checked> 최신순<br></td>
					<td><input type="radio" name="plan_sort" value="likecount">
						인기순<br></td>
				</tr>
				<tr>
					<td colspan="2" height="10"></td>
				</tr>
				<tr>
					<td colspan="2"><h4>테마</h4></td>
				</tr>
				<tr>
					<td><input type="radio" id="rd1" name="categorynum" value="categorynum" checked>
						<label for="rd1">
						전체</label></td>
					<td><input type="radio" id="rd2" name="categorynum" value="11">
						<label for="rd2">
						나홀로여행</label></td>
				</tr>
				<tr>
					<td><input type="radio" id="rd3" name="categorynum" value="12">
						<label for="rd3">
						친구와여행</label></td>
					<td><input type="radio" id="rd4" name="categorynum" value="13">
						<label for="rd4">
						가족여행</label></td>
				</tr>
				<tr>
					<td><input type="radio" id="rd5" name="categorynum" value="14">
						<label for="rd5">
						단체여행</label></td>
					<td><input type="radio" id="rd6" name="categorynum" value="15">
						<label for="rd6">
						커플여행</label></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"><h4>기간</h4>
						<div id="slider-range" style="margin: 10px"></div>
							<label for="amount"></label> <input type="text" name="period1" id="amount" readonly
								style="background-color: transparent; border: 0; color: #f6931f; font-weight: bold;">
					</td>
				</tr>
				<tr>
					<td colspan="2"><h4>도시</h4>
					<input type="text" name="city" style="width: 220px; margin: 5px;"/></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><button type="submit">검색</button></td>
				</tr>
			</table>
		</form>
		</div>
	</div>
<div class="content">
<div class="row mb-4">
        <div class="col-md-12">
          <p><h2>여행일정</h2>
        </div>
      </div>
<hr>
<div id="contentDiv" class="row">
<c:forEach items="${planList}" var="plan">
	<div class="col-lg-4 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">${plan.planname}</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
          </div>
        </div>
</c:forEach>
</div>
<div id="searchDiv" class="row">

</div>
</div>
</body>
</html>