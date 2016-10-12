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
			<a href="/users/order">个人中心</a>
			｜
			<a href="users/logout">退出</a>
		</i>
	</p>
	</c:if>
	<c:if test="${member==null}">
		<p>
			<i>
				<a href="##">EN</a>
				｜
				<a href="/users/login">登录</a>
				｜
				<a href="/users/reg">注册</a>
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
		<div class="tab"><a href="/findpwPhone">通过登录/注册手机找回密码</a><a href="/findpwEmail" class="sel">通过绑定邮箱找回密码</a></div>
		<div class="space50"></div>
		<table>
			<tr><th>绑定邮箱：</th><td><input type="text" placeholder="请输入绑定邮箱" /></td></tr>
			<tr><td colspan="2" class="space20"></td></tr>
			<tr><th>验证码：</th><td><input type="text" style="width:17%;" />　<img src="${CONTEXT_PATH}/static/img/codeCheck.png" />　<a>看不清?</a></td></tr>
		</table>
		<div class="space50"></div>
		<div class="tac"><a class="btn">　发送验证邮件　</a></div>
		<div class="space100"></div>
	</div>
</div>
<div class="bottom">
	<dl>
		<dt>
			版权所有：1998-2014 悠游集团　<a>法律公告</a>　｜　<a>隐私保护</a>　　Boss网京ICP备11035381
		</dt>
		<dd>
			<a>满意度调查</a>　｜　<a>联系我们</a>　｜　<a>工作机会</a>　｜　<a>合作伙伴认证</a>　｜　<a>帮助中心</a>
		</dd>
	</dl>
</div>
</body>
</html>