<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>${site_title} - 注册成功</title>
    <%@include file="/common/include.rec.jsp" %>
</head>
<body>
<div class="topB">
    <p>
        <i>
            <a href="##">EN</a>
        <c:choose>
            <c:when test="${userSession != null && userSession.account!=null}">
                <a href="/account/shopcart"><img src="/static/img/topcoin_shoppingcar.png"  class="topcar" /></a>
                <c:out value="${userSession.account.nickName}"/>，欢迎来到悠悠宝！
                <a href="/logout">[退出]</a>
                ｜
                <a href="/account/center">个人中心</a>
            </c:when>
            <c:otherwise>
                <a href="/login">登录</a>｜<a href="/register/page">注册</a>
            </c:otherwise>
        </c:choose>
        </i>
    </p>
    <div>
        <a class="logo" href="/index"><img src="${CONTEXT_PATH}/static/img/logo.png" /></a>
        <b>欢迎注册</b>
    </div>
</div>
<table class="welRegister">
    <tr>
        <th rowspan="4">√</th><td><b>恭喜，<c:out value="${userSession.account.nickName}"/>已注册成功!</b></td>
    </tr>
    <tr>
        <td><div class="space40"></div><a class="btn" style="color:#fff" href="/service/list">立即购物</a><div class="space20"></div></td>
    </tr>
    <tr>
        <td><i>您的昵称：***会展示在页面顶部和商品评价等地方，如不希望暴露，建议您：</i><a href="#">修改昵称</a></td>
    </tr>
    <tr>
        <td>
			<span>
				<b>超过 80% 的用户选择了立即验证邮箱，账户更安全购物更放心。</b>
				<div class="space"></div>
				<font>您的邮箱：</font><input type="text" /><a class="btn" style="color:#fff" href="#">发送验证邮件</a>
			</span>
        </td>
    </tr>
</table>
<div class="space30"></div>
<!-- 引用bottom -->
<%@include file="/common/usersbottom.rec.jsp" %>
</body>
</html>