<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>我的订单</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <%@include file="/commons/include.rec.jsp"  %>
    <script src="${CONTEXT_PATH}/static/js/users/menus.js" type="text/javascript"></script>
      <script src="${CONTEXT_PATH}/static/js/users/jquery.fs.boxer.js" type="text/javascript"></script>
    <link  href="${CONTEXT_PATH}/static/js/users/jquery.fs.boxer.css" rel="stylesheet" type="text/css" />
    <script>
    $(document).ready(function() {
    	initLeftMenu('${menuItem}','${CONTEXT_PATH}');
		$(".boxer").not(".retina, .boxer_fixed, .boxer_top, .boxer_format, .boxer_mobile, .boxer_object").boxer();

	
    });
       
    </script>
  </head>
<body>
<!-- 引用用户页部  -->
<%@include file="/commons/usershead.rec.jsp"  %>
<div class="mw panel"><span>服务 &gt; 账户中心 &gt; 分享设置</span></div>

<div class="space20"></div>

<div class="mw">
<!-- 左侧导航菜单 -->
	<dl class="centerMenu"></dl>
<!-- 右侧信息开始 -->	
<div class="centerCon centerShare">
		<div class="title">
			账户绑定管理
			<div class="line1"></div> 
			同步分享　
			<i>绑定主流社交网站账号，可以快速的将你在悠游宝角色又去的内容分享给相应网站的朋友们。赶紧快时你的分享之旅吧！</i>
		</div>
		<table class="shareList">
			<tr>
				<th><img src="${CONTEXT_PATH}/static/img/icon_share_1.png" /></th><td>新浪微博<div class="space20"></div><a class="btn">马上绑定</a></td>
				<th><img src="${CONTEXT_PATH}/static/img/icon_share_2.png" /></th><td>微信<div class="space20"></div><a class="btn">马上绑定</a></td>
			</tr>
			<tr>
				<th><img src="${CONTEXT_PATH}/static/img/icon_share_3.png" /></th><td>Twitter<div class="space20"></div><a class="btn">马上绑定</a></td>
				<th><img src="${CONTEXT_PATH}/static/img/icon_share_4.png" /></th><td>facebook<div class="space20"></div><a class="btn">马上绑定</a></td>
			</tr>
		</table>
	</div>
</div>

<%@include file="/commons/usersbottom.rec.jsp"  %>

</body>
</html>