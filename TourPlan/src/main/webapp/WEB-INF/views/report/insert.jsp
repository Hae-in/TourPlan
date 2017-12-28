<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<div>
<c:if test="${action == 'success'}">
신고가 접수되었습니다.
</c:if>
<c:if test="${empty action}">
<form action="../report/insert.do" method="post">
<input type="hidden" name="placenum" value="${param.placenum}">
<input type="hidden" name="plannum" value="${param.plannum}">
<textarea name="reportcontent" rows="3" cols="100%"></textarea>
<div style="text-align:right;"><input type="submit"></div>
</form>
</c:if>
</div>
</body>
</html>