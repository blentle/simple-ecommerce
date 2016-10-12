<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-采购单</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>
<body>
	
<form id="purchaseform" class="form-inline definewidth m20" action="${ctx}/purchase/confirm" method="post">
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
	        <th>采购数量</th>
	    </tr>
	    </thead>
	    <c:forEach items="${purDetailList}" var="item" varStatus="st">
		    <tr id="del${st.index}">
		        <td>${item.detail.goodsName}<input type="hidden" name="purDetailArray[${st.index}].purchaseCode" value="${item.detail.purchaseCode}" /></td>
		        <td><fmt:message key="def.goods.type.${item.detail.goodsType}.name" bundle="${def}" /><input type="hidden" name="purDetailArray[${st.index}].id" value="${item.detail.id}" /></td>
		        <td>${item.country.countryName}</td>
		        <td>${item.operator.operatorName}</td>
		        <td>${item.store.storeName}</td>
		        <td>${item.packages.packagesName}</td>
		        <td>${item.detail.applyNum}</td>
		        <td><input name="purDetailArray[${st.index}].purchaseNum" type="text" class="required" /></td>
		    </tr>
    	</c:forEach>
	    
	</table>
	<br/>
	<p>
			&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="history.go(-1);" class="btn btn-success">返回</button>
		    &nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="confirmPurchase();" class="btn btn-success">确认采购</button>
	</p>
</form>
<script type="text/javascript">
	function confirmPurchase(){
		if(validateForm("#purchaseform")){
				$("#purchaseform").submit();
		}	
     }
</script>
</body>
</html>