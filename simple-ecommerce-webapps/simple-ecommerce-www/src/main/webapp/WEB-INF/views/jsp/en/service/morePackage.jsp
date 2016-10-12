<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/commons/include.rec.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>更多套餐</title>
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
					｜ <a href="/users/logout?language=en">logout</a>
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
				<a href="/en/operators">Operators</a> 
				<a href="/en/partners">Partners</a> 
				<a href="/en/contacts">Contacts</a>
		</div>
	</div>
	<div class="space30"></div>

	<div class="mw">
	
	<div class="packageMenu fl">
		<h2>在这里找到你想要的</h2>
		<dl>
			<dt><span>1</span>countries regions</dt>
			<dd><input type="checkbox" />大陆地区</dd>
			<dd><input type="checkbox" />香港地区</dd>
			<dd><input type="checkbox" />台湾地区</dd>
			
			<dt><span>2</span>phone format</dt>
			<dd><input type="checkbox" />GSM</dd>
			<dd><input type="checkbox" />WCDMA</dd>
			<dd><input type="checkbox" />WCDMA2000</dd>
			
			<dd><p>请谨记：一定要选择和你手机祥同志是的套餐和号码，如果你不知道的话，请下载APP或者问90后的孩子们</p></dd>
			<dt><span>3</span>operator</dt>
			<dd><input type="checkbox" />中国联通</dd>
			<dd><input type="checkbox" />中国电信</dd>
			<dd><input type="checkbox" />中华电信</dd>
			<dd><input type="checkbox" />PCCW</dd>
		</dl>
		<div class="space50 tac"><input type="button" value="filtrate" class="btn" /></div>
		<div class="space30"></div>
	</div>

		<div class="packageList fr">
			<img src="${CONTEXT_PATH}/static/img/packageTitleImg.png" />
			<div class="space"></div>
			<div class="sort">
				<b>price<i class="sel">↑</i></b><b>sales<i>↓</i></b>
			</div>
			<ul id="packagelist">
				<c:forEach items="${packageslist}" var="a">
					<li>
						<a href="##"></a>
						<em></em>
						<div>
							<strong>${a.packagesName}</strong>
							<img src="${a.packagesPcImage}" />
							<p><b>work off：<font>${a.packagesSalesVolume}</font></b><i>￥${a.packagesRmbPrice}</i></p>
							<div class="space20"></div>
							<p class="tac"><button class="btn">　buy　</button></p>
						</div>
						<span>
							${a.packagesDesc}
							<div class="space"></div>
							Scope of application: China
							<div class="space"></div>
							operator：<font>${a.store.storeName}</font>
						</span>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>	
	<table width="100%">
	<tr><td width="32%"></td>
	<td>
	<web:pager pageNo="${pageNo}" currentClass="currentpage"
		pageSize="3" url="/service/morePackage?language=en" btnNum="9"
		totalCount="${totalCount}" >
	</web:pager>
	</td>
	</tr>
	</table>
	<div class="space100"></div>

		<%@include file="/commons/usersbottom.rec.en.jsp"  %>

</body>
</html>