<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href='<c:url value='/'/>resources/js/jquery-ui.min.css'>
<link rel="stylesheet"
	href='<c:url value='/'/>resources/js/css/ui.jqgrid.css'>
<script src='<c:url value='/'/>resources/js/jquery.form.min.js'></script>
<style>
li {
	list-style-type:none;
}
.profileTable {
	text-align: center;
    border: 1px solid #e0e0e0;
    margin: 5px;
}
.profileTable td {
	padding: 5px;
	border: 1px solid #e0e0e0;
}

.btn {
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
.btn:hover {
  color: #333;
  background-color: #e6e6e6;
  border-color: #adadad;
}
</style>

</head>
<body>
<table class="profileTable">
	<tr>
		<td colspan="2" style="background: #f2f2f2;">${member.id}님의 회원정보</td>
	</tr>
	<tr>
		<td colspan="2">
			<div id="profile" style="padding: 10px;">
				<c:if test="${not empty m_picture}">
					<img src="<c:url value='/'/>resources/images/${m_picture[0].realfilename}" width='100px' height='100px' style='border-radius: 20px;'>
				</c:if>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<!-- 이미지 업로드 -->
			<div id="upload"></div>
				<form id="frm_img" method="post" enctype="multipart/form-data">
					<input type="file" id="uploadFile" name="uploadFile" style="border: 1px solid grey">
					<button type="button" onclick="imageAdd();">업로드</button>
				</form>
			<!-- 이미지 업로드 -->	
		</td> 
	</tr>
	<form id="frm">
	<tr>
		<td style="background: #f2f2f2;">닉네임</td> <td><input type="text" name="nickname" value="${member.nickname}"/></td>			
	</tr>
	<tr>
		<td style="background: #f2f2f2;">비밀번호</td> <td><input type="password" name="password" value=""/></td>			
	</tr>
	<tr>
		<td style="background: #f2f2f2;">가입일</td> <td>${member.regdate}</td>			
	</tr>
	<tr>
		<td colspan="2"><button class="btn">회원정보수정</button></td>
	</tr>
	</form>
</table>
<script>
var member_num = "<%=session.getAttribute("membernum")%>";

function imageAdd(){
	if($("#profile img").length == 0) {
		$("#frm_img").ajaxForm({
			dataType:"json",
			data : {membernum: member_num},
			url:'../memberAjax/insertImage',
			success: function(result, textStatus){
				if(result.code == 'success') {
					alert("등록되었습니다.");
					var post = "<img src='<c:url value='/'/>resources/images/" + result.imageName + "' width='100px' height='100px' class='img-circle'>";
					$(post).appendTo($("#profile"));
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
			data : {membernum: member_num,
					nickname: "update"},
			url:'../memberAjax/insertImage',
			success: function(result, textStatus){
				if(result.code == 'success') {
					alert("등록되었습니다.");
					var post = "<img src='<c:url value='/'/>resources/images/" + result.imageName + "' width='100px' height='100px' class='img-circle'>";
					$("#profile").empty();
					$(post).appendTo($("#profile"));
				}
			},
			error: function(){
				alert("파일업로드 중 오류가 발생하였습니다.");
				return;
			}
		}).submit();
	}
}

$(".btn").click(function() {
	var param = $("#frm").serialize();
	param += "&membernum="+member_num;
	$.ajax({
		url : "../memberAjax/update",
		dataType : "json",
		data : param,
		success : function(data) {
			alert("수정완료");
		}
	});
});
</script>
</body>
</html>