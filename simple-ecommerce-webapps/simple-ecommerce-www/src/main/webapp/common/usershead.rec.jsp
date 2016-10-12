<%@ page contentType="text/html;charset=UTF-8" %>
	<div class="top">
	<c:if test="${member!=null}">
	<p>
		<i>
			<a href="##">${member.memberNickname}</a>，欢迎您！　　　
			<a href="/users/order">个人中心</a>
			｜
			<a href="/users/logout">退出</a>
		</i>
	</p>
	</c:if>
	<c:if test="${member==null}">
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
	<div>
		<a class="logo"><img src="${CONTEXT_PATH}/static/img/logo.png" /></a>
		<dl>
			<dt><input type="text" placeholder="搜索关键字" /><button></button></dt>
			<dd>热门搜索： 
				<a href="##">热门搜索词</a> 
				<a href="##">热门搜索词</a> 
				<a href="##">热门搜索词</a> 
				<a href="##">热门搜索词</a> 
			</dd>
		</dl>
	</div>
</div>
<div class="menu">
	<div>
		<a href="http://localhost:8080" >首页</a>
		<a href="/aboutyyb">关于悠游宝</a>
		<a href="/service" class="sel">服务</a>
		<a href="/operators">运营商</a>
		<a href="/partners">合作商</a>
		<a href="/contacts">联系我们</a>
	</div>

</div>
<div class="space30"></div>