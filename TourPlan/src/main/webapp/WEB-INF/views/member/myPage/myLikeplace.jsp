<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="myTag" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script>
	function dolist(page){
		document.frm.elements["page"].value = page
		document.frm.submit();
	}
</script>
</head>
<body>

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
											<%-- ${i.lat}${i.lon}${i.addr}${i.city}${i.country} --%>											
											${i.content}
										</p>
									</div>
									<div class="card-footer text-muted">
										Like Count : ${i.likecnt}
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					
					<myTag:paging paging="${paging}" jsfunc="dolist"/> 
					
					<a href="form.do">신규</a> 

				</div>
</body>
</html>

