<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>快递查询</title>
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
        <font class="hclr3f">快递查询</font>
        <div class="line3"></div>
        <p class="hce3p">1、下单成功之后，在“订单中心”里会随时更新您的订单状态；</p>
        <p class="hce3p">2、订单状态显示已发货，您就可以跟踪快递的物流信息了。</p>
        <div class="space20"></div>
        <img src="${CONTEXT_PATH}/static/img/hce.png" />
        <div class="space40"></div>
    </div>
</div>
</body>
</html>