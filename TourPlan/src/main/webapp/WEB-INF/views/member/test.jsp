<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href='<c:url value='/'/>resources/js/jquery-ui.min.css'>
<link rel="stylesheet" href="/resources/demos/style.css">
<script src='<c:url value='/'/>resources/js/jquery-3.2.1.min.js'></script>
<script src='<c:url value='/'/>resources/js/jquery-ui.min.js'></script>
<script>
var id_ok = false;

function id_check() {
	if(id_ok == true) {
		alert('아이디 중복체크를 해주세요')
		return true;
	}
	else 
		return false;
}

$(function() {
	$("#id_check").on('click','',function(){
		if($("#id").val() == null) {
			alert("아이디를 입력해주세요");
		} else {
			var param = "id=" + $("#id").val();
			$.getJSON("../memberAjax/select", param, function(data,status){
				if(status =="success" ) {
					if( data == true ) 
						alert("같은 아이디가 있습니다");
					else
						id_ok = true;
				} else {
					alert(status);
				}
			});
		}
});
</script>
</head>
<body>
<c:forEach items="${list }" var="list">
${list.nickname}<br>
</c:forEach>
<br>
<br>
<form action="<c:url value='/'/>member/insert.do" onsubmit="return id_check();"><!-- 여기서 입력 받은 것을 컨트롤러로 값을 넘겨줌 -->
id<input type="text" name="id" id="id"><button id="id_check">아이디중복체크</button><br>
password<input type="password" name="password" ><br>
<input type="hidden" name="state" value="1">
nickname<input type="text" name="nickname" >
<input type="submit" value="전송"></form>
</body>
</html>