<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/commons/include.rec.jsp"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>找回密码</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
<body>
<div class="topS">
    <div>
        <a class="logo"><img src="${CONTEXT_PATH}/static/img/logo.png" /></a>
        <c:if test="${member!=null}">
	<p>
		<i>
			<a href="##">${member.memberNickname}</a>，欢迎您！　　　
			<a href="/users/order?language=en">个人中心</a>
			｜
			<a href="users/logout?language=en">logout</a>
		</i>
	</p>
	</c:if>
	<c:if test="${member==null}">
		<p>
			<i>
				<a href="##">CN</a>
				｜
				<a href="/users/login?language=en">login</a>
				｜
				<a href="/users/reg?language=en">register</a>
			</i>
		</p>
	</c:if>
    </div>
</div>
<div class="findPassword">
	<div class="mw">
		<div class="space50"></div>
		<ul class="pBar w8p ma"><li class="sel">1、填写账户名<b></b><i></i></li><li>2、验证身份<b></b><i></i></li><li>3、设置新密码<b></b><i></i></li><li>4、完成</li></ul>
		<div class="space50"></div>
		<div class="tab"><a href="/findpwPhone?language=en" class="sel">Retrieve password by mobile phones</a><a href="/findpwEmail?language=en">Through mailbox to retrieve password</a></div>
		<div class="space50"></div>
		<table>
			<tr><th>请填写手机验证码：</th><td><input type="text" />　<a class="btn-s">获取短信验证码</a></td></tr>
			<tr><th></th><td>验证码已发出，请注意查收短信，如果没有收到，你可以在<i>102</i>秒后要求系统重新发送</td></tr>
		</table>
		<div class="space50"></div>
		<div class="tac"><a class="btn">　submit　</a></div>
		<div class="space100"></div>
	</div>
</div>
	<%@include file="/commons/usersbottom.rec.en.jsp"  %>
</body>
</html>