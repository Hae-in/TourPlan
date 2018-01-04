<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>투어플랜(TourPlan)-일정만들기 상세</title>
<link rel="stylesheet" href="../resources/css/plantable.css" type="text/css" media="screen"/>
<script type="text/javascript" src="../resources/js/redips-drag-min.js"></script>
<script type="text/javascript" src="../resources/js/drag.js"></script>
<script src='<c:url value='/'/>resources/js/jquery-3.2.1.min.js'></script>
<script src='<c:url value='/'/>resources/js/jquery-ui.min.js'></script>
<script>
	$(function(){
		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
		
		$.ajax({
			url : "<%=request.getContextPath()%>/placeAjax/selectAll.do",
			dataType : "json",
			success : function(data) {
				//받아온 json을 테이블에 출력
				
				for (i = 0; i < data.length; i++) {
					//console.log(data[i].imagename);
					/* $("#tbody").append("<tr><td>"+data[i].imagename+"</td><td><div>"+data[i].placename+"</div><div>"+data[i].city+", "+data[i].country+"</div></td></tr>") */
					//$("#tbody").append("<tr><td class='redips-mark lunch'><img width='100px;' height='65px;' src='../resources/images/"+(data[i].imagename == null ? "null.jpg" : data[i].imagename) +"'></td><td class='dark'><div id='place_" + data[i].placenum + "_"+i+"' class='redips-drag redips-clone'>"+data[i].placename+"<br>"+data[i].city+", " +data[i].country+"</div></td>"+"<td class='lat' style='display: none;'>"+data[i].lat+"</td><td class='lon' style='display: none;'>"+data[i].lon+"</td></tr>");
					//$("#tbody").append("<tr><td class='redips-mark lunch'><img width='100px;' height='65px;' src='../resources/images/"+(data[i].imagename == null ? "null.jpg" : data[i].imagename) +"'></td><td class='dark'><div id='place_" + data[i].placenum + "_"+i+"' class='redips-drag redips-clone'>"+data[i].placename+"<br>"+data[i].city+", " +data[i].country+"</div></td></tr>");
					$("#tbody").append("<tr><td class='redips-mark lunch'><img width='100px;' height='65px;' src='../resources/images/"+(data[i].imagename == null ? "null.jpg" : data[i].imagename) +"'></td><td class='dark'><div lon='"+data[i].lon+"' lat='"+data[i].lat+"' id='place_" + data[i].placenum + "_"+i+"' class='redips-drag redips-clone'>"+data[i].placename+"<br>"+data[i].city+", " +data[i].country+"</div></td></tr>");
				}
			}
		});
	});
	
	function getDate() {
		var depDate = $("#depDate").val().split('-');
		var arrDate = $("#arrDate").val().split('-');
		var depDateArr = new Date(depDate[0], depDate[1], depDate[2]); 
		var arrDateArr = new Date(arrDate[0], arrDate[1], arrDate[2]); 
		var day = 0;
		//console.log(arrd);
		//console.log(arrd1);

		var diff = arrDateArr - depDateArr;
 		var currDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨

 		day = parseInt(diff/currDay)+1;
 		//console.log(day);
 		$("#dayInput").val(day);
	}
	
	function readData() {
		/* // 테이블 읽어오기
		$(".plan-items").each(function(i, item) {
			var tdId = $(this).attr('id');
			var tdIdSubstr = $(this).attr('id').substring(0,1);
			var text = $.trim($(item).html());
			if(text != "") {
				//console.log(i + " : " + tdId);
				//console.log(i + " : " + tdIdSubstr);
				if(tdIdSubstr == 1) {
					console.log(tdIdSubstr + text);
				} 
			} 
		}); */
		
	}
	
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
			td = tr[i].getElementsByTagName("td")[1];
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
</head>
<body>
	<div class="header">
		<input type="text" id="planName" placeholder="아까 적은 여행제목 (수정가능)" />
		<div class="divContents">
			<div>
				<table border="1">
					<tr>
						<td>출발일</td>
						<td>도착일</td>
						<td>일수</td>
						<td>인원</td>
						<td>여행테마</td>
						<td>공개여부</td>
					</tr>
					<tr>
						<td><input type="date" id="depDate" onchange="getDate()"></td>
						<td><input type="date" id="arrDate" onchange="getDate()"></td>
						<td><input type="text" id="dayInput" readonly="readonly"></td>
						<td><input type="number" min="1"></td>
						<td><input class="planCate" type="button" value="나홀로여행">
							<input class="planCate" type="button" value="친구와여행"> <input
							class="planCate" type="button" value="가족여행"> <input
							class="planCate" type="button" value="단체여행"> <input
							class="planCate" type="button" value="커플여행"> <input
							class="planCate" type="button" value="기타"></td>
						<td>
							<div id="isopen">
								<label class="switch"> <input type="checkbox"><span class="slider round"></span>
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
			<div class="column divNav" style="background-color: whitesmoke;">
				<div id="left">
					<div id="innerLeft">
						<input type="text" class="searchInput" id="searchInput-region"
							onkeyup="searchRegionFunction()" placeholder="Search.."
							title="Type in a name">
						<!-- <input type="text" class="searchInput" id="searchInput-place" onkeyup="searchPlaceFunction()" placeholder="Search for place.." title="Type in a name"> -->
						<!-- <div class="redips-trash" title="Trash">Trash</div> -->
						<table id="trashTb">
							<tr>
								<td class="redips-trash" title="Trash" id="trashTD"><h3>
										<strong>Trash</strong>
									</h3></td>
							</tr>
						</table>
						<table id="table1" border="1">
							<colgroup id="colgroup">
								<col width="180px" />
							</colgroup>
							<tbody id="tbody">

							</tbody>
						</table>
						<button id="newPlaceBtn">새장소등록</button>
					</div>
				</div>
			</div>
			<div class="column divMain" style="background-color: whitesmoke;">
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
						var MarkersArray = [];
						var Coordinates= [];
						var travelPathArray = [];
						var map;
						var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
					    var labelIndex = -1;
					    
					    var parameter = []; 
						var day = $("#day").val();
						var tds = new Array();
						var divs = new Array();
						
						function myMap(lat, lon) {
							var mapLocation = new google.maps.LatLng(lat, lon); // 지도에서 가운데로 위치할 위도와 경도
							var markLocation = new google.maps.LatLng(lat, lon);
							var mapProp = {
								center : mapLocation,
								zoom : 18,
								mapTypeId: google.maps.MapTypeId.ROADMAP
							};
							map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
							console.log("label = " + labelIndex);
							var marker = new google.maps.Marker({
							    position: markLocation,
							    title:"Hello World!",
							    label: labels[labelIndex++ % labels.length]
								//삭제하면 라벨링 다시
								
							});
							//console.log("l2" + labelIndex);
							Coordinates.push(mapLocation);
							MarkersArray.push(marker);
							flightPath();
							//console.log(lat);
							// To add the marker to the map, call setMap();
							//marker.setMap(map);
							for(i = 0; i < MarkersArray.length; i++) {
								MarkersArray[i].setMap(map);
							}
						}
						function flightPath(){
							for (i in travelPathArray){
								travelPathArray[i].setMap(null);
							}
							var flightPath = new google.maps.Polyline({
								path: Coordinates,
								strokeColor: "#FF0000",
								strokeOpacity: 0.3,
								strokeWeight: 2
							});
							flightPath.setMap(map);
							travelPathArray.push(flightPath);
						}
					</script>
					<!-- <script class="myMapScript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC6-5na3Y2gJSt31kHSeSWZqp3VM1hvgJg&callback=myMap"></script> -->
					<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC6-5na3Y2gJSt31kHSeSWZqp3VM1hvgJg&callback=myMap"></script>
					<div id="planList">
						<div id="right">
							<table id="table2" border="1">
								<colgroup>
									<col width="100" />
									<col width="100" />
									<col width="100" />
								</colgroup>
								<tbody>
									<tr>
										<td class="redips-mark dark">Day1</td>
										<td class="redips-mark dark">Day2</td>
										<td class="redips-mark dark">Day3</td>
									</tr>
									<tr>
										<td class="table2td"></td>
										<td class="table2td"></td>
										<td class="table2td"></td>
									</tr>
									<tr>
										<td class="table2td"></td>
										<td class="table2td"></td>
										<td class="table2td"></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
									<tr>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
							<div id="divText"></div>
						</div>
					</div>
				</div>
				<div id="divBtns">
					<button type="submit">저장</button>
					<button type="button"
						onclick="window.open('<c:url value='/'/>planTable/shareView.do')">공유하기</button>
					<button type="button">취소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>