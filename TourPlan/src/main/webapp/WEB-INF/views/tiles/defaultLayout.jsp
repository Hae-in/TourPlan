<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><tiles:getAsString name="title" /></title>
<%-- <link href="<c:url value='/resources/css/layout.css' />" rel="stylesheet"></link> --%>
<!-- Bootstrap core CSS -->
<link href="../resources/thema/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="../resources/thema/css/modern-business.css" rel="stylesheet">
</head>
<body>
<!-- Navigation -->
<tiles:insertAttribute name="header" />

<!-- body -->
<tiles:insertAttribute name="body" />

</body>
</html>

