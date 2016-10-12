<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>${site_title}</title>
    <%@include file="/common/include.rec.jsp"  %>
  </head>
<body>
<!-- 引用TOP -->
<div class="top">
    <p>
        <i>
            <c:choose>
                <c:when test="${userSession != null && userSession.account != null}">
                    <a href="${ctx}/trolley/goods/show"><img src="${ctx}/static/img/topcoin_shoppingcar.png"  class="topcar" /></a>
                    <c:out value="${userSession.account.nickName}"/>，欢迎来到悠悠宝！
                    <a href="${ctx}/logout">[退出]</a>
                    ｜
                    <a href="${ctx}/account/center">个人中心</a>
                </c:when>
                <c:otherwise>
                    <a href="${ctx}/login">登录</a>｜<a href="${ctx}/register/page">注册</a>
                </c:otherwise>
            </c:choose>
        </i>
    </p>
</div>
<!-- menu -->
<%@include file="/common/include.menu.rec.jsp" %>
<div class="fp">
    <div class="fbg">
        <div class="fbnr">
            <img src="/static/img/fbg.png" />
            <h2 class="h21">到 哪 儿 都 要 本 地 资 费</h2>
            <h2 class="h22">Where are the local charges</h2>
            <button class="btn1">iphone版</button>
            <button class="btn2">Android版</button>
        </div>

    </div>

    <div class="fdx">
        <div class="space40"></div>
        <font>经济，省时，便捷  —  一切让您满意</font>
        <p>ECONOMIC  EFFICIENT  CONVENIENT —— ALL  MAKE  YOU SATISFIED</p>
        <div class="space40"></div>
        <table>
            <tr><td><img src="/static/img/f1.png" /> </td><td><img src="/static/img/f2.png" /></td><td><img src="/static/img/f3.png" /></td><td><img src="/static/img/f4.png" /></td></tr>

            <tr class="tr16"><td>一卡多号</td><td>全球运营商</td><td>本地资费</td><td>随心缴费</td></tr>
            <tr class="tr14"><td>A multi number card</td><td>Global carriers</td><td>Local  tariff</td><td>Follow the payment</td></tr>
        </table>
        <div class="space30"></div>
    </div>

    <div class="fpphone1">

        <div class="fpphone1bg">
            <div class="space100"></div>
            <div class="space"></div>
            <font>出差旅行就用悠游宝</font>
            <span>全方位的解决经常商务出差与跨境旅游的人群通讯的问题</span>
            <span>无需购买多个手机，无需带着多个手机东奔西走</span>
            <div class="space"></div>
            <a class="btn" style="margin-left:398px;" href="04 package.html">中国大陆旅行套餐</a><a class="btn" href="04 package.html">中国香港旅行套餐</a><a class="btn" href="04 package.html">中国台湾旅行套餐</a>
        </div>
    </div>

    <div class="fpphone2">
        <div class="fpphone2bg">
            <div class="space100"></div>
            <font>出差旅行就用悠游宝</font>

            <span>全方位的解决经常商务出差与跨境旅游的人群通讯的问题</span>
            <span>无需购买多个手机，无需带着多个手机东奔西走</span>
            <div class="space"></div>
            <a class="btn" href="04 package.html">中国大陆旅行套餐</a><a class="btn" href="04 package.html">中国香港旅行套餐</a><a class="btn" href="04 package.html">中国台湾旅行套餐</a>
        </div>
    </div>
</div>
<!-- 引用bottom -->
<%@include file="/common/usersbottom.rec.jsp"  %>
</body>
</html>