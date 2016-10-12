<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-录入入库明细</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
    <script type="text/javascript" src="${ctx}/static/js/entrybill-goods-detail.js"></script>
</head>
<body>
<table class="table">
    <tr>
        <%--<td><a class="btn btn-primary" href="javascript:void(0);" onclick="downloadTemplate('${ctx}','${entryDetail.goodsType.code}');">下载Excel模板</a></td>--%>
        <%--<td><a class="btn btn-primary" href="javascript:void(0);" onclick="imortGoodsDetailData('${ctx}',${entryDetail.id});">导入Excel数据</a></td>--%>
        <td><a class="btn btn-success" href="${ctx}/entry/preentry/${entryDetail.purchaseCode}">返回</a></td>
    </tr>
    <tr>
        <td colspan="3">
            <div id="errMsg">
                <span id="firstMsg"></span>
            </div>
        </td>
    </tr>
</table>
<form id="createForm" class="form-inline definewidth m20">
    <h3>手工录入</h3>
    <table class="table">
        <tr>
            <td>卡贴号:</td>
            <td><input id="cardNo" type="text" name="cardNo" class="required"></td>
            <td>价格:</td>
            <td><input id="price" type="text" name="price" class="required number"></td>
            <td>
                <a href="javascript:void(0);" class="btn btn-primary" onclick="createCardDetail();">确定录入</a>
            </td>
        </tr>
    </table>
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
        <tr>
            <th><em>采购入库单号</em></th>
            <th><em>入库明细唯一标示</em></th>
            <th><em>商品类型</em></th>
            <th><em>卡贴号码</em></th>
            <th><em>价格</em></th>
            <th><em>数量</em></th>
            <th><em>操作</em></th>
        </tr>
    </thead>
    <tbody>
        <c:if test="${not empty pageInfo.list}">
            <c:forEach items="${pageInfo.list}" var="entity">
                <tr id="entry-goods-detail-${entity.id}">
                    <td><span>${entryDetail.purchaseCode}</span></td>
                    <td><span>${entryDetail.id}</span></td>
                    <td><span><fmt:message key="def.goods.type.${entity.goodsType.code}.name" bundle="${def}"/></span></td>
                    <td><span>${entity.cardNo}</span></td>
                    <td><span>${entity.price}</span></td>
                    <td><span>${entity.entryNum}</span></td>
                    <td>
                        <a class='btn btn-small btn-danger'onclick="deleteEntryGoodsDetail('${ctx}',${entity.id});" href="javascript:void(0);">删除</a>
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
        <pg:pager url="${ctx}/entry/entrybill/goods/detail/precreate/${entryDetail.id}"
                  items="${pageInfo.total}" isOffset="true"
                  maxPageItems="${pageInfo.pageSize}"
                  export="offset, currentPageNumber=pageNumber" scope="request">
            <pg:param name="maxPageItems" value="${page.pageSize}"/><!--不能缺少的-->
            <pg:param name="items" value="${pageInfo.total}"/>
            <%@ include file="/common/page.jsp" %>
        </pg:pager>
    </c:if>
</div>
</body>
<script type="text/javascript">
    function createCardDetail() {
        if(validateForm("#createForm")) {
            var data = {
                purEntryDetailId:${entryDetail.id},
                cardNo:$("#cardNo").val(),
                price:$("#price").val()
            };
            $.post("${ctx}/entry/entrybill/goods/detail/card/create",data,function(result) {
                var data = eval(result);
                if(data.status_code == '1') {
                    window.location.reload();
                } else {
                    BUI.Message.Alert(data.msg,'error');
                }
            });
        }
    }
</script>
</html>