<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-入库单详情</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>
<body>
<div class="container">
    <div class="detail-page">
        <h2>入库单详情</h2>
        <div class="detail-section">
            <h3>卡贴信息</h3>
            <div class="row detail-row">
                <c:if test="${not empty cardList}">
                    <table class="table table-bordered table-hover definewidth m10">
                        <thead>
                            <tr>
                                <th>国家</th>
                                <th>采购数量</th>
                                <th>已录入明细</th>
                                <th>已入库数量</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${cardList}" var="cardEntity">
                                <tr>
                                    <td>
                                        <span class="detail-text">${cardEntity.country.countryName}</span>
                                    </td>
                                    <td>
                                        <span class="detail-text">${cardEntity.detail.applyNum}</span>
                                    </td>
                                    <td>
                                        <span class="detail-text">${cardEntity.detail.detailNum}</span>
                                    </td>
                                    <td>
                                        <span class="detail-text">${cardEntity.detail.entryNum}</span>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>
        <div class="detail-section">
            <h3>套餐信息</h3>
            <div class="row detail-row">
                <c:if test="${not empty packagesList}">
                    <table class="table table-bordered table-hover definewidth m10">
                        <thead>
                        <tr>
                            <th>国家</th>
                            <th>运营商</th>
                            <th>店铺</th>
                            <th>套餐名称</th>
                            <th>采购数量</th>
                            <th>已录入明细</th>
                            <th>已入库数量</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="packagesEntity" items="${packagesList}">
                                <tr>
                                    <td>
                                        <span class="detail-text">${packagesEntity.country.countryName}</span>
                                    </td>
                                    <td>
                                        <span class="detail-text">${packagesEntity.operator.operatorName}</span>
                                    </td>
                                    <td>
                                        <span class="detail-text">${packagesEntity.store.storeName}</span>
                                    </td>
                                    <td>
                                        <span class="detail-text">${packagesEntity.detail.goodsName}</span>
                                    </td>
                                    <td>
                                        <span class="detail-text">${packagesEntity.detail.purchaseNum}</span>
                                    </td>
                                    <td>
                                        <span class="detail-text">${packagesEntity.detail.detailNum}</span>
                                    </td>
                                    <td>
                                        <span class="detail-text">${packagesEntity.detail.entryNum}</span>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>
        <div class="detail-section">
            <h3>号码信息</h3>
            <div class="row detail-row">
                <c:if test="${not empty phoneNumberList}">
                    <table class="table table-bordered table-hover definewidth m10">
                        <thead>
                        <tr>
                            <th>国家</th>
                            <th>运营商</th>
                            <th>店铺</th>
                            <th>采购数量</th>
                            <th>已录入明细</th>
                            <th>已入库数量</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="phoneEntity" items="${phoneNumberList}">
                            <tr>
                                <td>
                                    <span class="detail-text">${phoneEntity.country.countryName}</span>
                                </td>
                                <td>
                                    <span class="detail-text">${phoneEntity.operator.operatorName}</span>
                                </td>
                                <td>
                                    <span class="detail-text">${phoneEntity.store.storeName}</span>
                                </td>
                                <td>
                                    <span class="detail-text">${phoneEntity.detail.purchaseNum}</span>
                                </td>
                                <td>
                                    <span class="detail-text">${phoneEntity.detail.detailNum}</span>
                                </td>
                                <td>
                                    <span class="detail-text">${phoneEntity.detail.entryNum}</span>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>