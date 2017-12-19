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
      <h1 class="mt-4 mb-3"></h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="<c:url value='/'/>">Home</a></li>
        <li class="breadcrumb-item">관리자</li>        
      </ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
        <div class="col-lg-3 mb-4">
          <div class="list-group">
            <a href="" class="list-group-item">회원관리</a>
            <a href="<c:url value='/'/>admin/plan.do" class="list-group-item">일정관리</a>
            <a href="<c:url value='/'/>admin/selectAll.do" class="list-group-item">명소관리</a>
            <a href="<c:url value='/'/>report/view" class="list-group-item">신고관리</a>
            <a href="" class="list-group-item">고객센터</a>
            <a href="" class="list-group-item">카테고리관리</a>
          </div>
        </div>
        <!-- Content Column -->
        <div class="col-lg-9 mb-8">
        <tiles:insertAttribute name="body" />
        </div>
      </div>
      <!-- /.row -->
		
    </div>
    <!-- /.container -->
<<<<<<< HEAD
    
    <script>
   		$('[href="'+document.location.pathname+'"]').addClass('active');
   		var title = $('[href="'+document.location.pathname+'"]').text();
   		$('.container > h1').append(title);
   		$('.breadcrumb').append('<li class="breadcrumb-item active">'+title+'</li>');
=======
   	<script>
   		
>>>>>>> branch 'master' of https://github.com/JeonHyeJu/TourPlan.git
   	</script>

</body>
</html>

