<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>일정만들기 상세</title>
<link rel="stylesheet" type="text/css" href="../resources/css/plantable.css">
<script src="../resources/js/jquery-3.2.1.min.js"></script>
<script src="../resources/js/jquery-ui.js"></script>
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
					$("#placeListDiv")
					.append("<div id='placeListItem0"+i+"' class='placeListItem' draggable='true' ondragstart='drag(event)'><hr>" + data[i].placename+ "<br>" + data[i].city+", "+data[i].country + "</div>")
					
					/* 
					.append("<div id='placeListItem"+i+"' draggable='drop(event)' ondragover='allowDrop(eventt)'>")
					.append("명소사진")
					.append(data[i].placename)
					.append(data[i].city+", "+data[i].country)
					.append("<hr></div>"); */
				}
			}
		});
		
		/* function allowDrop(ev) {
		    ev.preventDefault();
		}

		function drag(ev) {
		    ev.dataTransfer.setData("text", ev.target.id);
		}

		function drop(ev) {
		    ev.preventDefault();
		    var data = ev.dataTransfer.getData("text");
		    ev.target.appendChild(document.getElementById(data));
		} */
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
				<div id="placeListDiv" ondrop="drop(event)" ondragover="allowDrop(event)">

				</div>
				<hr>페이징처리
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
						<div id="planList" ondrop="drop(event)" ondragover="allowDrop(event)">
							<div class="prevnext" id="prev">
							<div class="planDay" id="day1">
								<div class="planDayTop">
									<div class="cols" id="prev">Prev</div>
									<div class="cols" id="day1"> 
										<div id="optimizationBtn1" class="optimizationBtn">최적동선</div>day1
										DAY 1
										<div id="dropdown" class="dropdownBtn">
											<div id="dropbtn"></div>
											<div id="dropdown-content">
												<a href="#">뒤로이동</a>
												<a href="#">앞에추가</a>
												<a href="#">뒤에추가</a>
												<a href="#">삭제</a>
											</div>
										</div>
									</div>
									<div class="cols" id="next"> </div>
									
								</div>
								<div class="planDayBottom"></div>
							</div>
							<div class="planDay">day2</div>
							<div class="planDay">day3</div>
							<div class="cols">Next</div>
						</div>
					</div>
				</div>
				<div id="divBtns">
					<button type="submit">저장</button>
					<button type="button">공유하기</button>
					<button type="button">취소</button>
				</div>
			</div>
			<script>
				function allowDrop(ev) {
					ev.preventDefault();
				}

				function drag(ev) {
				    ev.dataTransfer.setData("text", ev.target.id);
				}
	
				function drop(ev) {
				    ev.preventDefault();
				  	var data = ev.dataTransfer.getData("text");
					ev.target.appendChild(document.getElementById(data));
				}
			</script>
		</div>
	</div>
</body>
</html>