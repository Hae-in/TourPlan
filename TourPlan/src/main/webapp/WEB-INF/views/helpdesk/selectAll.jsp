<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script>
	$(function() {
		$("#accordion").accordion();
	});
</script>
</head>
<body>
	자주묻는질문
	<div id="accordion">
		<c:forEach items="${helpdesk}" var="i">
			<h3>${i.title}</h3>
			<div>
				<p>${i.content}</p>
			</div>
		</c:forEach>
	</div>
</body>
</html>