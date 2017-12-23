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
<script src='<c:url value='/'/>resources/js/jquery-3.2.1.min.js'></script>
<script src='<c:url value='/'/>resources/js/jquery.jqGrid.min.js'></script>
<script src='<c:url value='/'/>resources/js/i18n/grid.locale-kr.js'></script>
<script src='<c:url value='/'/>resources/js/jquery-ui.min.js'></script>
<style>
li {
	list-style-type:none;
}
</style>  
</head>
<body>
<form>
<ol>
	<li>${member.id}님</li>
	<li>아이디 : <input type="text" name="nickname" value="${member.nickname}"/></li>
	<li>비밀번호 : <input type="password" name="password" value=""/></li>
	<li>가입일 : ${member.regdate}</li>
</ol>
</form>
</body>
</html>