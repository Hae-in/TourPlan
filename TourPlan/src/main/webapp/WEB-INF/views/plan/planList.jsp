<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="myTag" tagdir="/WEB-INF/tags"%>
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
function dolist(page){
	document.frm.elements["page"].value = page
	document.frm.submit();
}
	$(function() {
		$("#slider-range").slider(
						{
							range : true,
							min : 1,
							max : 31,
							values : [ 1, 7 ],
							slide : function(event, ui) {
								$("#amount").val(
										"day" + ui.values[0] + " - day"
												+ ui.values[1]);
								$("[name='period1']").val(ui.values[0]);
								$("[name='period2']").val(ui.values[1]);
							}
						});
		$("#amount").val(
				"day" + $("#slider-range").slider("values", 0) + " - day"
						+ $("#slider-range").slider("values", 1));

		if('${planSearchVO.period1}' != '') {
			$("input:radio[name='plan_sort']:input[value='${planSearchVO.plan_sort}']").prop("checked", "true");
			$("input:radio[name='categorynum']:input[value='${planSearchVO.categorynum}']").prop("checked", "true");
			$( "#slider-range" ).slider( "values", [ ${planSearchVO.period1}, ${planSearchVO.period2} ] );
			$("#amount").val("day${planSearchVO.period1} - day${planSearchVO.period2}")
			$("[name='period1']").val( '${planSearchVO.period1}' );
			$("[name='period2']").val( '${planSearchVO.period2}' );
			$("[name='city']").val( '${planSearchVO.city}' );
		} else {}
		
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
						/* var l_count = parseInt($("#l_count").text()) + 1;
						$("#l_count").text() */
						var l_count;
						l_count = thisSave.parent().parent().next(['div']).children(['span']).text();
						
						thisSave.attr('likeplannum', data.likeplannum);	
						if(data.likeplannum == null || data.likeplannum == "") {
							thisSave.text("♡");
							l_count = parseInt(l_count) - 1;
							thisSave.parent().parent().next(['div']).children(['span']).text(l_count);
						} else {
							thisSave.text("♥");
							l_count = parseInt(l_count) + 1;
							thisSave.parent().parent().next(['div']).children(['span']).text(l_count);
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
	<div class="container" style="max-width: 1300px;">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">일정</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<c:url value='/'/>">Home</a></li>
			<li class="breadcrumb-item">일정</li>
		</ol>

		<form action="../plan/selectAll.do" method="post" id="frm" name="frm">
		<input type="hidden" name="page" value="1">
			<!-- Content Row -->
			<div class="row">
				<!-- Sidebar Column -->
				<div class="col-lg-4 mb-4">
					<div class="list-group">
						<div class="list-group-item">
							<font size="4px">정렬</font><br /> 
							<span><input type="radio" id="rd" name="plan_sort" value="" checked><label for="rd">최신순</label></span>
							<span><input type="radio" id="rd0" name="plan_sort" value="likecount"><label for="rd0">인기순</label></span>
						</div>
						<div class="list-group-item">
							<font size="4px">카테고리</font><br />
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
						<font size="4px">기간</font><br /> 
						<div id="slider-range" style="margin: 10px"></div>
							<label for="amount"></label> <input type="text" id="amount" readonly 
							style="background-color: transparent; border: 0; color: #f6931f; font-weight: bold;">
						</div>
						<input type="hidden" name="period1" value="1"><input type="hidden" name="period2" value="7">
						<div class="list-group-item">
						<font size="4px">도시</font><br /> <input type="text" name="city" style="width: 220px; margin: 5px;"/>
						</div>
						<!-- 일반검색은 state=1, isopen=1 -->
						<input type="hidden" name="state" value="1">
						<input type="hidden" name="isopen" value="1">
						<button type="submit" style="cursor: pointer; height: 40px;">검색</button>
					</div>
				</div>
				<!-- Content Column -->
				<div class="col-lg-8 mb-8">
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
											<c:if test="${sessionScope.membernum != null}">
												<span class="likemy" plannum="${plan.plannum}" likeplannum="${plan.likemy}"> 
													<c:if test="${plan.likemy != null}">♥</c:if> 
												 	<c:if test="${plan.likemy == null}">♡</c:if>
												</span>
											</c:if>
											<a href="../plan/select.do?plannum=${plan.plannum}">${plan.planname}</a>
										</h4>
										<p class="card-text">
										</p>
									</div>
									<div class="card-footer text-muted">Like Count :
										<span id="l_count">${plan.likecount}</span></div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			</form>
			<!-- /.row -->
		
		<myTag:paging paging="${paging}" jsfunc="dolist"/> 

	</div>
	<!-- /.container -->
</body>
</html>





