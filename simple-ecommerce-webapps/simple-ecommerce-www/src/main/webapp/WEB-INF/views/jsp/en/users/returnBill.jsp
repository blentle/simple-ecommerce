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
    <script src="${CONTEXT_PATH}/static/js/users/menus.en.js" type="text/javascript"></script>
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
<%@include file="/commons/usershead.rec.en.jsp"  %>
<div class="mw panel"><span>Service &gt; Account Central&gt; Information</span></div>

<div class="space20"></div>

<div class="mw">
<!-- 左侧导航菜单 -->
	<dl class="centerMenu"></dl>
<!-- 右侧信息开始 -->	
	<div class="centerCon goodsReturnBill">
		<div class="panel">
			<span><b class="fl">Sales service details</b></span>
			<div>
				<b class="fl space50">service number：141063475 100元香港有套餐</b>
				<p class="fr space50"><a class="btn btn-ss"><img src="${CONTEXT_PATH}/static/img/icon_pop.png" /> contact customer service</a></p>
			</div>
		</div>
		<div class="space20"></div>
		<div class="panel">
			<div>
				<b class="space30">Vending service schedule</b>
				<div class="space20"></div>
				<p><!-- 本次售后服务由<a>悠游宝</a>为您提供 -->This service is provided by <a>XXX</a> for you<div class="space"></div>悠游宝将在00天23时53分45秒内给出审核意见</p>
				<div class="space100 bar tac">
					<img src="${CONTEXT_PATH}/static/img/shenhebar.png" />
					<!-- 在我看来目前就三个状态? 申请的时候不在本页面申请 结束了之后应该也回不来吧? 如果这要详细做 请提供更细致的步骤状态 目前就放了个图在这 -->
				</div>
				<div class="space30"><b>The progress that：</b></div>
				<div class="space30"><i>Dear customer, your service has been submitted successfully, please wait a simple treasure customer audit.</i></div>
			</div>
		</div>
		<div class="space20"></div>
		<div class="panel">
			<div>
				<div class="space30 oh"><b class="space30 fl">tracking information</b><font class="fr">pack up</font></div>
				<div class="space20"></div>
				<table>
					<tr class="title"><th>processing time</th><th>processing information</th><th>operator</th></tr>
					<tr><th><a>2014-11-26 10:21:36</a></th><th><a href="${CONTEXT_PATH}/users/returnBillDetail?language=en">你的服务形式已经申请成功,审核后出售</a></th><th><a>系统</a></th></tr>
				</table>
				<div class="space20"></div>
			</div>
		</div>
		<div class="space20"></div>
		<div class="panel">
			<div>
				<div class="space30 oh"><b class="space30 fl">tracking information</b><font class="fr">pack up</font></div>
				<div class="space20"></div>
				<table>
					<tr><td class="w2p">return merchandise way</td><td>用户期望返还方式为“客户发货”</td></tr>
					<tr><td>goods are handled</td><td>用户期望返还方式为“换货”</td></tr>
					<tr><td>problem description</td><td>很好</td></tr>
					<tr><td>shipping address</td><td>北京市海淀区五环到刘欢指尖安宁庄东路山</td></tr>
					<tr><td>contact information</td><td>contact:张晓明　　phone:13161166111</td></tr>
				</table>
				<div class="space20"></div>
				<div class="tac"><a class="btn">　refresh　</a></div>
				<div class="space20"></div>
			</div>
		</div>
	</div>
</div>

<%@include file="/commons/usersbottom.rec.en.jsp"  %>

</body>
</html>