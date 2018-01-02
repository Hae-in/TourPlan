<%@page import="com.yedam.tourplan.plan.service.PlanVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
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
<script type="text/javascript" src="<c:url value='/'/>resources/js/redips-drag-min.js?v=<%=System.currentTimeMillis()%>"></script>
<script type="text/javascript" src="<c:url value='/'/>resources/js/drag2.js"></script>
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
			async : false,
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
							
							/***************************일정표 및 스토리 틀*************************/
							//[일정표]최상단 Day1, Day2, Day3..
							var post_day = $("#day").text();
							var table_top = "<tr>";
							for(d=1; d<=post_day; d++) {
								table_top += "<td class='redips-mark dark'>Day" + d + "</td>";	
							} 
							table_top += "</tr>";
							$("#table2").append(table_top);
							
							//[일정표]그 이하 tr, td 일정만큼 틀 추가
							var last_tr = data[0].tr;
							for(j=0; j<=last_tr; j++) {
								var table_td = "<tr>";
								for(i=1; i<=post_day; i++) {
									table_td += "<td id="+i+"a"+j+"></td>";
								}
								table_td += "</tr>";
								$("#table2").append(table_td);
							}
							
							//[스토리]post 테이블 칸만큼 틀 추가
							for(i=1; i<=post_day; i++) {
								var day_div = "<div id='postDay" + i + "' style='border: 1px solid red;'><font size='5'><b>" + i + " Day</b></font>";
								for(j=0; j<=last_tr; j++) {
									day_div += "<div id='post"+i+"a"+j+"'></div>";
								}
								day_div += "</div>";
								$("#storyTab").append(day_div);
							}
							
							//[스토리]처음 Post목록 불러오는 ajax
							var param_post = "plannum="+plannum;
							$.getJSON("../postAjax/selectPost", param_post, function(data,status){
								if(status =="success" ) {
									if( data.length > 0) {
										for(i=0; i<data.length; i++) {
											var div = "<div style='border: 1px solid grey; padding: 5px; margin: 5px; width: fit-content;'>" + data[i].post + "</div>"
											$("#post" + data[i].day + "a" + data[i].tr).append(div);
										}
									}
								} else {
									alert(status);
								}
							})
							/***************************일정표 및 스토리 틀*************************/
							
							//[일정표]만들어진 tr,td에 데이터넣기
							for(i=0; i<data.length; i++) {
								for(j=0; j<data_place.length; j++) {
									if(data[i].placenum == data_place[j].placenum) {
										break;
									}
								}
								var div = "<div id='place_" + data[i].placenum + "_" + data[i].plantablenum + "' class='redips-drag'>" + data_place[j].placename + "<br>" + data_place[j].city + ", " + data_place[j].country+ "<br>" + data[i].staytime + "분</div>";
								 $(div).appendTo($("#" + data[i].day + "a" + data[i].tr));
								 
								 $("#post"+ data[i].day + "a" + data[i].tr).append("<div style='border: solid 1px orange;'>" + data_place[j].placename + "<br>" + data_place[j].city + ", " + data_place[j].country +  "</div>");
							}
						}
					} else {
						alert(status);
					}
				});
				
			}
		});
		
});
	//[스토리][일정표] 탭 나눔
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

#innerLeft {
	text-align: center;
    border: 1px solid #e0e0e0;
   	padding: 10px;
    background: whitesmoke;
    border-radius: 10px;
}

.btn-default {
  width: 100%;
  padding: 10px 12px;
  font-size: 15px;
  font-weight: normal;
  text-align: center;
  vertical-align: middle;
  cursor: pointer;
  border: 1px solid transparent;
  border-radius: 4px;
  color: #555;
  background-color: #fff;
  border-color: #ccc;
}
.btn-default:hover {
  color: #333;
  background-color: #e6e6e6;
  border-color: #adadad;
  text-decoration:none;
}
.topTable {
	width: 80%;
}
#planname {
	width: 80%;
	height: 45px;
	margin-bottom: 5px;
	font-size: 18px;
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

	<div class="header">
		<input type="text" id="planName" placeholder="${plan.planname}"/>
		<div class="divContents">
			<div>
				<table class="topTable" border="1">
					<tr>
						<td>출발일</td><td>일수</td><td>인원</td><td>여행테마</td><td>이미지</td>
					</tr>
					<tr>
						<td>${plan.departuredate}</td>
						<td id="day">${plan.day}</td>
						<td>${plan.people}</td>
						<td>
							<select id="sel" name="categorynum" disabled>
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
						<c:if test="${not empty m_picture}">
							<img src="<c:url value='/'/>resources/images/${m_picture[0].realfilename}" width='100px' height='100px' style='border-radius: 20px;'>
						</c:if><br>
						<font size="4">${writer.nickname}</font><br><hr>
						<a href="#"><font color='#e60000'>▶잘못된 일정 신고하기</font></a></td>
					</div>
				</div>
			</div>
			<div class="column divMain" style="background-color:#bbb;">
				<div class="tab">
					<button class="tablinks" onclick="openTab(event, 'storyTab')">스토리</button>
					<button class="tablinks" onclick="openTab(event, 'planTab')" id="defaultOpen">지도/일정표</button>
				</div>
				<div id="storyTab" class="tabcontent">
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
								<tbody>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br>
				<div id="divBtns">
					<a href="../plan/modify.do?plannum=<%=vo.getPlannum()%>" class="btn-default">이 일정 참고하기</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>