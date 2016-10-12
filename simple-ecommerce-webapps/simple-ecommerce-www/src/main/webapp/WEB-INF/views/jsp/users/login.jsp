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
			<a href="/users/order">个人中心</a>
			｜
			<a href="users/logout">退出</a>
		</i>
		</p>
		</c:if>
	<c:if test="${member.memberNickname==null}">
		<p>
			<i>
				<a href="/en">EN</a>
				｜
				<a href="/users/login">登录</a>
				｜
				<a href="/users/reg">注册</a>
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
			<h2>手机号登录</h2>
			<div class="formList">
				<div style="color: #ff0000;height: 22px;margin-top: 0px"  align="center">
					<form:errors path="memberMobilePhone"></form:errors>
				</div>
				<div class="formRow formRowBorder">
					<div><input type="text"name="memberMobilePhone"   placeholder="手机号" style="background:url(${CONTEXT_PATH}/static/img/icon_tel.png) left center no-repeat; padding-left:35px;"/></div>
				</div>
				<div style="color: #ff0000;height: 22px;margin-top: 0px"  align="center">
					<form:errors path="memberPassword"></form:errors>
				</div>
				<div class="formRow formRowBorder">
					<div><input type="password" name="memberPassword" placeholder="密码" style="background:url(${CONTEXT_PATH}/static/img/icon_password.png) left center no-repeat; padding-left:35px;" /></div>
				</div>
				<div style="color: #ff0000;height: 22px;margin-top: 0px"  align="center">${codemessage}</div>
				<div class="formRow">
					<div><input type="text" name="vcode" placeholder="验证码" style=" width:120px; text-align:center;"/></div>
					<div>　<img id="codeImg" src="">　</div>
					<div><a id="revcode">刷新</a></div>
				</div>
				<div style="color: #ff0000;height: 22px;margin-top: 0px"  align="center">
					${message}
				</div>
				<input type="submit" value="登 录" />

				<div class="space"></div>
				<a href="/findpwPhone">忘记密码?</a> 没有账号? <a href="/users/reg">立即注册</a>
			</div>
		</div>
	</div>
</div>
</form:form>
<div class="bottomS">
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