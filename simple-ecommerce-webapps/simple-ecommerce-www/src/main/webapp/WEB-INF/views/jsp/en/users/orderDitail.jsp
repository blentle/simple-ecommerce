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
    <script src="${CONTEXT_PATH}/static/js/users/menus.en.js" type="text/javascript"></script>
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
<%@include file="/commons/usershead.rec.en.jsp"  %>
<div class="mw panel"><span>Service &gt; My Orders &gt; Orders Centre</span></div>

<div class="space20"></div>

<div class="mw">
<!-- 左侧导航菜单 -->
	<dl class="centerMenu"></dl>
<!-- 右侧信息开始 -->
	<div class="centerCon orderDitail">
		<div class="panel">
			<span>
				<div class="fl">order id：${mallorder.orderId}　　status：accomplish</div><div class="fr"><a class="btn btn-s btn-ss">print order</a>　<a class="btn btn-s btn-ss">evaluate</a></div>
			</span>
			<div>
				<div class="space30">Thank you order has been completed, are you swimming in the shopping mall, welcome you to evaluate the transaction and the purchased goods.</div>
				<div class="space40"></div>
				<ul class="timeLine">
					
					<li <c:if test="${mallorder.orderStatus>=0}"> class="sel" </c:if>><b></b><i>提交订单</i><em><fmt:formatDate value="${mallorder.createTime}"/><br><fmt:formatDate value="${mallorder.createTime}" type="time" /></em></li>
					<li <c:if test="${mallorder.orderStatus>=1}"> class="sel" </c:if>><b></b><i>商品出库</i><em><fmt:formatDate value="${mallorder.updateTime}" type="date" /><br><fmt:formatDate value="${mallorder.updateTime}" type="time" /></em><span></span></li>
					<li <c:if test="${mallorder.orderStatus>=2}"> class="sel" </c:if>><b></b><i>等待收货</i><em><fmt:formatDate value="${mallorder.updateTime}" type="date" /><br><fmt:formatDate value="${mallorder.updateTime}" type="time" /></em><span></span></li>
					<li <c:if test="${mallorder.orderStatus==3}"> class="sel" </c:if>><b></b><i>accomplish</i><em><fmt:formatDate value="${mallorder.updateTime}" type="date" /><br><fmt:formatDate value="${mallorder.updateTime}" type="time" /></em><span></span></li>
				</ul>
				<div class="space40"></div>
				<div class="orderTab"><dl class="fl"><dt class="sel">order-tracking</dt><dt>payment information</dt></dl><a class="fr"><img src="${CONTEXT_PATH}/static/img/icon_phone.png" /> Mobile phone to check the order, more convenient</a></div>
				<table>
					<thead>
						<tr><td width="200"><b>processing time</b></td><td><b>process information</b></td><td width="100"><b>operator</b></td></tr>
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
							payment method：在线支付<br>
							amount of goods：￥60.20<br>
							discount amount：￥0.00<br>
							amount payable：￥60.20
						</td>
						<td style=" vertical-align:top;">
							freight：￥0.00<br>
							actual freight：￥0.00
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="space"></div>
		<div class="panel">
			<span>order information</span>
			<div>
				<div class="space30"><b>Consignee information</b></div>
				<p>
					consignee：${mallorder.member.memberName }<br>
					address：北京市海淀区三环以内学院路南多少号院北师大科技园楼门号<br>
					phone number：${mallorder.member.memberPhone }
				</p>
				<div class="space20"></div>
				<div class="space30"><b>Payment and delivery methods</b></div>
				<p>
					pattern of payment：在线付款<br>
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
				<div class="space30"><b>commodity list</b></div>
				<table>
					<thead>
						<tr><th><b>ommodity id</b></th><th><b>commodity picture</b></th><th><b>ommodity name</b></th><th><b>price</b></th><th><b>number</b></th><th><b>操作</b></th></tr>
					</thead>
					<tbody>
						<c:forEach var="md" items="${mallorder.detailList}" varStatus="sd">
						<tr>
							<th>${md.orderDetailId }</th>
							<th><img src="${CONTEXT_PATH}${md.packages.packagesPcImage }/static/img/servePanelSlide_1.png" width="85" height="70" /></th>
							<td><a href="${CONTEXT_PATH}/mall/oneNumber?language=en&id=18610111111">${md.packages.packagesName }${md.orderCommodityName }</a></td>
							<th><i>￥${md.unitPrice }</i></th>
							<th>${md.quantity }</th>
							<th><a>申请返修/退换货</a><div class="space"></div><a class="btn btn-ss"><img src="${CONTEXT_PATH}/static/img/icon_stillBuy.png" /> repurchase</a></th>
						</tr>
						<tr><td colspan="63"><div class="line2"></div></td></tr>
						</c:forEach>
						
						<tr><td colspan="5" class="tar"><b>commodity price：<br>- cash back：<br>+ freight：</b></td><td class="tal"><b>￥${mallorder.orderSum }<br>￥0.00<br>￥0.00</b></td></tr>
						<tr><td colspan="5" class="tar"><b>amount payable：</b></td><td class="tal"><strong>￥${mallorder.orderSum }</strong></td></tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<%@include file="/commons/usersbottom.rec.en.jsp"  %>
</body>
</html>