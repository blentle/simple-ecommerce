<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-服务站点列表</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>
<body>
<form class="form-inline definewidth m20" action="${ctx}/basedata/servicesite/list" method="post">
    站点名称：
    <input type="text" name="serviceName" class="input-default" placeholder="" value="${serviceName}">&nbsp;&nbsp;
    <button type="submit" class="btn btn-primary">查询</button>
    &nbsp;&nbsp;
    <button type="button" class="btn btn-success" id="addnew">添加服务站点</button>
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
        <tr>
            <th>站点名称</th>
            <th>联系人</th>
            <th>联系电话</th>
            <th>所属国家</th>
            <th>省(直辖市/自治区)</th>
            <th>市(区/自治州)</th>
            <th>区(县/市/镇)</th>
            <th>详细地址</th>
            <th>排序值</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody>
        <c:if test="${not empty rows}">
            <c:forEach items="${rows}" var="entity">
                <tr>
                    <td>${entity.serviceSite.serviceSiteName}</td>
                    <td>${entity.serviceSite.contactName}</td>
                    <td>${entity.serviceSite.contactPhone}</td>
                    <td>${entity.country.countryName}</td>
                    <td>${entity.province.regionName}</td>
                    <td>${entity.city.regionName}</td>
                    <td>${entity.district.regionName}</td>
                    <td>${entity.serviceSite.serviceSiteAddress}</td>
                    <td>${entity.serviceSite.seqKey}</td>
                    <td>
                        <a href="${ctx}/basedata/servicesite/preedit/${entity.serviceSite.id}">编辑</a>
                    </td>
                </tr>
            </c:forEach>
        </c:if>
        <tr>
        </tr>
    </tbody>
</table>
<div class="inline pull-right page">
    <c:if test="${pageInfo.pages > 1}">
        <pg:pager url="${ctx}/basedata/servicesite/list"
                  items="${pageInfo.total}" isOffset="true"
                  maxPageItems="${pageInfo.pageSize}"
                  export="offset, currentPageNumber=pageNumber" scope="request">
            <pg:param name="maxPageItems" value="${page.pageSize}"/><!--不能缺少的-->
            <pg:param name="items" value="${pageInfo.total}"/>
            <pg:param name="serviceName" value="${serviceName}"/>
            <%@ include file="/common/page.jsp" %>
        </pg:pager>
    </c:if>
</div>
</body>
</html>

<script>
    $(function () {
        $('#addnew').click(function () {
            window.location.href = "${ctx}/basedata/servicesite/precreate";
        });
    });
</script>
</body>
</html>