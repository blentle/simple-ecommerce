<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
      <script src="${CONTEXT_PATH}/static/js/users/jquery.fs.boxer.js" type="text/javascript"></script>
    <link  href="${CONTEXT_PATH}/static/js/users/jquery.fs.boxer.css" rel="stylesheet" type="text/css" />
    <script>
    $(document).ready(function() {
    	initLeftMenu('${menuItem}','${CONTEXT_PATH}');
		$(".boxer").not(".retina, .boxer_fixed, .boxer_top, .boxer_format, .boxer_mobile, .boxer_object").boxer();

	
         });
       function updateMemberData(){
    	   $("#updateForm").submit();
       }
    
    </script>
  </head>
<body>
<!-- 引用用户页部  -->
<%@include file="/commons/usershead.rec.en.jsp"  %>
<div class="mw panel"><span>Service &gt; Account Central&gt; Information</span></div>

<div class="space20"></div>

<div class="mw">
<!-- 左侧导航菜单 -->
	<dl class="centerMenu"></dl>
<!-- 右侧信息开始 -->	
	<div class="centerCon goodsReturnBill">
		<div class="panel">
			<span><b class="fl">返修/退换货 申请查看</b></span>
			<div>
				<div class="space40"><b>service id：1410366547　　　status：<a>已解决</a>　　　apply time：2012-10-07 10:50:40</b></div>
				<div class="line2"></div>
				<div class="space40">本次返修已经处理完毕，希望我们的服务能令您满意，感谢您的支持，谢谢。</div>
				<div class="space20"></div>
				<ul class="timeLine">
					<li class="sel" style="margin-left:0px;"><b></b><i>submit order</i></li>
					<li class="sel"><b></b><i>客服审核</i><span></span></li>
					<li class="sel"><b></b><i>商品处理</i><span></span></li>
					<li class="sel"><b></b><i>accomplish</i><span></span></li>
					<li><b></b><i>customer affirm</i><span></span></li>
				</ul>
				<div class="space20"></div>
			</div>
		</div>
		<div class="space20"></div>
		<div class="panel">
			<div>
				<div class="space30 oh"><b class="space30 fl">service information</b><font class="fr">pack up</font></div>
				<div class="space20"></div>
				<i>
					<table>
						<tr class="title"><th>processing time</th><th>processing information</th><th>operation</th></tr>
						<tr><td>2012-10-07 10:50:51</td><td>提交申请成功</td><td>客户</td></tr>
						<tr><td>2012-10-07 10:50:51</td><td>提交申请成功，请等待审核</td><td>客户</td></tr>
						<tr><td>2012-10-07 10:50:51</td><td>请将商品邮寄到悠游宝<br>地址xx；<br>收件人xx；<br>邮编：100094；<br>联系电话010-25253344</td><td>客户</td></tr>
						<tr><td>2012-10-07 10:50:51</td><td>商品已经收到切等级检测完毕，请等待处理</td><td>客户</td></tr>
						<tr><td>2012-10-07 10:50:51</td><td>退款申请已提交，等待财务审核</td><td>客户</td></tr>
						<tr><td>2012-10-07 10:50:51</td><td>又有商城操作已结束，若有疑问请留言反馈！</td><td>客户</td></tr>
						<tr><td>2012-10-07 10:50:51</td><td>财务已退款请注意查收</td><td>客户</td></tr>
					</table>
				</i>
				<div class="space20"></div>
			</div>
		</div>
		<div class="space20"></div>
		<div class="panel">
			<div>
				<div class="space30 oh"><b class="space30 fl">detailed information</b><font class="fr">pack up</font></div>
				<div class="space20"></div>
				<table>
					<tr><td class="w2p">trade names</td><td>100元香港游套餐</td></tr>
					<tr><td>problem description</td><td>SIM卡不能识别</td></tr>
					<tr><td> attachment list</td><td>卡贴x1 说明书x1</td></tr>
					<tr><td>commodity prices</td><td>￥369.00</td></tr>
					<tr><td>trade dress</td><td>良好，包装完整</td></tr>
					<tr><td>pickup address</td><td>北京市海淀区五环到刘欢指尖安宁庄东路山</td></tr>
					<tr><td>invoice mail address</td><td>北京市海淀区五环到刘欢指尖安宁庄东路山</td></tr>
					<tr><td>oods return way</td><td>寄件</td></tr>
					<tr><td>contact information</td><td>contact：张晓明　　phone：13111113333</td></tr>
				</table>
				<div class="space20"></div>
			</div>
		</div>
	</div>
</div>

<%@include file="/commons/usersbottom.rec.en.jsp"  %>

</body>
</html>