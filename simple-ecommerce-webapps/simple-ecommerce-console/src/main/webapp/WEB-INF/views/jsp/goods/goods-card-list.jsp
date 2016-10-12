<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-卡贴列表</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
    <script type="text/javascript" src="${ctx}/static/js/entrybill-goods-detail.js"></script>
</head>
<body>
<form class="form-inline definewidth m20" action="${ctx}/goods/card/list" method="post">
    <table class="table">
        <tr>
            <td>卡贴号</td>
            <td><input type="text" name="cardNo" value="${cardNo}"></td>
            <td>状态</td>
            <td>
                <select name="status">
                    <option value="">全部</option>
                    <c:if test="${not empty statusList}">
                        <c:forEach var="entity" items="${statusList}">
                            <option value="${entity.code}" <c:if test="${entity.code eq status}"> selected="selected" </c:if>>
                                <fmt:message key="def.goods.status.${entity.code}.name" bundle="${def}"/>
                            </option>
                        </c:forEach>
                    </c:if>
                </select>
            </td>
            <td><button type="submit" class="btn btn-primary">查询</button></td>
        </tr>
    </table>
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th><em>入库明细唯一标示</em></th>
        <th><em>商品类型</em></th>
        <th><em>卡贴号码</em></th>
        <th><em>商品状态</em></th>
        <th><em>库存</em></th>
        <th><em>操作</em></th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${not empty pageInfo.list}">
        <c:forEach items="${pageInfo.list}" var="entity">
            <tr>
                <td><span>${entity.entryDetailId}</span></td>
                <td><span><fmt:message key="def.goods.type.${entity.goodsType.code}.name" bundle="${def}"/></span></td>
                <td><span>${entity.cardNo}</span></td>
                <td><span id="goods-status-${entity.id}" <c:if test="${entity.status eq offSaleType}"> class="emphasize" </c:if>><fmt:message key="def.goods.status.${entity.status.code}.name" bundle="${def}"/></span></td>
                <td><span>${entity.storage}</span></td>
                <td>
                    <c:choose>
                        <c:when test="${entity.status eq offSaleType}">
                            <a id="operation-${entity.id}" class='btn btn-info' onclick="operate('${ctx}',${entity.id});" href="javascript:void(0);">上架</a>
                        </c:when>
                        <c:when test="${entity.status eq onSaleType}">
                            <a id="operation-${entity.id}" class='btn btn-info' onclick="operate('${ctx}',${entity.id});" href="javascript:void(0);">下架</a>
                        </c:when>
                        <c:otherwise>

                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </c:if>
    </tbody>
</table>
<div class="inline pull-right page">
    <c:if test="${pageInfo.pages > 1}">
        <pg:pager url="${ctx}/goods/card/list"
                  items="${pageInfo.total}" isOffset="true"
                  maxPageItems="${pageInfo.pageSize}"
                  export="offset, currentPageNumber=pageNumber" scope="request">
            <pg:param name="maxPageItems" value="${pageInfo.pageSize}"/><!--不能缺少的-->
            <pg:param name="items" value="${pageInfo.total}"/>
            <pg:param name="cardNo" value="${cardNo}"/>
            <pg:param name="status" value="${status}"/>
            <%@ include file="/common/page.jsp" %>
        </pg:pager>
    </c:if>
</div>
</body>
</html>