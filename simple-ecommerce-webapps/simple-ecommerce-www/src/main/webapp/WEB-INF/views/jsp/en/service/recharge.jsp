<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/commons/include.rec.jsp"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>手机充值</title>
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

<div class="charge mw panel">
    <span>Service &gt; Promptly top up&gt; Confirmation Message</span>
    <div>
        <div class="w6p ma">
            <div class="space20"></div>
            <ul class="pBar"><li class="sel">1、write number,amount<b></b><i></i></li><li>2、Confirm and pay<b></b><i></i></li><li>3、accomplish</li></ul>
            <div class="space30"></div>
            <table class="formTable">
                <tr><th width="30%">phone number：</th><td><input type="text" />　<i><!-- 请仔细核对充值号码，充错号将无法退款 --></i></td></tr>
                <tr class="tip"><th></th><td colspan="2">北京 联通</td></tr>
                <tr><th>top-up amount：</th><td><select><option>20元</option></select></td></tr>
                <tr class="tip"><th></th><td><b>￥19.90元</b></td></tr>
                <tr><th>到账时间：</th><td><input type="radio" />1-10分钟　<input type="radio" />24小时　<input type="radio" />48小时</td></tr>
                <tr><th colspan="2"><div class="space30"></div></th></tr>
                <tr><th></th><td><a href="/en/payment" class="btn">submit order</a>　　<a>Top-up help</a></td></tr>
            </table>
            <div class="space30"></div>
        </div>
    </div>
</div>

<div class="space100"></div>

	<%@include file="/commons/usersbottom.rec.en.jsp"  %>
<script>
    $(function(){

    });
</script>

</body>
</html>