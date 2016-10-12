<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/commons/include.rec.jsp"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>预约中心</title>
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
					｜ <a href="users/logout">logout</a>
				</i>
			</p>
		</c:if>
		<c:if test="${member==null}">
			<p>
				<i> <a href="/" class="abcd">CN</a> ｜ <a href="/users/login">login</a>
					｜ <a href="/users/reg">register</a>
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
	<div class="mw appointment">
	<div class="space30"></div>
	<b class="space40 bg15 db">　<a>notice：</a>Gray border around the country or region has not been opened out treasure, click start<a>subscribe</a></b>
	<div class="space30"></div>
	<table class="w10p">
		<tr><th>中国大陆</th><td>
			<a class="sel"><b>中国大陆</b></a>
		</td></tr>
		<tr><th>港澳台地区</th><td>
			<a class="sel"><b>中国香港</b></a>
			<a class="sel"><b>中国香港</b></a>
			<a><b>中国香港</b><i><em>1435</em>人预约开通</i></a>
		</td></tr>
		<tr><th>港澳台地区</th><td>
			<a class="sel"><b>中国香港</b></a>
			<a class="sel"><b>中国香港</b></a>
			<a><b>中国香港</b><i><em>1435</em>人预约开通</i></a>
			<a><b>中国香港</b><i><em>1435</em>人预约开通</i></a>
			<a><b>中国香港</b><i><em>1435</em>人预约开通</i></a>
		</td></tr>
		<tr><th>港澳台地区</th><td>
			<a class="sel"><b>中国香港</b></a>
			<a class="sel"><b>中国香港</b></a>
			<a><b>中国香港</b><i><em>1435</em>人预约开通</i></a>
			<a><b>中国香港</b><i><em>1435</em>人预约开通</i></a>
			<a><b>中国香港</b><i><em>1435</em>人预约开通</i></a>
			<a><b>中国香港</b><i><em>1435</em>人预约开通</i></a>
			<a><b>中国香港</b><i><em>1435</em>人预约开通</i></a>
			<a><b>中国香港</b><i><em>1435</em>人预约开通</i></a>
			<a><b>中国香港</b><i><em>1435</em>人预约开通</i></a>
			<a><b>中国香港</b><i><em>1435</em>人预约开通</i></a>
			<a><b>中国香港</b><i><em>1435</em>人预约开通</i></a>
		</td></tr>
	</table>
	<div class="space100"></div>
</div>
	<%@include file="/commons/usersbottom.rec.en.jsp"  %>
	
</body>
</html>