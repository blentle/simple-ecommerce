<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>常见问题</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0" />
    <link  href="${CONTEXT_PATH}/static/css/normal.css" type="text/css" rel="stylesheet"/>
    <link  href="${CONTEXT_PATH}/static/css/mstyle.css" type="text/css" rel="stylesheet"/>
    <script src="${CONTEXT_PATH}/static/js/jquery.js" type="text/javascript"></script>
    <script src="${CONTEXT_PATH}/static/js/bottom.js" type="text/javascript"></script>
    <script type="text/javascript">
        function reInitIframe(){
            var iframe = parent.document.getElementById("myFrame");
            try{
                var bHeight = iframe.contentWindow.document.body.scrollHeight;
                var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
                var height = Math.max(bHeight, dHeight);
                iframe.height =  height;
            }catch (ex){}
        }
    </script>
</head>
<body>
<div class="mcenterCon hcp">
    <div class="hcp1"><font>常见问题</font><h2>FREQUENCY ASKED QUESTIONS</h2></div>
    <div class="space20"></div>
    <div class="hcp2">
        <div class="hcp21">
            <table>
                <tr>
                    <td><img src="${CONTEXT_PATH}/static/img/icon_hcp2.png"/></td>
                    <td class="td1"><font>客服温馨提示</font><p>为了减少您可能的等待时间，您不妨先<i>仔细阅读下面的常见问题</i>。查询物流状态，退货，退余额等操作均可以登录悠游宝网站后自助进行，无需联系客服。如果仍无法解决，请您在本页页底联系在线客服，或拨打悠游宝客服电话。谢谢您的理解！</p></td>
                </tr>
            </table>
        </div>
        <div class="hcp22">
            <span><font>常见问题</font> </span>
            <font class="hcp22f">订单什么时候发货？大概多长时间可以收到货？</font>
            <div class="line3"></div>
            <p class="hcp22p">正常情况下您的订单将在6小时内发出（最晚不超过1个工作日）。发货之后，您可以在我的订单中可以查看发货状态。由于快递公司可能无法时时更新信息，因此您看到的发货情况可能有一定延迟。</p>
            <font class="hcp22f">为什么后下的订单，先收到了，之前下的订单还没有收到？你们是按什么顺序发货的？</font>
            <div class="line3"></div>
            <p class="hcp22p">为了单位时间内以最快的速度处理尽量多订单，悠游宝会适当综合按订单里货品配货的情况安排发货顺序，因此可能会出现订单发货和下单顺序不完全一致的情况。我们会尽一切努力为您尽快发货。</p>
            <font class="hcp22f">订单显示发货了，但快递信息为什么还没有更新？</font>
            <div class="line3"></div>
            <p class="hcp22p">您在订单页面看到的物流查询信息由快递公司传递提供。由于快递公司信息更新会有一定延迟，请您多多谅解。(延迟时间可能从1天到3天不等，EMS快递的物流配送信息最多可能有1周左右延迟）</p>
        </div>
        <div class="space40"></div>
        <div class="space30"></div>
    </div>
</div>
</body>
</html>