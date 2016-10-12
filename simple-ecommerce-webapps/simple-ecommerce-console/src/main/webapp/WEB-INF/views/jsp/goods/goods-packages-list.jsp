<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-套餐列表</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
    <script type="text/javascript" src="${ctx}/static/js/entrybill-goods-detail.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/store.js"></script>
</head>
<body>
<form class="form-inline definewidth m20" action="${ctx}/goods/packages/list" method="post">
    <table class="table">
        <tr>
            <td>套餐名称</td>
            <td><input type="text" name="packagesName" value="${packagesName}"></td>
            <td>类型</td>
            <td>
                <select name="type">
                    <option value="">全部</option>
                    <c:if test="${not empty typeList}">
                        <c:forEach var="entity" items="${typeList}">
                            <option value="${entity.code}" <c:if test="${entity.code eq type}"> selected="selected" </c:if>>
                                <fmt:message key="def.packages.type.${entity.code}.name" bundle="${def}"/>
                            </option>
                        </c:forEach>
                    </c:if>
                </select>
            </td>
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
            <td></td>
        </tr>
        <tr>
            <td>国家</td>
            <td>
                <select name="countryCode" onchange="loadOperatorsByCountry('${ctx}',this.value,'firstOperatorOption');">
                    <option value="">全部</option>
                    <c:if test="${not empty countryList}">
                        <c:forEach var="entity" items="${countryList}">
                            <option value="${entity.countryCode}" <c:if test="${entity.countryCode eq countryCode}"> selected="selected" </c:if>>${entity.countryName}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </td>
            <td>运营商</td>
            <td>
                <select name="operatorId" onchange="loadStoresByOperator('${ctx}',this.value,'firstStoreOption');">
                    <option id="firstOperatorOption" value="0">全部</option>
                    <c:if test="${not empty operatorList}">
                        <c:forEach var="entity" items="${operatorList}">
                            <option value="${entity.id}" <c:if test="${entity.id eq operatorId}"> selected="selected" </c:if>>${entity.operatorName}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </td>
            <td>店铺</td>
            <td>
                <select name="storeId">
                    <option id="firstStoreOption" value="0">全部</option>
                    <c:if test="${not empty storeList}">
                        <c:forEach var="entity" items="${storeList}">
                            <option value="${entity.id}" <c:if test="${entity.id eq storeId}"> selected="selected" </c:if>>${entity.storeName}</option>
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
        <th><em>商品类型</em></th>
        <th><em>套餐名称</em></th>
        <th><em>套餐类型</em></th>
        <th><em>价格</em></th>
        <th><em>国家</em></th>
        <th><em>运营商</em></th>
        <th><em>店铺</em></th>
        <th><em>商品状态</em></th>
        <th><em>库存</em></th>
        <th><em>操作</em></th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${not empty rows}">
        <c:forEach items="${rows}" var="entity">
            <tr>
                <td><span><fmt:message key="def.goods.type.${entity.goods.goodsType.code}.name" bundle="${def}"/></span></td>
                <td><span>${entity.goods.goodsName}</span></td>
                <td><span <c:if test="${entity.packages.packagesType eq requiredType}"> class="emphasize" </c:if>><fmt:message key="def.packages.type.${entity.packages.packagesType.code}.name" bundle="${def}"/></span></td>
                <td><span>${entity.goods.goodsPrice}</span></td>
                <td><span>${entity.country.countryName}</span></td>
                <td><span>${entity.operator.operatorName}</span></td>
                <td><span>${entity.store.storeName}</span></td>
                <td><span id="goods-status-${entity.goods.id}" <c:if test="${entity.goods.status eq offSaleType}"> class="emphasize" </c:if>><fmt:message key="def.goods.status.${entity.goods.status.code}.name" bundle="${def}"/></span></td>
                <td><span>${entity.goods.storage}</span></td>
                <td>
                    <c:choose>
                        <c:when test="${entity.goods.status eq offSaleType}">
                            <a id="operation-${entity.goods.id}" class='btn btn-info' onclick="operate('${ctx}',${entity.goods.id});" href="javascript:void(0);">上架</a>
                        </c:when>
                        <c:when test="${entity.goods.status eq onSaleType}">
                            <a id="operation-${entity.goods.id}" class='btn btn-info' onclick="operate('${ctx}',${entity.goods.id});" href="javascript:void(0);">下架</a>
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
            <pg:param name="packagesName" value="${packagesName}"/>
            <pg:param name="status" value="${status}"/>
            <pg:param name="type" value="${type}"/>
            <pg:param name="countryCode" value="${countryCode}"/>
            <pg:param name="operatorId" value="${operatorId}"/>
            <pg:param name="storeId" value="${storeId}"/>
            <%@ include file="/common/page.jsp" %>
        </pg:pager>
    </c:if>
</div>
</body>
</html>