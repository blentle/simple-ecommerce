<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-物流公司列表</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>
<body>
<form class="form-inline definewidth m20" action="${ctx}/basedata/logisticscompany/list" method="post">
    物流公司：
    <input type="text" name="companyName" class="input-default" placeholder="" value="${companyName}">&nbsp;&nbsp;
    <button type="submit" class="btn btn-primary">查询</button>
    &nbsp;&nbsp;
    <button type="button" class="btn btn-success" id="addnew">添加物流公司</button>
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
        <tr>
            <th>物流公司</th>
            <th>联系人</th>
            <th>联系电话</th>
            <th>备注</th>
            <th>排序值</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody>
        <c:if test="${not empty pageInfo.list}">
            <c:forEach items="${pageInfo.list}" var="entity">
                <tr>
                    <td>${entity.logisticsName}</td>
                    <td>${entity.contactName}</td>
                    <td>${entity.contactPhone}</td>
                    <td>${entity.logisticsDesc}</td>
                    <td>${entity.seqKey}</td>
                    <td>
                        <a href="${ctx}/basedata/logisticscompany/preedit/${entity.id}">编辑</a>
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
        <pg:pager url="${ctx}/basedata/logisticscompany/list"
                  items="${pageInfo.total}" isOffset="true"
                  maxPageItems="${pageInfo.pageSize}"
                  export="offset, currentPageNumber=pageNumber" scope="request">
            <pg:param name="maxPageItems" value="${page.pageSize}"/><!--不能缺少的-->
            <pg:param name="items" value="${pageInfo.total}"/>
            <pg:param name="companyName" value="${companyName}"/>
            <%@ include file="/common/page.jsp" %>
        </pg:pager>
    </c:if>
</div>
</body>
</html>

<script>
    $(function () {
        $('#addnew').click(function () {
            window.location.href = "${ctx}/basedata/logisticscompany/precreate";
        });
    });
</script>
</body>
</html>