<%@page import="com.yedam.tourplan.plan.service.PlanSearchVO"%>
<%@page import="com.yedam.tourplan.plan.service.PlanVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String old_plannum = "no";
	String catenum = "";
	String isopen = "";
	PlanVO old_vo = (PlanVO) request.getAttribute("vo");
	if(old_vo != null) {
		catenum = old_vo.getCategorynum();
		isopen = old_vo.getIsopen();
		old_plannum = old_vo.getPlannum();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>투어플랜(TourPlan)-일정만들기 상세</title>
<script type="text/javascript" src="../resources/js/redips-drag-min.js"></script>
<script type="text/javascript" src="../resources/js/drag2.js"></script>
<script src='<c:url value='/'/>resources/js/jquery.form.min.js'></script>
<script>
var oldPlannum = "<%=old_plannum%>";

	$(function(){
		document.getElementById("defaultOpen").click();
		
		$.ajax({
			url : "<%=request.getContextPath()%>/placeAjax/selectAll.do",
			dataType : "json",
			success : function(data) {
				//받아온 json을 테이블에 출력
				
				for (i = 0; i < data.length; i++) {
					console.log(data[i].imagename);
					$("#tbody").append("<tr><td class='redips-mark lunch'><img width='100px;' height='65px;' src='../resources/images/"+(data[i].imagename == null ? "null.jpg" : data[i].imagename) +"'></td><td class='dark'><div id='place_" + data[i].placenum + "_"+i+"' class='redips-drag redips-clone'>"+data[i].placename+"<br>"+data[i].city+", " +data[i].country+"</div></td></tr>");
				}
			}
		});
		
		if(oldPlannum == "no"){
			console.log("새로만드는일정"); }
		else {
			console.log("이전일정참고");
			//이미 들어가있는 일정 불러오기
			var param = "plannum=" + oldPlannum;
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

			$("#sel > option[value='<%=catenum%>']").attr("selected", "true");
			var isopen = "<%=isopen%>";
			if(isopen == "1") {
				$("#isopen_ck").prop("checked", "true");
			}
			
		}//else
		
		$('#table2').find('div').each(function(i, e){
			console.log($(this).text());
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
<body onunload="f5check();">

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

<!-- Modal Start -->
<div id="dialog-form" title="포스트 쓰기">
  <p class="validateTips"><span style="cursor: pointer;" onclick="onPost();">포스트</span> | <span style="cursor: pointer;" onclick="onImage();">이미지</span></p>
 
  <form id="frm1">
    <fieldset>
      <label for="post">포스트 내용</label>
      <input type="text" name="post" id="post" value="" class="text ui-widget-content ui-corner-all">
      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
    </fieldset>
  </form>

  <form id="frm2" method="post" enctype="multipart/form-data">
    <fieldset>
      <label for="uploadFile">이미지 업로드</label>
      <input type="file" name="uploadFile"><br />
      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
    </fieldset>
  </form>
</div>
<!-- Modal End -->

	<div class="header">
		<input type="text" id="planname" value="${vo.planname}"/>
		<div class="divContents">
			<div>
				<table border="1">
					<tr>
						<td>출발일</td><td>도착일</td><td>day</td><td>인원</td><td>여행테마</td><td>공개여부</td><td>이미지</td>
					</tr>
					<tr>
						<td><input type="text" id="departuredate" name="departuredate" value="${vo.departuredate}"></td>
						<td><input type="text" id="arrivaldate" name="arrivaldate" value="${vo.arrivaldate}"></td>
						<td><input type="text" id="day" value="3" onchange="dayCheck();"></td>
						<td><input type="text" id="people" name="people" value="${vo.people}"></td>
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
							<div>
								<label class="switch"> 
									<input id="isopen_ck" type="checkbox" name="is" value="1"><span class="slider round"></span>
								</label>
									<!-- ★★★form넘기기전 confirm해야 -->
									<input type="hidden" id="isopen" name="isopen" value="0">
							</div>
						</td>
						<td>
							<!-- 이미지 업로드 -->
							<div id="upload"></div>
							<form id="frm_img" method="post" enctype="multipart/form-data">
      							<input type="file" name="uploadFile" style="border: 1px solid grey"><br />
      							<button type="button" onclick="imageAdd();">업로드</button>
  							</form>
							<!-- 이미지 업로드 -->			
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
						<input type="text" class="searchInput" id="searchInput-region" onkeyup="searchRegionFunction()" placeholder="Search.." title="Type in a name">
						<!-- <input type="text" class="searchInput" id="searchInput-place" onkeyup="searchPlaceFunction()" placeholder="Search for place.." title="Type in a name"> -->
						<!-- <div class="redips-trash" title="Trash">Trash</div> -->
						<table id="trashTb">
							<tr><td class="redips-trash" title="Trash" id="trashTD"><h3><strong>Trash</strong></h3></td></tr>
						</table>
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
			</div>
			<div class="column divMain" style="background-color:#bbb;">
				<div class="tab">
					<button class="tablinks" onclick="openTab(event, 'storyTab')">스토리</button>
					<button class="tablinks" onclick="openTab(event, 'planTab')" id="defaultOpen">지도/일정표</button>
				</div>
				<div id="storyTab" class="tabcontent">
					<!-- Stoty tab Start -->

					
					<!-- Stoty tab End -->
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
									<tr>
										<td class="redips-mark dark">Day1</td>
										<td class="redips-mark dark">Day2</td>
										<td class="redips-mark dark">Day3</td>
									</tr>
									<tr>
											<td id="1a0" day="1" tr="0"></td>
											<td id="2a0" day="2" tr="0"></td>
											<td id="3a0" day="3" tr="0"></td>
										</tr>
										<tr>
											<td id="1a1" day="1" tr="1"></td>
											<td id="2a1" day="2" tr="1"></td>
											<td id="3a1" day="3" tr="1"></td>
										</tr>
										<tr>
											<td id="1a2" day="1" tr="2"></td>
											<td id="2a2" day="2" tr="2"></td>
											<td id="3a2" day="3" tr="2"></td>
										</tr>
										<tr>
											<td id="1a3" day="1" tr="3"></td>
											<td id="2a3" day="2" tr="3"></td>
											<td id="3a3" day="3" tr="3"></td>
										</tr>
										<tr>
											<td id="1a4" day="1" tr="4"></td>
											<td id="2a4" day="2" tr="4"></td>
											<td id="3a4" day="3" tr="4"></td>
										</tr>
										<tr>
											<td id="1a5" day="1" tr="5"></td>
											<td id="2a5" day="2" tr="5"></td>
											<td id="3a5" day="3" tr="5"></td>
										</tr>
										<tr>
											<td id="1a6" day="1" tr="6"></td>
											<td id="2a6" day="2" tr="6"></td>
											<td id="3a6" day="3" tr="6"></td>
										</tr>
										<tr>
											<td id="1a7" day="1" tr="7"></td>
											<td id="2a7" day="2" tr="7"></td>
											<td id="3a7" day="3" tr="7"></td>
										</tr>
										<tr>
											<td id="1a8" day="1" tr="8"></td>
											<td id="2a8" day="2" tr="8"></td>
											<td id="3a8" day="3" tr="8"></td>
										</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div id="divBtns">
					<button type="button" onclick="savePlan();">저장하기</button>
					<button type="button">취소</button>
				</div>
			</div>
		</div>
	</div>
	
<script>
var isSave = false;
var plannum = "";
var memberId = "<%=session.getAttribute("memberid")%>";
var image_num = "";

//★★안됨
function f5check() {
	alert("새로고침");
	if(isSave == false) {
		if(confirm("저장하지 않고 페이지이동시 일정이 삭제됩니다. 계속하시겠습니까?"))
			return true;
		else 
			return false;
	}
	else {}
}

function imageAdd(){
	if($("#upload img").length == 0) {
		$("#frm_img").ajaxForm({
			dataType:"json",
			data : {plannum: plannum},
			url:'../planAjax/insertImage',
			success: function(result, textStatus){
				if(result.code == 'success') {
					alert("등록되었습니다.");
					var post = "<img src='<c:url value='/'/>resources/images/" + result.imageName + "' width='100px'>";
					$(post).appendTo($("#upload"));
					image_num = result.imageNum;
				}
			},
			error: function(){
				alert("파일업로드 중 오류가 발생하였습니다.");
				return;
			}
		}).submit();
	} else {
		alert("이미지번호 : " + image_num);
		$("#frm_img").ajaxForm({
			dataType:"json",
			data : {plannum: image_num,
					planname: "update"},
			url:'../planAjax/insertImage',
			success: function(result, textStatus){
				if(result.code == 'success') {
					alert("등록되었습니다.");
					var post = "<img src='<c:url value='/'/>resources/images/" + result.imageName + "' width='100px'>";
					$("#upload").empty();
					$(post).appendTo($("#upload"));
				}
			},
			error: function(){
				alert("파일업로드 중 오류가 발생하였습니다.");
				return;
			}
		}).submit();
	}
}

function savePlan() {
	if(memberId == "null") {
		alert('로그인이 필요합니다!');
		return;
	} else {
	
	if($("#isopen_ck:checked").val() == null) {} 
	else { $("#isopen").val("1"); }

	var param2 = "planname=" + $("#planname").val() + "&departuredate=" + $("#departuredate").val() + "&arrivaldate=" + $("#arrivaldate").val()
	+ "&people=" + $("#people").val() + "&categorynum=" + $("#sel").val() + "&isopen=" + $("#isopen").val() + "&state=0&id=" + memberId + "&imagename=" + image_num;
	console.log("makePlan의 param값 : " + param2);
	
	if(isSave == true) {
		param2 += "&plannum=" + plannum;
		$.ajax({
		    url         : '../planAjax/update'
	   		,type        : 'GET'
		   	,data        : param2
	   		,dataType    : 'text'
	   		,success     : function(data,status) {
		       	if (status =="success") {
		    	   	if(data.length > 0) {
		    		   	alert("수정 성공");
		    	   		alert("update한 plannum : " + data);
		    	   		plannum = data;
		    	   		saveTable();
		    	   		}
	   		   else {
		    			alert("저장에 실패했습니다"); }
   			   	} else { alert("에러발생 관리자에게 문의하세요") }
   			}
		  });
	}
	else {
		$.ajax({
		    url         : '../planAjax/insert'
	   		,type        : 'GET'
		   	,data        : param2
	   		,dataType    : 'text'
	   		,success     : function(data,status) {
		       	if (status =="success") {
		    	   	if(data.length > 0) {
		    		   	alert("저장 성공");
		    	   		alert("insert한 plannum : " + data);
		    	   		plannum = data;
		    	   		saveTable();
		    	   		}
	   		   else {
		    			alert("저장에 실패했습니다"); }
   			   	} else { alert("에러발생 관리자에게 문의하세요") }
   			}
		  });
		}//esle
	}//memberId check else
}//savePlan()

function saveTable() {
	var parameter = []; 
	//★★★day구해야!!
	var day = 3;
	var tds = new Array();
	var divs = new Array();
	
		for(i=1; i<=day; i++) {
			for(j=0; j<9; j++) {
				var p = {};
			
				if($("[day='"+i+"'][tr='"+j+"'] div").length == 0) { }
				else {
				
				var div_id = $("[day='"+i+"'][tr='"+j+"'] div").attr("id");
				var divide_place = div_id.split("_")[1];
				
				p.day = i;
				p.tr = j;
				p.placenum = divide_place
				p.plannum = plannum;
				p.fix = "0";
				p.sortnum = "5";
				p.staytime = "30";
				
				//★★★1227 ajax 포스트넘 가져와서 속성에 넣고 해당 div부를 때 그 속성값 plantableVO로 함께 담음
				//이후 컨트롤러에서 plantable insert후 plannum, plantablenum을 함께 넘겨 post의 plantablenum에 update
				//그러면 select할때 plannum,plantablenum으로 가져올 수 있음
				//만약 2개이상이라면? VO에 배열넣을수있나? 
				//$("#post"+i+"a"+tr)의 포스트num을 가져와야
				parameter.push(p);
			}
		}
	}
	
	if(isSave == true) {
		$.ajax({
		    url         : '../planTableAjax/planUpdate'
		   ,type        : 'POST'
		   ,dataType    : 'json'
		   ,data		: JSON.stringify( parameter )
		   ,contentType	: 'application/json' 
		   ,mimeType: 'application/json'
		   ,success     : function(data,status) {
		       if (status =="success") {
		    	   if(data == true) {
			    	   	alert("저장 성공"); }
		    	   else {
			    		alert("저장에 실패했습니다"); }
	   		   } else { alert("에러발생 관리자에게 문의하세요") }
	   		}
		   	,error: function(result) {
	   		}
		});
	} else {
	
		$.ajax({
		    url         : '../planTableAjax/planInsert'
		   ,type        : 'POST'
		   ,dataType    : 'json'
		   ,data		: JSON.stringify( parameter )
		   ,contentType	: 'application/json' 
		   ,mimeType: 'application/json'
		   ,success     : function(data,status) {
		       if (status =="success") {
		    	   if(data == true) {
			    	   	alert("저장 성공 ");
		    	   		isSave = true;	}
		    	   else {
			    		alert("저장에 실패했습니다"); }
	   		   } else { alert("에러발생 관리자에게 문의하세요") }
	   		}
		   ,error: function(result) {
	   		}
		});
	} //else
}

function dayCheck() {
	console.log("dayCheck실행");
	var last_day = parseInt($("#table2 tr:eq(2) td").length);
	var form_day = parseInt($("#day").val());
	
	if($("#day").val() <= 0) {
		alert("0이하는 설정할 수 없습니다.");
		$("#day").val("1");
	} else if(form_day > last_day) {
		var sub = form_day - last_day;
		for(i=1; i<=sub; i++) {
			$("#table2 tr:eq(0)").append("<td class='redips-mark dark'>Day"+(last_day+i)+"</td>");
			for(j=0; j<9; j++) {
				var append_td = "<td id='" + (last_day+i) + "a" + j + "' day='" + (last_day+i) + "' tr='" + j + "'></td>"
				$("#table2 tr:eq(" + (j+1) + ")").append(append_td);
			}
			
			//포스트도 함께 추가
			var day_div = "<div style='border: 1px solid red;'><font size='5'><b>" + (last_day+i) + " Day</b></font></div>"
			for(j=0; j<9; j++) {
				day_div += "<div id='post"+i+"a"+j+"'></div><button id='"+i+","+j+"' class='postbtn' style='display:none;'>포스트쓰기</button>"
			}
			$("#storyTab").append(day_div);
		}
	} else if(form_day < last_day) {
		if(confirm("일정과 포스트도 함께 삭제됩니다 계속하시겠습니까?")) {
			var sub = last_day - form_day;
			for(i=1; i<=sub; i++) {
				$("#table2 tr:eq(0) td:last").remove();
				for(j=0; j<9; j++) {
					$("#table2 tr:eq(" + (j+1) + ") td:last").remove();
				}
			
				//포스트도 함께 삭제
				$("#storyTab div:last").remove();
			}
		} else { $("#day").val(last_day); }
	} else if(form_day == last_day) {
	} else {
		alert('숫자만 입력가능합니다');
		$("#day").val("1");
	}
}

var post_day = $("#day").val();
for(i=1; i<=post_day; i++) {
	var day_div = "<div id='postDay" + i + "' style='border: 1px solid red;'><font size='5'><b>" + i + " Day</b></font></div>"
	for(j=0; j<9; j++) {
		day_div += "<div id='post"+i+"a"+j+"'></div><button id='"+i+","+j+"' class='postbtn' style='display:none;'>포스트쓰기</button>"
	}
	$("#storyTab").append(day_div);
}


//Post Function
$("#frm2").hide();
	
var p_all = "";
var arr = "";
var post = "";

function onImage() {
	$("#frm1").hide();
	$("#frm2").show();
}

function onPost() {
	$("#frm2").hide();
	$("#frm1").show();
}

function firstFunc() {
	if($("#frm1").css("display") != "none") {
		postAdd();
	} else {
		imageAdd_Post();
	}
}

//insert Ajax & 포스트 추가ui
function postAdd(){
	var param = '';
	if($("#frm1").css("display") != "none") {
		post = $("#post").val();						//포스트 insert후 추가 위한 변수
		$("#post").val("");	
	} else {}
	
	dialog.dialog( "close" );
	var div = "<div style='border: 1px solid grey; padding: 5px; margin: 5px; width: fit-content;'>" + post + "</div>"
	$(div).appendTo($("#post" + arr[0] + "a" + arr[1]));
}
 
function imageAdd_Post(){
	console.log("이미지버튼 클릭");
	$("#frm2").ajaxForm({
		dataType:"json",
		data : {plantablenum: ""},
		url:'../postAjax/insertImage.do',
		success: function(result, textStatus){
			if(result.code == 'success') {
				alert("등록되었습니다.");
				post = "<img src='<c:url value='/'/>resources/images/" + result.imageName + "' width='800px'>";
				postAdd();
			}
		},
		error: function(){
			alert("파일업로드 중 오류가 발생하였습니다.");
			return;
		}
	}).submit();
}

// Modal
dialog = $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 400,
      width: 350,
      modal: true,
      buttons: {
        "저장": firstFunc,
        "취소": function() {
          dialog.dialog( "close" );
        }
      }
    });

$(function () {
// Modal 띄우기 위한 버튼
	$( ".postbtn" ).button().on( "click", function() {
	   p_all = $(this).attr("id");
	   arr = p_all.split(",");					//클릭한 위치 알기 위한 버튼 id String split
	   dialog.dialog( "open" );
	});
})
</script>
	
</body>
</html>