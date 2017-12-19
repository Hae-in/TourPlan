<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>명소 보기</title>
</head>
<body>
내용
${place}<br>
<c:forEach items="${files}" var="i">	
	${i.tablename}
	${i.tablenum}
	${i.filenum}
	${i.filename}
	${i.realfilename}
	${i.filesize}<br/>	
</c:forEach>
<br>
.
<a href="form.do?num=${place.placenum}">수정</a>
<a href="delete.do?num=${place.placenum}">삭제</a>
<a href="form.do">신규</a>
<a href="selectAll.do">목록</a>
</body>
</html>