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

    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">Sidebar Page
        <small>Subheading</small>
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.html">Home</a>
        </li>
        <li class="breadcrumb-item active">About</li>
      </ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
        <div class="col-lg-3 mb-4">
          <div class="list-group">
            <a href="" class="list-group-item">회원관리</a>
            <a href="" class="list-group-item active">일정관리</a>
            <a href="" class="list-group-item">명소관리</a>
            <a href="<c:url value='/'/>report/view" class="list-group-item">신고관리</a>
            <a href="" class="list-group-item">고객센터</a>
            <a href="" class="list-group-item">카테고리관리</a>
          </div>
        </div>
        <!-- Content Column -->
        <tiles:insertAttribute name="body" />
      </div>
      <!-- /.row -->
		
    </div>
    <!-- /.container -->
    
   	<script>
   		
   	</script>

</body>
</html>

