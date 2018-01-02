<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href='<c:url value='/'/>resources/css/google_map_place.css' />
<script src='<c:url value='/'/>resources/js/jquery-3.2.1.min.js'></script>
<script>
	$(function() {
		$.ajax({
			url : "../categoryAjax/selectAll.do",
			type : "json",
			success : function(data) {
				var options = "";
				for (i = 0; i < data.length; i++) {
					options += "<option value='" + data[i].categorynum + "'>" + data[i].categoryname + "</option>";
				}
				$("#categorynum").append(options);
				$("#categorynum").val("${place.categorynum}").prop("selected",true);
			}
		});		
		
		$('#fileAdd').click(function(){
			$('#uploadFileArea').append('<input type="file" name="uploadFile">');
		});
		
		$('.fileRemove').click(function(){			
			var filenum = $(this).prev('span').attr('id');
			if($(this).val() == '삭제') {
				$('#frm').append('<input type="text" name="deleteFile" value="'+filenum+'">');
				$(this).val('삭제취소');	
			} else {
				$('input[value="'+filenum+'"]').remove();
				$(this).val('삭제');
			}
			
		});		
	});	
	
</script>
</head>
<body>
<%-- <c:if test="${action == 'success'}">
등록되었습니다.
<script>$(parent.document).find('#upload-form').dialog('close');alert('제어 끝');</script>
</c:if>
 --%>
 <%-- ${place} --%>
<form action="form.do" method="post" enctype="multipart/form-data" id="frm">
<input type="text" name="action" value="${empty param.num ? 'insert':'update'}">
<input type="hidden" name="placenum" value="${place.placenum}">
	<table>		
			<tr>
				<th>명소이름	</th>
				<td><input type="text" name="placename" id="placeName" value="${place.placename}"></td>
				<th>분류
				<td>
					<select name="categorynum" id="categorynum">
						<option value="">선택</option>
					</select> 
				</td> 				 
			</tr>
			<tr>	
				<th>설명</th>
				<td colspan="3"><input type="text" name="content" id="placeContent" value="${place.content}"></td>
			</tr>
			<tr>	
				<th>
					파일첨부
					<input type="button" value="+" id="fileAdd">
				</th>
				<td colspan="3" id="uploadFileArea">	
					<c:forEach items="${files}" var="i">						
						<span id="${i.filenum}">${i.realfilename}</span>						
						<input type="button" value="삭제" class="fileRemove">
						<br/>
					</c:forEach>				
					<input type="file" name="uploadFile">					 
				</td>
			</tr>			
			<tr>	
				<th>주소</th>
				<td colspan="3"><input type="text" name="addr" id="addr" value="${place.addr}"></td>
			</tr>	 
			<tr>	
				<th colspan="4">
					위도 <input type="text" name="lat" id="lat" value="${place.lat}"> 
					경도 <input type="text" name="lon" id="lng" value="${place.lon}">				
					도시 <input type="text" name="city" id="city" value="${place.city}"> 
				 	국가 <input type="text" name="country" id="country" value="${place.country}">
				</th> 	
			</tr>		
	</table>
<input type="submit" value="등록">
</form>	

	
	<input id="pac-input" class="controls" type="text" placeholder="Search Box">
    <div id="map"></div>

    <script src='<c:url value='/'/>resources/js/google_map_place.js'></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB-xnFL2hcyJzAErag4gFM-r6XYWB7VAgc&libraries=places&callback=initAutocomplete"
         async defer></script>
</body>
</html>