<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>투어플랜(TourPlan)</title>
    <!-- Bootstrap core CSS -->
    <link href="../resources/thema/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="../resources/thema/css/modern-business.css" rel="stylesheet">
  </head>
  <body>
    <header>
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <!-- Slide One - Set the background image for this slide in the line below -->
          <div class="carousel-item active" style="background-image: url('https://img-wishbeen.akamaized.net/plan/1414143429451_15471568586_bb8dd52b2a_k.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>First Slide</h3>
              <p>This is a description for the first slide.</p>
            </div>
          </div>
          <!-- Slide Two - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('https://img.travel.rakuten.co.jp/mytrip/content/gourmet/tabimeshi-hyogo/images/key.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>Second Slide</h3>
              <p>This is a description for the second slide.</p>
            </div>
          </div>
          <!-- Slide Three - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('https://i0.wp.com/cistoday.com/wp-content/uploads/2017/04/%EB%9F%AC%EC%8B%9C%EC%95%84-%EC%97%AC%ED%96%89-%EB%B0%8F-%EB%8B%A8%EA%B8%B0%EC%B2%B4%EB%A5%98-%EC%9C%A0%EC%9D%98-%EC%82%AC%ED%95%AD.jpg?resize=660%2C330')">
            <div class="carousel-caption d-none d-md-block">
              <h3>Third Slide</h3>
              <p>This is a description for the third slide.</p>
            </div>
          </div>
          <!-- Slide Three - Set the background image for this slide in the line below -->
          <!-- 
          <div class="carousel-item" style="background-image: url('http://placehold.it/1900x1080')">
            <div class="carousel-caption d-none d-md-block">
              <h3>Third Slide</h3>
              <p>This is a description for the third slide.</p>
            </div>
          </div> 
          -->
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </header>

    <!-- Page Content -->
    <div class="container">
      <!-- Portfolio Section -->
      <br><br><br><br>
	  <!-- Call to Action Section -->
      <div class="row mb-4">
        <div class="col-md-12">
          <p><h2>인기명소<a class="btn btn-secondary" href="#" style="float:right">더보기&rarr;</a></h2></p>
        </div>
      </div>
	  <hr>
      <div class="row">
        <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Place One</a>
              </h4>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Place Two</a>
              </h4>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Place Three</a>
              </h4>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Place Four</a>
              </h4>
            </div>
          </div>
        </div>
      </div>
      
	  <br><br><br><br>
      
      <div class="row mb-4">
        <div class="col-md-12">
          <p><h2>추천여행일정<a class="btn btn-secondary" href="<c:url value='/'/>plan/selectAll.do?plan_sort=likecount" style="float:right">더보기&rarr;</a></h2></p>
        </div>
      </div>
	  <hr>
      <div class="row">
      <c:forEach begin="0" end="3" varStatus="i">
      
        <div class="col-lg-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">${planList[i.index].planname}</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
          </div>
        </div>
        
        </c:forEach>
        </div>
        
    <!-- /.container -->
    <br><br><br><br>
    
    <!-- Bootstrap core JavaScript -->
    <script src="../resources/thema/vendor/jquery/jquery.min.js"></script>
    <script src="../resources/thema/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  </body>
</html>