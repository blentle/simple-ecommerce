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
       function updateMemberData(){
    	   $("#updateForm").submit();
       }
    
    </script>
  </head>
<body>
<!-- 引用用户页部  -->
<%@include file="/commons/usershead.rec.jsp"  %>
<div class="mw panel"><span>服务 &gt; 账户中心&gt; 消息</span></div>

<div class="space20"></div>

<div class="mw">
<!-- 左侧导航菜单 -->
	<dl class="centerMenu"></dl>
<!-- 右侧信息开始 -->	
	<div class="centerCon serveBill">
		<h2 class="space40 tac">服务单明细</h2>
		<table>
			<tr><th><i>*</i>服务类型：</th><td><input type="radio"> 退货　　　<input type="radio"> 换货</td></tr>
			<tr><th>申请凭据：</th><td><input type="radio"> 有发票　　<input type="radio"> 无发票</td></tr>
			<tr><th><i>*</i>问题描述：</th><td><textarea></textarea></td></tr>
			<tr><th><i>*</i>图片信息：</th><td><div class="space"></div><a class="btn-s">上传图片</a><div class="space"></div><p>为了帮助我们更好地解决问题，请上传照片。</p><div class="space"></div><em>最多可上传5张照片，每张图片不超过5M，支持bmp、gif、jpg、jpeg格式文件。</em></td></tr>
			<tr><th><i>*</i>商品返回方式：</th><td><em>商品返回地址将在服务单审核通过后以短信形式告知，或在“查看返修/退换货记录”中查询。</em></td></tr>
			<tr><th><i>*</i>收货地址：</th><td><select><option>北京</option></select> <select><option>海淀区</option></select> <select><option>五环到刘欢</option></select><input type="text" /></td></tr>
			<tr><th>申请凭据：</th><td><input type="text" /></td></tr>
			<tr><th>申请凭据：</th><td><input type="text" /></td></tr>
			<tr><td class="tac space100" colspan="2"><a class="btn" href="${CONTEXT_PATH}/users/returnApplyResult">　提 交　</a></td></tr>
		</table>
	</div>
</div>

<%@include file="/commons/usersbottom.rec.jsp"  %>

</body>
</html>