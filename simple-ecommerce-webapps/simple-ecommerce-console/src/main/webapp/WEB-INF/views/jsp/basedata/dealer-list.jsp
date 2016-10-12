<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-代理商列表</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>
<body>
<form class="form-inline definewidth m20" action="${ctx}/basedata/dealer/list" method="post">
    代理商：
    <input type="text" name="dealerName" class="input-default" placeholder="" value="${dealerName}">&nbsp;&nbsp;
    <button type="submit" class="btn btn-primary">查询</button>
    &nbsp;&nbsp;
    <button type="button" class="btn btn-success" id="addnew">添加代理商</button>
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
        <tr>
            <th>代理商</th>
            <th>联系人</th>
            <th>联系电话</th>
            <th>所属国家</th>
            <th>级别</th>
            <th>排序值</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody>
        <c:if test="${not empty rows}">
            <c:forEach items="${rows}" var="entity">
                <tr>
                    <td>${entity.dealer.dealerName}</td>
                    <td>${entity.dealer.contactName}</td>
                    <td>${entity.dealer.contactPhone}</td>
                    <td>${entity.country.countryName}</td>
                    <td>${entity.dealer.dealerLevel}</td>
                    <td>${entity.dealer.seqKey}</td>
                    <td>
                        <a href="${ctx}/basedata/dealer/preedit/${entity.dealer.id}">编辑</a>
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
        <pg:pager url="${ctx}/basedata/dealer/list"
                  items="${pageInfo.total}" isOffset="true"
                  maxPageItems="${pageInfo.pageSize}"
                  export="offset, currentPageNumber=pageNumber" scope="request">
            <pg:param name="maxPageItems" value="${page.pageSize}"/><!--不能缺少的-->
            <pg:param name="items" value="${pageInfo.total}"/>
            <pg:param name="dealerName" value="${dealerName}"/>
            <%@ include file="/common/page.jsp" %>
        </pg:pager>
    </c:if>
</div>
</body>
</html>

<script>
    $(function () {
        $('#addnew').click(function () {
            window.location.href = "${ctx}/basedata/dealer/precreate";
        });
    });
</script>
</body>
</html>