<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>我的订单</title>
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
	<div class="centerCon">
		<!-- <div class="panel"><div>便利提醒： <a>待付款(0)</a>　<a>待确认收货(0)</a></div></div> -->
		<div class="space"></div>
		<div class="b1"><img class="w10p" src="${CONTEXT_PATH}/static/img/centerImg.png" /></div>
		<div class="space"></div>
		<table class="orderTable">
			<thead>
				<tr><th colspan="2">order information</th><th>consignee</th><th>order amount</th><th><select><option>最近三个月</option></select></th><th>order</th><th>logistics</th><th>payment</th><th>operation</th></tr>
			</thead>
			<tbody>
			<c:forEach var="mo" items="${molist}" varStatus="status">
				<tr id="main_${mo.orderId}"><th colspan="9">order number：<b>${mo.orderId}</b></th></tr>
					<c:forEach var="md" items="${mo.detailList}" varStatus="sd">
						<tr id="detail_${mo.orderId}">
						<td><img src="${CONTEXT_PATH}/static/img/servePanelSlide_1.png" /></td>
						<td><strong><b>${md.packages.packagesName}</b></strong></td>
						<td><i>${mo.member.memberName}</i></td>
						<td><b>￥${md.unitPrice}</b><div class="space5"></div>online payment</td>
						<td><i><fmt:formatDate value="${mo.createTime}" type="date" /></i><div class="space5"></div><i><fmt:formatDate value="${mo.createTime}" type="time" /></i></td>
						<td><i>
							<c:if test="${mo.orderStatus==0}" >
								submit
							</c:if>
							<c:if test="${mo.orderStatus==1}" >
								outbound
							</c:if>
							<c:if test="${mo.orderStatus==2}" >
								收货
							</c:if>
							<c:if test="${mo.orderStatus==3}" >
								complete
							</c:if>
						</i></td>
						<td><i>
							<%-- <c:if test="${mo.orderLogisticsStatus==0}" >
								无货
							已收货
							</c:if> --%>
						</i></td>
						<td><i>
							<c:if test="${mo.orderPaymentStatus==0}" >
								non-payment
							</c:if>
							<c:if test="${mo.orderPaymentStatus==1}" >
								pay
							</c:if>
								pay
						</i></td>
						
						<td>
						<a href="${CONTEXT_PATH}/users/orderDetail/${mo.orderId}?language=en">check</a>　<a href="${CONTEXT_PATH}/users/delDetail/${md.orderDetailId}?language=en">remove</a><div class="space5" ></div><a class="btn" href="${CONTEXT_PATH}/mall/oneNumber?language=en&id=${mo.orderId}"><em></em>repurchase</a><div class="space5"></div><a href="${CONTEXT_PATH}/users/returnApply?language=en">退换货/挂失</a></td>
					</tr>
					
					
					</c:forEach>
					
			</c:forEach>
			</tbody>                                                                                   
		</table>
			<div class="space"></div>
			<div class="space50">
				<web:pager pageNo="${pageNo}" currentClass="sel"
					pageSize="${pageSize}" url="/users/order?language=en" btnNum="5"
					totalCount="10" pageStyles="center">
				</web:pager>
			</div>
			<%@include file="/commons/userspanel.rec.en.jsp"%>
		</div>
</div>
<%@include file="/commons/usersbottom.rec.en.jsp"  %>

</body>
</html>