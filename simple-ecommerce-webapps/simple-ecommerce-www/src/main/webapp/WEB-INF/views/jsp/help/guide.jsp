<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>新手指南</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0"/>
    <link href="${CONTEXT_PATH}/static/css/normal.css" type="text/css" rel="stylesheet"/>
    <link href="${CONTEXT_PATH}/static/css/mstyle.css" type="text/css" rel="stylesheet"/>
    <script src="${CONTEXT_PATH}/static/js/jquery.js" type="text/javascript"></script>
    <script src="${CONTEXT_PATH}/static/js/bottom.js" type="text/javascript"></script>
</head>
<body>
<div class="mcenterCon hclr">
    <div class="hclr1"><font>新手指南 > 购物流程 > 登录或注册</font></div>
    <div class="hclr2">
        <div class="space20"></div>
        <ul class="pBarsb">
            <li>
                <a href="m2 helpCenterLoginorRegister.html"></a>
                <img src="${CONTEXT_PATH}/static/img/c1.png"/>
                <br>&nbsp;&nbsp;登录或注册<b></b><i></i>
            </li>
            <li class="sel">
                <a href="m9 helpCenterChooseGoods.html"></a>
                <img src="${CONTEXT_PATH}/static/img/c2.png"/> <br>&nbsp;&nbsp;&nbsp;&nbsp;挑选商品<b></b><i></i>
            </li>
            <li class="sel">
                <a href='m3 helpCenterAddtoCar.html'></a>
                <img src="${CONTEXT_PATH}/static/img/c3.png"/>
                <br>&nbsp;加入购物车<b></b><i></i></li>
            <li class="sel">
                <a href="m7 helpCenterOrder.html"></a>
                <img src="${CONTEXT_PATH}/static/img/c4.png"/> <br>&nbsp;&nbsp;确认下单<b></b><i></i>
            </li>
            <li class="sel">
                <a href="m8 helpCenterReceiving.html"></a>
                <img src="${CONTEXT_PATH}/static/img/c5.png"/> <br>&nbsp;&nbsp;&nbsp;&nbsp;收货
            </li>
        </ul>
        <div class="space20"></div>
    </div>
    <div class="hclr3">
        <font class="hclr3f">新用户注册</font>

        <div class="line3"></div>
        <p class="hclr3p">step1 点击页面右上方“注册”按钮注册悠游宝账号</p>
        <img src="${CONTEXT_PATH}/static/img/hclr1.png"/>

        <p class="hclr3p">step2 注册前仔细阅读《用户协议》和《会员条款》，如无异议请勾选“我已阅读用户协议和会员条款”</p>
        <img src="${CONTEXT_PATH}/static/img/hclr2.png"/>
        <font class="hclr3f">登录</font>

        <div class="line3"></div>
        <p class="hclr3p">step1 如果你已拥有悠游宝账号，请点击页面右上方“登录”按钮</p>
        <img src="${CONTEXT_PATH}/static/img/hclr3.png"/>

        <p class="hclr3p">step2 在登录页面的信息栏内填写对应信息，点击“登录”按钮进行登录。登陆成功后，系统自动跳转至悠游宝服务页面</p>
        <img src="${CONTEXT_PATH}/static/img/hclr4.png"/>

        <div class="space40"></div>
        <div class="space20"></div>
    </div>
</div>
</body>
</html>