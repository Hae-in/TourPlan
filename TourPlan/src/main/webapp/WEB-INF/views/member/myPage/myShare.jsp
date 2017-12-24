<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정 조회</title>
<style>
.list-group-item span {
	display: inline-block;
	margin-right: 10px;
}
</style>
<script>
	$(function() {
		$("#slider-range")
				.slider(
						{
							range : true,
							min : 1,
							max : 31,
							values : [ 1, 7 ],
							slide : function(event, ui) {
								$("#amount").val(
										"day" + ui.values[0] + " - day"
												+ ui.values[1]);
							}
						});
		$("#amount").val(
				"day" + $("#slider-range").slider("values", 0) + " - day"
						+ $("#slider-range").slider("values", 1));

		$(".likemy").click(function(){		
			var plannum = $(this).attr('plannum');
			var likeplannum = $(this).attr('likeplannum');
			var thisSave = $(this);			
			$.ajax("../likeplanAjax/insert.do",{
				method: 'post',
				data: { plannum: plannum, likeplannum: likeplannum },
				dataType:'json',
				success : function(data, status){
					if(status=="success") {
						thisSave.attr('likeplannum', data.likeplannum);	
						if(data.likeplannum == null || data.likeplannum == "") {
							thisSave.text("♡");
						} else {
							thisSave.text("♥");
						}
					} else {
						alert(status);	
					}	
				}				
			});
		});
	
	});
</script>

</head>
<body>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">일정</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<c:url value='/'/>">Home</a></li>
			<li class="breadcrumb-item">일정</li>
		</ol>

		<form action="../plan/selectAll.do" method="post" id="frm">
			<!-- Content Row -->
			<div class="row">
				<!-- Sidebar Column -->
				<div class="col-lg-4 mb-4">
					<div class="list-group">
						<div class="list-group-item">
							정렬<br /> 
							<span><input type="radio" name="plan_sort" value="" checked> 최신순</span>
							<span><input type="radio" name="plan_sort" value="likecount">인기순</span>
						</div>
						<div class="list-group-item">
							카테고리<br />
							<table>
								<tr>
									<td><span><input type="radio" id="rd1" name="categorynum" value="" checked> <label for="rd1"> 전체</label></span></td> 
									<td><span><input type="radio" id="rd2" name="categorynum" value="11"> <label for="rd2"> 나홀로여행</label></span></td>
								</tr>
								<tr>
									<td><span><input type="radio" id="rd3" name="categorynum" value="12"> <label for="rd3"> 친구와여행</label></span></td> 
									<td><span><input type="radio" id="rd4" name="categorynum" value="13"> <label for="rd4"> 가족여행</label></span></td>
								</tr>
								<tr>
									<td><span><input type="radio" id="rd5" name="categorynum" value="14"> <label for="rd5"> 단체여행</label></span></td> 
									<td><span><input type="radio" id="rd6" name="categorynum" value="15"> <label for="rd6"> 커플여행</label></span></td>
								</tr>
								<tr>
									<td colspan="2"><span><input type="radio" id="rd7" name="categorynum" value="16"> <label for="rd7">기타</label></span></td>
								</tr>
							</table>
						</div>
						<div class="list-group-item">
						<div id="slider-range" style="margin: 10px"></div>
							기간<br /> 
							<label for="amount"></label> <input type="text" name="period1" id="amount" readonly 
							style="background-color: transparent; border: 0; color: #f6931f; font-weight: bold;">
						</div>
						<div class="list-group-item">
							도시<br /> <input type="text" name="city" style="width: 220px; margin: 5px;"/>
						</div>
						<button type="submit">검색</button>
					</div>
				</div>
				<!-- Content Column -->
				<div class="col-lg-8 mb-8">
					<div class="row">
						<c:forEach items="${planList}" var="plan">
							<div class="col-lg-6 portfolio-item">
								<div class="card h-100">
									<a href="../plan/shareView.do?plannum=${plan.plannum}"> 
									<c:if test="${not empty plan.imagename}">
										<img class="card-img-top" src="<c:url value='/'/>resources/images/${plan.imagename}" alt="" width="348" height="250"> 
									</c:if> 
									<c:if test="${empty plan.imagename}">
										<img class="card-img-top" src="http://placehold.it/700x400" alt="">
									</c:if>
									</a>
									<div class="card-body">
										<h4 class="card-title">
											<c:if test="${sessionScope.membernum != null}">
												<span class="likemy" plannum="${plan.plannum}"
													likeplannum="${plan.likemy}"> 
													<c:if test="${plan.likemy != null}">♥</c:if> 
												 	<c:if test="${plan.likemy == null}">♡</c:if>
												</span>
											</c:if>
											<a href="../plan/shareView.do?plannum=${plan.plannum}">${plan.planname}</a>
										</h4>
										<p class="card-text">
										</p>
									</div>
									<div class="card-footer text-muted">Like Count :
										${plan.likecount}</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- /.row -->
		</form>

	</div>
	<!-- /.container -->
</body>
</html>


