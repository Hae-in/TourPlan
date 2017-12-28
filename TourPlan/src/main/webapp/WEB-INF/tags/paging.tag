<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="paging" type="com.yedam.tourplan.common.Paging" %>
<%@ attribute name="jsfunc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="pagination justify-content-center">
	<c:if test="${paging.startPage>1}">
		<li class="page-item">
			<a class="page-link" aria-label="Previous" href="javascript:${jsfunc}(${paging.startPage-1})">
				<span aria-hidden="true">&laquo;</span>
		        <span class="sr-only">Previous</span>
			</a>
		</li>	
	</c:if>
	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
		<c:if test="${i != paging.page}">
			<li class="page-item"><a class="page-link" href="javascript:${jsfunc}(${i})">${i}</a></li>
		</c:if>
		<c:if test="${i == paging.page}">
			<li class="page-item"><a class="page-link"><b>${i}</b></a></li>
		</c:if>
	</c:forEach>
	<c:if test="${paging.endPage<paging.totalPageCount}">
		<li class="page-item">
			<a class="page-link" aria-label="Next" href="javascript:${jsfunc}(${paging.endPage+1})">
	            <span aria-hidden="true">&raquo;</span>
	            <span class="sr-only">Next</span>
			</a>
		</li>	
	</c:if>
</ul>