<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>在线支付</title>
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
    <div class="hclr3">
        <span class="hcops">关于快递问题导致的订单纠纷</span>
        <font class="hclr3f">一、支付宝</font>
        <div class="line3"></div>
        <p class="hce3p">如果您已经拥有支付宝账户，可选择支付宝进行付款</p>
        <div class="space20"></div>
        <img src="${CONTEXT_PATH}/static/img/hcop1.png" />
        <img src="${CONTEXT_PATH}/static/img/hcop2.png" />
        <div class="space20"></div>
        <div class="space40"></div>
    </div>
</div>
</body>
</html>