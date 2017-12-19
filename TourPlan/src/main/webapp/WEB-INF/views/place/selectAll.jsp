<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
목록<br>
<c:forEach items="${placeList}" var="i">
	<a href="select.do?num=${i.placenum}">${i.placename}</a>
	${i.lat}
	${i.lon}
	${i.addr}
	${i.city}
	${i.country}
	<br>
</c:forEach>
</body>
</html>