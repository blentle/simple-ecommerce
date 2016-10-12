<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>${site_title} - 订单付款</title>
    <%@include file="/common/include.rec.jsp" %>
    <style>
        #addfapiao {
            cursor: pointer
        }
    </style>
</head>
<body>
<!-- 引用TOP -->
<%@include file="/common/topOne.rec.jsp" %>
<%@include file="/common/include.menu.rec.jsp" %>
<div class="space30"></div>
<div class="pay mw">
    <div class="fl payMenu">
        <h2>悠游宝</h2>

        <div>
            <div class="space20"></div>
            您的订单总额
            <div class="space20"></div>
            <b>￥${order.paymentFee} RMB</b>

            <div class="space100"></div>
            <div class="space100"></div>
            <div class="space100"></div>
            <div class="space100"></div>
            <div class="line1"></div>
            <div class="space"></div>
            <i><b>请于24小时内完成付款，否则订单会自动取消</b></i>

            <div class="space"></div>
        </div>
    </div>


    <div class="fr  payCon" style="border:none;background:none;padding-bottom:10px;">
        <ul class="pBar">
            <li>1、确认信息<b></b><i></i></li>
            <li class="sel">2、付款<b></b><i></i></li>
            <li>3、完成</li>
        </ul>
        <h3>选择付款方式</h3>
    </div>
    <div class="fr payCon">
        <!--		<ul class="pBar"><li class="sel">1、确认信息<b></b><i></i></li><li>2、付款<b></b><i></i></li><li>3、完成</li></ul>
                <h3>选择付款方式</h3>-->
        <dl>
            <dt class="sel">
            <h4 onClick='$(this).parent().toggleClass("sel").siblings().toggleClass("sel");'><span><i></i></span>使用信用卡或借记卡付款
            </h4>
            <table class="w5p formTable ma">

                <tr>
                    <td class="tal">卡类型　：</td>
                    <td>
                        <div class="space30"></div>
                        <div class="space30"></div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="tac">
                        <img src="${ctx}/static/img/bank_1.png" onClick='$(this).addClass("sel").siblings().removeClass("sel")'
                             class="sel"/>
                        <img src="${ctx}/static/img/bank_2.png" onClick='$(this).addClass("sel").siblings().removeClass("sel")'/>
                        <img src="${ctx}/static/img/bank_3.png" onClick='$(this).addClass("sel").siblings().removeClass("sel")'/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="tac">
                        <div class="space30"></div>
                        <!--href="10 paid.html"-->
                        <a class="btn" style="text-align:center" href="javascript:void(0);">　付 款　</a>
                    </td>
                </tr>
            </table>
            <div class="space30"></div>
            </dt>
            <dt>
            <h4 onClick='$(this).parent().toggleClass("sel").siblings().toggleClass("sel");'><span><i></i></span>第三方支付
            </h4>
            <table class="w5p formTable ma">
                <tr>
                    <td colspan="2" class="tac">
                        <img src="${ctx}/static/img/bank_4.png" onClick='$(this).addClass("sel").siblings().removeClass("sel")'
                             class="sel"/>
                        <img src="${ctx}/static/img/bank_5.png" onClick='$(this).addClass("sel").siblings().removeClass("sel")'/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="tac">
                        <div class="space30"></div>
                        <a class="btn" style="text-align:center" href="javascript:void(0);">　付 款　</a>
                    </td>
                </tr>
            </table>
            <div class="space30"></div>
            </dt>
        </dl>
    </div>
</div>


<div class="space100"></div>
<div class="bottom">
    <dl>
        <dt>
            版权所有：1998-2014 悠游集团　<a>法律公告</a>　｜　<a>隐私保护</a>　　Boss网京ICP备11035381
        </dt>
        <dd>
            <a>满意度调查</a>　｜　<a href="37 contact.html">联系我们</a>　｜　<a
                href="d3 JobOpportunities.html">工作机会</a>　｜　<a>合作伙伴认证</a>　｜　<a href="m2 helpCenterLoginorRegister.html">帮助中心</a>
        </dd>
    </dl>
</div>
<script type="text/javascript" src="${ctx}/static/js/bottom.js"></script>
</body>
</html> 
