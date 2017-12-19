<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정만들기 상세</title>
<script src="../resources/js/jquery-3.2.1.min.js"></script>
<script>
	$(function() {
		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
		
		$.ajax({
			url : "<%=request.getContextPath()%>/placeAjax/selectAll.do",
			dataType : "json",
			success : function(data) {
				//받아온 json을 테이블에 출력
				for(i = 0; i < data.length; i++) {
					$("#placeListTbody")
						/* .append("<tr>") */ 
	 					.append("<td rowspan='2'>" + "사진" + "</td>")
	 					.append("<td>"+ data[i].placename +"</td>")
	 					/* .append("</tr>") */
	 					.append("<tr><td>"+ data[i].city + data[i].country +"</td></tr>");
				}
			}
		});
	});
	function openTab(evt, tabName) {
	    var i, tabcontent, tablinks;
	    tabcontent = document.getElementsByClassName("tabcontent");
	    for (i = 0; i < tabcontent.length; i++) {
	        tabcontent[i].style.display = "none";
	    }
	    tablinks = document.getElementsByClassName("tablinks");
	    for (i = 0; i < tablinks.length; i++) {
	        tablinks[i].className = tablinks[i].className.replace(" active", "");
	    }
	    document.getElementById(tabName).style.display = "block";
	    evt.currentTarget.className += " active";
	}
</script>
<style>
body {
	width: 90%;
	height: 2000px;
	margin: 10px auto 0px auto;
}

div {
	/* border: 1px solid black; */
}

#divTop {
	/* background-color: #578ca9; */
	width: 100%;
	height: 150px;
	border: 1px solid black;
	margin-left: auto;
	margin-right: auto;;
}

#divLeft {
	/* background-color: #F6D155; */
	float: left;
	width: 25%;
	height: 700px;
	/* margin-left: 5px; */
	position: fixed;
	top: 250px;
	border: 1px solid black;
}

#divRight {
	/* background-color: #EDCDC2; */
	float: right;
	width: 70%;
	height: 2000px;
	border: 1px solid black;
	margin-top: 20px;
}

#divTitle {
	margin: 10px;
}

#planName {
	width: 100%;
	height: 50px;
}

#appendDivTitle {
	width: 100%;
	height: 70px;
	/*border: 2px solid red;*/
	margin-top: 10px;
}

#departureDate {
	float: left;
	margin: 5px;
}

#departureDate input {
	height: 30px;
}

#day {
	float: left;
	margin: 5px;
}

#day input {
	height: 30px;
}

#people {
	float: left;
	margin: 5px;
}

#people input {
	height: 30px;
}

#category {
	float: left;
	margin: 5px;
}

#category input {
	height: 34px;
}

#isopen {
	float: left;
	margin: 5px;
}

/*공개여부*/
.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 32px;
}

.switch input {
	display: none;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 24px;
	width: 24px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}
/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}
/*공개여부끝*/
#leftSearchDiv {
	padding: 20px;
}

#placeListDiv {
	margin-top: 20px;
}

#searchRegion, #searchPlace {
	width: 95%;
	padding: 5px;
	margin-top: 5px;
}

#selectCate {
	width: 50%;
	height: 25px;
	margin-top: 5px;
}

#likePlace {
	width: 43%;
	height: 100%;
	margin-top: 5px;
	padding: 5px;
}

#placeList {
	width: 100%;
	/* padding: 5px; */
}

tr {
	height: 50px;
}

#addNewPlace {
	width: 100%;
}

/* Style the tab */
.tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
}

.tablinks {
	width: 50%;
}

#map {
	height: 100%;
}

#planList {
	margin-top: 10px;
}

.planDayTD {
	height: 150px;
}
</style>
</head>
<body>
	<div id="wrap">
		<div id="divTop">
			<div id="divTitle">
				<div>
					<input type="text" id="planName" placeholder="아까 적은 여행제목 (수정가능)">
				</div>
			</div>
			<div id="appendDivTitle">
				<div id="departureDate">
					<label>출발일</label><br> <input type="text">
				</div>
				<div id="day">
					<label>일수</label><br> <input type="text">
				</div>
				<div id="people">
					<label>인원</label><br> <input type="text">
				</div>
				<div id="category">
					<label>여행테마</label><br> 
					<input class="" type="button" value="나홀로여행"> 
					<input type="button" value="친구와여행">
					<input type="button" value="가족여행"> 
					<input type="button" value="단체여행"> 
					<input type="button" value="커플여행"> 
					<input type="button" value="기타">
				</div>
				<div id="isopen">
					<label>공개여부</label><br> <label class="switch"> <input
						type="checkbox"> <span class="slider round"></span>
					</label>
				</div>
			</div>
		</div>
		<div id="divBot">
			<div id="divLeft">
				<div id="leftSearchDiv">
					<div>
						<input id="searchRegion" type="text" placeholder="지역검색:파리 or 프랑스">
					</div>
					<div>
						<input id="searchPlace" type="text" placeholder="명소검색:에펠탑">
					</div>
					<div>
						<select id="selectCate">
							<option selected="selected">전체카테고리</option>
							<option>쇼핑</option>
							<option>역사</option>
							<option>자연</option>
							<option>문화/예술</option>
							<option>체험/이벤트</option>
							<option>음식점</option>
							<option>명소</option>
							<option>숙소</option>
							<option>교통</option>
							<option>기타</option>
						</select> <input id="likePlace" type="text" placeholder="좋아요한장소">
					</div>
				</div>
				<div id="placeListDiv">
					<table id="placeList" border="1" ondrop="drop(event)" ondragover="allowDrop(event)">
						<colgroup>
							<col width="30%">
							<col width="70%">
						</colgroup>
						<tbody id="placeListTbody"></tbody>
					</table>
					페이징처리
				</div>
				<div id="newPlace">
					<input id="addNewPlace" type="button" value="새명소등록">
				</div>
			</div>
			<div id="divRight">
				<div id="divMain">
					<div class="tab">
					  	<button class="tablinks" onclick="openTab(event, 'storyTab')">스토리</button>
					  	<button class="tablinks" onclick="openTab(event, 'planTab')" id="defaultOpen">지도/일정표</button>
					</div>
					<div id="storyTab" class="tabcontent">
					  <h3>storyTab</h3>
					  <p>storyTab is the capital city of England.</p>
					</div>
					<div id="planTab" class="tabcontent">
					  <div id="googleMap" style="width:100%;height:400px;"></div>
						<script>
							function myMap() {
							var mapProp= {
							    center:new google.maps.LatLng(51.508742,-0.120850),
							    zoom:5,
							};
							var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
							}
						</script>
						<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC6-5na3Y2gJSt31kHSeSWZqp3VM1hvgJg&callback=myMap"></script>
						<div>
							<table id="planList" border="1">
								<tr><td class="planDayTD">Day 1</td></tr>
								<tr><td>plan 1</td></tr>
								<tr><td>plan 2</td></tr>
								<tr><td>plan 3</td></tr>
								<tr><td>plan 4</td></tr>
							</table>
						</div>
					</div>
				</div>
				<div id="divBtns">
					<button type="submit">저장</button>
					<button type="button">공유하기</button>
					<button type="button">취소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>