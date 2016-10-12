<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-订单详情</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>
<body>
<div class="container">
    <div class="detail-page">
        <div class="detail-section">
            <h3>订单基本信息</h3>
            <div class="row detail-row">
                <c:if test="${not empty order}">
                    <table class="table table-bordered table-hover definewidth m10">
                        <thead>
                        <tr>
                            <th><em>订单号</em></th>
                            <th><em>下单人</em></th>
                            <th><em>订单类型</em></th>
                            <th><em>收货人姓名</em></th>
                            <th><em>收货人手机号</em></th>
                            <c:choose>
                                <c:when test="${order.needDistribute eq bySelfOrderType}">
                                    <th><em>预约服务站点</em></th>
                                </c:when>
                                <c:when test="${order.needDistribute eq postOrderType}">
                                    <th><em>收货地址</em></th>
                                </c:when>
                                <c:otherwise>

                                </c:otherwise>
                            </c:choose>
                            <th><em>订单状态</em></th>
                            <th><em>订单总金额</em></th>
                            <th><em>下单时间</em></th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <span class="detail-text">${order.orderCode}</span>
                                </td>
                                <td>
                                    <span class="detail-text">${account.accountName}</span>
                                </td>
                                <td>
                                    <span class="detail-text">
                                        <fmt:message key="def.order.type.${order.needDistribute.code}.name" bundle="${def}"/>
                                    </span>
                                </td>
                                <c:choose>
                                    <c:when test="${order.needDistribute eq postOrderType}">
                                        <td>
                                            <span class="detail-text">${orderContact.receiverName}</span>
                                        </td>
                                        <td>
                                            <span class="detail-text">${orderContact.phone}</span>
                                        </td>
                                    </c:when>
                                    <c:when test="${order.needDistribute eq bySelfOrderType}">
                                        <td>
                                            <span class="detail-text">${accountBooking.accountBooking.bookingRealName}</span>
                                        </td>
                                        <td>
                                            <span class="detail-text">${accountBooking.accountBooking.mobile}</span>
                                        </td>
                                    </c:when>
                                    <c:otherwise>

                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${order.needDistribute eq bySelfOrderType}">
                                        <td>
                                            <span class="detail-text">${accountBooking.serviceSite.serviceSiteName}</span>
                                        </td>
                                    </c:when>
                                    <c:when test="${order.needDistribute eq postOrderType}">
                                        <td>
                                            <span class="detail-text">${orderContact.address}</span>
                                        </td>
                                    </c:when>
                                    <c:otherwise>

                                    </c:otherwise>
                                </c:choose>
                                <td>
                                    <span class="detail-text">
                                        <fmt:message key="def.order.status.${order.orderStatus.code}.name" bundle="${def}"/>
                                    </span>
                                </td>
                                <td>
                                    <span class="detail-text">${order.totalFee}</span>
                                </td>
                                <td>
                                    <span class="detail-text">
                                        <fmt:formatDate value="${order.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                    </span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>
        <div class="detail-section">
            <h3>详细信息</h3>
            <div class="row detail-row">
                <c:if test="${not empty orderDetailList}">
                    <table class="table table-bordered table-hover definewidth m10">
                        <thead>
                        <tr>
                            <th><em>商品类型</em></th>
                            <th><em>商品名称</em></th>
                            <th><em>商品数量</em></th>
                            <th><em>商品单价</em></th>
                            <th><em>支付金额</em></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="orderDetail" items="${orderDetailList}">
                            <form>
                                <tr>
                                    <td>
                                        <span class="detail-text"><fmt:message key="def.goods.type.${orderDetail.goodsType.code}.name" bundle="${def}"/></span>
                                    </td>
                                    <td>
                                        <span class="detail-text">${orderDetail.goodsName}</span>
                                    </td>
                                    <td>
                                        <span class="detail-text">${orderDetail.goodsNum}</span>
                                    </td>
                                    <td>
                                        <span class="detail-text">${orderDetail.goodsPrice}</span>
                                    </td>
                                    <td>
                                        <span class="detail-text">${orderDetail.payPrice}</span>
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>
    </div>
    <button type="submit" class="btn btn-success" onclick="javascript:history.go(-1);">返回</button>
</div>
<script type="text/javascript">
    function createPackagesGoodsDetail(entryDetailId) {
        if(validateForm("#packagesForm-"+ entryDetailId)) {
            var num = $("#entry-num-" + entryDetailId).val();
            var data = {
                purEntryDetailId:entryDetailId,
                amount:num
            };
            $.post("${ctx}/entry/entrybill/goods/detail/packages/create",data,function(result){
                var data = eval(result);
                if(data.status_code == '1') {
                    //reload:
                    window.location.href = "${ctx}/entry/preentry/${entrybill.purchaseCode}";
                } else {
                    BUI.Message.Alert(data.msg,'error');
                }
            });
        }
    }
</script>
</body>
</html>