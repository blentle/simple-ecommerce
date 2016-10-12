<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-订单列表</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>
<body>
<form class="form-inline definewidth m20" action="${ctx}/order/list" method="post">
    <table class="table">
        <tr>
            <td>订单号</td>
            <td><input type="text" name="orderCode" value="${orderCode}"></td>
            <td>订单状态</td>
            <td>
                <select name="orderStatus">
                    <option value="">全部</option>
                    <c:if test="${not empty orderStatusList}">
                        <c:forEach var="entity" items="${orderStatusList}">
                            <option value="${entity.code}" <c:if test="${entity.code eq orderStatus}"> selected="selected" </c:if>>
                                <fmt:message key="def.order.status.${entity.code}.name" bundle="${def}"/>
                            </option>
                        </c:forEach>
                    </c:if>
                </select>
            </td>
            <td>发货状态</td>
            <td>
                <select name="shipStatus">
                    <option value="">全部</option>
                    <c:if test="${not empty shipStatusList}">
                        <c:forEach items="${shipStatusList}" var="shipEntity">
                            <option value="${shipEntity.code}" <c:if test="${shipEntity.code eq shipStatus}"> selected="selected" </c:if>>
                                <fmt:message key="def.order.ship.status.${shipEntity.code}.name" bundle="${def}"/>
                            </option>
                        </c:forEach>
                    </c:if>
                </select>
            </td>
            <td></td>
        </tr>
        <tr>
            <td>支付状态</td>
            <td>
                <select name="paymentStatus">
                    <option value="">全部</option>
                    <c:if test="${not empty paymentStatusList}">
                        <c:forEach var="payEntity" items="${paymentStatusList}">
                            <option value="${payEntity.code}" <c:if test="${payEntity.code eq paymentStatus}"> selected="selected" </c:if>>
                                <fmt:message key="def.order.ship.status.${payEntity.code}.name" bundle="${def}"/>
                            </option>
                        </c:forEach>
                    </c:if>
                </select>
            </td>
            <td>订单类型</td>
            <td>
                <select name="orderType">
                    <option value="">全部</option>
                    <c:if test="${not empty orderTypeList}">
                        <c:forEach var="entity" items="${orderTypeList}">
                            <option value="${entity.code}" <c:if test="${entity.code eq orderType}"> selected="selected" </c:if>>
                                <fmt:message key="def.order.type.${entity.code}.name" bundle="${def}"/>
                            </option>
                        </c:forEach>
                    </c:if>
                </select>
            </td>
            <td><button type="submit" class="btn btn-primary">查询</button></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th><em>订单号</em></th>
        <th><em>下单用户</em></th>
        <th><em>收货人姓名</em></th>
        <th><em>收货人手机号</em></th>
        <th><em>发货状态</em></th>
        <th><em>支付状态</em></th>
        <th><em>订单类型</em></th>
        <th><em>订单状态</em></th>
        <th><em>下单时间</em></th>
        <th><em>操作</em></th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${not empty rows}">
        <c:forEach items="${rows}" var="entity">
            <tr>
                <td><span>${entity.order.orderCode}</span></td>
                <td><span>${entity.account.accountName}</span></td>
                <c:choose>
                    <c:when test="${entity.order.needDistribute eq postOrderType}">
                        <td><span>${entity.orderContactInfo.receiverName}</span></td>
                        <td><span>${entity.orderContactInfo.phone}</span></td>
                    </c:when>
                    <c:when test="${entity.order.needDistribute eq bySelfOrderType}">
                        <td><span>${entity.accountBooking.bookingRealName}</span></td>
                        <td><span>${entity.accountBooking.mobile}</span></td>
                    </c:when>
                    <c:otherwise>

                    </c:otherwise>
                </c:choose>
                <td>
                    <span><fmt:message key="def.order.ship.status.${entity.order.shipStatus.code}.name" bundle="${def}"/></span>
                </td>
                <td>
                    <span><fmt:message key="def.order.payment.status.${entity.order.paymentStatus.code}.name" bundle="${def}"/></span>
                </td>
                <td>
                    <span><fmt:message key="def.order.type.${entity.order.needDistribute.code}.name" bundle="${def}"/></span>
                </td>
                <td>
                    <span><fmt:message key="def.order.status.${entity.order.orderStatus.code}.name" bundle="${def}"/></span>
                </td>
                <td>
                    <span><fmt:formatDate value="${entity.order.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                </td>
                <td>
                    <span><a class='btn btn-small btn-primary' href="${ctx}/order/detail/${entity.order.orderCode}">查看</a></span>
                </td>
            </tr>
        </c:forEach>
    </c:if>
    </tbody>
</table>
<div class="inline pull-right page">
    <c:if test="${pageInfo.pages > 1}">
        <pg:pager url="${ctx}/order/list"
                  items="${pageInfo.total}" isOffset="true"
                  maxPageItems="${pageInfo.pageSize}"
                  export="offset, currentPageNumber=pageNumber" scope="request">
            <pg:param name="maxPageItems" value="${pageInfo.pageSize}"/><!--不能缺少的-->
            <pg:param name="items" value="${pageInfo.total}"/>
            <pg:param name="orderCode" value="${orderCode}"/>
            <pg:param name="orderStatus" value="${orderStatus}"/>
            <pg:param name="shipStatus" value="${shipStatus}"/>
            <pg:param name="paymentStatus" value="${paymentStatus}"/>
            <pg:param name="orderType" value="${orderType}"/>
            <%@ include file="/common/page.jsp" %>
        </pg:pager>
    </c:if>
</div>
</body>
</html>