<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>${site_title} - 号码</title>
    <%@include file="/common/include.rec.jsp"  %>
</head>
<body>
<!-- 引用TOP -->
<%@include file="/common/topOne.rec.jsp" %>
<%@include file="/common/include.menu.rec.jsp" %>
<div class="space30"></div>

<div class="mw">
	<div class="packageMenu fl">
		<form id="packageForm" method="post" action="${ctx}/service/number/list" >
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
			<dt><span>2</span>手机制式</dt>
			<c:forEach items="${phoneStandardList}" var="item">
					<dd><input name="phoneStandard" type="checkbox" 
					 <c:if test="${ not empty phoneStandardSec}">
	                     <c:forEach items="${phoneStandardSec}" var="r">
	                         <c:if test="${r eq item}">checked</c:if>
	                     </c:forEach>
                     </c:if> value="${item}" />${item}</dd>
				</c:forEach>
				<dd><input name="phoneStandard" type="checkbox" value="" />其他</dd>
			<dd><p>请谨记：一定要选择和你手机祥同志是的套餐和号码，如果你不知道的话，请下载APP或者问90后的孩子们</p></dd>
			<dt><span>3</span>卡贴</dt>
			<dd><input type="radio" name="bindCard" value="1" />绑定</dd>
			<dd><input type="radio" name="bindCard" value="0" />不绑定</dd>
			<dd><p>请谨记：非智能机仅仅需要在第一次购买时带卡贴</p></dd>
			<dt><span>4</span>运营商</dt>
			<c:forEach items="${operatorList}" var="item">
					<dd><input name="operatorId" type="checkbox" 
					<c:if test="${ not empty operatorIdSec}">
	                     <c:forEach items="${operatorIdSec}" var="r">
	                         <c:if test="${r eq item.id}">checked</c:if>
	                     </c:forEach>
                     </c:if> value="${item.id}" />${item.operatorName}</dd>
				</c:forEach>
				<dd><input name="operatorId" type="checkbox" value="" />其他</dd>
			<dt><span>5</span>价格</dt>
			<dd><input type="text" name="goodsPriceMin" value="${param.goodsPriceMin}"/> - <input name="goodsPriceMax" type="text" value="${param.goodsPriceMax}"/></dd>
			<dt><span>6</span>数字挑选</dt>
			<dd>包含数字<select name="includeNumber">
				<option value="">-请选择-</option>
				<c:forEach items="${numberList}" var="item">
					<option value="${item}">${item}</option>
				</c:forEach>
			</select></dd>
			<dd>排除数字<select name="excludeNumber">
				<option value="">-请选择-</option>
				<c:forEach items="${numberList}" var="item">
					<option value="${item}">${item}</option>
				</c:forEach>
			</select></dd>
			<dd>结尾数字<select name="tailNumber">
				<option value="">-请选择-</option>
				<c:forEach items="${numberList}" var="item">
					<option value="${item}">${item}</option>
				</c:forEach>
			</select></dd>
		</dl>
		<div class="space50 tac"><input type="submit" value="确定筛选" class="btn" /></div>
		<div class="space30"></div>
		<input type="hidden" name="orderBy" id="orderBy" />
		<input type="hidden" name="order" id="order" />
		</form>
	</div>
	<div class="numberList fr">
		<img src="${ctx}/static/img/numberTitleImg.png" />
		<div class="space"></div>
		<div class="sort"><span id="price" onclick="orderby('GOODS_PRICE',this);"><b>价格<i class="sel">↑</i></b></span></div>
		<ul>
			<c:forEach items="${numbersList}" var="item">
				<li>
					<a href="javascript:numberDetail('${item.ID}','${item.PACKAGES_NAME}','${item.PACKAGES_DESC}','${item.PACKAGES_RANGE}','${item.OPERATOR_ID}','${operatorMap[item.OPERATOR_ID]}','${item.PHONE}','${item.GOODS_PRICE}','${item.VALID_TIME}','${item.INTRODUCTION}','${item.PRETTY_PRICE}',${item.BIND_CARD},'${item.PHONE_STANDARD}','${item.PACKAGES_IMAGE}');"></a>
					<p><b>${item.PHONE}</b><i>￥${item.GOODS_PRICE}</i></p>
					${item.PACKAGES_DESC}
					<div class="space"></div>
					适用范围：<c:if test="${not empty item.PACKAGES_RANGE}">
	                    	${item.PACKAGES_RANGE}
	                    </c:if>
	                    <c:if test="${empty item.PACKAGES_RANGE}">
	                    	${countryMap[item.COUNTRY_CODE]}
	                    </c:if>
					<div class="space"></div>
					运营商：<font>${operatorMap[item.OPERATOR_ID]}</font>
					<div class="space"></div>
					卡贴：<c:if test="${item.BIND_CARD}">绑定</c:if>
						  <c:if test="${!item.BIND_CARD}">未绑定</c:if>
					<button class="btn">购 买</button>
				</li>
			</c:forEach>
		</ul>
		<c:if test="${pageInfo.pages > 1}">
	        <pg:pager url="${ctx}/service/number/list"
	                  items="${pageInfo.total}" isOffset="true"
	                  maxPageItems="${pageInfo.pageSize}"
	                  export="offset, currentPageNumber=pageNumber" scope="request">
	            <pg:param name="maxPageItems" value="${page.pageSize}"/><!--不能缺少的-->
	            <pg:param name="items" value="${pageInfo.total}"/>
	            <pg:param name="countryCode" value="${countryCode}"/>
	            <pg:param name="operatorId" value="${operatorId}"/>
	            <pg:param name="phoneStandard" value="${phoneStandard}"/>
	            <pg:param name="orderBy" value="${param.orderBy}"/>
	            <pg:param name="order" value="${param.order}"/>
	            <pg:param name="bindCard" value="${param.bindCard}"/>
	            <pg:param name="goodsPriceMin" value="${param.goodsPriceMin}"/>
	            <pg:param name="goodsPriceMax" value="${param.goodsPriceMax}"/>
	            <pg:param name="includeNumber" value="${param.includeNumber}"/>
	            <pg:param name="excludeNumber" value="${param.excludeNumber}"/>
	            <pg:param name="tailNumber" value="${param.tailNumber}"/>
	            <%@ include file="/common/page.jsp" %>
	        </pg:pager>
    	</c:if>
	</div>
</div>

<div class="space100"></div>
<form id="numberForm" method="post" action="${ctx}/service/number/detail">
	<input type="hidden" name="packagesName" id="packagesName2" value="" />
	<input type="hidden" name="packagesDesc" id="packagesDesc2" value="" />
	<input type="hidden" name="packagesRange" id="packagesRange2" value="" />
	<input type="hidden" name="introduction" id="introduction2" value="" />
	<input type="hidden" name="validTime" id="validTime2" value="" />
	<input type="hidden" name="operatorName" id="operatorName2" value="" />
	<input type="hidden" name="operatorId" id="operatorId2" value="" />
	<input type="hidden" name="phone" id="phone2" value="" />
	<input type="hidden" name="goodsPrice" id="goodsPrice2" value="" />
	<input type="hidden" name="prettyPrice" id="prettyPrice2" value="" />
	<input type="hidden" name="phoneStandard" id="phoneStandard2" value="" />
	<input type="hidden" name="bindCard" id="bindCard2" value="" />
    <input type="hidden" name="goodsId" id="goodsId2"/>
    <input type="hidden" name="packageImg" id="packageImg"/>
</form>
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
			}
		}
		var bindCard="${param.bindCard}";
		if(bindCard){
			$("input[name='bindCard'][value='"+bindCard+"']").attr("checked",true);
		}
		var includeNumber="${param.includeNumber}";
		var excludeNumber="${param.excludeNumber}";
		var tailNumber="${param.tailNumber}";
		if(includeNumber){
			$("select[name='includeNumber'] option[value='"+includeNumber+"']").attr("selected",true);
		}
		if(excludeNumber){
			$("select[name='excludeNumber'] option[value='"+excludeNumber+"']").attr("selected",true);
		}
		if(tailNumber){
			$("select[name='tailNumber'] option[value='"+tailNumber+"']").attr("selected",true);
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

	function numberDetail(goodsId,packagesName,packagesDesc,packagesRange,operatorId,operatorName,phone,goodsPrice,validTime,introduction,prettyPrice,bindCard,phoneStandard,packageImg){
		$("#packagesName2").val(packagesName);
		$("#packagesDesc2").val(packagesDesc);
		$("#packagesRange2").val(packagesRange);
		$("#validTime2").val(validTime);
		$("#introduction2").val(introduction);
		$("#operatorId2").val(operatorId);
		$("#operatorName2").val(operatorName);
		$("#phone2").val(phone);
		$("#goodsPrice2").val(goodsPrice);
        $("#goodsId2").val(goodsId);
        $("#prettyPrice2").val(prettyPrice);
        $("#bindCard2").val(bindCard);
        $("#phoneStandard2").val(phoneStandard);
        $("#packageImg").val(packageImg);
		$("#numberForm").submit();
    }
	
</script>
</body>
</html>
