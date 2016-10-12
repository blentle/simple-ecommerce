<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>验货签收</title>
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
        <font class="hclr3f">验货签收</font>
        <div class="line3"></div>
        <span class="hcrms">关于快递问题导致的订单纠纷</span>
        <p class="hce3p hcrmp">请您签收货品时，尽量在快递人员在场时当面检查商品（如果快递人员坚持先签收再验货，可以在签收之后立刻检查）。请注意——</p>
        <p class="hce3p hcrmp">1、务必检查封箱胶带是否为悠游宝专用胶带，胶带是否有被拆开重新粘贴过的痕迹。</p>
        <p class="hce3p hcrmp">2、务必检查包装箱是否为悠游宝专用包装箱，包装箱上是否有悠游宝客户留档信息。</p>
        <p class="hce3p hcrmp">3、快递包装是否有破损、渗漏、缺少等现象。</p>
        <p class="hce3p hcrmp">4、若出现以上情况，建议您尽快与我们取得联系，并拍照存档，把照片发给我们的客服人员，以便我们对物流快递公司进行追债。</p>
        <div class="space20"></div>
        <p class="hce3p hcrmp">当然，根据我们的<a>30天拆封无条件退货政策</a>，无论是因为快递还是其他原因导致商品破损、渗漏等现象，只要您有意退货，我们都会马上为您办理退货手续。客服热线（免长途费）：400-123-8888</p>
        <div class="space20"></div>
        <p class="hce3p hcrmp"><i style="color:#333">请注意：</i>价值500元以上商品不支持30封条无条件退货政策，拆封后如无质量问题不退不换。请您务必在签收时仔细检查货品包装是否完好，因物流原因造成损坏的，请立即致电我们的客服人员为您处理。</p>
        <div class="space20"></div>
        <div class="space40"></div>

    </div>
</div>
</body>
</html>