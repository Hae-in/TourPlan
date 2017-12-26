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
          <div class="carousel-item active" style="background-image: url('https://www.whentobewhere.com/sites/default/files/styles/banner/public/photos/Moreno_0005_banner.jpg?itok=e3e6cNyo&sc=778bdc87b6355eccc9fccf6dea752c15?resize=660%2C330')">
            <div class="carousel-caption d-none d-md-block">
              <h3>여행자의 마지막 로망, 빙하</h3>
              <p>깔라파테, 아르헨티나</p>
            </div>
          </div>
          
          <div class="carousel-item" style="background-image: url('https://i.imgur.com/cIH9lDy.jpg?resize=660%2C330')">
            <div class="carousel-caption d-none d-md-block">
              <h3>대자연의 품에 안기다</h3>
              <p>그랜드 캐년, 미국</p>
            </div>
          </div>
          
          <div class="carousel-item" style="background-image: url('http://amazingusambaratrekking.com/img/serengeti.jpg?resize=660%2C330')">
            <div class="carousel-caption d-none d-md-block">
              <h3>야생, 야생, 야생</h3>
              <p>세렝게티 국립공원, 탄자니아</p>
            </div>
          </div>
          
          <div class="carousel-item" style="background-image: url('https://d1ljaggyrdca1l.cloudfront.net/wp-content/uploads/2017/03/Game-Drive-at-Serengeti-National-Park--1600x900.jpg?resize=660%2C330')">
            <div class="carousel-caption d-none d-md-block">
              <h3>야생, 야생, 야생</h3>
              <p>세렝게티 국립공원, 탄자니아</p>
            </div>
          </div>
          
          <div class="carousel-item" style="background-image: url('https://radseason-cvujcydfqolrrrg.netdna-ssl.com/wp-content/uploads/2017/04/You-will-prove-to-yourself-that-persistence-overcomes-resistance-as-you-take-your-final-step-atop-of-the-Annapurna-Base-Camp.jpg?resize=660%2C330')">
            <div class="carousel-caption d-none d-md-block">
              <h3>내 생애 단 한 번, 히말라야 트레킹</h3>
              <p>안나푸르나 베이스캠프, 네팔 </p>
            </div>
          </div>
          
          <div class="carousel-item" style="background-image: url('https://radseason-cvujcydfqolrrrg.netdna-ssl.com/wp-content/uploads/2017/04/You-will-prove-to-yourself-that-persistence-overcomes-resistance-as-you-take-your-final-step-atop-of-the-Annapurna-Base-Camp.jpg?resize=660%2C330')">
            <div class="carousel-caption d-none d-md-block">
              <h3>이 세상 모든 수중 스포츠</h3>
              <p> </p>
            </div>
          </div>

          <div class="carousel-item" style="background-image: url('https://img.travel.rakuten.co.jp/mytrip/content/gourmet/tabimeshi-hyogo/images/key.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>혼자여도 나는 좋아</h3>
              <p>방콕, 태국</p>
            </div>
          </div>
          
 		  <div class="carousel-item" style="background-image: url('http://guidedtoursantorini.com/wp-content/uploads/2017/03/Santorini-Building-Photo-At-Night-1920x777.jpg?resize=660%2C330')">
            <div class="carousel-caption d-none d-md-block">
              <h3>사랑이 깊어지는 그 곳</h3>
              <p>미코노스, 그리스</p>
            </div>
          </div>
          
          <div class="carousel-item" style="background-image: url('https://blog.gaijinpot.com/wp-content/uploads/sites/4/2017/09/in-the-clouds2.jpg?resize=660%2C330')">
            <div class="carousel-caption d-none d-md-block">
              <h3>우리 가족 다 같이 따뜻한 온천에서</h3>
              <p>나가노, 일본</p>
            </div>
          </div>
           
          <div class="carousel-item" style="background-image: url('https://en.sandsresortsmacao.com/content/dam/macao/cotaistrip/master/main/home/about%20sands%20resort/sands-resorts-macao_2000x666.jpg?resize=660%2C330')">
            <div class="carousel-caption d-none d-md-block">
              <h3>나는야~ 밤의 나그네</h3>
              <p>마카오, 중국</p>
            </div>
          </div>
          
          <div class="carousel-item" style="background-image: url('https://cdn2.i-scmp.com/sites/default/files/styles/landscape/public/images/methode/2016/10/24/fb5026ea-95de-11e6-89e7-0e47003bc2df_1280x720.jpg?itok=di6QMD-g?resize=660%2C330')">
            <div class="carousel-caption d-none d-md-block">
              <h3>나는야~ 밤의 나그네</h3>
              <p>마카오, 중국</p>
            </div>
          </div>
          
          <div class="carousel-item" style="background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpOkIruh8TjiwovE4VIQ7ZMbADTeqkKx8R5ngrxGLxtbSAUI4p.jpeg?resize=660%2C330')">
            <div class="carousel-caption d-none d-md-block">
              <h3>최고의 술을 마시러 갈테야</h3>
              <p>방콕, 태국</p>
            </div>
          </div>
          
     	  <div class="carousel-item" style="background-image: url('https://s-media-cache-ak0.pinimg.com/originals/93/53/2c/93532c98eea715836a65d95f68be1247.jpg?resize=660%2C330')">
            <div class="carousel-caption d-none d-md-block">
              <h3>과거로 타임슬립</h3>
              <p>아바나, 쿠바</p>
            </div>
          </div>
     
          <div class="carousel-item" style="background-image: url('https://upload.wikimedia.org/wikipedia/commons/1/14/Nirmal_Hriday.JPG?resize=660%2C330')">
            <div class="carousel-caption d-none d-md-block">
              <h3>자신을 돌아보는 봉사활동 여행</h3>
              <p>마더 테레사 하우스, 콜카타, 인도</p>
            </div>
          </div>
           
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