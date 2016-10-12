<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-国家列表</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>
<body>
<form class="form-inline definewidth m20" action="${ctx}/basedata/country/list" method="post">
    <table class="table">
        <tr>
            <td>国家名称</td>
            <td><input type="text" name="countryName" id="countryName" value="${param.countryName}"></td>
            <td>开通状态</td>
            <td>
                <select name="openStatus" id="openStatus" class="input-normal">
                    <option value="">全部</option>
                    <option value="y">已开通</option>
                    <option value="n">未开通</option>
                </select>
            </td>
            <td><button type="submit" class="btn btn-primary">查询</button></td>
        </tr>
    </table>
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>序号</th>
        <th>国家名称</th>
        <th>区号</th>
        <th>英文名</th>
        <th>开通状态</th>
        <th>是否开通手机注册</th>
        <th>是否开放充值</th>
        <th>预约人数</th>
        <th>操作</th>
    </tr>
    </thead>
    <c:forEach items="${pageInfo.list}" var="item">
	    <tr>
	        <td>${item.id}</td>
	        <td>${item.countryName}</td>
	        <td>${item.countryCode}</td>
	        <td>${item.englishName}</td>
	        <td>
                <c:choose>
                    <c:when test="${item.openStatus.code eq 'y'}">
                        已开通
                    </c:when>
                    <c:otherwise>
                        未开通
                    </c:otherwise>
                </c:choose>

            </td>
	        <td><fmt:message key="def.global.status.${item.registerStatus.code}.name" bundle="${def}"/> </td>
	        <td><fmt:message key="def.global.status.${item.rechargeStatus.code}.name" bundle="${def}"/></td>
	        <td>${item.bookingNumber}</td>
	        <td>
	            <a href="${ctx}/basedata/country/toedit?id=${item.id}" class="btn btn-primary">编辑</a>
	        </td>
	    </tr>
    </c:forEach>
</table>
<div class="inline pull-right page">
    <c:if test="${pageInfo.pages > 1}">
        <pg:pager url="${ctx}/basedata/country/list"
                  items="${pageInfo.total}" isOffset="true"
                  maxPageItems="${pageInfo.pageSize}"
                  export="offset, currentPageNumber=pageNumber" scope="request">
            <pg:param name="maxPageItems" value="${page.pageSize}"/><!--不能缺少的-->
            <pg:param name="items" value="${pageInfo.total}"/>
            <pg:param name="countryName" value="${countryName}"/>
            <pg:param name="openStatus" value="${openStatus}"/>
            <%@ include file="/common/page.jsp" %>
        </pg:pager>
    </c:if>
</div>
<script type="text/javascript">
$(function () {
	$("#openStatus option[value='${param.openStatus}']").attr("selected",true);
});
</script>
</body>
</html>