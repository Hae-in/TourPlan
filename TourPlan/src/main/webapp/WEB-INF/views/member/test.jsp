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
		alert('���̵� �ߺ�üũ�� ���ּ���')
		return true;
	}
	else 
		return false;
}

$(function() {
	$("#id_check").on('click','',function(){
		if($("#id").val() == null) {
			alert("���̵� �Է����ּ���");
		} else {
			var param = "id=" + $("#id").val();
			$.getJSON("../memberAjax/select", param, function(data,status){
				if(status =="success" ) {
					if( data == true ) 
						alert("���� ���̵� �ֽ��ϴ�");
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
<form action="<c:url value='/'/>member/insert.do" onsubmit="return id_check();"><!-- ���⼭ �Է� ���� ���� ��Ʈ�ѷ��� ���� �Ѱ��� -->
id<input type="text" name="id" id="id"><button id="id_check">���̵��ߺ�üũ</button><br>
password<input type="password" name="password" ><br>
<input type="hidden" name="state" value="1">
nickname<input type="text" name="nickname" >
<input type="submit" value="����"></form>
</body>
</html>