<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
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
			}
		});
		
		$('#fileAdd').click(function(){
			$('#aa').append('<input type="file" name="uploadFile">');
		});	
	});
	

	
</script>
    <style>
      #map {
        height: 400px;
      }
      .controls {
        margin-top: 10px;
        border: 1px solid transparent;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        height: 32px;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
      }

      #pac-input {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 300px;
      }

      #pac-input:focus {
        border-color: #4d90fe;
      }

      .pac-container {
        font-family: Roboto;
      }

      #type-selector {
        color: #fff;
        background-color: #4d90fe;
        padding: 5px 11px 0px 11px;
      }

      #type-selector label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }
      #target {
        width: 345px;
      }
    </style>
</head>
<body>
<form action="insert.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="membernum" value="1">
	<table>		
			<tr>
				<th>명소이름	</th>
				<td><input type="text" name="placename"></td>
				<th>분류
				<td>
					<select name="categorynum" id="categorynum">
						<option value="">선택</option>
					</select> 
				</td> 				 
			</tr>
			<tr>	
				<th>설명</th>
				<td colspan="3"><input type="text" name="content"></td>
			</tr>
			<tr>	
				<th>
					파일첨부
					<input type="button" value="+" id="fileAdd">
				</th>
				<td colspan="3" id="aa">
					<input type="file" name="uploadFile">					 
				</td>
			</tr>			
			<tr>	
				<th>주소</th>
				<td colspan="3"><input type="text" name="addr" id="addr"></td>
			</tr>	 
			<tr>	
				<th colspan="4">
					위도 <input type="text" name="lat" id="lat"> 
					경도 <input type="text" name="lon" id="lng">				
					도시 <input type="text" name="city" id="city"> 
				 	국가 <input type="text" name="country" id="country">
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