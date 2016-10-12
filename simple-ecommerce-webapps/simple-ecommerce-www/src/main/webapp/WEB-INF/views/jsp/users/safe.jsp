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
       function findMemberMail(memberMail) {
           $.ajax({
               url: "/users/findMemberMail",
               type:"post",
               dataType:"json",
               data:{"memberMail":memberMail},
               success: function(data){
                   if(data.rs!=0){
                       alert('该邮箱已经注册');
                       // $("#outstoregoodsid").html(str);
                       $("#memberMail").val("");//清空
                       $("#memberMail").focus();
                   }

               },
               error:function(data){
                   alert("错误");
               }
           });
       }
    </script>
  </head>
<body>
<!-- 引用用户页部  -->
<%@include file="/commons/usershead.rec.jsp"  %>
<div class="mw panel"><span>服务 &gt; 账户中心 &gt; 账户安全</span></div>

<div class="space20"></div>

<div class="mw">
<!-- 左侧导航菜单 -->
	<dl class="centerMenu"></dl>
<!-- 右侧信息开始 -->	
	<div class="centerCon centerSafe">
		<div class="title">
			安全级别：<b>较高</b> 
			<dl><dt></dt><dd></dd><dd></dd></dl>
			<i>建议您启动全部安全设置，以保证账户及资金安全</i>
		</div>
		<table class="safeList">
			<tr><td><b>√</b>登录密码　｜　<em>互联网账号存在被盗风险，建议您定期更改密码以保护账户安全</em></td><th><a href="${CONTEXT_PATH}/users/updatePassword" data-boxer-height="310" data-boxer-width="460" class="boxer ">修改</a></th></tr>
			<tr><td><i><c:if test="${memberCenter.state==0 }">！</c:if><c:if test="${memberCenter.state==1 }" >√</c:if></i>邮箱验证　｜　<font>验证后，可用于快速找回登录密码</font></td><th><span class="btn" onclick="findMemberMail('${memberCenter.memberMail}');">立即验证</span></th></tr>
		</table>
		<div class="space100"></div>
		<div class="space100"></div>
	</div>
</div>

<%@include file="/commons/usersbottom.rec.jsp"  %>

</body>
</html>