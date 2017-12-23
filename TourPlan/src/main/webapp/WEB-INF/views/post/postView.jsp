<%@page import="com.yedam.tourplan.plan.service.PlanSearchVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% 
	PlanSearchVO vo = (PlanSearchVO) session.getAttribute("vo");
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href='<c:url value='/'/>resources/js/jquery-ui.min.css'>
<script src='<c:url value='/'/>resources/js/jquery-3.2.1.min.js'></script>
<script src='<c:url value='/'/>resources/js/jquery.form.min.js'></script>
<script src='<c:url value='/'/>resources/js/jquery-ui.min.js'></script>
<style>
    label, input { display:block; }
    input.text { margin-bottom:12px; width:95%; padding: .4em; }
    h1 { font-size: 1.2em; margin: .6em 0; }
    .ui-dialog .ui-state-error { padding: .3em; }
    .validateTips { border: 1px solid transparent; padding: 0.3em; }
</style>
<script>
var plannum = <%=vo.getPlannum()%>;

function onImage() {
	$("#frm1").hide();
	$("#frm2").show();
}
function onPost() {
	$("#frm2").hide();
	$("#frm1").show();
}

$(function() {
	
	$("#frm2").hide();
	
	var p_all;
	var arr = new Array();
	var post = "";
	
	//처음 Post목록 불러오는 ajax
	var param = "plannum=2";	//★★★수정해야함
	$.getJSON("../postAjax/selectPost", param, function(data,status){
		if(status =="success" ) {
			if( data.length > 0) {
				for(i=0; i<data.length; i++) {
					var div = "<div style='border: 1px solid grey; padding: 5px; margin: 5px; width: fit-content;'>" + data[i].post + "</div>"
					$(div).appendTo($("#" + data[i].day + "_" + data[i].tr));
				}
			}
		} else {
			alert(status);
		}
	})	
	
	function firstFunc() {
		if($("#frm1").css("display") != "none") {
			postAdd();
		} else {
			imageAdd();
		}
	}
	
	//insert Ajax & 포스트 추가ui
	function postAdd(){
		var param = '';
		if($("#frm1").css("display") != "none") {
			post = $("#post").val();						//포스트 insert후 추가 위한 변수
			$("#post").val("");	
			param = "post=" + post;						//포스트 입력값 파라미터로 전환
		} else {	
			param =	"post=" + post; 
		}
		param += "&plantablenum=" + arr[0] + "&plannum=" + arr[1] + "&day=" + arr[2] + "&tr=" + arr[3];
		
		dialog.dialog( "close" );
		$.getJSON("../postAjax/insert", param, function(data,status){
			if(status =="success" ) {
					var div = "<div style='border: 1px solid grey; padding: 5px; margin: 5px; width: fit-content;'>" + post + "</div>"
					$(div).appendTo($("#" + arr[2] + "_" + arr[3]));
			} else {
				alert(status);
			}
		});
	}

	function imageAdd(){
		console.log("이미지버튼 클릭");
		$("#frm2").ajaxForm({
			dataType:"json",
			data : {plantablenum: arr[0]},
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
	 
	// Modal 띄우기 위한 버튼
	$( ".postbtn" ).button().on( "click", function() {
	   p_all = $(this).attr("id");
	   arr = p_all.split(",");					//클릭한 위치 알기 위한 버튼 id String split
	   dialog.dialog( "open" );
	});
	
	$("#reload").click(function () {
		location.reload();
	});
	
});
</script>
</head>
<body>

<button id="reload" type="button">새로고침</button>

<!-- Story Start -->
<c:set value="${fn:length(ptList)-1}" var="end" />
<c:set value="${ptList[end].day}" var="day" />
<c:forEach begin="1" end="${day}" varStatus="status">
	<div style="border: 1px solid red;"><font size="5"><b>${status.index} Day</b></font></div>
	<c:forEach items="${ptList}" var="list">
		<c:if test="${list.day == status.index}">
			<c:forEach items="${placeList}" var="listplace">
				<c:if test="${list.placenum == listplace.placenum}">
					<ol>
						<ui><div id="${status.index}_${list.tr}"><div style="border: solid 1px orange;">${list.tr}, ${listplace.placename}</div></ui>
						<ui><button id="${list.plantablenum},${list.plannum},${status.index},${list.tr}" class="postbtn"> Post 쓰기 </button></ui>
		  			</ol>				
				</c:if>		
			</c:forEach>
		</c:if>
	</c:forEach>
	<br>
</c:forEach>
<!-- Story End -->

<!-- Modal Start -->
<div id="dialog-form" title="포스트 쓰기">
  <p class="validateTips"><span style="cursor: pointer;" onclick="onPost();">포스트</span> | <span style="cursor: pointer;" onclick="onImage();">이미지</span></p>
 
  <form id="frm1">
    <fieldset>
      <label for="post">포스트 내용</label>
      <input type="text" name="post" id="post" value="" class="text ui-widget-content ui-corner-all">
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
    </fieldset>
  </form>

  <form id="frm2" method="post" enctype="multipart/form-data">
    <fieldset>
      <label for="uploadFile">이미지 업로드</label>
      <input type="file" id="uploadFile" name="uploadFile"><br />
      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
    </fieldset>
  </form>
</div>
<!-- Modal End -->

</body>
</html>