<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-号码列表</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
    <script type="text/javascript" src="${ctx}/static/js/entrybill-goods-detail.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/store.js"></script>
</head>
<body>
<form class="form-inline definewidth m20" action="${ctx}/goods/mobile/list" method="post">
    <table class="table">
        <tr>
            <td>手机号码</td>
            <td><input type="text" name="mobile" value="${mobile}"><span class="emphasize">(支持模糊查询)</span></td>
            <td>号码类型</td>
            <td>
                <select name="liangType">
                    <option value="">全部</option>
                    <c:if test="${not empty typeList}">
                        <c:forEach var="entity" items="${typeList}">
                            <option value="${entity.code}" <c:if test="${entity.code eq liangType}"> selected="selected" </c:if>>
                                <fmt:message key="def.mobile.number.type.${entity.code}.name" bundle="${def}"/>
                            </option>
                        </c:forEach>
                    </c:if>
                </select>
            </td>
            <td><button type="submit" class="btn btn-primary">查询</button></td>
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
        </tr>

        <tr>
            <td>包含数字</td>
            <td>
                <select name="include">
                    <option value="-1">全部</option>
                    <c:if test="${not empty digits}">
                        <c:forEach var="entity" items="${digits}">
                            <option value="${entity}" <c:if test="${entity eq include}"> selected="selected" </c:if>>${entity}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </td>
            <td>不包含数字</td>
            <td>
                <select name="exclude">
                    <option value="-1">全部</option>
                    <c:if test="${not empty digits}">
                        <c:forEach var="entity" items="${digits}">
                            <option value="${entity}" <c:if test="${entity eq exclude}"> selected="selected" </c:if>>${entity}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </td>
            <td>结尾数字</td>
            <td>
                <select name="tail">
                    <option  value="-1">全部</option>
                    <c:if test="${not empty digits}">
                        <c:forEach var="entity" items="${digits}">
                            <option value="${entity}" <c:if test="${entity eq tail}"> selected="selected" </c:if>>${entity}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </td>
        </tr>
    </table>
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th><em>商品类型</em></th>
        <th><em>手机号</em></th>
        <th><em>是否绑定卡贴</em></th>
        <th><em>卡贴号</em></th>
        <th><em>是否绑定套餐</em></th>
        <th><em>套餐</em></th>
        <th><em>号码类型(靓号)</em></th>
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
                <td><span>${entity.goods.phone}</span></td>
                <td>
                    <c:choose>
                        <c:when test="${entity.goods.bindCard}">
                            <span class="emphasize">是</span>
                        </c:when>
                        <c:otherwise>
                            <span>否</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td><span>${entity.goods.cardNo}</span></td>
                <td>
                    <c:choose>
                        <c:when test="${entity.goods.bindPackages}">
                            <span class="emphasize">是</span>
                        </c:when>
                        <c:otherwise>
                            <span>否</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td><span>${entity.packages.packagesName}</span></td>
                <td>
                    <span>
                        <fmt:message key="def.mobile.number.type.${entity.goods.prettyNumber.code}.name" bundle="${def}"/>
                    </span>
                </td>
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
        <pg:pager url="${ctx}/goods/mobile/list"
                  items="${pageInfo.total}" isOffset="true"
                  maxPageItems="${pageInfo.pageSize}"
                  export="offset, currentPageNumber=pageNumber" scope="request">
            <pg:param name="maxPageItems" value="${pageInfo.pageSize}"/><!--不能缺少的-->
            <pg:param name="items" value="${pageInfo.total}"/>
            <pg:param name="mobile" value="${mobile}"/>
            <pg:param name="liangType" value="${liangType}"/>
            <pg:param name="countryCode" value="${countryCode}"/>
            <pg:param name="operatorId" value="${operatorId}"/>
            <pg:param name="storeId" value="${storeId}"/>
            <pg:param name="include" value="${include}"/>
            <pg:param name="exclude" value="${exclude}"/>
            <pg:param name="tail" value="${tail}"/>
            <%@ include file="/common/page.jsp" %>
        </pg:pager>
    </c:if>
</div>
</body>
</html>