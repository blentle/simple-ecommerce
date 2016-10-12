<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-入库</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>
<body>
<div class="container">
    <div class="detail-page">
        <h2>入库明细</h2>
        <div class="detail-section">
            <h3>卡贴信息</h3>
            <div class="row detail-row">
                <c:if test="${not empty cardList}">
                    <table class="table table-bordered table-hover definewidth m10">
                        <thead>
                        <tr>
                            <th><em>国家</em></th>
                            <th><em>商品名称</em></th>
                            <th><em>采购数量</em></th>
                            <th><em>已录入明细</em></th>
                            <th><em>操作</em></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${cardList}" var="cardEntity">
                            <tr>
                                <td>
                                    <span class="detail-text">${cardEntity.country.countryName}</span>
                                </td>
                                <td>
                                    <span class="detail-text">${cardEntity.detail.goodsName}</span>
                                </td>
                                <td>
                                    <span class="detail-text">${cardEntity.detail.applyNum}</span>
                                </td>
                                <td>
                                    <span class="detail-text">${cardEntity.detail.detailNum}</span>
                                </td>
                                <td>
                                    <a class="btn btn-info" href="${ctx}/entry/entrybill/goods/detail/precreate/${cardEntity.detail.id}">录入(编辑)明细</a>
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
                            <th><em>国家</em></th>
                            <th><em>运营商</em></th>
                            <th><em>店铺</em></th>
                            <th><em>商品名称</em></th>
                            <th><em>申请数量</em></th>
                            <th><em>采购数量</em></th>
                            <th><em>已录入明细</em></th>
                            <th><em>录入数量</em></th>
                            <th><em>操作</em></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="packagesEntity" items="${packagesList}">
                            <form id="packagesForm-${packagesEntity.detail.id}">
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
                                        <span class="detail-text">${packagesEntity.detail.applyNum}</span>
                                    </td>
                                    <td>
                                        <span class="detail-text">${packagesEntity.detail.purchaseNum}</span>
                                    </td>
                                    <td>
                                        <span class="detail-text">${packagesEntity.detail.detailNum}</span>
                                    </td>
                                    <td>
                                        <input id="entry-num-${packagesEntity.detail.id}" type="text" class="required digits"/>
                                    </td>
                                    <td>
                                        <a class="btn btn-info" href="javascript:void(0);" onclick="createPackagesGoodsDetail(${packagesEntity.detail.id});">确定录入</a>
                                    </td>
                                </tr>
                            </form>
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
                            <th><em>国家</em></th>
                            <th><em>运营商</em></th>
                            <th><em>店铺</em></th>
                            <th><em>商品名称</em></th>
                            <th><em>采购数量</em></th>
                            <th><em>已录入明细</em></th>
                            <th><em>操作</em></th>
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
                                    <span class="detail-text">${phoneEntity.detail.goodsName}</span>
                                </td>
                                <td>
                                    <span class="detail-text">${phoneEntity.detail.purchaseNum}</span>
                                </td>
                                <td>
                                    <span class="detail-text">${phoneEntity.detail.detailNum}</span>
                                </td>
                                <td>
                                    <a class="btn btn-info" href="${ctx}/entry/entrybill/goods/detail/precreate/${phoneEntity.detail.id}">录入(编辑)明细</a>
                                </td>
                            </tr>
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