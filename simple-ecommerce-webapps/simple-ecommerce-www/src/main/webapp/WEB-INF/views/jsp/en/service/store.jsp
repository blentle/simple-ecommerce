<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/commons/include.rec.jsp"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>运营商店铺</title>
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
<div class="shop">
	<div class="shopCon">
		<table class="mw">
			<tr>
				<td rowspan="2">
					<a class="shopLogo"><img src="${CONTEXT_PATH}/static/img/logo_bank_1.png" /></a>
				</td>
				<td>
					<h2>北京联通官方旗舰店</h2>
				</td>
				<th rowspan="2">
					<a><img src="${CONTEXT_PATH}/static/img/tempImg_1.png" /></a>
					<a><img src="${CONTEXT_PATH}/static/img/tempImg_2.png" /></a>
				</th>
			</tr>
			<tr>
				<td>店铺评价：<b>4.9</b>　　联系电话：<b>10010</b>　　<a><b>＋</b>加入收藏夹</a></td>
			</tr>
		</table>
	</div>
	<a class="banner">
	
	</a>
	<div class="space30"></div>
	<p class="mw">
	中国联合网络通信集团有限公司（简称“中国联通”）于2009年1月6日在原中国网通和原中国联通的基础上合并组建而成，在国内31个省（自治区、直辖市）和境外多个国家和地区设有分支机构，是中国唯一一家在纽约、香港、上海三地同时上市的电信运营企业，连续多年入选“世界500强企业”。<br>
<br>
中国联通主要经营GSM和WCDMA制式移动网络业务，固定通信业务，国内、国际通信设施服务业务，卫星国际专线业务、数据通信业务、网络接入业务和各类电信增值业务，与通信信息业务相关的系统集成业务等。2009年1月6日，原中国联合通信有限公司与原中国网络通信集团公司重组合并，新公司更名为中国联合网络通信集团有限公司。为与合并前的中国联通相区分，业界常以“新联通”进行称呼。
	</p>
	<div class="space30"></div>
	<div class="mw panel">
		<span>store inside package</span>
		<div>
			<div class="space"></div>
			<dl class="selHot">
				<dt><a href="##"></a><img src="${CONTEXT_PATH}/static/img/servePanelSlide_1.png"><p>全国联通100元充值 5秒到账</p><b>￥ 99.00</b><p>月销：<i>3368</i></p></dt>
				<dd></dd>
				<dt><a href="##"></a><img src="${CONTEXT_PATH}/static/img/servePanelSlide_2.png"><p>全国联通100元充值 5秒到账</p><b>￥ 99.00</b><p>月销：<i>3368</i></p></dt>
				<dd></dd>
				<dt><a href="##"></a><img src="${CONTEXT_PATH}/static/img/servePanelSlide_3.png"><p>全国联通100元充值 5秒到账</p><b>￥ 99.00</b><p>月销：<i>3368</i></p></dt>
				<dd></dd>
				<dt><a href="##"></a><img src="${CONTEXT_PATH}/static/img/servePanelSlide_1.png"><p>全国联通100元充值 5秒到账</p><b>￥ 99.00</b><p>月销：<i>3368</i></p></dt>
				<dd></dd>
				<dt><a href="##"></a><img src="${CONTEXT_PATH}/static/img/servePanelSlide_2.png"><p>全国联通100元充值 5秒到账</p><b>￥ 99.00</b><p>月销：<i>3368</i></p></dt>
			</dl>
			<div class="space"></div>
		</div>
	</div>
	<div class="space30"></div>
	<div class="mw panel">
		<span>store number</span>
		<div>
			<div class="recommend">
				<div class="fl">
					<a href="##"></a>
					<p><strong>170 4563 8647</strong><i>￥166</i></p>
					<div class="space20"></div>
					本地通话226min+1024MB4G流量，超出套餐部分本地主叫0.34元/min，流量0.1元/MB，被叫免费
					<div class="space"></div>
					Scope of application: Beijing, China
					<div class="space"></div>
					operator：<font>中国联通</font>
					<div class="space"></div>
					<p class="tac"><button class="btn">　购 买　</button></p>
				</div>
				<div class="interval"></div>
				<div class="fl">
					<a href="##"></a>
					<p><strong>170 4563 8647</strong><i>￥166</i></p>
					<div class="space20"></div>
					本地通话226min+1024MB4G流量，超出套餐部分本地主叫0.34元/min，流量0.1元/MB，被叫免费
					<div class="space"></div>
					Scope of application: Beijing, China
					<div class="space"></div>
					operator：<font>中国联通</font>
					<div class="space"></div>
					<p class="tac"><button class="btn">　购 买　</button></p>
				</div>
				<div class="interval"></div>
				<div class="fl">
					<a href="##"></a>
					<p><strong>170 4563 8647</strong><i>￥166</i></p>
					<div class="space20"></div>
					本地通话226min+1024MB4G流量，超出套餐部分本地主叫0.34元/min，流量0.1元/MB，被叫免费
					<div class="space"></div>
					Scope of application: Beijing, China
					<div class="space"></div>
					operator：<font>中国联通</font>
					<div class="space"></div>
					<p class="tac"><button class="btn">　购 买　</button></p>
				</div>
				<div class="fr">
					<a href="##"></a>
					<p><strong>170 4563 8647</strong><i>￥166</i></p>
					<div class="space20"></div>
					本地通话226min+1024MB4G流量，超出套餐部分本地主叫0.34元/min，流量0.1元/MB，被叫免费
					<div class="space"></div>
					Scope of application: Beijing, China
					<div class="space"></div>
					operator：<font>中国联通</font>
					<div class="space"></div>
					<p class="tac"><button class="btn">　buy　</button></p>
				</div>
			</div>
		</div>
	</div>
	<div class="space30"></div>
	<div class="mw panel">
		<div>
			<div class="space50 line1"><h3 class="fl">shop evaluation</h3><a class="btn fr">Add evaluation</a><div class="share fr">
			<div class="bshare-custom icon-medium-plus"><a title="share" href="http://www.bShare.cn/" id="bshare-shareto" class="bshare-more">share</a><a title="分享到微信" class="bshare-weixin"></a><a title="分享到新浪微博" class="bshare-sinaminiblog"></a><a title="分享到Facebook" class="bshare-facebook"></a><a title="分享到Twitter" class="bshare-twitter"></a><a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a></div><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
		</div></div>
			<div class="line2 p10">
				<div class="space30">****6457用户评论</div>
				<div class="oh"><p class="fl">出国玩了一趟真心好用出国玩了一趟真心好用出国玩了一趟真心好用出国玩了一趟真心好用出国玩了一趟真心好用出国玩了一趟真心好用出国玩了一趟真心好用出国玩了一趟真心好用出国玩了一趟真心好用出国玩了一趟真心好用出国玩了一趟真心好用出国玩了一趟真心好用出国玩了一趟真心好用出国玩了一趟真心好用出国玩了一趟真心好用出国玩了一趟真心好用出国玩了一趟真心好用出国玩了一趟真心好用出国玩了一趟真心好用</p><p class="fr">2014-14-25</p></div>
			</div>
			<div class="line2 p10">
				<div class="space30">****6457用户评论</div>
				<div class="oh"><p class="fl">出国玩了一趟真心好用</p><p class="fr">2014-14-25</p></div>
			</div>
			<div class="line2 p10">
				<div class="space30">****6457用户评论</div>
				<div class="oh"><p class="fl">出国玩了一趟真心好用</p><p class="fr">2014-14-25</p></div>
			</div>
		</div>
	</div>
	<div class="space100"></div>
</div>

	<%@include file="/commons/usersbottom.rec.en.jsp"  %>
</body>
</html>