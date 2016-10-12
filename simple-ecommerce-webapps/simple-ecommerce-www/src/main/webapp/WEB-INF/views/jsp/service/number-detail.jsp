<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>${site_title} - 号码</title>
    <%@include file="/common/include.rec.jsp" %>
    <script type="text/javascript">
	$(function(){
	$(".trshow").click(function(){
		$(this).next(".trdispnone").toggle();
		})
	})
	</script>
	<style>
	.tc{cursor:pointer}
	.trdispnone{font-size:12px;color:#999;display:none}
	</style>
</head>
<body>
<!-- 引用TOP -->
<%@include file="/common/topOne.rec.jsp" %>
<%@include file="/common/include.menu.rec.jsp" %>
<div class="space30"></div>

<div class="mw rn bg11 b1 p20 detailNumber">
	<div class="fl">
		<div class="space20"></div>
		<c:if test="${empty packageImg}">
			<img src="${ctx}/static/img/detailPackageImg.png" />
		</c:if>
		<c:if test="${not empty packageImg}">
			<img src="${imgDomain}${packageImg}" />
		</c:if>
        <div class="space20"></div>
        <div class="share">
			<div class="bshare-custom icon-medium-plus"><a title="分享到" href="http://www.bShare.cn/" id="bshare-shareto" class="bshare-more">分享到</a><a title="分享到QQ空间" class="bshare-qzone"></a><a title="分享到新浪微博" class="bshare-sinaminiblog"></a><a title="分享到人人网" class="bshare-renren"></a><a title="分享到腾讯微博" class="bshare-qqmb"></a><a title="分享到网易微博" class="bshare-neteasemb"></a><a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a></div><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
		</div>
        
        
	</div>
	<div class="fr">
		<strong>${phone}(${operatorName})</strong>
		<div class="space20"></div>
		<p>价格：　<b>￥${goodsPrice}</b></p>
		<div class="space20"></div>
		<p>提示：　号码支持手机制式${standardStr}</p>
		<i class="i1">如果您不知道您手机的制式请下载手机APP进行购买</i>
		<div class="space20"></div>
        <p><input type="checkbox" />卡贴（贴在手机SIM卡上，仅第一次使用时需要购买）</p>
        <div class="space20"></div>
        <p>必选套餐：<c:if test="${empty packagesName}"><font id="requiredPackageName" onclick='$("#requiredPackage").show();'>选择套餐内容<span></span></font>
        		</c:if>
        		<c:if test="${not empty packagesName}">${packagesName}
        		</c:if>　
        </p>
		<div class="space"></div>
		<i class="i1"><p style="font-size:12px;" id="requiredPackageIntroduction">${introduction}</p></i>
		<div class="space"></div>
        <p>可选套餐：　<font onclick='$("#optionalPackage").show();' id="optionalPackageName">选择套餐内容<span></span></font></p>
		<div class="space"></div>
 		<i class="i1"><p style="font-size:12px;" id="optionalPackageIntroduction"></p></i>
		<div class="space20"></div>
		<p><a class="btn" href="javascript:void(0);" onclick="buyNow(${goodsId});">立即购买</a><!--c2是第一次买   c1是第二次次买-->　<a class="btn btn-s" href="javascript:void(0);" onclick="addToShopCart(${goodsId});">加入购物车</a></p>
		<div class="space20"></div>
        
        

	</div>
</div>

<div class="mw parameterTab">
	<a id="desc" class="sel" href="javascript:changediv('desc');"><img src="${ctx}/static/img/icon_parameter.png" />参数<i></i></a>
	<a id="hotpackage" href="javascript:changediv('hotpackage');"><img src="${ctx}/static/img/icon_recommend.png" />热门推荐<i></i></a>
</div>

<div id="descdiv" class="mw b1 rn bg11 parameterCon">
	<strong>参数</strong>
	<div class="space"></div>
	<p>运营商：${operatorName} <a href="${ctx}/operator">进入该运营商中心</a></p>
	<p>　　　　　<i></i><i></i><i></i><i></i><i></i><font>5.0</font></p>
	<div class="space"></div>
	<p>卡贴：<c:if test="${bindCard}">绑定</c:if>
	    <c:if test="${!bindCard}">未绑定</c:if>
	</p>
	<table>
		<tr>
			<td>号码：${phone}</td><td>价格：${prettyPrice}元</td>
		</tr>
	</table>
	<div id="requiredOption" <c:if test="${empty packagesName}">style="display:none;"</c:if>>
		<table>
			<tr>
				<td>必选套餐：<span id="requiredPackageName1">${packagesName}</span></td><td>价格：<span id="requiredPackagePrice">${packagePrice}</span>元</td>
			</tr>
		</table>
		<p id="requiredPackageDesc">
			　　${packagesDesc}
		</p>
		<div class="space"></div>
		<p>适用范围：<span id="requiredPackageRange">${packagesRange}</span></p>
		<div class="space"></div>
		<p>有效期：<span id="requiredPackageValidTime">${validTime}</span></p>
	</div>
	<div class="space"></div>
	<div id="optionalOption" style="display:none;">
		<table>
			<tr>
				<td>可选套餐：<span id="optionalPackageName1"></span></td><td>价格：<span id="optionalPackagePrice"></span>元</td>
			</tr>
		</table>
		<p id="optionalPackageDesc">
			　　${packagesDesc}
		</p>
		<div class="space"></div>
		<p>适用范围：<span id="optionalPackageRange">${packagesRange}</span></p>
		<div class="space"></div>
		<p>有效期：<span id="optionalPackageValidTime">${validTime}</span></p>
	</div>
</div>


<div id="hotpackagediv" class="recommend" style="display:none;">
	<c:forEach items="${numbersList}" var="item">
	<div class="fl">
    <div  class="divrelative">
		<a href="07 detailNumber.html"></a>
		<p><strong>${item.PHONE}</strong><i>￥${item.GOODS_PRICE}</i></p>
		<div class="space20"></div>
		${item.PACKAGES_DESC}
		<div class="space"></div>
		适用范围：${item.PACKAGES_RANGE}
		<div class="space"></div>
		运营商：<font>${operatorMap[item.OPERATOR_ID]}</font>
		<div class="space"></div>
        </div>
            <div  class="divrelative">
            <a href="${ctx}/service/number/list"></a>
		<p class="tac"><button class="btn">　了解更多　</button></p>
        </div>
	</div>
	<div class="interval"></div>
	</c:forEach>
</div>

<div class="space30"></div>

<div class="mw rn b1 bg11 question">
	<table class="fl">
		<tr><th>购物上有问题？</th></tr>
		<tr class="trshow"><td><span>+</span><a>卡贴是什么？</a></td></tr>
        <tr class="trdispnone"><td> 自己百度哦亲~ </td></tr>
		<tr class="trshow"><td><span>+</span><a>手机制式是什么？</a></td></tr>
                <tr class="trdispnone"><td> 自己百度哦亲~ </td></tr>
		<tr class="trshow"><td><span>+</span><a>卡贴使用方法？</a></td></tr>
                <tr class="trdispnone"><td> 自己百度哦亲~ </td></tr>
		<tr class="trshow"><td><span>+</span><a>不要卡贴时怎么使用？</a></td></tr>
                <tr class="trdispnone"><td> 自己百度哦亲~ </td></tr>
	</table>
	<table class="fr">
		<tr><th colspan="2">还有问题？</th></tr>
		<tr><th><img src="${ctx}/static/img/icon_question.png" /></th><td><b>400-6754-7867</b><br>悠游宝客服热线</td></tr>
		<tr><th colspan="2">现在联系我们！</a></th></tr>
	</table>
</div>

<div class="space100"></div>
<!-- 引用bottom -->
<%@include file="/common/usersbottom.rec.jsp" %>



<div id="requiredPackage" class="rn dosn"  style="display:none">
   <span>套餐组合</span><!--页面本来有取消的  我把这个x号去掉了<img src="../img/e2_coinx.png" />-->
   <div class="space30"></div>
   <h2>必选套餐:</h2>
   <c:forEach items="${requiredPackageList}" var="item">
   		<div class="tc" id="${item.GOODSID}" onclick="chooseRequiredPackage(${item.GOODSID},'${item.PACKAGES_NAME}','${item.INTRODUCTION}','${item.PACKAGES_DESC}','${item.GOODS_PRICE}','${item.PACKAGES_RANGE}','${item.VALID_TIME}');">${item.PACKAGES_NAME}</div>
   </c:forEach>
        <div class="space30"></div>
   <a class="btn" style="margin-left:170px;float:left" href="javascript:confirmRequiredPackage();">确定</a><a class="btn" style="margin-right:170px;float:right"   onclick='$("#requiredPackage").hide();'>取消</a>
      <div class="space100"></div>
</div>
<div id="optionalPackage" class="rn dosn"  style="display:none">
   <span>套餐组合</span><!--页面本来有取消的  我把这个x号去掉了<img src="../img/e2_coinx.png" />-->
   <div class="space30"></div>
   <h2>可选套餐:</h2>
   <c:forEach items="${optionalPackageList}" var="item">
   		<div class="tc" id="${item.GOODSID}" onclick="chooseOptionalPackage(${item.GOODSID},'${item.PACKAGES_NAME}','${item.INTRODUCTION}','${item.PACKAGES_DESC}','${item.GOODS_PRICE}','${item.PACKAGES_RANGE}','${item.VALID_TIME}');">${item.PACKAGES_NAME}</div>
   </c:forEach>     
        <div class="space30"></div>
   <a class="btn" style="margin-left:170px;float:left" href="javascript:confirmOptionalPackage();">确定</a><a class="btn" style="margin-right:170px;float:right"   onclick='$("#optionalPackage").hide();'>取消</a>
      <div class="space100"></div>
</div>
<input type="hidden" id="requiredGoodsId" />
<input type="hidden" id="optionalGoodsId" />
<script>
var div1id;
var div2id;
var div1name;
var div2name;
var div1introduction;
var div2introduction;
var div1desc;
var div2desc;
var div1price;
var div2price;
var div1range;
var div2range;
var div1time;
var div2time;
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

function chooseRequiredPackage(id,name,introduction,desc,price,range,validtime){
	div1id=id;
	div1name=name;
	div1introduction=introduction;
	div1desc=desc;
	div1price=price;
	div1range=range;
	div1time=validtime;
	$("#"+id).addClass("tcs").siblings().removeClass("tcs");
}
function chooseOptionalPackage(id,name,introduction,desc,price,range,validtime){
	div2id=id;
	div2name=name;
	div2introduction=introduction;
	div2desc=desc;
	div2price=price;
	div2range=range;
	div2time=validtime;
	$("#"+id).addClass("tcs").siblings().removeClass("tcs");
}

function confirmRequiredPackage(){
	$("#requiredGoodsId").val(div1id);
	$("#requiredPackageName").html(div1name+"<span></span>");
	$("#requiredPackageName1").html(div1name);
	$("#requiredPackageIntroduction").html(div1introduction);
	$("#requiredPackagePrice").html(div1price);
	$("#requiredPackageDesc").html(div1desc);
	$("#requiredPackageRange").html(div1range);
	$("#requiredPackageValidTime").html(div1time);
	$("#requiredOption").show();
	$("#requiredPackage").hide();
}

function confirmOptionalPackage(){
	$("#optionalGoodsId").val(div2id);
	$("#optionalPackageName").html(div2name+"<span></span>");
	$("#optionalPackageName1").html(div2name);
	$("#optionalPackageIntroduction").html(div2introduction);
	$("#optionalPackagePrice").html(div2price);
	$("#optionalPackageDesc").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+div2desc);
	$("#optionalPackageRange").html(div2range);
	$("#optionalPackageValidTime").html(div2time);
	$("#optionalOption").show();
	$("#optionalPackage").hide();
}

function addToShopCart(goodsId) {

	var success=true;
	var requiredGoodsId=$("#requiredGoodsId").val();
	var optionalGoodsId=$("#optionalGoodsId").val();
    if(goodsId) {
        $.post("${ctx}/trolley/goods/put",{goodsId:goodsId},function(result){
            var data = eval(result);
            if(data.status_code != "1") {
                alert(data.msg);
                success=false;
            }
        });
    }
    if(requiredGoodsId) {
        $.post("${ctx}/trolley/goods/put",{goodsId:requiredGoodsId},function(result){
            var data = eval(result);
            if(data.status_code != "1") {
                alert(data.msg);
                success= false;
            }
        });
    }
    if(optionalGoodsId) {
        $.post("${ctx}/trolley/goods/put",{goodsId:optionalGoodsId},function(result){
            var data = eval(result);
            if(data.status_code != "1") {
                alert(data.msg);
                success= false;
            }
        });
    }
    if(success){
    	alert("成功加入购物车");
    }
}
function buyNow(goodsId){
	var requiredGoodsId=$("#requiredGoodsId").val();
	var optionalGoodsId=$("#optionalGoodsId").val();
	if(requiredGoodsId){
		goodsId = goodsId+","+requiredGoodsId;
	}
	if(optionalGoodsId){
		goodsId = goodsId+","+optionalGoodsId;
	}
	location.href="${ctx}/trolley/buynow/"+goodsId;
}
</script>   
</body>
</html> 
