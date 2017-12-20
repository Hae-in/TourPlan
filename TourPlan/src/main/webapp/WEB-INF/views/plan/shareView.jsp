<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>투어플랜(TourPlan)-일정만들기 상세</title>
<!-- <link rel="stylesheet" href="../resources/css/dragdrop.css" type="text/css" media="screen"/> -->
<script src='<c:url value='/'/>resources/js/jquery-3.2.1.min.js'></script>
<script src='<c:url value='/'/>resources/js/jquery-ui.min.js'></script>
<script type="text/javascript" src="<c:url value='/'/>resources/js/drag.js"></script>
<script type="text/javascript" src="<c:url value='/'/>resources/js/redips-drag-source.js??v=<%=System.currentTimeMillis()%>"></script>
<script>
/*
 * 1369번째줄★★★★★
 */
	$(function(){
		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
		
		$("#place-item0").dblclick(function() {
			//$("td").eq(1).empty();
		});
		
		/* var td_arr = new Array();
		var td_arr2 = new Array();
		
		$("#submit").on('click','',function(){
			td_arr = $(".go");

			for(i=0; i<td_arr.length; i++) {
				 = $(td_arr[i]).has().attr("id");
			}
			var param = "id=" + $("#id").val();
			$.getJSON("../memberAjax/select", param, function(data,status){
				if(status =="success" ) {
				} else {
					alert(status);
				}
			});
		}); */
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
	margin-top: 20px; 
}
* {
    box-sizing: border-box;
    color: black;
}

div {
	/* border: 0.1px solid black; */
}

.sidenav {
    height: 100%;
    width: 300px;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #ffffff;
    overflow-x: hidden;
    margin-top: 50px;
}

.sidenav a {
    color: black;
    padding: 16px;
    text-decoration: none;
    display: block;
}

.sidenav a:hover {
    background-color: #ddd;
    color: black;
}

.header {
    background-color: #f1f1f1;
    padding: 50px;
    /* text-align: center; */
    margin-left: 300px;
}

.footer {
    background-color: #555;
    padding: 50px;
    text-align: center;
    margin-left: 300px;
}

#planName {
	width: 100%;
	height: 50px;
	margin-bottom: 20px;
}

/*공개여부*/
#isopen {
	float: left;
	/* margin: 5px; */
}

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
	border-radius: 40px;
}

.slider.round:before {
	border-radius: 50%;
}
/*공개여부끝*/

.planCate {
	width: 120px;
}

.tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

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

.tab button:hover {
    background-color: #ddd;
}

.tab button.active {
    background-color: #ccc;
}

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
	width: 100%;
	height: 100%;
}

#table2 tr {
	height: 100px;
}

.redips-drag {
	cursor: move;
	margin: auto;
	z-index: 10;
	color: #222;
	text-align: center;
	font-size: 10pt;
	opacity: 0.7;
	filter: alpha(opacity=70);
	width: 87px;
	height: 20px;
	line-height: 20px;
	border: 1px solid #555;
	border-radius: 3px;
	-moz-border-radius: 3px;
}

div#redips-drag table {
	background-color: #eee;
	border-collapse: collapse;
}

div#redips-drag td {
	border-style: solid;
	border-width: 1px;
	border-color: white;
	height: 32px;
	text-align: center;
	font-size: 10pt;
	padding: 2px;
}

div#redips-drag #table1 td {
	border-width: 0px 0px 1px 0px;
}

div#redips-drag #table1 div {
	margin-left: 5px;
	float: left;
}
/* 
div#redips-drag #table1 input {
	float: right;
	width: 15px;
	height: 23px;
	margin-right: 5px;
	border-width: 1px;
	border-radius: 3px;
	visibility: hidden;
} */

.ar { background-color: #AAC8E2; }
.bi { background-color: #E7D783; }
.ch { background-color: #E99AE6; }

/* trash cell */
.redips-trash {
	color: white;
	background-color: #6386BD;
}

.dark{
	color: #444;
	background-color: #e0e0e0;
}

.button_container{
	padding-top: 10px;
	text-align: right;
}

		/* "Save" button */
		.button_container input{
			background-color: #6A93D4;
			color: white; 
			border-width: 1px;
			width: 40px;
			padding: 0px;
		}
</style>
</head>
<body>
	<div id="main_container">
		<div id="redips-drag">
			<div class="sidenav">
				<!-- 
				<a href="#">Link</a>
				<a href="#">Link</a>
				<a href="#">Link</a>
				-->
				<div id="left">
					<table id="table1" border="1" style="width: 100%;">
						<colgroup>
							<col width="190"/>
						</colgroup>
						<tbody>
							<tr>
								<td class="dark">
									<div id="place_1_" class="redips-drag redips-clone ar">그랜드캐니언</div>
								</td>
							</tr>
	
							<tr>
								<td class="dark">
									<div id="place_2_" class="redips-drag redips-clone bi">쭈꾸미집</div>
								</td>
							</tr>
							<tr>
								<td class="dark">
									<div id="place_3_" class="redips-drag redips-clone ch">고척돔</div>
								</td>
							</tr>
							<tr>
								<td class="dark">
									<div id="place_4_" class="redips-drag redips-clone ar">올림픽공원</div>
								</td>
							</tr>
							<tr>
								<td class="dark">
									<div id="place_5_" class="redips-drag redips-clone ar">올림픽홀</div>
								</td>
							</tr>
							<tr>
								<td class="dark">
									<div id="place_6_" class="redips-drag redips-clone ar">야구경기장</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="header">
				<input type="text" id="planName" placeholder="아까 적은 여행제목 (수정가능)">
				<div class="divContents">
					<div>
						<table border="1">
							<tr>
								<td>출발일</td><td>일수</td><td>인원</td><td>여행테마</td><td>공개여부</td>
							</tr>
							<tr>
								<td><input type="text"></td>
								<td><input type="text"></td>
								<td><input type="text"></td>
								<td><div id="message"></div>
									<input class="planCate" type="button" value="나홀로여행">
									<input class="planCate" type="button" value="친구와여행">
									<input class="planCate" type="button" value="가족여행"> 
									<input class="planCate" type="button" value="단체여행"> 
									<input class="planCate" type="button" value="커플여행"> 
									<input class="planCate" type="button" value="기타">
								</td>
								<td>
									<div id="isopen">
										<label class="switch"> 
											<input type="checkbox"> <span class="slider round"></span>
										</label>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			
			<div class="footer">
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
						<div id="googleMap" style="width: 100%; height: 400px;"></div>
						<script>
							function myMap() {
								var mapProp = {
									center : new google.maps.LatLng(51.508742, -0.120850),
									zoom : 5,
								};
								var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
							}
						</script>
						<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC6-5na3Y2gJSt31kHSeSWZqp3VM1hvgJg&callback=myMap"></script>
						<div id="planList">
							<div id="right">
								<table id="table2" border="1">
									<colgroup>
										<col width="100"/>
										<col width="100"/>
										<col width="100"/>
									</colgroup>
									<tbody>
										<tr>
											<td class="redips-mark dark">Day1</td>
											<td class="redips-mark dark">Day2</td>
											<td class="redips-mark dark">Day3</td>
										</tr>
										<tr>
											<td id="1a0"></td>
											<td id="2a0"></td>
											<td id="3a0"></td>
										</tr>
										<tr>
											<td id="1a1"></td>
											<td id="2a1"></td>
											<td id="3a1"></td>
										</tr>
										<tr>
											<td id="1a2"></td>
											<td id="2a2"></td>
											<td id="3a2"></td>
										</tr>
										<tr>
											<td id="1a3"></td>
											<td id="2a3"></td>
											<td id="3a3"></td>
										</tr>
										<tr>
											<td id="1a4"></td>
											<td id="2a4"></td>
											<td id="3a4"></td>
										</tr>
										<tr>
											<td id="1a5"></td>
											<td id="2a5"></td>
											<td id="3a5"></td>
										</tr>
										<tr>
											<td id="1a6"></td>
											<td id="2a6"></td>
											<td id="3a6"></td>
										</tr>
										<tr>
											<td id="1a7"></td>
											<td id="2a7"></td>
											<td id="3a7"></td>
										</tr>
										<tr>
											<td id="1a8"></td>
											<td id="2a8"></td>
											<td id="3a8"></td>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div id="divBtns">
						<button type="button" id="submit">저장</button>
						<button type="button">공유하기</button>
						<button type="button">취소</button>
						<button type="button" onclick='send("insert", "", 1, 1, 30, 5, 0, 5, 4);'>테스트 day1, tr5번째넣기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- WebSocket Start -->
<script type="text/javascript">
	var textarea = document.getElementById("textarea");
	var xhttp = new XMLHttpRequest();
	
	var webSocket = new WebSocket(
			'ws://localhost:80/tourplan/websocket/sharePlan.do');
	webSocket.onerror = function(event) {
		onError(event)
	};
	webSocket.onopen = function(event) {
		var param = "plannum=1";
		$.getJSON("../planTableAjax/selectPT", param, function(data,status){
			if(status =="success" ) {
				if( data.length > 0) {
					console.log("for문 시작");
					for(i=0; i<data.length; i++) {
						var div = "<div>" + data[i].placenum + "</div>";
						console.log("id값 : " + "#"  + data[i].day + "a" + data[i].tr);
						 $(div).appendTo($("#" + data[i].day + "a" + data[i].tr));
					}
				}
			} else {
				alert(status);
			}
		})
		onOpen(event)
	};
	webSocket.onmessage = function(event) {
		var msg = JSON.parse(event.data);
		
		switch (msg.type) {
		case "insert":
			var div = "<div>" + msg.placenum + "</div>";
			$(div).appendTo($("#"+ msg.day + "a" + msg.tr));
			break;
		case "delete":
			$("#"+ msg.day + "a" + msg.tr).empty();
			break;
		}

		//onMessage(event)
	};
	function onMessage(event) {
		console.log("onMessage");
	}
	
	function onOpen(event) {
		console.log("연결 성공");
	}
	function onError(event) {
		console.log(event);
		alert(event.data);
	}
	function send(v_type, v_plantablenum, v_plannum, v_day, v_staytime, v_sortnum, v_fix, v_tr, v_placenum) {
		console.log("send실행!");
		// 서버로 전송할 데이터를 담을 msg 객체 생성.
		var msg = {
			type : v_type,
			plantablenum : v_plantablenum,
			plannum : v_plannum, 
			day : v_day, 
			staytime : v_staytime, 
			sortnum : v_sortnum, 
			fix : v_fix, 
			tr : v_tr,
			placenum : v_placenum
		};
		//  Send  the msg  object  as  a  JSON-formatted  string.
		webSocket.send(JSON.stringify(msg));
	}

</script>
<!-- WebSocket End -->
</body>
</html>