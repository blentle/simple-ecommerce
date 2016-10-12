<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/commons/include.rec.jsp"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>支付</title>
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

<div class="pay mw">
	<div class="fl payMenu">
		<h2>悠游宝</h2>
		<div>
			<div class="space20"></div>
			 Order Total
			<div class="space20"></div>
			<b>￥60.00 RMB</b>
			<div class="space100"></div>
			<div class="space100"></div>
			<div class="line1"></div>
			<div class="space"></div>
			<i><b>Please complete the payment within 24 hours, otherwise the order will be automatically cancelled</b></i>
			<div class="space"></div>
		</div>
	</div>
	<div class="fr payCon">
		<ul class="pBar"><li class="sel">1、填写号码，金额<b></b><i></i></li><li>2、payment<b></b><i></i></li><li>3、top up<b></b><i></i></li><li>3、accomplish</li></ul>
		<h3>Choose the mode of payment</h3>
		<dl>
			<dt class="sel">
				<h4 onClick='$(this).parent().toggleClass("sel").siblings().toggleClass("sel");'><span><i></i></span>Use a credit card or debit card payments</h4>
				<table class="w5p formTable ma">
					<tr><td class="tal" width="25%">国家地区：</td><td><select><option>中国大陆</option></select></td></tr>
					<tr><td class="tal">卡类型　：</td><td><div class="space30"></div><div class="space30"></div></td></tr>
					<tr>
						<td colspan="2" class="tac">
							<img src="${CONTEXT_PATH}/static/img/bank_1.png" onClick='$(this).addClass("sel").siblings().removeClass("sel")' class="sel" />
							<img src="${CONTEXT_PATH}/static/img/bank_2.png" onClick='$(this).addClass("sel").siblings().removeClass("sel")' />
							<img src="${CONTEXT_PATH}/static/img/bank_3.png" onClick='$(this).addClass("sel").siblings().removeClass("sel")' />
						</td>
					</tr>
					<tr>
						<td colspan="2" class="tac">
							<div class="space30"></div>
							<a href="/en/paySuccess" class="btn">　payment　</a>
						</td>
					</tr>
				</table>
				<div class="space30"></div>
			</dt>
			<dt>
				<h4 onClick='$(this).parent().toggleClass("sel").siblings().toggleClass("sel");'><span><i></i></span>Use the platform to pay</h4>
					<table class="w5p formTable ma">
					<tr>
						<td colspan="2" class="tac">
							<img src="${CONTEXT_PATH}/static/img/bank_4.png" onClick='$(this).addClass("sel").siblings().removeClass("sel")' class="sel" />
							<img src="${CONTEXT_PATH}/static/img/bank_5.png" onClick='$(this).addClass("sel").siblings().removeClass("sel")' />
						</td>
					</tr>
					<tr>
						<td colspan="2" class="tac">
							<div class="space30"></div>
							<a href="/paySuccess" class="btn">　payment　</a>
						</td>
					</tr>
				</table>
				<div class="space30"></div>
			</dt>
		</dl>
	</div>
</div>


<div class="space100"></div>
	<%@include file="/commons/usersbottom.rec.en.jsp"  %>
</body>
</html>