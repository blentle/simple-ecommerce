<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-采购单</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>
<body>
<form class="form-inline definewidth m20" action="${ctx}/purchase/list" method="post">
    <table class="table">
        <tr>
            <td>采购单号</td>
            <td><input type="text" name="purchaseCode" id="purchaseCode" value="${param.purchaseCode}"></td>
            <td>申请日期</td>
            <td><input type="text" name="startApplyTime" id="startApplyTime" class="calendar" value="${param.startApplyTime}">~<input type="text" name="endApplyTime" id="endApplyTime" class="calendar" value="${param.endApplyTime}"></td>
            <td><button type="submit" class="btn btn-primary">查询</button>
            	<button type="button" class="btn btn-success" id="addnew" onclick="add()">申请采购</button>
            </td>
        </tr>
    </table>
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>序号</th>
        <th>采购单号</th>
        <th>申请日期</th>
        <th>采购状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <c:forEach items="${pageInfo.list}" var="item" varStatus="st">
	    <tr>
	        <td>${st.index+1}</td>
	        <td>${item.purchaseCode}</td>
	        <td><fmt:formatDate value="${item.applyTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	        <td><fmt:message key="def.entry.status.${item.status.code}.name" bundle="${def}"/></td>
	        <td>
	            <a href="${ctx}/purchase/view?purchaseCode=${item.purchaseCode}" class="btn btn-primary">查看</a>
                <c:if test="${item.status eq applyingStatus}">
                    <a href="${ctx}/purchase/pre/add?purchaseCode=${item.purchaseCode}" class="btn btn-primary">编辑</a>
                    <a href="${ctx}/purchase/view?purchaseCode=${item.purchaseCode}&editFlag=1" class="btn btn-primary">审核</a>
                </c:if>
                <c:if test="${item.status eq auditedStatus}">
	                <a href="${ctx}/purchase/pre/confirm?purchaseCode=${item.purchaseCode}" class="btn btn-primary">确认采购</a>
                </c:if>
	        </td>
	    </tr>
    </c:forEach>
</table>
<div class="inline pull-right page">
    <c:if test="${pageInfo.pages > 1}">
        <pg:pager url="${ctx}/purchase/list"
                  items="${pageInfo.total}" isOffset="true"
                  maxPageItems="${pageInfo.pageSize}"
                  export="offset, currentPageNumber=pageNumber" scope="request">
            <pg:param name="maxPageItems" value="${page.pageSize}"/><!--不能缺少的-->
            <pg:param name="items" value="${pageInfo.total}"/>
            <pg:param name="purchaseCode" value="${param.purchaseCode}"/>
            <pg:param name="startApplyTime" value="${param.startApplyTime}"/>
            <pg:param name="endApplyTime" value="${param.endApplyTime}"/>
            <%@ include file="/common/page.jsp" %>
        </pg:pager>
    </c:if>
</div>
<script type="text/javascript">
	$(function () {
		BUI.use('bui/calendar',function(Calendar){
	        var datepicker = new Calendar.DatePicker({
	          trigger:'.calendar',
	          autoRender : true
	        });
	      });
		
	});
	function add(){
		location.href="${ctx}/purchase/pre/add";
	}
</script>
</body>
</html>