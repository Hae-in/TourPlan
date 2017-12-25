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
</style>

</head>
<body>
프로필사진
<div id="profile">
	<c:if test="${not empty m_picture}">
		<img src="<c:url value='/'/>resources/images/${m_picture[0].realfilename}" width='100px' height='100px' style='border-radius: 20px;'>
	</c:if>
</div>
<!-- 이미지 업로드 -->
<div id="upload"></div>
<form id="frm_img" method="post" enctype="multipart/form-data">
<input type="file" id="uploadFile" name="uploadFile" style="border: 1px solid grey"><br />
<button type="button" onclick="imageAdd();">업로드</button>
<!-- 이미지 업로드 -->	
</form>
<form action="../memberAjax/update">
<ol>
	<li>${member.id}님</li>
	<li>아이디 : <input type="text" name="nickname" value="${member.nickname}"/></li>
	<li>비밀번호 : <input type="password" name="password" value=""/></li>
	<li>가입일 : ${member.regdate}</li>
</ol>
</form>

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
		alert("이미지번호 : " + image_num);
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
</script>
</body>
</html>