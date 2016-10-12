<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/commons/include.rec.jsp"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>用户登陆</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
	$(document).ready(function(){
		changeCode();
		$("#revcode").bind("click",changeCode);
	});
	
	function genTimestamp(){
		var time = new Date();
		return time.getTime();
	}

	function changeCode(){
		$("#codeImg").attr("src","vcode?t="+genTimestamp());
	}
	</script>
  </head>
<body>

<div class="topS">
	<div>
		<a class="logo"><img src="${CONTEXT_PATH}/static/img/logo.png" /></a>
		<c:if test="${member.memberNickname!=null}">
		<p>
		<i>
			<a href="##">${member.memberNickname}</a>欢迎您！　　　
			<a href="/users/order?language=en">个人中心</a>
			｜
			<a href="users/logout?language=en">logout</a>
		</i>
		</p>
		</c:if>
	<c:if test="${member.memberNickname==null}">
		<p>
			<i>
				<a href="/">CN</a>
				｜
				<a href="/users/login?language=en">login</a>
				｜
				<a href="/users/reg?language=en">register</a>
			</i>
		</p>
	</c:if>
	</div>
</div>
<form:form name="form"  method="post"
		   modelAttribute="member">
<input type="hidden" name="locale" value="zh_CN">
<div class="mainHome">
	<div>
		<div class="homePanel rn login">
			<h2>phone login</h2>
			<div class="formList">
				<div style="color: #ff0000;height: 22px;margin-top: 0px"  align="center">
					<form:errors path="memberMobilePhone"></form:errors>
				</div>
				<div class="formRow formRowBorder">
					<div><input type="text"name="memberMobilePhone"   placeholder="Phone Number" style="background:url(${CONTEXT_PATH}/static/img/icon_tel.png) left center no-repeat; padding-left:35px;"/></div>
				</div>
				<div style="color: #ff0000;height: 22px;margin-top: 0px"  align="center">
					<form:errors path="memberPassword"></form:errors>
				</div>
				<div class="formRow formRowBorder">
					<div><input type="password" name="memberPassword" placeholder="PassWord" style="background:url(${CONTEXT_PATH}/static/img/icon_password.png) left center no-repeat; padding-left:35px;" /></div>
				</div>
				<div style="color: #ff0000;height: 22px;margin-top: 0px"  align="center">${codemessage}</div>
				<div class="formRow">
					<div><input type="text" name="vcode" placeholder="identifying code" style=" width:120px; text-align:center;"/></div>
					<div>　<img id="codeImg" src="">　</div>
					<div><a id="revcode">refresh</a></div>
				</div>
				<div style="color: #ff0000;height: 22px;margin-top: 0px"  align="center">
					${message}
				</div>
				<input type="submit" value="login" />

				<div class="space"></div>
				<a href="/findpwPhone?language=en">forget password?</a> no account? <a href="/users/reg?language=en">register</a>
			</div>
		</div>
	</div>
</div>
</form:form>
<%@include file="/commons/usersbottom.rec.en.jsp"  %>
</body>
</html>