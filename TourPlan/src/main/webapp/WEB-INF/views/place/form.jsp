<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href='<c:url value='/'/>resources/css/google_map_place.css' />
<script src='<c:url value='/'/>resources/js/jquery-3.2.1.min.js'></script>
<script> 
	$(function() {
		$.ajax({
			url : "../categoryAjax/selectAll.do?group=1",
			type : "json",
			success : function(data) {
				var options = "";
				for (i = 0; i < data.length; i++) {
					options += "<option value='" + data[i].categorynum + "'>"
							+ data[i].categoryname + "</option>";
				}
				$("#categorynum").append(options);
				$("#categorynum").val("${place.categorynum}").prop("selected",
						true);
			}
		});

		$('#fileAdd').click(
				function() {
					$('#uploadFileArea').append(
							'<input type="file" name="uploadFile">');
				});

		$('.fileRemove')
				.click(
						function() {
							var filenum = $(this).prev('span').attr('id');
							if ($(this).val() == '삭제') {
								$('#frm')
										.append(
												'<input type="text" name="deleteFile" value="'+filenum+'">');
								$(this).val('삭제취소');
							} else {
								$('input[value="' + filenum + '"]').remove();
								$(this).val('삭제');
							}

						});
		
		
	});
</script>
</head>
<body>
	<form action="form.do" method="post" enctype="multipart/form-data" id="frm">
	<input type="hidden" name="action" value="${empty param.num ? 'insert':'update'}"> 
	<input type="hidden" name="placenum" value="${place.placenum}">
	<input type="hidden" name="lat" id="lat" value="${place.lat}">
	<input type="hidden" name="lon" id="lng" value="${place.lon}">
	<input type="hidden" name="addr" id="addr" value="${place.addr}">
      <!-- Content Row -->
      <div class="row">
        <!-- Map Column -->
        <div class="col-lg-8 mb-4">
			<input id="pac-input" class="controls" type="text" placeholder="Search Box">
			<div id="map"></div>
        </div>
        <!-- Contact Details Column -->
        <div class="col-lg-4 mb-4">
			<table>
				<tr>
					<th>명소명</th>
					<td><input type="text" name="placename" id="placeName" value="${place.placename}" required="required"></td>
				</tr>
				<tr>
					<th>분류</th>
					<td><select name="categorynum" id="categorynum" required="required">
							<option value="">선택</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>도시</th>
					<td><input type="text" name="city" id="city" value="${place.city}"></td>
				</tr>
				<tr>	 
					<th>국가</th>
					<td><input type="text" name="country" id="country" value="${place.country}"></td>
				</tr>
				<tr>
					<th>설명</th>
					<td>
						<textarea name="content" id="placeContent" rows="3">${place.content}</textarea>
					</td>
				</tr>
				<tr>
					<th colspan="2">사진 <input type="button" value="+" id="fileAdd"></th>
				</tr>
				<tr>
					<td colspan="2" id="uploadFileArea">
						<c:forEach items="${files}" var="i">
							<span id="${i.filenum}">${i.realfilename}</span>
							<input type="button" value="삭제" class="fileRemove">
							<br />
						</c:forEach> 
						<input type="file" name="uploadFile">
					</td>
				</tr>
			</table>
			<input type="submit" value="등록" class="btn btn-primary">
		</div>
	</div>	
	</form>


	<script src='<c:url value='/'/>resources/js/google_map_place.js'></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB-xnFL2hcyJzAErag4gFM-r6XYWB7VAgc&libraries=places&callback=initAutocomplete"
		async defer></script>
</body>
</html>