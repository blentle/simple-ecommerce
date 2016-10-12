<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>退货政策</title>
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
        <font class="hclr3f">退货政策</font>
        <div class="line3"></div>
        <div class="space"></div>
        <img src="${CONTEXT_PATH}/static/img/hcrp.png" />
        <div class="space20"></div>
        <span class="hcrms">1、填写“退货申请”</span>
        <p class="hce3p hcrmp">个人中心的订单记录，<a href="#">订单中心</a>进入后填写<a href="#">”退货申请“</a></p>
        <span class="hcrms">2、待客服确认</span>
        <p class="hce3p hcrmp">我们的客服将打电话给您确认退货消息，退货批准后您将同时收到一条退货短信和一封确认退货信息的邮件。</p>
        <p class="hce3p hcrmp">请根据邮件或短信中的地址将退货产品退回。</p>
        <p class="hce3p hcrmp">点击<a href="#">”我的退货进度“</a>可查看退货进度。</p>
        <span class="hcrms">3、寄回退货商品</span>
        <p class="hce3p hcrmp">填写发货单背面的售后服务单，连同商品寄回到短信或邮件中提示的地址。</p>
        <p class="hce3p hcrmp">您退货产生的运费将由悠游宝承担，邮费会根据发送地点实报（最高退款金额15元）退回给您。</p>
        <div class="space20"></div>
    </div>
</div>
</body>
</html>