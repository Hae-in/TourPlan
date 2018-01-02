<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%
	String membernum = (String) session.getAttribute("membernum");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><tiles:getAsString name="title" /></title>
<%-- <link href="<c:url value='/resources/css/layout.css' />" rel="stylesheet"></link> --%>
<!-- Bootstrap core CSS -->
<link href="<c:url value='/'/>resources/thema/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<c:url value='/'/>resources/thema/css/modern-business.css" rel="stylesheet">
<link href="<c:url value='/'/>resources/css/style.css" rel="stylesheet">
<link rel="stylesheet" href='<c:url value='/'/>resources/js/jquery-ui.min.css'>
<script src="../resources/thema/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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
        <li class="breadcrumb-item">마이페이지</li>        
      </ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
        <div class="col-lg-3 mb-4">
          <div class="list-group">
            <a href="<c:url value='/'/>member/select.do?membernum=<%=membernum%>" class="list-group-item">회원정보수정</a>
            <a href="<c:url value='/'/>plan/selectMade.do" class="list-group-item">내가 등록한 일정</a>
            <a href="<c:url value='/'/>place/selectAllMypage.do" class="list-group-item">내가 등록한 명소</a>
            <a href="<c:url value='/'/>plan/selectLike.do" class="list-group-item">좋아요일정</a>
            <a href="<c:url value='/'/>likeplace/selectAllMypage.do" class="list-group-item">좋아요명소</a>
            <a href="<c:url value='/'/>plan/selectShare.do" class="list-group-item">공유된 일정</a>
            <%-- <a href="<c:url value='/'/>#" class="list-group-item">회원탈퇴</a> --%>
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
    
    <script>
   		$('[href^="'+document.location.pathname+'"]').addClass('active');
   		var title = $('[href^="'+document.location.pathname+'"]').text();
   		$('.container > h1').append(title);
   		$('.breadcrumb').append('<li class="breadcrumb-item active">'+title+'</li>');
   	</script>

</body>
</html>

