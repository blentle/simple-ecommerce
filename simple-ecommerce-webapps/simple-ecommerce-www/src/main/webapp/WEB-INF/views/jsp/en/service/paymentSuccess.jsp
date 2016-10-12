<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/commons/include.rec.jsp"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>支付成功</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

</head>
<body>
<div class="top">
<c:if test="${member!=null}">
			<p>
				<i> <a href="##">${member.memberNickname}</a>，Welcome you！ <a href="/users/order?language=en">personal center</a>
					｜ <a href="users/logout?language=en">logout</a>
				</i>
			</p>
		</c:if>
		<c:if test="${member==null}">
			<p>
				<i> <a href="/" class="abcd">CN</a> ｜ <a href="/users/login?language=en">login</a>
					｜ <a href="/users/reg?language=en">register</a>
				</i>
			</p>
		</c:if>
    <div>
			<a class="logo"><img src="${CONTEXT_PATH}/static/img/logo.png" /></a>
			<dl>
				<dt>
					<input type="text" placeholder="keyword" /><button></button>
				</dt>
				<dd>
					Hot Search： <a href="#">Hong Kong package </a><a href="#">Taiwan package </a><!-- <a href="#">热卖排行 </a><a href="#">选号入网 </a> -->
				</dd>
			</dl>
		</div>
</div>
<div class="menu">
   <div>
			<a href="/en">Home</a> 
				<a href="/en/aboutyyb">AboutYyb</a>
				<a href="/en/service" class="sel" >Service</a> 
				<a href="/en/operators"  >Operators</a> 
				<a href="/en/partners">Partners</a> 
				<a href="/en/contacts" >Contacts</a>
		</div>
</div>
<div class="space30"></div>

<div class="paid mw">
    <span>√</span>
    <dl>
        <dt><strong>Thank you, payment success!</strong></dt>
        <dd>
            order id: SP20141124000000<br>
            您购买的是无卡贴的套餐/号码，请使用者登录手机app进行号码写入
        </dd>
        <dt>　 If you have any questions, please contact customer service <b>400-456-4567</b></dt>
    </dl>
    <ul>
        <li><img src="${CONTEXT_PATH}/static/img/paidCode.png" /></li>
        <li><p></p><em></em><i>Install mobile client, anywhere at any time to check the order</i></li>
    </ul>
</div>
<div class="space"></div>
<div class="mw">
    after complete the payment, you can: <a>view your order status</a><a> to continue shopping</a><a>problem feedback</a>
    <!-- 完成支付后，您可以： <a>查看订单状态</a>　<a>继续购物</a>　<a>问题反馈</a> -->
</div>

<div class="space30"></div>

<div class="mw"><img class="w10p" src="${CONTEXT_PATH}/static/img/paidImg.png" /></div>

<div class="space30"></div>

<div class="mw panel">
    <span>selling item</span>
    <div>
        <div class="space"></div>
        <dl class="selHot">
            <dt><a href="##"></a><img src="${CONTEXT_PATH}/static/img/servePanelSlide_1.png"><p>全国联通100元充值 5秒到账</p><b>￥ 99.00</b><p>sales volume：<i>3368</i></p></dt>
            <dd></dd>
            <dt><a href="##"></a><img src="${CONTEXT_PATH}/static/img/servePanelSlide_2.png"><p>全国联通100元充值 5秒到账</p><b>￥ 99.00</b><p>sales volume：<i>3368</i></p></dt>
            <dd></dd>
            <dt><a href="##"></a><img src="${CONTEXT_PATH}/static/img/servePanelSlide_3.png"><p>全国联通100元充值 5秒到账</p><b>￥ 99.00</b><p>sales volume：<i>3368</i></p></dt>
            <dd></dd>
            <dt><a href="##"></a><img src="${CONTEXT_PATH}/static/img/servePanelSlide_1.png"><p>全国联通100元充值 5秒到账</p><b>￥ 99.00</b><p>sales volume：<i>3368</i></p></dt>
            <dd></dd>
            <dt><a href="##"></a><img src="${CONTEXT_PATH}/static/img/servePanelSlide_2.png"><p>全国联通100元充值 5秒到账</p><b>￥ 99.00</b><p>sales volume：<i>3368</i></p></dt>
        </dl>
        <div class="space"></div>
    </div>
</div>

<div class="space100"></div>
	<%@include file="/commons/usersbottom.rec.en.jsp"  %>

</body>
</html>