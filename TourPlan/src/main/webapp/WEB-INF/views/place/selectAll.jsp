<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="myTag" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
.list-group-item span {
	display: inline-block;
	margin-right: 10px;
}
</style>
<script>
	$(function() {
		categoryListRadio("category", "${param.categorynum}");
			
		$(".likemy").click(placeLike);
		
		$("#keyword").autocomplete({
			minLength : 0,
			source : function(request, response) {
				$.ajax({
					url : "../placeAjax/selectAllKeyword.do",
					dataType : "json",
					data : {
						keyword : request.term
					},
					success : function(data) {
						response(data);
					}
				});
			},
			focus : function(event, ui) {
				$("#keyword").val(ui.item.country + " " + ui.item.city);
				return false;
			},
			select : function(event, ui) {
				$("input[name='country']").val(ui.item.country);
				$("input[name='city']").val(ui.item.city);
				document.frm.submit();
				return false;
			}
		}).autocomplete("instance")._renderItem = function(ul, item) {
			return $("<li>").append(
					"<div>" + item.country + " " + item.city + "</div>")
					.appendTo(ul);
		};		
	});		
</script>
<script src='<c:url value='/'/>resources/js/place.js'></script>
</head>
<body>
	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">명소 </h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<c:url value='/'/>">Home</a></li>
			<li class="breadcrumb-item">명소</li>
		</ol>

		<form action="selectAll.do" method="post" id="frm" name="frm">
		<input type="hidden" name="page" value="1">
		<input type="hidden" name="country" value="${param.country}">
		<input type="hidden" name="city" value="${param.city}">
			<!-- Content Row -->
			<div class="row">
				<!-- Sidebar Column -->
				<div class="col-lg-3 mb-4">
					<div class="list-group">
						<div class="list-group-item">
							Total : ${paging.totalRecord}건<br/><br/>
							정렬<br/>		 
							<span><input type="radio" name="sort" value="likecnt" <c:if test="${param.sort == 'likecnt'}">checked="checked"</c:if>> 인기순 </span> 
							<span><input type="radio" name="sort" value="writedate" <c:if test="${param.sort == 'writedate'}">checked="checked"</c:if>> 최신순</span>
						</div>
						<div class="list-group-item">
							카테고리<br />
							<div id="category"></div>
						</div>
						<div class="list-group-item">
							국가 or 도시<br /> 
							<div class="ui-widget">
								<input type="text" name="keyword" id="keyword" value="${param.keyword}" size="12">
							</div>
						</div>
						<input type="submit" value="검색">
					</div>
				</div>
				<!-- Content Column -->
				<div class="col-lg-9 mb-8">
					<div class="row">
						<c:forEach items="${placeList}" var="i">
							<div class="col-lg-6 portfolio-item">
								<div class="card h-100">
									<a href="select.do?num=${i.placenum}"> <c:if
											test="${not empty i.imagename}">
											<img class="card-img-top"
												src="<c:url value='/'/>resources/images/${i.imagename}"
												alt="">
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
					
					<myTag:paging paging="${paging}" jsfunc="dolist"/> 
					
					<c:if test="${sessionScope.membernum != null and sessionScope.membernum != ''}">
					<button type="button" onclick="modal_iframe('form.do','명소등록','1080','500')" class="btn btn-primary">신규</button>
					<div id="dialog-place"></div> 
					</c:if>
				</div>
			</div>
			<!-- /.row -->
		</form>

	</div>
	<!-- /.container -->
	
	
</body>
</html>

