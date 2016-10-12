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
<div class="mw panel"><span>服务 &gt; 我的订单 &gt; 我的购物车</span></div>

<div class="space20"></div>

<div class="mw">
    <dl class="centerMenu">
        <dt><img src="${ctx}/static/img/icon_center_1.png"/>我的订单</dt>
        <dd><a href="${ctx}/order/center">订单中心</a></dd>
        <dd><a class="sel" href="${ctx}/trolley/goods/show">我的购物车</a></dd>
        <dt><img src="${ctx}/static/img/icon_center_2.png"/>我的收藏</dt>
        <dd><a>收藏的商品</a></dd>
        <dd><a>收藏的店铺</a></dd>
        <dt><img src="${ctx}/static/img/icon_center_3.png"/>账户中心</dt>
        <dd><a>基本资料</a></dd>
        <dd><a>入网资料</a></dd>
        <dd><a>消息</a></dd>
        <dd><a>账户安全</a></dd>
        <dd><a>分享设置</a></dd>
        <dd><a>收货地址</a></dd>
        <dt><img src="${ctx}/static/img/icon_center_4.png"/>客户服务</dt>
        <dd><a>退换货</a></dd>
        <dd><a>卡贴挂失</a></dd>
        <dt><img src="${ctx}/static/img/icon_center_5.png"/>预约中心</dt>
        <dd><a>我的预约</a></dd>

    </dl>

    <div class="centerCon centerShopping">
        <div class="title">
            <input type="checkbox"/> 全选　　　<font>收藏时间<b>↓</b></font>　　　<em>删除选中</em>
        </div>
        <table class="shoppingTable">
            <thead>
            <tr>
                <th colspan="2">商品</th>
                <th>商品组成</th>
                <th>商品价格</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${not empty rows}">
                <c:forEach var="goodsDetail" items="${rows}">
                    <tr id="goods-head-${goodsDetail.goods.id}">
                        <th colspan="6">店铺：${goodsDetail.store.storeName}</th>
                    </tr>
                    <tr id="goods-data-${goodsDetail.goods.id}">
                        <td>
                            <input name="trolley-goods-detail" value="${goodsDetail.shopCart.id}" type="checkbox" onclick="caculate(this,${goodsDetail.goods.goodsPrice});"/>
                            <c:choose>
                                <c:when test="${not empty goodsDetail.packages && not empty goodsDetail.packages.packagesImage}">
                                    <img src="${imgDomain}${goodsDetail.packages.packagesImage.m}"/>
                                </c:when>
                                <c:otherwise>
                                    <img src="${ctx}/static/img/bnsi_coin2.png"/>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <strong>
                                <b>【${goodsDetail.operator.operatorName}】沃4G手机卡（1G流量+300条短信+通话时长40min）</b>
                            </strong>
                        </td>
                        <td>
                            <i>${goodsDetail.packages.packagesName} × 1<br>号码${goodsDetail.goods.phone} × 1<br>
                                <c:if test="${not empty goodsDetail.goods.cardNo}">
                                    卡贴 × 1
                                </c:if>
                            </i>
                        </td>
                        <td>￥ ${goodsDetail.goods.goodsPrice}</td>
                        <td><a href="javascript:void(0);">收藏</a>　<a href="javascript:void(0);" onclick="deleteGoods(${goodsDetail.goods.id});">删除</a></td>
                    </tr>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
        <div class="amount">已选商品<b id="choosen"> 0</b>件　　　合计（不含运费）：￥<b id="totalPrice">0.00</b>　　　<a href="javascript:void(0);" onclick="generateOrder();" class="btn">　提交购物车　</a></div>
        <div class="space"></div>
        <div class="panel">
            <span>热卖单品</span>
            <div>
                <div class="space"></div>
                <dl class="selHot">
                    <dt><a href="##"></a><img src="${ctx}/static/img/servePanelSlide_1.png">
                    <p>全国联通100元充值 5秒到账</p><b>￥ 99.00</b>

                    <p>月销：<i>3368</i></p></dt>
                    <dd></dd>
                    <dt><a href="##"></a><img src="${ctx}/static/img/servePanelSlide_2.png">
                    <p>全国联通100元充值 5秒到账</p><b>￥ 99.00</b>

                    <p>月销：<i>3368</i></p></dt>
                    <dd></dd>
                    <dt><a href="##"></a><img src="${ctx}/static/img/servePanelSlide_3.png">
                    <p>全国联通100元充值 5秒到账</p><b>￥ 99.00</b>

                    <p>月销：<i>3368</i></p></dt>
                    <dd></dd>
                    <dt><a href="##"></a><img src="${ctx}/static/img/servePanelSlide_1.png">
                    <p>全国联通100元充值 5秒到账</p><b>￥ 99.00</b>

                    <p>月销：<i>3368</i></p></dt>
                </dl>
                <div class="space"></div>
            </div>
        </div>
    </div>
</div>

<div class="space100"></div>
<!-- 引用bottom -->
<%@include file="/common/usersbottom.rec.jsp" %>
<div class="dpaw">
    <h2><b>选择号码</b><i onClick="hideDpaw();">＋</i></h2>
    <dl class="awTab">
        <dt>推荐号码</dt>
    </dl>
    <div class="search">制式类型：<select>
        <option>全部</option>
    </select>　价格：<input type="text"/> - <input type="text"/>　尾号：<input type="text" placeholder="2-4位数字"/>
        <button class="btn">搜索</button>
    </div>
    <ul id="ulnumbers">
    </ul>
    <dl class="pageNum pageNumSmall">
        <dt>&lt;上一页</dt>
        <dt class="sel">1</dt>
        <dt>2</dt>
        <dt>3</dt>
        <dt>4</dt>
        <dd>...</dd>
        <dt>下一页&gt;</dt>
        <dd>共14页，跳转到:</dd>
        <dt><input type="text"/></dt>
        <dt>GO</dt>
    </dl>
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
<script type="text/javascript">
    function caculate(obj,price) {
       if(obj.checked) {
           $("#choosen").html(parseInt($("#choosen").html())+1);
           $("#totalPrice").html(parseFloat($("#totalPrice").html())+price);
       } else {
           $("#choosen").html(parseInt($("#choosen").html())-1);
           $("#totalPrice").html(parseFloat($("#totalPrice").html())-price);
       }
    }
    function deleteGoods(goodsId) {
        if(goodsId) {
            $.post("${ctx}/trolley/goods/remove",{goodsIds:goodsId},function(result){
                var data = eval(result);
                if(data.status_code == "1") {
                    $("#goods-head-"+goodsId).remove();
                    $("#goods-data-"+goodsId).remove();
                } else {
                    alert(data.msg);
                }
            });
        }
    }
    function generateOrder() {
        var shopCartDetail =[];
        $('input[name="trolley-goods-detail"]:checked').each(function(){
            shopCartDetail.push($(this).val());
        });
        if(shopCartDetail.length < 1) {
            alert("请至少选择一件商品");
            return;
        }
        var data = shopCartDetail.join(",");
        window.location.href = "${ctx}/trolley/commit/" + data;
    }
</script>
</body>
</html>
