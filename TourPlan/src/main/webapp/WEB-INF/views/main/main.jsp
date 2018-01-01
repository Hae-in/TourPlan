<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>투어플랜(TourPlan)</title>
<!-- Bootstrap core CSS -->
<link href="../resources/thema/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="../resources/thema/css/modern-business.css" rel="stylesheet">
</head>
<body>
	<header>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- Slide One - Set the background image for this slide in the line below -->

				<div class="carousel-item active"
					style="background-image: url('https://upload.wikimedia.org/wikipedia/commons/1/14/Nirmal_Hriday.JPG?resize=660%2C330')">
					<div class="carousel-caption d-none d-md-block">
						<h3><a href="../theme/theme1.do"></a>자신을 돌아보는 봉사활동 여행</h3>
						<p>마더 테레사 하우스, 콜카타, 인도</p>
					</div>
				</div>

				<div class="carousel-item"
					style="background-image: url('https://i.imgur.com/cIH9lDy.jpg?resize=660%2C330')">
					<div class="carousel-caption d-none d-md-block">
						<h3>
							<a href="../theme/theme2.do">대자연의 품에 안기다</a>
						</h3>
						<p>그랜드 캐년, 미국</p>
					</div>
				</div>

				<div class="carousel-item"
					style="background-image: url('http://amazingusambaratrekking.com/img/serengeti.jpg?resize=660%2C330')">
					<div class="carousel-caption d-none d-md-block">
						<h3>
							<a href="../theme/theme3.do">야생, 야생, 야생</a>
						</h3>
						<p>세렝게티 국립공원, 탄자니아</p>
					</div>
				</div>

				<div class="carousel-item"
					style="background-image: url('https://radseason-cvujcydfqolrrrg.netdna-ssl.com/wp-content/uploads/2017/04/You-will-prove-to-yourself-that-persistence-overcomes-resistance-as-you-take-your-final-step-atop-of-the-Annapurna-Base-Camp.jpg?resize=660%2C330')">
					<div class="carousel-caption d-none d-md-block">
						<h3><a href="../theme/theme4.do">내 생애 단 한 번, 히말라야 트레킹</a></h3>
						<p>안나푸르나 베이스캠프, 네팔</p>
					</div>
				</div>

				<div class="carousel-item"
					style="background-image: url('https://upload.wikimedia.org/wikipedia/commons/1/14/Nirmal_Hriday.JPG?resize=660%2C330')">
					<div class="carousel-caption d-none d-md-block">
						<h3>
							여행자의 마지막 로망, 빙하
						</h3>
						<p>깔라파테, 아르헨티나</p>
					</div>
				</div>
				
				<div class="carousel-item"
					style="background-image: url('http://www.ultimatebali.com/wp-content/uploads/2015/11/Best-Surf-Spots-in-Bali.jpg?resize=660%2C330')">
					<div class="carousel-caption d-none d-md-block">
						<h3>파도가 밀어주는 짜릿함~ 서핑!</h3>
						<p>발리, 인도네시아</p>
					</div>
				</div>

				<div class="carousel-item"
					style="background-image: url('https://www.balivillasandmore.com/wp-content/uploads/2015/09/banner5.jpg?cd1846?resize=660%2C330')">
					<div class="carousel-caption d-none d-md-block">
						<h3>나도! 나도 할거야~ 서핑!</h3>
						<p>발리, 인도네시아</p>
					</div>
				</div>

				<div class="carousel-item"
					style="background-image: url('http://cdn1.theinertia.com/wp-content/uploads/2016/06/bada-1200x695.jpg?resize=660%2C330')">
					<div class="carousel-caption d-none d-md-block">
						<h3>당신도 할 수 있어~ 서핑!</h3>
						<p>발리, 인도네시아</p>
					</div>
				</div>

				<div class="carousel-item"
					style="background-image: url('https://media.timeout.com/images/103444978/image.jpg?resize=660%2C330')">
					<div class="carousel-caption d-none d-md-block">
						<h3>혼자여도 나는 좋아</h3>
						<p>뉴욕, 미국</p>
					</div>
				</div>

				<div class="carousel-item"
					style="background-image: url('http://guidedtoursantorini.com/wp-content/uploads/2017/03/Santorini-Building-Photo-At-Night-1920x777.jpg?resize=660%2C330')">
					<div class="carousel-caption d-none d-md-block">
						<h3>사랑이 깊어지는 그 곳</h3>
						<p>미코노스, 그리스</p>
					</div>
				</div>

				<div class="carousel-item"
					style="background-image: url('https://blog.gaijinpot.com/wp-content/uploads/sites/4/2017/09/in-the-clouds2.jpg?resize=660%2C330')">
					<div class="carousel-caption d-none d-md-block">
						<h3>우리 가족 다 같이 따뜻한 온천에서</h3>
						<p>나가노, 일본</p>
					</div>
				</div>

				<div class="carousel-item"
					style="background-image: url('http://travelwithjoshcohen.com/wp-content/uploads/2014/12/hk1010.jpg?resize=660%2C330')">
					<div class="carousel-caption d-none d-md-block">
						<h3>내 아이에게 최고의 추억을</h3>
						<p>디즈니랜드, 홍콩</p>
					</div>
				</div>

				<div class="carousel-item"
					style="background-image: url('https://en.sandsresortsmacao.com/content/dam/macao/cotaistrip/master/main/home/about%20sands%20resort/sands-resorts-macao_2000x666.jpg?resize=660%2C330')">
					<div class="carousel-caption d-none d-md-block">
						<h3>나는야~ 밤의 나그네</h3>
						<p>마카오, 중국</p>
					</div>
				</div>

				<div class="carousel-item"
					style="background-image: url('http://www.santiagochiletour.cl/wp-content/uploads/2017/07/concha-y-toro-santiago-chile-tour.jpg?resize=660%2C330')">
					<div class="carousel-caption d-none d-md-block">
						<h3>악마의 술을 마시러 갈테야</h3>
						<p>꼰차 이 또로, 칠레</p>
					</div>
				</div>

				<div class="carousel-item"
					style="background-image: url('http://www.ibizadc.com/wp-content/uploads/2016/12/cl.jpeg?resize=660%2C330')">
					<div class="carousel-caption d-none d-md-block">
						<h3>환락의 밤이여 내게로 오라!</h3>
						<p>이비자, 스페인</p>
					</div>
				</div>

				<div class="carousel-item"
					style="background-image: url('https://s-media-cache-ak0.pinimg.com/originals/93/53/2c/93532c98eea715836a65d95f68be1247.jpg?resize=660%2C330')">
					<div class="carousel-caption d-none d-md-block">
						<h3>과거로 타임슬립</h3>
						<p>아바나, 쿠바</p>
					</div>
				</div>

			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</header>

	<!-- Page Content -->
	<div class="container">
		<!-- Portfolio Section -->
		<br>
		<br>
		<br>
		<br>
		<!-- Call to Action Section -->
		<div class="row mb-4">
			<div class="col-md-12">
				<p>
				<h2>
					인기명소<a class="btn btn-secondary" href="../place/selectAll.do" style="float: right">더보기&rarr;</a>
				</h2>
				</p>
			</div>
		</div>
		<hr>
		<div class="row">
			<c:forEach items="${placeList}" var="i">
				<div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
					<div class="card h-100">
						<a href="../place/select.do?num=${i.placenum}"> 
							<c:if test="${not empty i.imagename}">
								<img class="card-img-top" src="<c:url value='/'/>resources/images/${i.imagename}" alt="">
							</c:if>
							<c:if test="${empty i.imagename}">
								<img class="card-img-top" src="http://placehold.it/700x400" alt="">
							</c:if>
						</a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="../place/select.do?num=${i.placenum}">${i.placename}</a>
							</h4>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<br>
		<br>
		<br>
		<br>

		<div class="row mb-4">
			<div class="col-md-12">
				<p>
				<h2>
					추천여행일정<a class="btn btn-secondary"
						href="<c:url value='/'/>plan/selectAll.do?plan_sort=likecount"
						style="float: right">더보기&rarr;</a>
				</h2>
				</p>
			</div>
		</div>
		<hr>
		<div class="row">
			<c:forEach items="${planList}" var="plan">
				<div class="col-lg-6 portfolio-item">
					<div class="card h-100">
						<a href="../plan/select.do?plannum=${plan.plannum}"> 
							<c:if test="${not empty plan.imagename}">
								<img class="card-img-top" src="<c:url value='/'/>resources/images/${plan.imagename}" alt="" width="348" height="250"> 
							</c:if>
							<c:if test="${empty plan.imagename}">
								<img class="card-img-top" src="http://placehold.it/700x400" alt="">
							</c:if>
						</a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="../plan/select.do?plannum=${plan.plannum}">${plan.planname}</a>
							</h4>
							<p class="card-text"></p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- /.container -->
		<br>
		<br>
		<br>
		<br>

		<!-- Bootstrap core JavaScript -->
		<script src="../resources/thema/vendor/jquery/jquery.min.js"></script>
		<script
			src="../resources/thema/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>