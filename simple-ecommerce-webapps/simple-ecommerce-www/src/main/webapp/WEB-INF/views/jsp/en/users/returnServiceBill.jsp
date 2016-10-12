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
	<div class="centerCon serveBill">
		<h2 class="space40 tac">service single detail</h2>
		<table>
			<tr><th><i>*</i>servicetype：</th><td><input type="radio"> sales return　　　<input type="radio"> exchange goods</td></tr>
			<tr><th>application credentials：</th><td><input type="radio"> invoice　　<input type="radio"> no invoice</td></tr>
			<tr><th><i>*</i>problem description：</th><td><textarea></textarea></td></tr>
			<tr><th><i>*</i>pictorial information：</th><td><div class="space"></div><a class="btn-s">upload photos</a><div class="space"></div><p>In order to help us to better solve the problem, please upload photos.</p><div class="space"></div><em>Can upload up to 5 photos, each image is not more than 5 m, supports BMP, GIF, JPG, jpeg files。</em></td></tr>
			<tr><th><i>*</i>goods return way：</th><td><em>Goods return address will be told in the form of text messages, after service form has been verified or query in the "check repair/return records.</em></td></tr>
			<tr><th><i>*</i>shipping address：</th><td><select><option>北京</option></select> <select><option>海淀区</option></select> <select><option>五环到刘欢</option></select><input type="text" /></td></tr>
			<tr><th>application credentials：</th><td><input type="text" /></td></tr>
			<tr><th>application credentials：</th><td><input type="text" /></td></tr>
			<tr><td class="tac space100" colspan="2"><a class="btn" href="${CONTEXT_PATH}/users/returnApplyResult?language=en">　submit　</a></td></tr>
		</table>
	</div>
</div> 

<%@include file="/commons/usersbottom.rec.en.jsp"  %>

</body>
</html>