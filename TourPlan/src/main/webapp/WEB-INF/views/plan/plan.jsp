<%@page import="com.yedam.tourplan.plan.service.PlanVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	response.setHeader("P3P","CP='CAO PSA CONi OTR OUR DEM ONL'"); 
	PlanVO vo = (PlanVO) request.getAttribute("plan");
	String catenum = vo.getCategorynum();
	String isopen = vo.getIsopen();
	String writer = vo.getId();
	String state = vo.getState();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>투어플랜(TourPlan)-일정만들기 상세</title>
<script type="text/javascript" src="<c:url value='/'/>resources/js/header.js"></script>
<script type="text/javascript" src="<c:url value='/'/>resources/js/redips-drag-min.js?v=<%=System.currentTimeMillis()%>"></script>
<script type="text/javascript" src="<c:url value='/'/>resources/js/script.js?v=<%=System.currentTimeMillis()%>"></script>
<script src='<c:url value='/'/>resources/js/jquery.form.min.js'></script>
<script>
var plannum = "<%=vo.getPlannum()%>";
$(function(){
	
	$("#sel > option[value='<%=catenum%>']").attr("selected", "true");
	var isopen = "<%=isopen%>";
	if(isopen == "1") {
		$("#isopen_ck2").prop("checked", "true");
	}
	
	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();
		
		$('#table2').find('div').each(function(i, e){
			console.log($(this).text());
		});
		
		var param = "plannum=" + plannum;
		
		$.ajax({
			url : "../placeAjax/selectAll.do",
			dataType : "json",
			success : function(data_place) {
				
				$.getJSON("../planTableAjax/selectPT", param, function(data,status){
					if(status =="success" ) {
						if( data.length > 0) {
							if(data[0].imagename != null) {
								var img = "<img id='topimg' src='<c:url value='/'/>resources/images/" + data[0].imagename + "' width='100px' style='cursor: pointer;' data-toggle='modal' data-target='#imageModal'>";
								$(img).appendTo($("#upload"));
								img = "<img id='topimg' src='<c:url value='/'/>resources/images/" + data[0].imagename + "' width='100%'>";
								$(img).appendTo($("#imageBody"));
							}
							for(i=0; i<data.length; i++) {
								for(j=0; j<data_place.length; j++) {
									if(data[i].placenum == data_place[j].placenum) {
										break;
									}
								}
								var div = "<div id='place_" + data[i].placenum + "_" + data[i].plantablenum + "' class='redips-drag'>" + data_place[j].placename + "<br>" + data_place[j].city + ", " + data_place[j].country+ "</div>";
								 $(div).appendTo($("#" + data[i].day + "a" + data[i].tr));
							}
						}
					} else {
						alert(status);
					}
				});
				
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

	function isitok() {
		if($("#isopen_ck:checked").val() == null) {
		} else { $("#isopen").val("1"); }
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
   /* position: fixed;
   left: 0px;
   bottom: 0px; */
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
	/* background-color: #eee; /* table2 background-color */ */
	border-collapse: collapse;
}

#table1 td, #table2 td {
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

#trashTb {
	width: 100%;
	height: 50px;
	margin-bottom: 10px;
	text-align: center;
	background-color: #DC4C46;
	color: #fff;
}

</style>
</head>
<body>

<!-- Modal -->
  <div class="modal fade" id="imageModal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">썸네일 이미지</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div id="imageBody" class="modal-body">
        </div>
      </div>
    </div>
  </div>
<!-- Modal End -->

<!-- Modal -->
  <div class="modal fade" id="planModal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">여행일정 만들기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div id="planBody" class="modal-body">
        	<form action="../plan/modify.do" onsubmit="isitok();">
        	<input type="hidden" name="plannum" value="<%=vo.getPlannum()%>">
        	<table>
        		<tr>
        			<td>여행제목</td> <td><input type="text" name="planname" value="간단한 소개"/></td>
        		</tr>
        		<tr>
        			<td>출발일</td> <td><input type="text" name="departuredate"></td>
        		</tr>
        		<tr>
        			<td>도착일</td> <td><input type="text" name="arrivaldate"></td>
        		</tr>
        		<tr>
        			<td>인원</td> <td><input type="text" name="people"></td>
        		</tr>
        		<tr>
        			<td>카테고리</td> <td><select name="categorynum">
        									<option value="11">나홀로여행</option>
				 							<option value="12">친구와여행</option>
  							 				<option value="13">가족여행</option>
						     				<option value="14">단체여행</option>
						     				<option value="15">커플여행</option>
						     				<option value="16">기타</option>
						  				</select></td>
        		</tr>
        		<tr>
        			<td>공개여부</td>
        			<td>
        				<label class="switch"><input id="isopen_ck" type="checkbox" value="1"><span class="slider round"></span></label>
        			</td>
        		</tr>
        		<tr>
        			<td><input type="hidden" name="state" value="0"></td> <td><input id="isopen" type="hidden" name="isopen" value="0"></td>
        		</tr>
        		<tr>
        			<td colspan="2"><button>일정만들기</button></td>
        		</tr>
        	</table>
        	</form>
        </div>
      </div>
    </div>
  </div>
<!-- Modal End -->


	<div class="header">
		<input type="text" id="planName" placeholder="${plan.planname}"/>
		<div class="divContents">
			<div>
				<table border="1">
					<tr>
						<td>출발일</td><td>일수</td><td>인원</td><td>여행테마</td><td>이미지</td>
					</tr>
					<tr>
						<td>${plan.departuredate}</td>
						<td>${plan.day}</td>
						<td>${plan.people}</td>
						<td>
							<select id="sel" name="categorynum">
        						<option value="11">나홀로여행</option>
								<option value="12">친구와여행</option>
  				 				<option value="13">가족여행</option>
			     				<option value="14">단체여행</option>
			     				<option value="15">커플여행</option>
			     				<option value="16">기타</option>
			  				</select>
						</td>
						<td>
							<div id="upload"></div>
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
					<div id="innerLeft">
						<div id="profile">
							<c:if test="${not empty m_picture}">
								<img src="<c:url value='/'/>resources/images/${m_picture[0].realfilename}" width='100px' height='100px' style='border-radius: 20px;'>
							</c:if>
						</div>
						사용자 정보 : ${writer.id}<br>
						${writer.nickname}
					</div>
				</div>
			</div>
			<div class="column divMain" style="background-color:#bbb;">
				<div class="tab">
					<button class="tablinks" onclick="openTab(event, 'storyTab')">스토리</button>
					<button class="tablinks" onclick="openTab(event, 'planTab')" id="defaultOpen">지도/일정표</button>
				</div>
				<div id="storyTab" class="tabcontent">
				<iframe src="<c:url value='/'/>post/select.do?plannum=<%=vo.getPlannum()%>" width="1000px" height="800px;" border="0"></iframe>
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
					<span data-toggle='modal' data-target='#planModal' style="cursor: pointer; background: white;">이 일정 참고하기</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>