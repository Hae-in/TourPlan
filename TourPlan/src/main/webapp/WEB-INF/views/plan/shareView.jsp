<%@page import="com.yedam.tourplan.plantable.service.PlanTableVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	PlanTableVO vo = (PlanTableVO) request.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>투어플랜(TourPlan)-일정만들기 상세</title>
<!-- <link rel="stylesheet" href="../resources/css/dragdrop.css" type="text/css" media="screen"/> -->
<script type="text/javascript" src="<c:url value='/'/>resources/js/header.js"></script>
<script type="text/javascript" src="<c:url value='/'/>resources/js/redips-drag-min.js?v=<%=System.currentTimeMillis()%>"></script>
<script type="text/javascript" src="<c:url value='/'/>resources/js/script.js?v=<%=System.currentTimeMillis()%>"></script>
<script>
 var plannum = <%=vo.getPlannum()%>; 
 
	$(function(){
		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
		
		$.ajax({
			url : "<%=request.getContextPath()%>/placeAjax/selectAll.do",
			dataType : "json",
			success : function(data) {
				//받아온 json을 테이블에 출력
				
				for (i = 0; i < data.length; i++) {
					$("#tbody").append("<tr><td><img width='100px;' src='../resources/images/"+(data[i].imagename == null ? "null.jpg" : data[i].imagename) +"'></td><td class='dark'><div id='place_" + data[i].placenum + "_" + "' class='redips-drag redips-clone'>"+data[i].placename+"<br>"+data[i].city+", " +data[i].country+"</div></td></tr>");
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
	
	function searchRegionFunction() {
		var input, filter, table, tr, td, i;
		input = document.getElementById("searchInput-region");
		filter = input.value.toUpperCase();
		table = document.getElementById("table1");
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[0];
			if (td) {
				if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}       
		}
	}
	
</script>
<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
}

/* Style the header */
.header {
    background-color: #f1f1f1;
    padding: 50px;
    /* text-align: center; */
    /* margin-left: 300px; */
}

/* Container for flexboxes */
.footer {
    display: -webkit-flex;
    display: flex;
}

/* Create three unequal columns that sits next to each other */
.column {
    padding: 10px;
    /* height: 200px; /* Should be removed. Only for demonstration */ */
}

/* Left column */
.column.divNav {
   -webkit-flex: 1;
   -ms-flex: 1;
   flex: 1;
}

/* Middle column */
.column.divMain {
    -webkit-flex: 2;
    -ms-flex: 4;
    flex: 4;
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

.redips-drag {	
	cursor: move;
	margin: auto;
	z-index: 10;
	color: #222;
	text-align: center;
	font-size: 10pt;
	opacity: 0.7;
	filter: alpha(opacity=70);
	width: 180px;	/* table1 td item size */
	height: 50px;
	line-height: 20px;
	border: 1px solid #555;
	border-radius: 3px;
	-moz-border-radius: 3px;
}

div#redips-drag table {
	background-color: #eee; /* table2 background-color */
	border-collapse: collapse;
}

div#redips-drag td {
	border-style: solid;
	border-width: 1px;
	border-color: white;	/* 모든 table td border-color */
	width: 200px;
	height: 60px;
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

.ar { background-color: #AAC8E2; }
.bi { background-color: #E7D783; }
.ch { background-color: #E99AE6; }

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

#searchTable td{
	width: 200px;
}

.searchInput {
  background-image: url('/css/searchicon.png');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}
</style>
</head>
<body>
	<div class="header">
		<input type="text" id="planName" placeholder="아까 적은 여행제목 (수정가능)"/>
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
						<td>
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
									<input type="checkbox"><span class="slider round"></span>
								</label>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div id="redips-drag">
		<div class="footer">
			<div class="column divNav" style="background-color:#aaa;">
				<div id="left">
					<input type="text" class="searchInput" id="searchInput-region" onkeyup="searchRegionFunction()" placeholder="Search.." title="Type in a name">
					<!-- <input type="text" class="searchInput" id="searchInput-place" onkeyup="searchPlaceFunction()" placeholder="Search for place.." title="Type in a name"> -->
					<table id="table1" border="1">
						<colgroup id="colgroup">
							<col width="180px"/>
						</colgroup>
						<tbody id="tbody">
							
						</tbody>
					</table>
					<button id="newPlaceBtn">새장소등록</button>
				</div>
			</div>
			<div class="column divMain" style="background-color:#bbb;">
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
								</tbody>
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
	
<!-- WebSocket Start -->
<script type="text/javascript">
	var textarea = document.getElementById("textarea");
	var xhttp = new XMLHttpRequest();
	
	//★★★포트바꿔야!
	var webSocket = new WebSocket(
			'ws://localhost:80/tourplan/websocket/sharePlan.do');
	webSocket.onerror = function(event) {
		onError(event)
	};
	webSocket.onopen = function(event) {
		var param = "plannum=2";
		
		$.ajax({
			url : "../placeAjax/selectAll.do",
			dataType : "json",
			success : function(data_place) {
				
				$.getJSON("../planTableAjax/selectPT", param, function(data,status){
					if(status =="success" ) {
						if( data.length > 0) {
							
							for(i=0; i<data.length; i++) {
								
								for(j=0; j<data_place.length; j++) {
									if(data[i].placenum == data_place[j].placenum) {
										break;
									}
								}
								
								//var div = "<div>" + data[i].placenum + "</div>";
								var div = "<div id='place_" + data[i].placenum + "_" + data[i].plantablenum + "' class='redips-drag'>" + data_place[j].placename + "<br>" + data_place[j].city + ", " + data_place[j].country+ "</div>";
								console.log("id값 : " + "#"  + data[i].day + "a" + data[i].tr);
								 $(div).appendTo($("#" + data[i].day + "a" + data[i].tr));
							}
						}
					} else {
						alert(status);
					}
				});
				
			}
		});
		
		onOpen(event)
	};
	webSocket.onmessage = function(event) {
		var msg = JSON.parse(event.data);
		
		switch (msg.type) {
		case "insert":
			if($("#"+ msg.day + "a" + msg.tr + " div").length == 0) {
				console.log("노자식");
				
				//복제
				var div = $("#place_" + msg.placenum + "_").get(0);
				var copy_div = REDIPS.drag.cloneObject(div, true);
				
				//복제품 속성부여
				$(copy_div).attr("class", 'redips-drag');
				$(copy_div).attr("id", $(div).attr("id") + msg.plantablenum);
				
				//복제품 변수에 담기
				var idid = $(copy_div).attr("id"); 
				var parent = $("#"+ msg.day + "a" + msg.tr).get(0);
				
				//복제품 부모에게 이동
				REDIPS.drag.moveObject({
				    id: idid,
				    target: parent
				});
				
			} else {
				var div = $("#"+ msg.day + "a" + msg.tr + " div");
				var arr = new Array();
				arr = div.attr("id").split("_");
				var id = arr[0] + "_" + arr[1] + "_" + msg.plantablenum;
				
				div.attr("id", id)
				console.log("자식있는 아이디값 : " + id);
			}
			break;
			
			
			/* $("#"+ msg.day + "a" + msg.tr).empty();
			var div = "<div id='place_" + msg.placenum + "_" + msg.plantablenum + "' class='redips-drag'>" + msg.child1 +"<br>"+ msg.child2 + "</div>";
			//★★★add drag event해줘야..
			REDIPS.drag.enableDrag(true, "place_" + msg.placenum + "_" + msg.plantablenum);
			$(div).appendTo($("#"+ msg.day + "a" + msg.tr)); */
			
			break;
		case "update":
			if($("#"+ msg.day + "a" + msg.tr + " div").length == 0) {
			
				var div = $("#" + msg.willmove + " div");
				$(div).appendTo($("#"+ msg.day + "a" + msg.tr));
				$("#" + msg.willmove).empty();
				
			} else {
				console.log($("#"+ msg.day + "a" + msg.tr + " div"));
				console.log("밑에 if실행");
			}
			break;
		case "delete":
			console.log("delete의 plantablenum : " + msg.plantablenum);
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
	function send(v_type, v_plantablenum, v_plannum, v_day, v_staytime, v_sortnum, v_fix, v_tr, v_placenum, v_child1, v_child2, v_willMove) {
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
			placenum : v_placenum,
			child1 : v_child1,
			child2 : v_child2,
			willmove : v_willMove
		};
		//  Send  the msg  object  as  a  JSON-formatted  string.
		webSocket.send(JSON.stringify(msg));
	}

</script>
<!-- WebSocket End -->
	
</body>
</html>