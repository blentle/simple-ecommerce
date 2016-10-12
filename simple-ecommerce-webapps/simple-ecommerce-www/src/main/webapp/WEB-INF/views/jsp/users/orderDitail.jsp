<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>我的购物车</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <%@include file="/commons/include.rec.jsp"  %>
    <script src="${CONTEXT_PATH}/static/js/users/menus.js" type="text/javascript"></script>
    <script>
    $( function() {
    	initLeftMenu('${menuItem}','${CONTEXT_PATH}');
    	$(".orderTab dt").each(function(){
    		$(this).click(function(){
    			$(this).addClass("sel").siblings().removeClass("sel");
    			$(this).closest(".orderTab").parent().find("table").eq($(this).index()).show().siblings("table").hide();
    		});
    	});
	});
    </script>
  </head>
<body>
<!-- 引用用户页部  -->
<%@include file="/commons/usershead.rec.jsp"  %>
<div class="mw panel"><span>服务 &gt; 我的订单 &gt; 订单中心</span></div>

<div class="space20"></div>

<div class="mw">
<!-- 左侧导航菜单 -->
	<dl class="centerMenu"></dl>
<!-- 右侧信息开始 -->
	<div class="centerCon orderDitail">
		<div class="panel">
			<span>
				<div class="fl">订单编号：${mallorder.orderCode}　　状态：完成</div><div class="fr"><a class="btn btn-s btn-ss">订单打印</a>　<a class="btn btn-s btn-ss">评价</a></div>
			</span>
			<div>
				<div class="space30">订单已经完成，感谢是您在悠游宝商城购物，欢迎您对本次交易及所购商品进行评价。</div>
				<div class="space40"></div>
				<ul class="timeLine">
					
					<li <c:if test="${mallorder.orderStatus>=0}"> class="sel" </c:if>><b></b><i>提交订单</i><em><fmt:formatDate value="${mallorder.createTime}"/><br><fmt:formatDate value="${mallorder.createTime}" type="time" /></em></li>
					<li <c:if test="${mallorder.orderStatus>=1}"> class="sel" </c:if>><b></b><i>商品出库</i><em><fmt:formatDate value="${mallorder.updateTime}" type="date" /><br><fmt:formatDate value="${mallorder.updateTime}" type="time" /></em><span></span></li>
					<li <c:if test="${mallorder.orderStatus>=2}"> class="sel" </c:if>><b></b><i>等待收货</i><em><fmt:formatDate value="${mallorder.updateTime}" type="date" /><br><fmt:formatDate value="${mallorder.updateTime}" type="time" /></em><span></span></li>
					<li <c:if test="${mallorder.orderStatus==3}"> class="sel" </c:if>><b></b><i>完成</i><em><fmt:formatDate value="${mallorder.updateTime}" type="date" /><br><fmt:formatDate value="${mallorder.updateTime}" type="time" /></em><span></span></li>
				</ul>
				<div class="space40"></div>
				<div class="orderTab"><dl class="fl"><dt class="sel">订单跟踪</dt><dt>付款信息</dt></dl><a class="fr"><img src="${CONTEXT_PATH}/static/img/icon_phone.png" /> 手机查订单，更方便</a></div>
				<table>
					<thead>
						<tr><td width="200"><b>处理时间</b></td><td><b>处理信息</b></td><td width="100"><b>操作人</b></td></tr>
					</thead>
					<tbody>
						<tr><td>2014-08-11 08:39:35</td><td>您提交了订单，等待系统确认</td><td>顺丰快递</td></tr>
						<tr><td>2014-08-11 08:39:35</td><td>您提交了订单，等待系统确认</td><td>顺丰快递</td></tr>
						<tr><td>2014-08-11 08:39:35</td><td>您提交了订单，等待系统确认</td><td>顺丰快递</td></tr>
						<tr><td>2014-08-11 08:39:35</td><td>您提交了订单，等待系统确认</td><td>顺丰快递</td></tr>
						<tr><td>2014-08-11 08:39:35</td><td>您提交了订单，等待系统确认</td><td>顺丰快递</td></tr>
						<tr><td>2014-08-11 08:39:35</td><td>您提交了订单，等待系统确认</td><td>顺丰快递</td></tr>
						<tr><td>2014-08-11 08:39:35</td><td>您提交了订单，等待系统确认</td><td>顺丰快递</td></tr>
						<tr><td colspan="3"><div class="space20 line1"></div><div class="space20"></div></td></tr>
						<tr><td><b>2014-08-11 08:39:35</b></td><td><b>您提交了订单，等待系统确认</b></td><td><b>顺丰快递</b></td></tr>
						<tr><td><b>送货方式：普通快递</b></td><td><b>承运人：顺丰快递　货运单号：170354654654</b></td><td></td></tr>
					</tbody>
				</table>
				<table style="display:none;">
					<tr><td colspan="2" class="space20"></td></tr>
					<tr>
						<td>
							付款方式：在线支付<br>
							商品金额：￥60.20<br>
							优惠金额：￥0.00<br>
							应付金额：￥60.20
						</td>
						<td style=" vertical-align:top;">
							运费金额：￥0.00<br>
							实际运费：￥0.00
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="space"></div>
		<div class="panel">
			<span>订单信息</span>
			<div>
				<div class="space30"><b>收货人信息</b></div>
				<p>
					收货人：${mallorder.member.memberName }<br>
					地　址：北京市海淀区三环以内学院路南多少号院北师大科技园楼门号<br>
					手机号码：${mallorder.member.memberPhone }
				</p>
				<div class="space20"></div>
				<div class="space30"><b>支付及配送方式</b></div>
				<p>
					支付方式：在线付款<br>
					<!-- 运　　费：北京市海淀区三环以内学院路南多少号院北师大科技园楼门号<br>
					送货日期：2014-08-29 -->
				</p>
				<div class="space20"></div>
				<!-- <div class="space30"><b>发票信息</b></div>
				<p>
					发票类型：普通发票<br>
					发票抬头：北京天合数为科技有限公司<br>
					发票内容：图书
				</p> -->
				<div class="space40"></div>
				<div class="space30"><b>商品清单</b></div>
				<table>
					<thead>
						<tr>
						<th><b>商品编号</b></th>
						<th><b>商品图片</b></th><th><b>商品名称</b></th><th><b>价格</b></th><th><b>数量</b></th><th><b>操作</b></th></tr>
					</thead>
					<tbody>
						<c:forEach var="md" items="${mallorder.detailList}" varStatus="sd">
						<tr>
							<th>${md.packages.packagesId}</th>
							<th><img src="${CONTEXT_PATH}${md.packages.packagesPcImage }" width="85" height="70" /></th>
							<td><a href="${CONTEXT_PATH}/mall/oneNumber?id=18610111111">${md.packages.packagesName }${md.orderCommodityName }</a></td>
							<th><i>￥${md.unitPrice }</i></th>
							<th>${md.quantity }</th>
							<th><a>申请返修/退换货</a><div class="space"></div><a class="btn btn-ss"><img src="${CONTEXT_PATH}/static/img/icon_stillBuy.png" /> 还要买</a></th>
						</tr>
						<tr><td colspan="63"><div class="line2"></div></td></tr>
						</c:forEach>
						
						<tr><td colspan="5" class="tar"><b>商品金额：<br>- 返现：<br>+ 运费：</b></td><td class="tal"><b>￥${mallorder.orderSum }<br>￥0.00<br>￥0.00</b></td></tr>
						<tr><td colspan="5" class="tar"><b>应付金额：</b></td><td class="tal"><strong>￥${mallorder.orderSum }</strong></td></tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<%@include file="/commons/usersbottom.rec.jsp"  %>
</body>
</html>