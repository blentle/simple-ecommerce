<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>${site_title} - 服务</title>
    <%@include file="/common/include.rec.jsp"  %>
</head>
<body>
<!-- 引用TOP -->
<%@include file="/common/topOne.rec.jsp" %>
<%@include file="/common/include.menu.rec.jsp" %>
<div class="space30"></div>

<div class="chargeSmall mw">
    <div class="slide">
        <ul>
            <li><img src="${CONTEXT_PATH}/static/img/slide.png"></li>
            <li><img src="${CONTEXT_PATH}/static/img/logo.png"></li>
            <li><img src="${CONTEXT_PATH}/static/img/homePanelTitleBG.png"></li>
        </ul>
        <dl>
            <dt></dt>
            <dt></dt>
            <dt></dt>
        </dl>
    </div>
    <div class="formList">
        <div class="formRow">
            <b>充值号码</b>

            <div><input type="tel" placeholder="请输入手机号码"/></div>
        </div>
        <div class="formRow tipRow">
            <b></b>

            <div style="margin-left:50px">仅支持大陆地区</div>
        </div>
        <div class="formRow">
            <b>充值金额</b>

            <div><select style="width:192px;">
                <option>100元</option>
            </select></div>
        </div>
        <div class="formRow tipRow">
            <b></b>

            <div style="margin-left:50px"><i>￥ 98.40 - 99.60</i></div>
        </div>
        <div class="formRow tac"><a class="btn" href="08 charge.html">立即充值</a></div>
        <div class="space20"></div>
        <div class="line1"></div>
        <div class="space20"></div>
        <div class="formRow tac">
            <a class="dib c13" href="${ctx}/order/center"><img src="${CONTEXT_PATH}/static/img/icon_order.png"/><br/>我的订单</a>　　
            <a class="dib c13" href="e4 ReservationCenter.html"><img src="${CONTEXT_PATH}/static/img/icon_appointment.png"/><br/>预约中心</a>
        </div>
    </div>
</div>

<div class="mw line1 space20"></div>
<div class="space20"></div>

<div class="mw serveBlock">
    <table class="fl">
        <tr>
            <td rowspan="2"><img src="${CONTEXT_PATH}/static/img/serve_1.png"></td>
            <th>我们认为高收费我们认为高收费我们认为高收费我们认为高收费我们认为高收费我们认为高收费我们认为高收费我们认为高收费<b>当地通讯自费</b></th>
        </tr>
        <tr>
            <td><a class="btn" href="${ctx}/service/package/list">更多套餐</a></td>
        </tr>
    </table>
    <table class="fr">
        <tr>
            <td rowspan="2"><img src="${CONTEXT_PATH}/static/img/serve_2.png"></td>
            <th>我们认为高收费我们认为高收费我们认为高收费我们认为高收费我们认为高收费我们认为高收费我们认为高收费我们认为高收费<b>一卡多号之</b></th>
        </tr>
        <tr>
            <td><a class="btn" href="${ctx}/service/number/list">更多号码</a></td>
        </tr>
    </table>
</div>

<div class="space20"></div>
<div class="mw serveTitle"><img src="${CONTEXT_PATH}/static/img/icon_deluxeSet.png"> 精选<b>套餐</b></div>
<div class="mw line1"></div>
<div class="space20"></div>

<div class="mw servePanelGroup">
    <div class="servePanel fl">
        <span class="serveTltleSmall">${country0}套餐<a href="${ctx}/service/package/list">更多</a></span>

        <div class="slide">
            <ul>
            	<c:forEach items="${packages0}" var="item">
                	<li><a href="javascript:packageDetail('${item.ID}','${item.PACKAGES_NAME}','${item.PACKAGES_DESC}','${item.SALES_VOLUME}','${item.PACKAGES_RANGE}','${operatorMap[item.OPERATOR_ID]}','${item.VALID_TIME}','${item.INTRODUCTION}','${item.PACKAGES_IMAGE}');"><strong>${item.PACKAGES_NAME}</strong><img src="${imgDomain}${item.PACKAGES_IMAGE}"/>${item.INTRODUCTION}</a>
                	</li>
                </c:forEach>
            </ul>
            <dl>
                <dt></dt>
                <dt></dt>
                <dt></dt>
            </dl>
        </div>
    </div>
    <div class="interval"></div>
    <div class="servePanel fl">
        <span class="serveTltleSmall">${country1}套餐<a href="${ctx}/service/package/list">更多</a></span>

        <div class="slide">
            <ul>
            	<c:forEach items="${packages1}" var="item">
                	<li><a href="javascript:packageDetail('${item.ID}','${item.PACKAGES_NAME}','${item.PACKAGES_DESC}','${item.SALES_VOLUME}','${item.PACKAGES_RANGE}','${operatorMap[item.OPERATOR_ID]}','${item.VALID_TIME}','${item.INTRODUCTION}','${item.PACKAGES_IMAGE}');"><strong>${item.PACKAGES_NAME}</strong><img src="${imgDomain}${item.PACKAGES_IMAGE}"/>${item.INTRODUCTION}</a>
                	</li>
                </c:forEach>
            </ul>
            <dl>
                <dt></dt>
                <dt></dt>
                <dt></dt>
            </dl>
        </div>
    </div>
    <div class="servePanel fr">
        <span class="serveTltleSmall">${country2}套餐<a href="${ctx}/service/package/list">更多</a></span>

        <div class="slide">
            <ul>
            	<c:forEach items="${packages2}" var="item">
	                <li><a href="javascript:packageDetail('${item.ID}','${item.PACKAGES_NAME}','${item.PACKAGES_DESC}','${item.SALES_VOLUME}','${item.PACKAGES_RANGE}','${operatorMap[item.OPERATOR_ID]}','${item.VALID_TIME}','${item.INTRODUCTION}','${item.PACKAGES_IMAGE}');"><strong>${item.PACKAGES_NAME}</strong><img src="${imgDomain}${item.PACKAGES_IMAGE}"/>${item.INTRODUCTION}</a>
	                </li>
                </c:forEach>
            </ul>
            <dl>
                <dt></dt>
                <dt></dt>
                <dt></dt>
            </dl>
        </div>
    </div>
</div>

<div class="space20"></div>
<div class="mw serveTitle"><img src="${CONTEXT_PATH}/static/img/icon_hotNumber.png"> 热销<b>号码</b></div>
<div class="mw line1"></div>
<div class="space20"></div>

<div class="mw numberGroup">
    <dl class="fl">
        <dt><span class="serveTltleSmall">${country0}号码<a href="${ctx}/service/number/list">更多</a></span></dt>
       	<c:forEach items="${numbers0}" var="item" varStatus="st">
	        <dd>
	            <a href="javascript:numberDetail('${item.ID}','${item.PACKAGES_NAME}','${item.PACKAGES_DESC}','${item.PACKAGES_RANGE}','${item.OPERATOR_ID}','${operatorMap[item.OPERATOR_ID]}','${item.PHONE}','${item.GOODS_PRICE}','${item.VALID_TIME}','${item.INTRODUCTION}','${item.PRETTY_PRICE}',${item.BIND_CARD},'${item.PHONE_STANDARD}','${item.PACKAGES_IMAGE}');"></a>
	
	            <div>
	                <p><b>${item.PHONE}</b><i>￥${item.GOODS_PRICE}</i></p>
	
	                <div class="space30"></div>
	                <p>${item.PACKAGES_NAME}<br><br>
	                    适用范围：<c:if test="${not empty item.PACKAGES_RANGE}">
	                    	${item.PACKAGES_RANGE}
	                    </c:if>
	                    <c:if test="${empty item.PACKAGES_RANGE}">
	                    	${country0}
	                    </c:if>
	                    <br><br>
	                    运营商：<em>${operatorMap[item.OPERATOR_ID]}</em>
	                </p>
	            </div>
	        </dd>
	        <c:if test="${st.index eq 0}">
		        <dd>
		            <div class="line2"></div>
		        </dd>
	        </c:if>
        </c:forEach>
    </dl>
    <div class="interval"></div>
    <dl class="fl">
        <dt><span class="serveTltleSmall">${country1}号码<a href="${ctx}/service/number/list">更多</a></span></dt>
       	<c:forEach items="${numbers1}" var="item" varStatus="st">
	        <dd>
	            <a href="javascript:numberDetail('${item.ID}','${item.PACKAGES_NAME}','${item.PACKAGES_DESC}','${item.PACKAGES_RANGE}','${item.OPERATOR_ID}','${operatorMap[item.OPERATOR_ID]}','${item.PHONE}','${item.GOODS_PRICE}','${item.VALID_TIME}','${item.INTRODUCTION}','${item.PRETTY_PRICE}',${item.BIND_CARD},'${item.PHONE_STANDARD}','${item.PACKAGES_IMAGE}');"></a>
	
	            <div>
	                <p><b>${item.PHONE}</b><i>￥${item.GOODS_PRICE}</i></p>
	
	                <div class="space30"></div>
	                <p>${item.PACKAGES_NAME}<br><br>
	                    适用范围：<c:if test="${not empty item.PACKAGES_RANGE}">
	                    	${item.PACKAGES_RANGE}
	                    </c:if>
	                    <c:if test="${empty item.PACKAGES_RANGE}">
	                    	${country1}
	                    </c:if><br><br>
	                    运营商：<em>${operatorMap[item.OPERATOR_ID]}</em>
	                </p>
	            </div>
	        </dd>
	        <c:if test="${st.index eq 0}">
		        <dd>
		            <div class="line2"></div>
		        </dd>
	        </c:if>
        </c:forEach>
    </dl>
    <div class="interval"></div>
    <dl class="fl">
        <dt><span class="serveTltleSmall">${country2}号码<a href="${ctx}/service/number/list">更多</a></span></dt>
       	<c:forEach items="${numbers2}" var="item" varStatus="st">
	        <dd>
	            <a href="javascript:numberDetail('${item.ID}','${item.PACKAGES_NAME}','${item.PACKAGES_DESC}','${item.PACKAGES_RANGE}','${item.OPERATOR_ID}','${operatorMap[item.OPERATOR_ID]}','${item.PHONE}','${item.GOODS_PRICE}','${item.VALID_TIME}','${item.INTRODUCTION}','${item.PRETTY_PRICE}',${item.BIND_CARD},'${item.PHONE_STANDARD}','${item.PACKAGES_IMAGE}');"></a>
	
	            <div>
	                <p><b>${item.PHONE}</b><i>￥${item.GOODS_PRICE}</i></p>
	
	                <div class="space30"></div>
	                <p>${item.PACKAGES_NAME}<br><br>
	                    适用范围：<c:if test="${not empty item.PACKAGES_RANGE}">
	                    	${item.PACKAGES_RANGE}
	                    </c:if>
	                    <c:if test="${empty item.PACKAGES_RANGE}">
	                    	${country2}
	                    </c:if><br><br>
	                    运营商：<em>${operatorMap[item.OPERATOR_ID]}</em>
	                </p>
	            </div>
	        </dd>
	        <c:if test="${st.index eq 0}">
		        <dd>
		            <div class="line2"></div>
		        </dd>
	        </c:if>
        </c:forEach>
    </dl>
</div>

<div class="space100"></div>
<form id="packageForm" method="post" action="${ctx}/service/package/detail">
	<input type="hidden" name="packagesName" id="packagesName" value="" />
	<input type="hidden" name="packagesDesc" id="packagesDesc" value="" />
	<input type="hidden" name="salesVolume" id="salesVolume" value="" />
	<input type="hidden" name="packagesRange" id="packagesRange" value="" />
	<input type="hidden" name="introduction" id="introduction" value="" />
	<input type="hidden" name="validTime" id="validTime" value="" />
	<input type="hidden" name="operatorName" id="operatorName" value="" />
	<input type="hidden" name="id" id="pid" value="" />
    <input type="hidden" name="packageImg" id="packageImg"/>
</form>
<form id="numberForm" method="post" action="${ctx}/service/number/detail">
	<input type="hidden" name="packagesName" id="packagesName2" value="" />
	<input type="hidden" name="packagesDesc" id="packagesDesc2" value="" />
	<input type="hidden" name="packagesRange" id="packagesRange2" value="" />
	<input type="hidden" name="introduction" id="introduction2" value="" />
	<input type="hidden" name="validTime" id="validTime2" value="" />
	<input type="hidden" name="operatorName" id="operatorName2" value="" />
	<input type="hidden" name="operatorId" id="operatorId2" value="" />
	<input type="hidden" name="phone" id="phone2" value="" />
	<input type="hidden" name="goodsPrice" id="goodsPrice2" value="" />
	<input type="hidden" name="prettyPrice" id="prettyPrice2" value="" />
	<input type="hidden" name="phoneStandard" id="phoneStandard2" value="" />
	<input type="hidden" name="bindCard" id="bindCard2" value="" />
    <input type="hidden" name="goodsId" id="goodsId2"/>
    <input type="hidden" name="packageImg" id="packageImg"/>
</form>
<!-- 引用bottom -->
<%@include file="/common/usersbottom.rec.jsp" %>
<script>
    $(function () {
        var slideTimer;
        var speed = 2000;//感觉轮播图变得太快改这个
        $(".slide").each(function () {
            $(this).mouseover(function () {
                $(this).addClass("slideMO");
            }).mouseout(function () {
                        $(this).removeClass("slideMO");
                    });
        });
        $(".slide dt").each(function () {
            $(this).click(function () {
                $(this).addClass("sel").siblings().removeClass("sel");
                var num = $(this).index();
                var sldeBox = $(this).parent().prev();
                sldeBox.find("li").eq(num).animate({"opacity": "1"}, 500).siblings().animate({"opacity": 0}, 500);
            });
        });
        function slideRun() {
            $(".slide").each(function () {
                if (!$(this).is(".slideMO")) {
                    if ($(this).find(".sel").next().is("dt")) {
                        $(this).find(".sel").next().trigger("click");
                    } else {
                        $(this).find("dt").first().trigger("click");
                    }
                }
            })
        }

        slideTimer = setInterval(slideRun, speed)
    });

    function packageDetail(id,packagesName,packagesDesc,salesVolume,packagesRange,operatorName,validTime,introduction,packageImg){
		$("#packagesName").val(packagesName);
		$("#packagesDesc").val(packagesDesc);
		$("#salesVolume").val(salesVolume);
		$("#packagesRange").val(packagesRange);
		$("#validTime").val(validTime);
		$("#introduction").val(introduction);
		$("#operatorName").val(operatorName);
		$("#pid").val(id);
        $("#packageImg").val(packageImg);
		$("#packageForm").submit();
    }
    function numberDetail(goodsId,packagesName,packagesDesc,packagesRange,operatorId,operatorName,phone,goodsPrice,validTime,introduction,prettyPrice,bindCard,phoneStandard,packageImg){
		$("#packagesName2").val(packagesName);
		$("#packagesDesc2").val(packagesDesc);
		$("#packagesRange2").val(packagesRange);
		$("#validTime2").val(validTime);
		$("#introduction2").val(introduction);
		$("#operatorId2").val(operatorId);
		$("#operatorName2").val(operatorName);
		$("#phone2").val(phone);
		$("#goodsPrice2").val(goodsPrice);
        $("#goodsId2").val(goodsId);
        $("#prettyPrice2").val(prettyPrice);
        $("#bindCard2").val(bindCard);
        $("#phoneStandard2").val(phoneStandard);
        $("#packageImg").val(packageImg);
		$("#numberForm").submit();
    }
</script>
</body>
</html>