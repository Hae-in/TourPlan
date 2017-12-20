<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
#category li {
    /* display: inline; */
    float:left; 
    list-style:none;
}
</style>
<script>
	$(function() {
		$.ajax({
			url : "../categoryAjax/selectAll.do?group=1",
			type : "json",
			success : function(data) {
				var options = "";
				for (i = 0; i < data.length; i++) {
					options += '<li><input type="radio" value="' + data[i].categorynum + '"> ' + data[i].categoryname + '</li>';
				}
				$("#category").append(options);
			}
		});	
		
		
	});	
</script>
</head>
<body>
    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">명소</h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="<c:url value='/'/>">Home</a></li>
        <li class="breadcrumb-item">명소</li>        
      </ol>

	  <form action="form.do" method="post" enctype="multipart/form-data" id="frm">	
      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->        
        <div class="col-lg-3 mb-4">
          <div class="list-group">         	
          	<div class="list-group-item">
          		정렬<br/>
          		<input type="radio" name="sort" value=""> 인기순 
          		<input type="radio" name="sort" value=""> 정렬순  	
          	</div>
          	<div class="list-group-item">
          		카테고리<br/>
          		<ul id="category"></ul>  	
          	</div>   
          	<div class="list-group-item">
          		도시<br/>
          		<input type="text" name="city">  	
          	</div>
            <input type="submit" value="검색">          	
          </div>
        </div>        
        <!-- Content Column -->
		<div class="col-lg-9 mb-8">
			 <div class="row">
				<div class="col-lg-6 portfolio-item">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Project One</a>
							</h4>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipiscing elit. Nam viverra euismod odio, gravida pellentesque
								urna varius vitae.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-6 portfolio-item">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Project One</a>
							</h4>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipiscing elit. Nam viverra euismod odio, gravida pellentesque
								urna varius vitae.</p>
						</div>
					</div>
				</div>
			</div>	

					목록<br>
					<c:forEach items="${placeList}" var="i">
						<c:if test="${not empty i.imagename}">
							<img src="<c:url value='/'/>resources/images/${i.imagename}"
								width="100">
						</c:if>

						<a href="select.do?num=${i.placenum}">${i.placename}</a>
				${i.lat}
				${i.lon}
				${i.addr}
				${i.city}
				${i.country}
				<br>
					</c:forEach>
					<a href="form.do">신규</a>


				</div>
			</div>
      <!-- /.row -->
      </form>
		
    </div>
    <!-- /.container -->
</body>
</html>

