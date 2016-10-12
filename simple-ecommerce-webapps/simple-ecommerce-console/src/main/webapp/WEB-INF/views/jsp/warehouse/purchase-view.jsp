<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-采购单</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>
<body>
	
<form id="purchaseform" class="form-inline definewidth m20"  method="post">
	<table class="table table-bordered table-hover definewidth m10" width="100%">
	    <thead id="addDataHtml">
	    <tr>
	        <th>商品名称</th>
	        <th>商品类型</th>
	        <th>国家</th>
	        <th>运营商</th>
	        <th>店铺</th>
	        <th>套餐</th>
	        <th>申请数量</th>
	        <c:if test="${empty editFlag}">
	        	<th>采购数量</th>
	        </c:if>
	    </tr>
	    </thead>
	    <c:forEach items="${purDetailList}" var="item" varStatus="st">
		    <tr>
		        <td>${item.detail.goodsName}</td>
		        <td><fmt:message key="def.goods.type.${item.detail.goodsType}.name" bundle="${def}" /></td>
		        <td>${item.country.countryName}</td>
		        <td>${item.operator.operatorName}</td>
		        <td>${item.store.storeName}</td>
		        <td>${item.packages.packagesName}</td>
		        <td>${item.detail.applyNum}</td>
		        <c:if test="${empty editFlag}">
		        	<td>${item.detail.purchaseNum}</td>
		        </c:if>
		    </tr>
    	</c:forEach>
	    
	</table>
	<br/>
	<p>
			&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="history.go(-1);" class="btn btn-success">返回</button>
			<c:if test="${not empty editFlag}">
				&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="auditPurchase('${purchaseCode}','audited');" class="btn btn-success">审核通过</button>
				&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="auditPurchase('${purchaseCode}','rejected');" class="btn btn-success">审核不通过</button>
			</c:if>
	</p>
</form>
<script type="text/javascript">
	function auditPurchase(purchaseCode,status){
		location.href="${ctx}/purchase/audit?purchaseCode="+purchaseCode+"&status="+status;
	}
</script>
</body>
</html>