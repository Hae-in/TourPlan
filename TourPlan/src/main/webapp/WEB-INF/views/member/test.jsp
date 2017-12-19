<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${list }" var="list">
${list.nickname}<br>
</c:forEach>
<br>
<br>
<form action="<c:url value='/'/>member/insert.do"><!-- 여기서 입력 받은 것을 컨트롤러로 값을 넘겨줌 -->
id<input type="text" name="id" ><br>
password<input type="password" name="password" ><br>
<input type="hidden" name="state" value="1">
nickname<input type="text" name="nickname" >
<input type="submit" value="전송"></form>
</body>
</html>