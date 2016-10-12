<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>${site_title} - 号码</title>
    <%@include file="/common/include.rec.jsp" %>
</head>
<body>
<!-- 引用TOP -->
<%@include file="/common/topOne.rec.jsp" %>
<%@include file="/common/include.menu.rec.jsp" %>
<div class="space30"></div>

<div class="rn bg11 b1 p20 detailPackage">
    <div class="fl">
        <div class="space20"></div>
        <img src="${imgDomain}${packageImg}"/>

        <div class="share">
            <div class="bshare-custom icon-medium-plus"><a title="分享到" href="http://www.bShare.cn/" id="bshare-shareto"
                                                           class="bshare-more">分享到</a><a title="分享到QQ空间"
                                                                                         class="bshare-qzone"></a><a
                    title="分享到新浪微博" class="bshare-sinaminiblog"></a><a title="分享到人人网" class="bshare-renren"></a><a
                    title="分享到腾讯微博" class="bshare-qqmb"></a><a title="分享到网易微博" class="bshare-neteasemb"></a><a
                    title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a></div>
            <script type="text/javascript" charset="utf-8"
                    src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
            <script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
        </div>


    </div>
    <div class="fr">
        <strong>${packages.packagesName}</strong>
        <i>(${packages.introduction})</i>

        <div class="space20"></div>
        <p>价格：　<b>￥${price}</b></p>

        <div class="space20"></div>
        <p>号码：<label id="bindnum">${phone}</label>　<font onclick='$(".dpaw").show();'>新选号码<span></span></font></p>

        <div class="space"></div>
        <p>　　　　<input type="checkbox"/>带卡贴</p>

        <div class="space"></div>
        <p>　　　　<em>(张贴在手机SIM卡上,智能手机客户仅第一次购买时需要)</em></p>

        <div class="space40"></div>
        <p>
            <a class="btn" href="${ctx}/trolley/buynow/${goods.id}">立即购买</a>
            <a class="btn btn-s" href="javascript:void(0);" onclick="addToShopCart(${goods.id});">加入购物车</a>
        </p>

        <div class="space20"></div>
        <span><em>√</em>已出售<em>${packages.salesVolume}</em>件　　<em>+</em><a>加入收藏</a></span>
    </div>
</div>

<div class="mw parameterTab">
    <a id="desc" class="sel" href="javascript:changediv('desc');"><img
            src="${ctx}/static/img/icon_parameter.png"/>参数<i></i></a>
    <a id="hotpackage" href="javascript:changediv('hotpackage');"><img
            src="${ctx}/static/img/icon_recommend.png"/>热门推荐<i></i></a>
</div>

<div id="descdiv" class="mw b1 rn bg11 parameterCon">
    <strong>参数</strong>

    <p>
        套餐内容：<br>
        　▪&nbsp;${packages.packagesDesc}
    </p>

    <div class="space"></div>
    <p>适用范围：${packages.packagesRange}</p>

    <div class="space"></div>
    <p>有效期：${packages.validTime}</p>

    <div class="space"></div>
    <p>运营商：${operatorName} <a href="${ctx}/operator">进入该运营商中心</a></p>
</div>


<div id="hotpackagediv" class="recommend" style="display:none;">
    <c:forEach items="${packageList}" var="item">
        <div class="fl">
            <div class="divrelative">
                <a href="06 detailPackage.html"></a>
                <strong>${item.PACKAGES_NAME}</strong>
                <img src="${ctx}/static/img/servePanelSlide_1.png"/>

                <div class="space20"></div>
                <p><b>已售：<font>${item.SALES_VOLUME}</font></b><i>￥${item.GOODS_PRICE}</i></p>

                <div class="space20"></div>
                    ${item.PACKAGES_DESC}
                <div class="space"></div>
                适用范围：${item.PACKAGES_RANGE}
                <div class="space"></div>
                运营商：<font>${operatorMap[item.OPERATOR_ID]}</font>

                <div class="space"></div>
            </div>
            <div class="divrelative">
                <a href="${ctx}/service/package/list"></a>

                <p class="tac">
                    <button class="btn">　了解更多　</button>
                </p>
            </div>
        </div>
    </c:forEach>
</div>

<div class="space30"></div>

<div class="mw rn b1 bg11 question">
    <table class="fl">
        <tr>
            <th>购物上有问题？</th>
        </tr>
        <tr class="trshow">
            <td><span>+</span><a>卡贴是什么？</a></td>
        </tr>
        <tr class="trdispnone">
            <td> 自己百度哦亲~</td>
        </tr>
        <tr class="trshow">
            <td><span>+</span><a>手机制式是什么？</a></td>
        </tr>
        <tr class="trdispnone">
            <td> 自己百度哦亲~</td>
        </tr>
        <tr class="trshow">
            <td><span>+</span><a>卡贴使用方法？</a></td>
        </tr>
        <tr class="trdispnone">
            <td> 自己百度哦亲~</td>
        </tr>
        <tr class="trshow">
            <td><span>+</span><a>不要卡贴时怎么使用？</a></td>
        </tr>
        <tr class="trdispnone">
            <td> 自己百度哦亲~</td>
        </tr>
    </table>
    <table class="fr">
        <tr>
            <th colspan="2">还有问题？</th>
        </tr>
        <tr>
            <th><img src="${ctx}/static/img/icon_question.png"/></th>
            <td><b>400-6754-7867</b><br>悠游宝客服热线</td>
        </tr>
        <tr>
            <th colspan="2">现在联系我们</th>
        </tr>
    </table>
</div>

<div class="space100"></div>
<!-- 引用bottom -->
<%@include file="/common/usersbottom.rec.jsp" %>
<div class="dpaw">
    <h2><b>选择号码</b><i onClick="hideDpaw();">＋</i></h2>
    <dl class="awTab">
        <dt>推荐号码</dt>
    </dl>
    	<input type="hidden" value="${packagesId}" id="packagesId" name="packagesId"/>
	    <div class="search">制式类型：<select id="phoneStandard" name="phoneStandard">
	        <option value="">全部</option>
	        <c:forEach items="${phoneStandardList}" var="item">
	        	<option value="${item}" <c:if test="${param.phoneStandard eq item}">selected="selected"</c:if>>${item}</option>
	        </c:forEach>
	    </select>　价格：<input id="goodsPriceMin" name="goodsPriceMin" type="text" value="${param.goodsPriceMin}" /> - <input id="goodsPriceMax" name="goodsPriceMax" type="text" value="${param.goodsPriceMax}" />　尾号：<input id="tailNumber" name="tailNumber" type="text" maxlength="1" value="${param.tailNumber}" />
	        <button class="btn" onclick="loadNumber();">搜索</button>
	    </div>
    <div id="ajaxPageList">
    	<%@include file="package-numbers.jsp"%>
    </div>
    <div class="space"></div>
    <div class="line1"></div>
    <p>备选号码</p>

    <div class="space"></div>
    <p class="tac">
        <font><span>待添加</span><em>＋</em></font><font><span>待添加</span><em>＋</em></font><font><span>待添加</span><em>＋</em></font>
    </p>

    <div class="space"></div>
    <p class="tac"><input class="btn" type="button" value="确定号码"/></p>
</div>
<script>
$(function () {
    
    $(".dpaw font em").on("click", function () {
        $(this).prev().removeAttr("num").html("待添加");
    });
    $("input.btn").on("click", function () {
        var nums = parseInt(0);
        $(".dpaw font span").each(function () {
            if ($(this).attr("num")) {
                nums += parseInt(1);
                selTelNum = $(this).attr("num");
            }
        });
        if (nums < 1) {
            alert("您还没选号");
        } else if (nums > 1) {
            alert("您只能选一个号");
        } else {
            alert("号码" + selTelNum + "已选择成功");
            $(".detailPackage .fr font").html(selTelNum + "<span></span>");
            $("#bindnum").html("");
            hideDpaw();
        }
    });
})
    function changediv(obj) {

        $("#" + obj).attr("class", "sel");
        $("#" + obj + "div").show();
        if (obj == "desc") {
            $("#hotpackage").attr("class", "");
            $("#hotpackagediv").hide();
        } else {
            $("#desc").attr("class", "");
            $("#descdiv").hide();
        }
    }

    
    function addToShopCart(goodsId) {
        if(goodsId) {
            $.post("${ctx}/trolley/goods/put",{goodsId:goodsId},function(result){
                var data = eval(result);
                if(data.status_code == "1") {
                    alert("成功加入购物车");
                } else {
                    alert(data.msg);
                }
            });
        }
    }

    function loadNumber(){
		$.post("${ctx}/service/package/loadnumbers",
			{
			 packagesId:$("#packagesId").val(),
			 phoneStandard:$("#phoneStandard").val(),
			 goodsPriceMin:$("#goodsPriceMin").val(),
			 goodsPriceMax:$("#goodsPriceMax").val(),
			 tailNumber:$("#tailNumber").val()
			},function(data){
	                $("#ajaxPageList").html(data);
         }); 
		 //$.ajax({
             //type: "POST",
            // url:"${ctx}/service/package/loadnumbers?packagesId="+$("#packagesId").val(),
             //success: function(data){
               //  $("#ajaxPageList").html(data);
             //}
        // });   
	}
    function selectNumber(num, price) {
        $(".dpaw font span").each(function () {
            if ($(this).attr("num")) {
            } else {
                $(this).attr("num", num);
                $(this).html(num + " <br>￥" + price);
                return false;
            }
        });
    }
    function hideDpaw() {
        $(".dpaw").hide();
    }
</script>
</body>
</html> 
