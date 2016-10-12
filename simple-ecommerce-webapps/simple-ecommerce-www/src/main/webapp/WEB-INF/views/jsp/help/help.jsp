<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>${site_title} - 帮助中心</title>
    <%@include file="/common/include.rec.jsp"  %>
    <script type="text/javascript">
        function tab(url){
            var iframe = document.getElementById("myFrame");
            iframe.src = url;
            iframe.height = 300;
            setTimeout(reInitIframe(),200);
        }
        function reInitIframe(){
            setTimeout(function(){
                var iframe = document.getElementById("myFrame");
                try{
                    var bHeight = iframe.contentWindow.document.body.scrollHeight;
                    var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
                    var height = Math.max(bHeight, dHeight);
                    iframe.height =  height;
                }catch (ex){}
            },200);
        }
    </script>
</head>
<body>
<!-- 引用TOP -->
<%@include file="/common/topOne.rec.jsp" %>
<div class="space30"></div>
<table class="mbar">
    <tr>
        <td class="td1"><img src="${CONTEXT_PATH}/static/img/icon_mbar_1.png" /></td>
        <td class="td2"><a href="#"><font>订单查询</font><i>viewing orders</i></a></td>
        <td class="td1"><img src="${CONTEXT_PATH}/static/img/icon_mbar_2.png" /></td>
        <td class="td2"><a href="#"><font>物流查询</font><i>shipping information</i></a></td>
        <td class="td1"><img src="${CONTEXT_PATH}/static/img/icon_mbar_3.png" /></td>
        <td class="td2"><a href="#"><font>修改密码</font><i>change the password</i></a></td>
        <td class="td1"><img src="${CONTEXT_PATH}/static/img/icon_mbar_4.png" /></td>
        <td class="td2" style="border:none"><a href="#"><font>退货办理</font><i>returns and refunds</i></a></td>
    </tr>
</table>
<div class="space30"></div>
<div class="mw">
    <div class="ulMenu">
        <div  class="navtop"><img src="${CONTEXT_PATH}/static/img/icon_mhelp.png" /><span>帮助中心</span></div>
        <ul class="ulm">
            <li>
                <h2><span class="sjx "><i></i></span><span>使用帮助</span></h2>
                <ul  class="uldisno ulmli" >
                    <li><a href="javascript:tab('/help/guide');">新手指南</a></li>
                    <li class="lilast"><a href="javascript:tab('/help/faq');">常见问题</a></li>
                </ul>
            </li>
            <li>
                <h2><span class="sjx"><i></i></span><span>支付相关</span></h2>
                <ul class="uldisno">
                    <li class="lilast"><a href="javascript:tab('/help/pay');">在线支付</a></li>
                </ul>
            </li>
            <li>
                <h2><span class="sjx"><i></i></span><span>配送相关</span></h2>
                <ul class="uldisno">
                    <li><a href="javascript:tab('/help/distribute')">配送说明</a></li>
                    <li><a href="javascript:tab('/help/shipping')">运费说明</a></li>
                    <li><a href="javascript:tab('/help/express')">快递查询</a></li>
                    <li class="lilast"><a href="javascript:tab('/help/sign')">验货签收</a></li>
                </ul>
            </li>
            <li>
                <h2><span class="sjx"><i></i></span><span>售后服务</span></h2>
                <ul class="uldisno">
                    <li><a href="javascript:tab('/help/returnPolicy');">退货政策</a></li>
                    <li><a href="javascript:tab('/help/returnsManagement')">退货办理</a></li>
                    <li class="lilast"><a href="javascript:tab('/help/refundDescription')">退款说明</a></li>
                </ul>
            </li>
            <li>
                <h2  id="h2last" class="h2border"><span class="sjx"><i></i></span><span>卡贴使用</span></h2>
                <ul class="uldisno">
                    <li class="lilast"><a href="javascript:tab('/help/card')">卡贴使用教程</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="mcenterCon hcp">
    <iframe id="myFrame" name="myFrame" src="${url}" width="870" scrolling="no" frameborder="0" onload="reInitIframe()"></iframe>
    </div>
</div>
<div class="space50"></div>
<!-- 引用bottom -->
<%@include file="/common/usersbottom.rec.jsp" %>
</body>
</html>