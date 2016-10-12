<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>${site_title} - 套餐</title>
    <%@include file="/common/include.rec.jsp"  %>
</head>
<body>
<!-- 引用TOP -->
<%@include file="/common/topOne.rec.jsp" %>
<%@include file="/common/include.menu.rec.jsp" %>
<div class="space30"></div>

<div class="mw">
	<div class="packageMenu fl">
		<form id="packageForm" method="post" action="${ctx}/service/package/list" >
			<h2>在这里找到你想要的</h2>
			<dl>
				
				<dt><span>1</span>国家地区</dt>
				<c:forEach items="${countryList}" var="item">
					<dd><input name="countryCode" type="checkbox" 
					 <c:if test="${ not empty countryCodeSec}">
	                     <c:forEach items="${countryCodeSec}" var="r">
	                         <c:if test="${r eq item.countryCode}">checked</c:if>
	                     </c:forEach>
                     </c:if> value="${item.countryCode}" />${item.countryName}</dd>
				</c:forEach>
				<dd><input name="countryCode" type="checkbox" value="" />更多</dd>
				<dt><span>2</span>运营商</dt>
				<c:forEach items="${operatorList}" var="item">
					<dd><input name="operatorId" type="checkbox" 
					<c:if test="${ not empty operatorIdSec}">
	                     <c:forEach items="${operatorIdSec}" var="r">
	                         <c:if test="${r eq item.id}">checked</c:if>
	                     </c:forEach>
                     </c:if> value="${item.id}" />${item.operatorName}</dd>
				</c:forEach>
				<dd><input name="operatorId" type="checkbox" value="" />其他</dd>
				<dd><p>请谨记：一定要选择和你手机祥同志是的套餐和号码，如果你不知道的话，请下载APP或者问90后的孩子们</p></dd>
				
			</dl>
			<div class="space50 tac"><input type="submit" value="确定筛选" class="btn" /></div>
			<div class="space30"></div>
			<input type="hidden" name="orderBy" id="orderBy" />
			<input type="hidden" name="order" id="order" />
		</form>
	</div>
	<div class="packageList fr">
		<img src="${CONTEXT_PATH}/static/img/packageTitleImg.png" />
		<div class="space"></div>
		<div class="sort"><span id="price" onclick="orderby('GOODS_PRICE',this);"><b>价格<i>↑</i></b></span><span id="sales" onclick="orderby('SALES_VOLUME',this);"><b>销量<i>↓</i></b></span></div>
		<ul>
			<c:forEach items="${packageList}" var="item">
			<li>
				<a href="javascript:packageDetail('${item.ID}','${item.PACKAGES_NAME}','${item.PACKAGES_DESC}','${item.SALES_VOLUME}','${item.PACKAGES_RANGE}','${operatorMap[item.OPERATOR_ID]}','${item.VALID_TIME}','${item.INTRODUCTION}','${item.PACKAGES_IMAGE}');"></a>
				<em></em>
				<div>
					<strong>${item.PACKAGES_NAME}</strong>
					<img src="${imgDomain}${item.PACKAGES_IMAGE}" />
					<p><b>已售：<font>${item.SALES_VOLUME}</font></b><i>￥${item.PACKAGES_PRICE}</i></p>
					<div class="space20"></div>
					<p class="tac"><button class="btn">　购 买　</button></p>
				</div>
				<span>
					${item.PACKAGES_DESC}
					<div class="space"></div>
					适用范围：${item.PACKAGES_RANGE}
					<div class="space"></div>
					运营商：<font>${operatorMap[item.OPERATOR_ID]}</font>
				</span>
			</li>
			</c:forEach>
			
		</ul>
		<c:if test="${pageInfo.pages > 1}">
	        <pg:pager url="${ctx}/service/package/list"
	                  items="${pageInfo.total}" isOffset="true"
	                  maxPageItems="${pageInfo.pageSize}"
	                  export="offset, currentPageNumber=pageNumber" scope="request">
	            <pg:param name="maxPageItems" value="${page.pageSize}"/><!--不能缺少的-->
	            <pg:param name="items" value="${pageInfo.total}"/>
	            <pg:param name="countryCode" value="${countryCode}"/>
	            <pg:param name="operatorId" value="${operatorId}"/>
	            <pg:param name="orderBy" value="${param.orderBy}"/>
	            <pg:param name="order" value="${param.order}"/>
	            <%@ include file="/common/page.jsp" %>
	        </pg:pager>
    	</c:if>
	</div>
</div>
<form id="packageDetailForm" method="post" action="${ctx}/service/package/detail">
	<input type="hidden" name="packagesName" id="packagesName" value="" />
	<input type="hidden" name="packagesDesc" id="packagesDesc" value="" />
	<input type="hidden" name="salesVolume" id="salesVolume" value="" />
	<input type="hidden" name="packagesRange" id="packagesRange" value="" />
	<input type="hidden" name="introduction" id="introduction" value="" />
	<input type="hidden" name="validTime" id="validTime" value="" />
	<input type="hidden" name="operatorName" id="operatorName" value="" />
	<input type="hidden" name="id" id="pid" value="" />
	<input type="hidden" name="packageImg" id="packageImg"/>
</form>
<div class="space100"></div>

<!-- 引用bottom -->
<%@include file="/common/usersbottom.rec.jsp" %>
<script>
	$(function () {
		var order="${param.order}";
		var orderBy="${param.orderBy}";
		if(orderBy){
			if(orderBy=="GOODS_PRICE"){
				if(order=="asc"){
					$("#price").html('<b>价格<i class="sel">↓</i></b>');
				}else{
					$("#price").html('<b>价格<i class="sel">↑</i></b>');
				}
			}else{
				if(order=="asc"){
					$("#sales").html('<b>销量<i class="sel">↓</i></b>');
				}else{
					$("#sales").html('<b>销量<i class="sel">↑</i></b>');
				}
			}
		}
	});
	function orderby(orderBy,obj){
		$("#orderBy").val(orderBy);
		if($(obj).text().indexOf("↑")!=-1){
			$("#order").val("asc");
		}else{
			$("#order").val("desc");
		}
		$("#packageForm").submit();
	}

	function packageDetail(id,packagesName,packagesDesc,salesVolume,packagesRange,operatorName,validTime,introduction,packageImg){
		$("#packagesName").val(packagesName);
		$("#packagesDesc").val(packagesDesc);
		$("#salesVolume").val(salesVolume);
		$("#packagesRange").val(packagesRange);
		$("#validTime").val(validTime);
		$("#introduction").val(introduction);
		$("#operatorName").val(operatorName);
		$("#pid").val(id);
		$("#packageImg").val(packageImg);
		$("#packageDetailForm").submit();
    }
</script>
</body>
</html>
