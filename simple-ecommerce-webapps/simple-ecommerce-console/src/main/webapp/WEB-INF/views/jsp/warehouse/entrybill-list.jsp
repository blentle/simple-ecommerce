<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-入库单列表</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>
<body>
<form class="form-inline definewidth m20" action="${ctx}/entry/entrybill/list" method="post">
    <table class="table">
        <tr>
            <td>入库单号</td>
            <td><input type="text" name="purchaseCode" value="${purchaseCode}"></td>
            <td>采购日期</td>
            <td>
               开始日期：<input name="startDate" class="calendar calendar-time" value="${startDate}" type="text"/>
               结束日期：<input name="endDate" class="calendar calendar-time" value="${endDate}" type="text"/>
            </td>
            <td>
                <button type="submit" class="btn btn-primary">查询</button>
            </td>
        </tr>
    </table>
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
        <tr>
            <th>采购单号</th>
            <th>申请日期</th>
            <th>审核日期</th>
            <th>采购日期</th>
            <th>采购状态</th>
            <th>是否需要发票</th>
            <td>操作</td>
        </tr>
    </thead>
    <tbody>
        <c:if test="${not empty pageInfo.list}">
            <c:forEach items="${pageInfo.list}" var="entity">
                <tr>
                    <td>${entity.purchaseCode}</td>
                    <td><fmt:formatDate value="${entity.applyTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td><fmt:formatDate value="${entity.auditTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td><fmt:formatDate value="${entity.purchaseTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td id="${entity.purchaseCode}-status"><fmt:message key="def.entry.status.${entity.status.code}.name" bundle="${def}"/></td>
                    <td>
                        <c:choose>
                            <c:when test="${entity.purchaseInvoice}">
                                <span class="emphasize">是</span>
                            </c:when>
                            <c:otherwise>
                                否
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a class='btn btn-small btn-primary' href="${ctx}/entry/entrybill/detail/${entity.purchaseCode}">查看</a>
                        <c:if test="${entity.status ne completeStatus}">
                            <a id="${entity.purchaseCode}-entry" class='btn btn-small btn-info' href="${ctx}/entry/preentry/${entity.purchaseCode}">入库</a>
                            <a id="${entity.purchaseCode}-complete" class='btn btn-small btn-info' href="javascript:void(0);" onclick="completeEntry('${entity.purchaseCode}');">完成</a>
                        </c:if>
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
        <pg:pager url="${ctx}/entry/entrybill/list"
                  items="${pageInfo.total}" isOffset="true"
                  maxPageItems="${pageInfo.pageSize}"
                  export="offset, currentPageNumber=pageNumber" scope="request">
            <pg:param name="maxPageItems" value="${page.pageSize}"/><!--不能缺少的-->
            <pg:param name="items" value="${pageInfo.total}"/>
            <pg:param name="purchaseCode" value="${purchaseCode}"/>
            <pg:param name="startDate" value="${startDate}"/>
            <pg:param name="endDate" value="${endDate}"/>
            <%@ include file="/common/page.jsp" %>
        </pg:pager>
    </c:if>
</div>
</body>
<script type="text/javascript">
    BUI.use('bui/calendar',function(Calendar){
        var datepicker = new Calendar.DatePicker({
            trigger:'.calendar-time',
            showTime:true,
            autoRender : true
        });
    });
    function completeEntry(purchaseCode) {
        BUI.Message.Confirm('确定完成入库了么？',function(){
            $.post("${ctx}/entry/entrybill/complete/" + purchaseCode,{},function(result) {
                var data = eval(result);
                if(data.status_code == "1") {
                    $("#" + purchaseCode + "-status").html("入库完成");
                    $("#" + purchaseCode + "-entry").remove();
                    $("#" + purchaseCode + "-complete").remove();
                } else {
                    BUI.Message.Alert(data.msg,"error");
                }
            });
        },"question");
    }
</script>
</html>