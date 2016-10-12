<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>邮件激活</title>
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
<h2>邮件激活</h2>
    邮件激活状态为：<c:if test="${st==1}">已激活</c:if>

    <input type="button" value="去购物">


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