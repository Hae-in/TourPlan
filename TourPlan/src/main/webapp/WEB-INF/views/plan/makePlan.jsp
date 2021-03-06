<%@page import="com.yedam.tourplan.plan.service.PlanSearchVO"%>
<%@page import="com.yedam.tourplan.plan.service.PlanVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>투어플랜(TourPlan)-일정만들기 상세</title>
<link href="<c:url value='/'/>resources/admin-thema/css/sb-admin.min.css" rel="stylesheet">
<script type="text/javascript" src="../resources/js/redips-drag-min.js"></script>
<script type="text/javascript" src="../resources/js/drag2.js"></script>
<script src='<c:url value='/'/>resources/js/jquery.form.min.js'></script>
<link rel="stylesheet" href="../resources/css/plan.css" type="text/css" media="screen"/>
<script>
var nowNum = 14;
	$(function(){
		document.getElementById("defaultOpen").click();
		
		//왼쪽 장소목록 테이블 출력
		$.ajax({
			url : "<%=request.getContextPath()%>/placeAjax/selectAll.do",
			dataType : "json",
			success : function(data) {
				//받아온 json을 테이블에 출력
				
				for (i = 0; i < data.length; i++) {
					console.log(data[i].imagename);
					$("#tbody").append("<tr><td class='redips-mark lunch'><a href='../place/select.do?num="+data[i].placenum+"' target='_blank'><img width='100px;' height='65px;' src='../resources/images/"+(data[i].imagename == null ? "null.jpg" : data[i].imagename) +"'></a></td><td class='dark'><div lon='"+data[i].lon+"' lat='"+data[i].lat+"' id='place_" + data[i].placenum + "_"+i+"' class='redips-drag redips-clone'>"+data[i].placename+"<br>"+data[i].city+", " +data[i].country+"<br><input class='stay' type='hidden' placeholder='몇 분' value='30' onchange='stayCheck(this);'></div></td></tr>");
					
					if(i > 14) {
						$("#tbody tr:eq("+i+")").hide();	
					}
				}
			}
		});
		
		$('#table2').find('div').each(function(i, e){
			console.log($(this).text());
		});
		
		//오른쪽 일정테이블 칸만큼 post쓰기 생성
		var post_day = $("#day").val();
		for(i=1; i<=post_day; i++) {
			var day_div = "<div id='postDay" + i + "' class='post_day'><font size='5'><b>" + i + " Day</b></font>";
			var table_td = "<td class='redips-mark dark'>Day" + i + "</td>";
			$("#table2 tr:eq(0)").append(table_td);
			for(j=0; j<9; j++) {
				day_div += "<div id='post"+i+"a"+j+"'></div><button id='"+i+"b"+j+"' class='postbtn' style='display:none;'>포스트쓰기</button>";
				table_td = "<td id="+i+"a"+j+" day='"+i+"' tr='"+j+"'></td>"
				$("#table2 tr:eq("+(j+1)+")").append(table_td);
			}
			day_div += "</div>";
			$("#storyTab").append(day_div);
		}
		
	});
	
	////[스토리][일정표] 탭 나눔
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
	
	//장소 검색 함수
	function searchRegionFunction() {
		var input, filter, table, tr, td;
		
		input = $("#searchInput-region");
		filter = input.val().toUpperCase();
		tr = $("#table1 tr");
		
		for(i=0; i<$("#table1 tr div").length; i++) {
			td = $("#table1 tr div:eq("+i+")").text();
			
			if (td.toUpperCase().indexOf(filter) > -1) {
				$("#table1 tr div:eq("+i+")").parent().parent().css("display", "");
			} else {
				$("#table1 tr div:eq("+i+")").parent().parent().css("display", "none");
			}
		}
	}
	
	//달력으로 day추출
	function getDate() {
		var depDate = $("#departuredate").val().split('-');
		var arrDate = $("#arrivaldate").val().split('-');
		var depDateArr = new Date(depDate[0], depDate[1], depDate[2]); 
		var arrDateArr = new Date(arrDate[0], arrDate[1], arrDate[2]); 
		var cal_day = 0;

		var diff = arrDateArr - depDateArr;
 		var currDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨

 		cal_day = parseInt(diff/currDay)+1;
 		$("#day").val(cal_day);
	}
	
	function moreView() {
		var num = nowNum;
		for(i=nowNum+1; i<nowNum+15; i++) {
			$("#tbody tr:eq("+num+")").hide();
			num--;
			$("#tbody tr:eq("+i+")").show();
		}
		nowNum += 15;
	}
	
	function preView() {
		var num = nowNum-15;
		for(i=nowNum; i>nowNum-15; i--) {
			$("#tbody tr:eq("+i+")").hide();
			$("#tbody tr:eq("+num+")").show();
			num--;
		}
		nowNum -= 15;
	}
</script>
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
		<input type="text" id="planName" name="planname" value="" placeholder="제목과 간단한 소개"/>
		<div class="divContents">
				<table class="topTable" border="1">
					<tr class="topTr">
						<td>출발일</td><td>도착일</td><td>day</td><td>인원</td><td>여행테마</td><td>공개여부</td><td>이미지</td>
					</tr>
					<tr>
						<td><input type="date" id="departuredate" name="departuredate" value=""></td>
						<td><input type="date" id="arrivaldate" name="arrivaldate" value="" onchange="getDate()"></td>
						<td><input type="text" id="day" value="3" readonly="readonly"><button type="button" onclick="dayCheck();">변경</button></td>
						<td><input type="text" id="people" name="people" value=""></td>
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
								<label class="switch"> 
									<input id="isopen_ck" type="checkbox" name="is" value="1"><span class="slider round"></span>
								</label>
									<input type="hidden" id="isopen" name="isopen" value="0">
						</td>
						<td>
							<!-- 이미지 업로드 -->
							<div id="upload"></div>
							<form id="frm_img" method="post" enctype="multipart/form-data">
      							<input type="file" name="uploadFile" style="border: 1px solid grey; width: 70%;">
      							<button type="button" onclick="imageAdd();">업로드</button>
  							</form>
							<!-- 이미지 업로드 -->			
						</td>
					</tr>
				</table>
		</div>
	</div>
	<div id="redips-drag">
		<div class="footer">
			<div class="column divNav" style="background-color:whitesmoke;">
				<div id="left">
					<div id="innerLeft">
						<input type="text" class="searchInput" id="searchInput-region" onkeyup="searchRegionFunction()" placeholder="Search.." title="Type in a name">
						<table id="trashTD">
							<tr><td class="redips-trash" title="Trash" id="trashTD"><h3><strong>Trash</strong></h3></td></tr>
						</table>
						<table id="table1" border="1">
							<colgroup id="colgroup">
								<col width="180px"/>
							</colgroup>
							<tbody id="tbody">
								
							</tbody>
						</table>
						<br>
						<button class="btn" onclick="preView();">이전</button>
						<button class="btn" onclick="moreView();">다음</button>
						<br><br>
						<button id="newPlaceBtn" class="btn-default">새장소등록</button>
					</div>
				</div>
			</div>
			<div class="column divMain" style="background-color:whitesmoke;">
				<div class="tab">
					<button class="tablinks" onclick="openTab(event, 'storyTab')">스토리</button>
					<button class="tablinks" onclick="openTab(event, 'planTab')" id="defaultOpen">지도/일정표</button>
				</div>
				<div id="storyTab" class="tabcontent">
				</div>
				<div id="planTab" class="tabcontent">
					<div id="googleMap" style="width: 100%; height: 400px;"></div>
  						  <div id="right-panel"><div>
					<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC6-5na3Y2gJSt31kHSeSWZqp3VM1hvgJg&libraries=places&callback=initMap"></script>
					<div id="planList">
						<div id="right">
							<table id="table2">
								<tbody>
									<tr>
									</tr>
									<tr>
										</tr>
										<tr>
										</tr>
										<tr>
										</tr>
										<tr>
										</tr>
										<tr>
										</tr>
										<tr>
										</tr>
										<tr>
										</tr>
										<tr>
										</tr>
										<tr>
										</tr>
								</tbody>
							</table>
							<div id="addTr" class="dark" style="text-align: center; cursor: pointer; padding: 5px;">칸 추가하기</div>
						</div>
					</div>
				</div>
			</div>
	</div>
	<div id="divBtns" style="padding: 10px 0 10px 0;">
				<table style="width:100%">
					<tr>
						<td style="width: 50%;">
						<span>
						<select id="travel_mode" style="height:50px; width:18%;">
					      <option value="DRIVING">자동차</option>
					      <option value="WALKING">도보</option>
					      <option value="TRANSIT">대중교통</option>
					    </select>
						<input type="text" id="cal_dis" placeholder="day" style="width: 8%; height: 50px;">
						<button type="submit" id="submit" class="cal_btn" style="width: 70%; height: 50px;">거리계산</button>
					</span>
					</td>	
					<td style="width: 50%;">
						<button class="btn btn-primary" type="button" onclick="savePlan();" style="width: 100%; cursor: pointer; height: 50px;">저장하기</button></td>
					</tr>
				</table>
			</div>
		</div>
			<div id="directions-panel"></div>
</div>
</div>
	
<script>
var isSave = false;
var planNum = "";
var memberId = "<%=session.getAttribute("memberid")%>";
var image_num = "";
var post_day = $("#day").val();

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

//Plan image
function imageAdd(){
	if(planNum == "") {
		alert('일정이 먼저 저장되어야 합니다!');
	} else {
		if($("#upload img").length == 0) {
			$("#frm_img").ajaxForm({
				dataType:"json",
				data : {plannum: planNum},
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
			$("#frm_img").ajaxForm({
				dataType:"json",
				data : {plannum: planNum,
						planname: "otherUp"},
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
}

//일정저장
function savePlan() {
	if(memberId == "null") {
		alert('로그인이 필요합니다!');
		return;
	} else {
	
	if($("#isopen_ck:checked").val() == null) {} 
	else { $("#isopen").val("1"); }

	var param2 = "planname=" + $("#planName").val() + "&departuredate=" + $("#departuredate").val() + "&arrivaldate=" + $("#arrivaldate").val()
	+ "&people=" + $("#people").val() + "&categorynum=" + $("#sel").val() + "&isopen=" + $("#isopen").val() + "&state=0&id=" + memberId + "&imagename=" + image_num;
	console.log("makePlan의 param값 : " + param2);
	
	if(isSave == true) {
		param2 += "&plannum=" + planNum;
		$.ajax({
		    url         : '../planAjax/update'
	   		,type        : 'GET'
		   	,data        : param2
	   		,dataType    : 'text'
	   		,success     : function(data,status) {
		       	if (status =="success") {
		    	   	if(data.length > 0) {
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
		    	   		planNum = data;
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
	var day = $("#day").val();
	var tds = new Array();
	var divs = new Array();
	var t = $("#table2 td:last").attr("tr");
	
		for(i=1; i<=day; i++) {
			for(j=0; j<=t; j++) {
				var p = {};
			
				if($("[day='"+i+"'][tr='"+j+"'] div").length == 0) { }
				else {
				
				var div_id = $("[day='"+i+"'][tr='"+j+"'] div").attr("id");
				var divide_place = div_id.split("_")[1];
				var postnum = $("#"+i+"a"+j).attr("postnum");
				var stay_time = $("[day='"+i+"'][tr='"+j+"'] div input").val();
				
				p.day = i;
				p.tr = j;
				p.placenum = divide_place
				p.plannum = planNum;
				p.fix = "0";
				p.sortnum = "5";
				p.staytime = stay_time;
				p.postnum = postnum;
				
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
			    	   	alert("수정 성공"); }
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
	var t = $("#table2 td:last").attr("tr");
	
	if($("#day").val() <= 0) {
		alert("0이하는 설정할 수 없습니다.");
		$("#day").val("1");
	} else if(form_day > last_day) {
		var sub = form_day - last_day;
		
		for(i=1; i<=sub; i++) {
			$("#table2 tr:eq(0)").append("<td class='redips-mark dark'>Day"+(last_day+i)+"</td>");
			for(j=0; j<=t; j++) {
				var append_td = "<td id='" + (last_day+i) + "a" + j + "' day='" + (last_day+i) + "' tr='" + j + "'></td>";
				$("#table2 tr:eq(" + (j+1) + ")").append(append_td);
			}
			
			//포스트도 함께 추가
			var day_div = "<div id='postDay"+(last_day+i)+"' class='post_day'><font size='5'><b>" + (last_day+i) + " Day</b></font>"
			for(j=0; j<=t; j++) {
				day_div += "<div id='post"+(last_day+i)+"a"+j+"' class='post_content'></div><button id='"+(last_day+i)+"b"+j+"' class='postbtn' style='display:none;'>포스트쓰기</button>"
			}
			day_div += "</div>";
			$("#storyTab").append(day_div);
		}
	} else if(form_day < last_day) {
		if(confirm("일정과 포스트도 함께 삭제됩니다 계속하시겠습니까?")) {
			var sub = last_day - form_day;
			for(i=1; i<=sub; i++) {
				$("#table2 tr:eq(0) td:last").remove();
				for(j=0; j<=t; j++) {
					$("#table2 tr:eq(" + (j+1) + ") td:last").remove();
				}
			
				//포스트도 함께 삭제
				$("#storyTab div[id^='postDay']:last").remove();
			}
		} else { $("#day").val(last_day); }
	} else if(form_day == last_day) {
	} else if($("#day").val() > 7) {
		alert('최대 7일까지 가능합니다');
	} else {
		alert('숫자만 입력가능합니다');
		$("#day").val("1");
	}
}

function stayCheck(obj) {
	var regTest = /[0-9]/g;
	var st_time = obj.value;
	
	if(!regTest.test(st_time)) {
		alert("분단위 숫자만 입력가능합니다");
		obj.value = 5;
	}
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

//insert Ajax & 포스트 추가
function postAdd(){
	var param = '';
	if($("#frm1").css("display") != "none") {
		post = $("#post").val();						//포스트 insert후 추가 위한 변수
		$("#post").val("");	
		param = "post=" + post;						//포스트 입력값 파라미터로 전환
	} else {	
		param =	"post=" + post; 
	}
	param += "&plantablenum=&plannum=&day=" + arr[0] + "&tr=" + arr[1];
	
	dialog.dialog( "close" );
	$.getJSON("../postAjax/insert", param, function(data,status){
		if(status =="success" ) {
			var div = "<div style='border: 1px solid grey; padding: 5px; margin: 5px; width: fit-content;'>" + post 
			+ "<span id='postNum"+data+"' class='del_a'>X</span></div>"
			$(div).appendTo($("#post" + arr[0] + "a" + arr[1]));
			
			if($("#"+arr[0]+"a"+arr[1]).attr("postnum") == null || $("#"+arr[0]+"a"+arr[1]).attr("postnum") == '') {
				$("#"+arr[0]+"a"+arr[1]).attr("postnum", data);
			} else {
				var n_temp = $("#"+arr[0]+"a"+arr[1]).attr("postnum");
				$("#"+arr[0]+"a"+arr[1]).attr("postnum", n_temp+","+data); 
			}
		} else {
			alert(status);
		}
	});
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
	$(document).on("click", '.postbtn', function(e) {
		e.stopImmediatePropagation();
		   p_all = $(this).attr("id");
		   arr = p_all.split("b");					//클릭한 위치 알기 위한 버튼 id String split
		   dialog.dialog( "open" );
	});
	
	//동적으로 생성된 태그는 click()이 안먹음 -> on으로 걸어야!
	$(document).on('click', '.del_a',function(e) {
		e.stopImmediatePropagation();
	   var post_temp = $(this).attr("id");
	   var arr = post_temp.split("m");
	   var del_param = "postnum=" + arr[1]; 
	   $.ajax({
		    url         : '../postAjax/delete'
		   ,type        : 'POST'
		   ,dataType    : 'text'
		   ,data		: del_param
		   ,success     : function(data,status) {
		       if (status =="success") {
			    	alert("삭제 성공 ");
			    	
			    	var pt_id = $("#postNum"+data).parent().parent().attr("id");
			    	var temp_arr = new Array();
			    	temp_arr = pt_id.split("t");
			    	pt_id = temp_arr[1];
			    	$("#"+pt_id).attr("postnum", "");
			    	
			    	$("#postNum"+data).parent().remove();
	   		   } else { alert("에러발생 관리자에게 문의하세요") }
	   		}
		});
	});
	
	$(document).on('click', '#addTr', function(e) {
		e.stopImmediatePropagation();
		var add = "<tr>";
		var d = $("#day").val();
		var t = parseInt($("#table2 td:last").attr("tr")) + 1;
		
		for(i=1; i<=d; i++) {
			add += "<td id='"+i+"a"+t+"' day='"+i+"' tr='"+t+"'></td>";
			
			//포스트도 함께 추가
			var postAdd = "<div id='post"+i+"a"+t+"' class='post_content'></div><button id='"+i+"b"+t+"' class='postbtn' style='display:none;'>포스트쓰기</button>";
			$("#postDay"+i).append(postAdd);
		}
		add += "</tr>";
		
		$("#table2").append(add);
	});
})

//구글맵스
var map;
var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
var labelIndex = 0;
var MarkersArray = [];
var MarkersArray2 = [];
var co= [];
var co2= [];
var co3= [];
var co4= [];
var Coordinates;
var color;
var travelPathArray = [];
var travelPathArray2 = [];
var t_mode;

function initMap() {
    var directionsService = new google.maps.DirectionsService;
    var directionsDisplay = new google.maps.DirectionsRenderer;
    map = new google.maps.Map(document.getElementById('googleMap'), {
      zoom: 6,
      center: {lat: 37.249289, lng: 127.076645}
    });
    directionsDisplay.setMap(map);
    
    document.getElementById('submit').addEventListener('click', function() {
 	   calculateAndDisplayRoute(directionsService, directionsDisplay);
    	});
    }

      function calculateAndDisplayRoute(directionsService, directionsDisplay) {
        var waypts = [];
        
        t_mode = $("#travel_mode").val();
        var calcul_day = $("#cal_dis").val();
        var count = $("[day='"+calcul_day+"'] div").length-1;
        var first_div_lat = parseFloat($("[day='"+calcul_day+"'] div:eq(0)").attr("lat"));
        var first_div_lng = parseFloat($("[day='"+calcul_day+"'] div:eq(0)").attr("lon"));
        var last_div_lat = parseFloat($("[day='"+calcul_day+"'] div:eq("+count+")").attr("lat")); 
        var last_div_lng = parseFloat($("[day='"+calcul_day+"'] div:eq("+count+")").attr("lon")); 
    	var wayArr_lat = new Array();
    	var wayArr_lng = new Array();
    	for(i=1; i<$("[day='"+calcul_day+"'] div").length-1; i++) {
    		wayArr_lat[i] = parseFloat($("[day='"+calcul_day+"'] div:eq("+i+")").attr("lat"));
    		wayArr_lng[i] = parseFloat($("[day='"+calcul_day+"'] div:eq("+i+")").attr("lon"));
    		
    		waypts.push({
                location: {lat:wayArr_lat[i],lng:wayArr_lng[i]},
                stopover: true
              });
    	}
    	
        directionsService.route({
          origin: {lat:first_div_lat,lng:first_div_lng},
          destination: {lat:last_div_lat,lng:last_div_lng},
          waypoints: waypts,
          optimizeWaypoints: true,
          travelMode: t_mode
        }, function(response, status) {
          if (status === 'OK') {
            directionsDisplay.setDirections(response);
            //console.log(response);
            var route = response.routes[0];
            var summaryPanel = document.getElementById('directions-panel');
            summaryPanel.innerHTML = '';
            for (var i = 0; i < route.legs.length; i++) {
              var routeSegment = i + 1;
              summaryPanel.innerHTML += '<b>최적경로: ' + routeSegment +
                  '</b><br>';
            	if(i == 0) {
            		summaryPanel.innerHTML += $("[lat='"+first_div_lat+"']").contents().first().text() + ' to ';
            		summaryPanel.innerHTML += $("[lat='"+wayArr_lat[1]+"']").contents().first().text() + ' ';
            		summaryPanel.innerHTML += route.legs[i].distance.text + ' ' + route.legs[i].duration.text + '<br>';
            	}
            	else if(i == route.legs.length-1) {
            		summaryPanel.innerHTML += $("[lat='"+wayArr_lat[count-1]+"']").contents().first().text() + ' to ';
            		summaryPanel.innerHTML += $("[lat='"+last_div_lat+"']").contents().first().text() + ' ';
            		summaryPanel.innerHTML += route.legs[i].distance.text + ' ' + route.legs[i].duration.text + '<br>';
            	}
            	else {
            		summaryPanel.innerHTML += $("[lat='"+wayArr_lat[i]+"']").contents().first().text() + ' to ';
            		summaryPanel.innerHTML += $("[lat='"+wayArr_lat[i+1]+"']").contents().first().text() + ' ';
            		summaryPanel.innerHTML += route.legs[i].distance.text + ' ' + route.legs[i].duration.text + '<br>';
            	}
            }
            
          } else {
            window.alert('구글api내에 데이터가 없습니다.');
          }
        });
      }
	
      function myMap(lat, lon, day, title) {
    	  if(day=='1') { Coordinates = co; color = "#FF0000"; }
    	  else if(day == '2') { Coordinates = co2; color = "#33cc33"; }
    	  else if(day == '3') { Coordinates = co3; color = "#0000ff"; }
    	  else if(day == '4') { Coordinates = co4; color = "#cc33ff"; }
    	  else {}
			var mapLocation = new google.maps.LatLng(lat, lon); // 지도에서 가운데로 위치할 위도와 경도
			var markLocation = new google.maps.LatLng(lat, lon);
			var marker = new google.maps.Marker({
			    position: markLocation,
			    title: title
			});
			Coordinates.push(markLocation);
			MarkersArray.push(marker);
			flightPath();
			for(i = 0; i < MarkersArray.length; i++) {
				MarkersArray[i].setMap(map);
			}
			map.setCenter(markLocation);
		}
		function flightPath(){
			for (i in travelPathArray){
				travelPathArray[i].setMap(null);
			}
			var flightPath = new google.maps.Polyline({
				path: Coordinates,
				strokeColor: color,
				strokeOpacity: 0.5,
				strokeWeight: 3
			});
			travelPathArray.push(flightPath);
			for (var i = 0; i < travelPathArray.length; i++) {
				travelPathArray[i].setMap(map);
		    }
		}
		
		 function myMap2(lat, lon, day, title) {
	    	  if(day=='1') { Coordinates = co; color = "#FF0000"; }
	    	  else if(day == '2') { Coordinates = co2; color = "#33cc33"; }
	    	  else if(day == '3') { Coordinates = co3; color = "#0000ff"; }
	    	  else if(day == '4') { Coordinates = co4; color = "#ff00ff"; }
	    	  else {}
				var mapLocation = new google.maps.LatLng(lat, lon); // 지도에서 가운데로 위치할 위도와 경도
				var markLocation = new google.maps.LatLng(lat, lon);
				var marker = new google.maps.Marker({
				    position: markLocation,
				    title: title
				});
				Coordinates.push(markLocation);
				MarkersArray.push(marker);
				flightPath();
				for(i = 0; i < MarkersArray.length; i++) {
					MarkersArray[i].setMap(map);
				}
				map.setCenter(markLocation);
			}
			function flightPath(){
				for (i in travelPathArray){
					travelPathArray[i].setMap(null);
				}
				var flightPath = new google.maps.Polyline({
					path: Coordinates,
					strokeColor: color,
					strokeOpacity: 0.5,
					strokeWeight: 3
				});
				travelPathArray.push(flightPath);
				for (var i = 0; i < travelPathArray.length; i++) {
					travelPathArray[i].setMap(map);
			    }
			}
		
		function delMarker() {
			for (var i = 0; i < MarkersArray.length; i++) {
				MarkersArray[i].setMap(null);
		    }
			for (var i = 0; i < travelPathArray.length; i++) {
				travelPathArray[i].setMap(null);
		    }
			MarkersArray = [];
			travelPathArray = [];
			co = [], co2 = [], co3 = [];
			
			for(f=0; f<$("#table2 div").length; f++) {
				var day = $("#table2 div:eq("+f+")").parent().attr("day");
				var lat = parseFloat($("#table2 div:eq("+f+")").attr("lat"));
				var lng = parseFloat($("#table2 div:eq("+f+")").attr("lon"));
				var title = $("#table2 div:eq("+f+")").contents().first().text();
				myMap(lat, lng, day, title);
			}
		}
</script>
	
</body>
</html>