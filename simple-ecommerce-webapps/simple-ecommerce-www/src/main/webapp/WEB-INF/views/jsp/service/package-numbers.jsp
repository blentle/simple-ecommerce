<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/include.rec.jsp" %>
    <ul id="ulnumbers">
    	<c:forEach items="${packageNumbers}" var="item">
    		<li onclick='selectNumber("${item.phone}","${item.goodsPrice}");'><strong>${item.phone}</strong><span>￥${item.goodsPrice}</span></li>
    	</c:forEach>
    </ul>
    <c:if test="${pageInfo.pages > 1}">
	        <pg:pager url="${ctx}/service/package/loadnumbers"
	                  items="${pageInfo.total}" isOffset="true"
	                  maxPageItems="${pageInfo.pageSize}"
	                  export="offset, currentPageNumber=pageNumber" scope="request">
	            <pg:param name="maxPageItems" value="${page.pageSize}"/><!--不能缺少的-->
	            <pg:param name="items" value="${pageInfo.total}"/>
	            <pg:param name="packagesId" value="${packagesId}"/>
	            <pg:param name="goodsPriceMin" value="${param.goodsPriceMin}"/>
	            <pg:param name="goodsPriceMax" value="${param.goodsPriceMax}"/>
	            <pg:param name="phoneStandard" value="${param.phoneStandard}"/>
	            <pg:param name="tailNumber" value="${param.tailNumber}"/>
	            <%@ include file="/common/page-ajax.jsp" %>
	        </pg:pager>
    	</c:if>
