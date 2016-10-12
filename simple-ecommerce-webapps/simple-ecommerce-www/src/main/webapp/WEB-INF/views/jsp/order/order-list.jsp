<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>${site_title} - 订单中心</title>
	<%@include file="/common/include.rec.jsp" %>
	<style>
		#addfapiao {
			cursor: pointer
		}
	</style>
</head>
<body>
<!-- 引用TOP -->
<%@include file="/common/topOne.rec.jsp" %>
<%@include file="/common/include.menu.rec.jsp" %>
<div class="space30"></div>

<div class="mw panel"><span>服务 &gt; 我的订单 &gt; 订单中心</span></div>

<div class="space20"></div>

<div class="mw">
	<dl class="centerMenu">
		<dt><img src="${ctx}/static/img/icon_center_1.png" />我的订单</dt>
		<dd><a class="sel" href="${ctx}/order/center">订单中心</a></dd>
		<dd><a href="${ctx}/trolley/goods/show">我的购物车</a></dd>
		<dt><img src="${ctx}/static/img/icon_center_2.png" />我的收藏</dt>
		<dd><a href="18 centerCollectGoods.html" >收藏的商品</a></dd>
		<dd><a href="17 centerCollectShop.html">收藏的店铺</a></dd>
		<dt><img src="${ctx}/static/img/icon_center_3.png" />账户中心</dt>
		<dd><a href="15 centerBaseInfo.html">基本资料</a></dd>
		<dd><a href="16 centerWebInfo.html">入网资料</a></dd>
		<dd><a href="20 centerMail.html">消息</a></dd>
		<dd><a href="12 centerSafe.html">账户安全</a></dd>
		<dd><a href="13 centerShare.html">分享设置</a></dd>
		<dd><a href="19 centerAddress.html">收货地址</a></dd>
        <dt><img src="${ctx}/static/img/icon_center_4.png" />客户服务</dt>
		<dd><a href="28 goodsReturnApply.html">退换货</a></dd>
		<dd><a href="a2 SIMcardLossReport.html">卡贴挂失</a></dd>
        <dt><img src="${ctx}/static/img/icon_center_5.png" />预约中心</dt>
		<dd><a href="a3 MyReservation.html">我的预约</a></dd>
 
	</dl>
	
	<div class="centerCon">
		<div class="panel"><div>便利提醒： <a>待付款(0)</a>　<a>待确认收货(0)</a></div></div>
		<div class="space"></div>
		<div class="b1"><img class="w10p" src="${ctx}/static/img/centerImg.png" /></div>
		<div class="space"></div>
		<table class="orderTable">
			<thead>
				<tr>
					<th colspan="2">订单信息</th>
					<th>收货人</th>
					<th>订单金额</th>
					<th>
						<select>
							<option>最近三个月</option>
						</select>
					</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty rows}">
					<c:forEach items="${rows}" var="entity">
						<tr id="order-head-${entity.order.id}"><th colspan="7">订单号：<b>${entity.order.orderCode}</b></th></tr>
						<tr id="order-body-${entity.order.id}">
							<td><img src="${ctx}/static/img/servePanelSlide_1.png" /></td>
							<td>
								<strong>
									<a href="06 detailPackage.html">
										<b>【北京联通】沃4G手机卡（1G流量+300条短信+通话时长40min）</b>
									</a>
								</strong>
							</td>
							<td>
								<i>
									<c:choose>
										<c:when test="${not empty entity.orderContactInfo}">
											${entity.orderContactInfo.receiverName}
										</c:when>
										<c:otherwise>
											${entity.accountBooking.bookingRealName}
										</c:otherwise>
									</c:choose>
								</i>
							</td>
							<td>
								<b>￥ ${entity.order.totalFee}</b>
								<div class="space5"></div>
								<fmt:message key="def.order.payment.type.${entity.order.paymentType.code}.name" bundle="${def}"/>
							</td>
							<td>
								<i><fmt:formatDate value="${entity.order.orderTime}" pattern="yyyy-MM-dd"/></i>
								<div class="space5"></div>
								<i><fmt:formatDate value="${entity.order.orderTime}" pattern="HH:mm:ss"/></i>
							</td>
							<td><select><option>跟踪</option></select></td>
							<td>
								<a href="${ctx}/order/detail/${entity.order.orderCode}">查看</a>
								<a href="javascript:void(0);" onclick="removeOrder(${entity.order.id})">删除</a>
								<div class="space5"></div>
								<a class="btn" href="${ctx}/service/package/list"><em></em>还要买</a>
								<div class="space5"></div>
								<a href="javascript:void(0);">退换货</a>
								<a href="javascript:void(0);">/挂失</a>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="space"></div>
		<div class="panel">
			<span>热卖单品</span>
			<div>
				<div class="space"></div>
				<dl class="selHot">
					<dt><a href="06 detailPackage.html"></a><img src="${ctx}/static/img/servePanelSlide_1.png"><p>全国联通100元充值 5秒到账</p><b>￥ 99.00</b><p>月销：<i>3368</i></p></dt>
					<dd></dd>
					<dt><a href="06 detailPackage.html"></a><img src="${ctx}/static/img/servePanelSlide_2.png"><p>全国联通100元充值 5秒到账</p><b>￥ 99.00</b><p>月销：<i>3368</i></p></dt>
					<dd></dd>
					<dt><a href="06 detailPackage.html"></a><img src="${ctx}/static/img/servePanelSlide_3.png"><p>全国联通100元充值 5秒到账</p><b>￥ 99.00</b><p>月销：<i>3368</i></p></dt>
					<dd></dd>
					<dt><a href="06 detailPackage.html"></a><img src="${ctx}/static/img/servePanelSlide_1.png"><p>全国联通100元充值 5秒到账</p><b>￥ 99.00</b><p>月销：<i>3368</i></p></dt>
				</dl>
				<div class="space"></div>
			</div>
		</div>
	</div>
</div>

<div class="space100"></div>
<div class="bottom">
	<dl>
		<dt>
			版权所有：1998-2014 悠游集团　<a>法律公告</a>　｜　<a>隐私保护</a>　　Boss网京ICP备11035381
		</dt>
		<dd>
			<a>满意度调查</a>　｜　<a href="37 contact.html">联系我们</a>　｜　<a href="d3 JobOpportunities.html">工作机会</a>　｜　<a>合作伙伴认证</a>　｜　<a href="m2 helpCenterLoginorRegister.html">帮助中心</a>
		</dd>
	</dl>
</div>
<script type="text/javascript" src="${ctx}/static/js/bottom.js"></script>
<script type="text/javascript">
	function removeOrder(orderId) {
		if(orderId) {
			$.post("${ctx}/order/account/remove",{orderId:orderId},function(result){
				var data = eval(result);
				if(data.status_code == "1") {
					$("#order-head-"+orderId).remove();
					$("#order-body-"+orderId).remove();
				} else {
					alert(data.msg);
				}
			})
		}
	}
</script>
</body>
</html> 
