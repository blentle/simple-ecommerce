<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>账号安全</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">

	</script>
	<style type="text/css">
		
	</style>
    <link href="${CONTEXT_PATH}/static/css/layout.css" rel="stylesheet" type="text/css" />
  </head>
<body>
	<div id="container">
<div id="header">
<div id="header-1"><a href="#">EN</a>|<a href="#">登陆</a>|<a href="/register">注册</a></div>
<h1>悠游宝</h1>
</div>
<div class="clearfloat"></div>
<div id="nav">
<ul>
<li><a href="http://localhost:8080">首页</a></li>
<li><a href="/aboutyyb">关于悠游宝</a></li>
<li><a href="/service">服务</a></li>
<li><a href="/operators">运营商</a></li>
<li><a href="/partners">合作商</a></li>
<li><a href="/contacts">联系我们</a></li>
</ul>
</div>
<div id="mainContent">
<div id="main">
<div class="mainbox">
<h2>注册</h2>

	<table border="0">
		<tr>
			<td width="800" height="470">图片</td>
			<td width="700">
				<form action="/users/add" method="post">
					<table border="0">
						<tr height="76">
							<td width="200" align="right">国家地区</td>
							<td width="500">
								<select style='width:400px;height:30px;' name="member_coutry">
									<option value="中国大陆">中国大陆</option>
									<option value="台湾">香港</option>
									<option value="台湾">台湾</option>
								</select>
							</td>
						</tr>
						<tr height="76">
							<td width="200" align="right">手机号码</td>
							<td width="500">
								<input name="member_mobile_phone" style='width:400px;height:30px;'/>
							</td>
						</tr>
						<tr height="76">
							<td width="200" align="right">密码</td>
							<td width="500">
								<input name="member_password" style='width:400px;height:30px;'/>
							</td>
						</tr>
						<tr height="76">
							<td width="200" align="right">手机验证码</td>
							<td width="500">
								<input type="button"  value="免费获取短信验证码">&nbsp;&nbsp;
								<input name="verificationCode" style='width:150px;height:30px;'/>
							</td>
						</tr>
						<tr height="76">
							<td width="200" align="right"></td>
							<td width="500">
							<input name="is" type="checkbox" checked="checked" />
							我已经阅读并同意用户协议和会员条款
							</td>
						</tr>
						<tr height="76">
							<td width="200" align="right">${message}</td>
							<td width="500" align="center">
								<input type="submit"  value="立即注册">
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
</div>
</div>

</div>
<div class="clearfloat"></div>
<div id="footer">


版权所有：1998-2014 悠游集团  法律公告  |  隐私保护   Boss网京ICP备11035381 满意度调查 | 联系我们 | 工作机会 | 合作伙伴认证 | 帮助中心

</div>
</div>

</body>
</html>