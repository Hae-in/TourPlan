<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>명소 보기</title>
<link rel="stylesheet"
	href='<c:url value='/'/>resources/js/jquery-ui.min.css'>
<script src='<c:url value='/'/>resources/js/jquery-3.2.1.min.js'></script>
<script src='<c:url value='/'/>resources/js/jquery-ui.min.js'></script>
<script>
	$(function() {
		$("#tabs").tabs({
			activate : function(event, ui) {
				console.log(event);
				if (event.currentTarget.id == "ui-id-2") {
					initMap();
				}

			}
		});
		
		$(".likemy").click(placeLike);
	});
</script>
<script src='<c:url value='/'/>resources/js/place.js'></script>
</head>
<body>
	<input type="hidden" id="lat" value="${place.lat}" />
	<input type="hidden" id="lng" value="${place.lon}" />
	<input type="hidden" id="placeName" value="${place.placename}" />
	<input type="hidden" id="placeContent" value="${place.content}" />
	<!-- Page Content -->
	<div class="container">
		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			<c:if test="${place.likemy != null}">
				♥
			</c:if>
			<c:if test="${place.likemy == null}">
				♡
			</c:if>
			${place.placename} <small>[${placeCategory.categoryname}]</small>
		</h1>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="index.html">Home</a></li>
			<li class="breadcrumb-item active">명소</li>
		</ol>
		<div id="tabs" class="mb-4">
			<ul>
				<li><a href="#tabs-1">사진</a></li>
				<li><a href="#tabs-2">위치</a></li>
			</ul>
			<div id="tabs-1">
				<!-- Image Header -->
				<div id="carouselExampleIndicators" class="carousel slide mb-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<c:forEach items="${files}" varStatus="status">
							<li data-target="#carouselExampleIndicators"
								data-slide-to="${status.index}"
								<c:if test="${status.index == 0}"> class="active"</c:if>></li>
						</c:forEach>
					</ol>
					<div class="carousel-inner" role="listbox">
						<c:forEach items="${files}" var="i" varStatus="status">
							<div
								class="carousel-item<c:if test='${status.index == 0}'> active</c:if>"
								style="background-image: url('<c:url value="/"/>resources/images/${i.realfilename}')">
								<div class="carousel-caption d-none d-md-block">
									<!-- <h3>Second Slide</h3>
						<p>This is a description for the second slide.</p> -->
								</div>
							</div>
						</c:forEach>
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
			</div>
			<div id="tabs-2">
				<div id="map" style="width: 100%; height: 500px;"></div>
			</div>
		</div>
		<hr>
		<!-- Date/Time -->
		<p>${placeMember.id} / ${place.writedate}</p>
		<hr>
		<!-- Post Content -->
		<blockquote class="blockquote">
			<p class="mb-0">${place.addr}</p>
			<footer class="blockquote-footer">
				${place.city} <cite title="Source Title">${place.country}</cite>
			</footer>
		</blockquote>
		<p>${place.content}</p>
		Like Count : ${place.likecnt}
		<br><br>
		<button type="button" data-toggle="modal" data-target="#reportModal" class="btn btn-primary">신고하기</button> 

		<c:if test="${place.membernum == sessionScope.membernum}">
		<button type="button" onclick="modal_iframe('form.do?num=${place.placenum}','명소수정','1080','500')" class="btn btn-primary">수정</button>
		<div id="dialog-place"></div>
		<%-- <a href="form.do?num=${place.placenum}" class="btn btn-primary">수정</a>  --%>
		<a href="delete.do?num=${place.placenum}" class="btn btn-primary">삭제</a> 
		</c:if>
		<a href="selectAll.do" class="btn btn-primary">목록</a>
		<br><br><br><br>
 		<hr>
		<div class="row">
			<c:forEach items="${placeList}" var="i">
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<a href="select.do?num=${i.placenum}"> <c:if
								test="${not empty i.imagename}">
								<img class="card-img-top"
									src="<c:url value='/'/>resources/images/${i.imagename}" alt="">
							</c:if> <c:if test="${empty i.imagename}">
								<img class="card-img-top" src="http://placehold.it/700x400"
									alt="">
							</c:if>
						</a>
						<div class="card-body">
							<h4 class="card-title">										
								<c:if test="${sessionScope.membernum != null}">
									<span class="likemy" placenum="${i.placenum}" likeplacenum="${i.likemy}">
									<c:if test="${i.likemy != null}">
										♥
									</c:if>
									<c:if test="${i.likemy == null}">
										♡
									</c:if>
									</span>
								</c:if>	
								<a href="select.do?num=${i.placenum}">${i.placename}</a>
							</h4>
							<p class="card-text">
								${i.content}
							</p>
						</div>
						<div class="card-footer text-muted">
							Like Count : <span id="likeCnt${i.placenum}">${i.likecnt}</span>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- /.container -->

	<!-- Modal -->
	<div class="modal fade" id="reportModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">신고하기</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				<div class="modal-body">
					<iframe src="../report/insert.do?placenum=${place.placenum}"
						frameborder="0" style="width: 80%;"></iframe>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<script src='<c:url value='/'/>resources/js/google_map_place.js'></script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB-xnFL2hcyJzAErag4gFM-r6XYWB7VAgc&callback=initMap">
		
	</script>
</body>
</html>