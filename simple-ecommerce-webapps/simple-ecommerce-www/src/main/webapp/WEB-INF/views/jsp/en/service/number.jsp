<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/commons/include.rec.jsp"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>手机号码</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
<script type="text/javascript">
	/* 页面加载完成，绑定事件 */
	$(document).ready(function() {
		btn();//点击提交，执行ajax
		joinCart();
		joinFavorites();
	});
	/* 提交结果，执行ajax */
	function btn() {
		var $btn = $("input.btn");//获取按钮元素
		//给按钮绑定点击事件
		$btn.bind("click",function() {
							$.ajax({
										type : "post",
										url : "${CONTEXT_PATH}/users/alertLogin",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
										data : {
											memberMobilePhone : $(
													"input[name=memberMobilePhone]")
													.val(),
											memberPassword : $(
													"input[name=memberPassword]")
													.val()
										},
										dataType : "json",//设置需要返回的数据类型
										success : function(data) {
											//  var d = eval("("+data+")");//将数据转换成json类型
											if (data == 1) {
												location.reload();
											} else {
												document.getElementById('message').innerHTML = "The user name or password is wrong";
											}

										},
										error : function(data) {
											alert("error");
										}
									});
						});
	}
	
	/**
	* 加入购物车
	*/
	function joinCart() {
		$("#joincart").bind("click",function(){
			var number=$("#number").html();
			var memberid=$("#memberid").html();
			var csi=$("#cart_store_id").html();
			var cpi=$("#cart_package_id").html();
			var cpd=$("#cart_package_desc").html();
			var cki=$("#cart_stock_id").html();
			var ced=$("#cart_package_detail").html();
			var cpp=$("#cart_package_price").html();
			$.ajax({
				type:"post",
				url:"joinCart",
				data:{id:number,
					memberid:memberid,
					csi:csi,
					cpi:cpi,
					cpd:cpd,
					cki:cki,
					ced:ced,
					cpp:cpp
					
				},
				dataType : "json",//设置需要返回的数据类型
				success : function(data) {
					alert('Has been add to cart');
				},
				error : function(data) {
					alert("error");
				}
			});
		});
	}
	/**
	* 加入收藏
	*/
	function joinFavorites() {
		$("#joinFavorites").bind("click",function(){
			var ft=$("#favorites_type").html();
			var memberid=$("#memberid").html();
			var csi=$("#cart_store_id").html();
			var cpi=$("#cart_package_id").html();
			$.ajax({
				type:"post",
				url:"joinFavorites",
				data:{ft:ft,
					  memberid:memberid,
					  csi:csi,
					  cpi:cpi
				},
				dataType : "json",//设置需要返回的数据类型
				success : function(data) {
					alert('Collection of success');
				},
				error : function(data) {
					alert("error");
				}
			});
		});
	}
	</script>
</head>
<body>
<div style="display: none;" id="favorites_type">1</div>
<div style="display: none;" id="memberid">${member.memberId}</div>
<div style="display: none;" id="cart_store_id">${stock.store.storeId}</div>
<div style="display: none;" id="cart_package_id">${stock.packages.packagesId}</div>
<div style="display: none;" id="cart_package_desc">${stock.packages.packagesDesc}</div>
<div style="display: none;" id="cart_stock_id">${stock.stockId}</div>
<div style="display: none;" id="cart_package_detail">
${stock.packages.packagesName}X1<br>
号码${stock.number}X1<br>
<c:if test="${stock.areBind==1}">
卡贴X1
</c:if>
</div>
<div style="display: none;" id=cart_package_price>${stock.packages.packagesRmbPrice}</div>

	<form:form name="alertLoginForm" id="alertLoginForm" method="post" 
		modelAttribute="member">
		<input type="hidden" name="locale" value="zh">
		<div class="alertLoginCover" onClick="hideALW();"></div>
		<div class="rn login alertLoginWindow">
			<h2>Login</h2>
			<div class="formList">
				<div style="color: #ff0000; height: 22px; margin-top: 0px"
					align="center">
					<form:errors path="memberMobilePhone"></form:errors>
				</div>
				<div class="formRow formRowBorder">
					<div>
						<input type="text" name="memberMobilePhone" placeholder="Phone Number"
							style="background:url(${CONTEXT_PATH}/static/img/icon_tel.png) left center no-repeat; padding-left:35px;" />
					</div>
				</div>
				<div style="color: #ff0000; height: 22px; margin-top: 0px"
					align="center">
					<form:errors path="memberPassword"></form:errors>
				</div>
				<div class="formRow formRowBorder">
					<div>
						<input type="password" name="memberPassword" placeholder="PassWord"
							style="background:url(${CONTEXT_PATH}/static/img/icon_password.png) left center no-repeat; padding-left:35px;" />
					</div>
				</div>
				<div style="color: #ff0000; height: 22px; margin-top: 0px"
					align="center"></div>
				<div class="formRow">
					<div>
						<input type="text" placeholder="identifying code"
							style="width: 120px; text-align: center;" />
					</div>
					<div>
						<img src="${CONTEXT_PATH}/static/img/codeCheck.png">
					</div>
					<div>
						<a>refresh</a>
					</div>
				</div>
				<div id="message"
					style="color: #ff0000; height: 22px; margin-top: 0px"
					align="center"></div>
				<input class="btn" type="button" value="Login" />

				<div class="space"></div>
				<a href="/findpwPhone?language=en">forget password?</a> no account? <a href="/users/reg?language=en">register</a>
			</div>
		</div>
	</form:form>
<div class="top">
<c:if test="${member!=null}">
			<p>
				<i> <a href="##">${member.memberNickname}</a>，Welcome you！ <a href="/users/order?language=en">personal center</a>
					｜ <a href="users/logout?language=en">logout</a>
				</i>
			</p>
		</c:if>
		<c:if test="${member==null}">
			<p>
				<i> <a href="/" class="abcd">CN</a> ｜ <a href="/users/login?language=en">login</a>
					｜ <a href="/users/reg?language=en">register</a>
				</i>
			</p>
		</c:if>
   <div>
			<a class="logo"><img src="${CONTEXT_PATH}/static/img/logo.png" /></a>
			<dl>
				<dt>
					<input type="text" placeholder="keyword" /><button></button>
				</dt>
				<dd>
					Hot Search： <a href="#">Hong Kong package </a><a href="#">Taiwan package </a><!-- <a href="#">热卖排行 </a><a href="#">选号入网 </a> -->
				</dd>
			</dl>
		</div>
</div>
<div class="menu">
    <div>
			<a href="/en">Home</a> 
				<a href="/en/aboutyyb">AboutYyb</a>
				<a href="/en/service" class="sel" >Service</a> 
				<a href="/en/operators"  >Operators</a> 
				<a href="/en/partners">Partners</a> 
				<a href="/en/contacts" >Contacts</a>
		</div>
</div>
<div class="space30"></div>

<div class="mw rn bg11 b1 p20 detailNumber">
    <div class="fl">
        <div class="share">
            <div class="bshare-custom icon-medium-plus"><a title="分享到" href="http://www.bShare.cn/" id="bshare-shareto" class="bshare-more">share</a><a title="分享到微信" class="bshare-weixin"></a><a title="分享到新浪微博" class="bshare-sinaminiblog"></a><a title="分享到Facebook" class="bshare-facebook"></a><a title="分享到Twitter" class="bshare-twitter"></a><a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a></div><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
        </div>
        <div class="space20"></div>
        <img src="${CONTEXT_PATH}/static/img/detailPackageImg.png" />
    </div>
    <div class="fr">
        <strong>${stock.number}(${stock.dataCarriers.carriersName})</strong>
        <i></i>
        <div class="space20"></div>
        <p>price：　<b>￥${stock.packages.packagesRmbPrice}</b></p>
        <div class="space20"></div>
        <p>Tip: number system, GSM phones, CDMA2000</p>
        <p>　　　　<font>If you do not know you to buy mobile phones formats, please download the APP</font></p>
        <div class="space20"></div>
        <table>
            <tr>
                <c:if test="${stock.areBind==1}">
                <!-- 绑卡贴 -->
                	<td>
                    <b><input type="checkbox" checked="checked"/> This card number is binding</b>
                    <font>Posted on a mobile phone SIM card, only need when buying for the first time</font>
                </td>
                </c:if>
                <c:if test="${stock.areBind==0}">
                	<td><b><input type="checkbox" /> This card number is not binding</b>
                    	<font>You buy is no card number, after the success of the payment, please use a mobile phone number into the APP</font>
                	</td>
                </c:if>
                
            </tr>
        </table>
        <div class="space40"></div>
        <p>
        
        <c:if test="${member!=null}">
					<a href="/en/buy" class="btn">buy</a>　<a class="btn btn-s" id="joincart">Add to cart</a>
				</c:if>
				<c:if test="${member==null}">
					<a href="#" class="btn" onClick="showALW();">buy</a>　<a class="btn btn-s" onClick="showALW();">Add to cart</a>
					
				</c:if>
        　</p>
        <div class="space20"></div>              
        <span><em>√</em>Have to sell<em>${stock.packages.packagesSalesVolume}</em>piece</span>
    </div>
</div>

<div class="mw parameterTab">
    <a class="sel"><img src="${CONTEXT_PATH}/static/img/icon_parameter.png" />parameter<i></i></a>
    <a><img src="${CONTEXT_PATH}/static/img/icon_recommend.png" />Hot recommended<i></i></a>
</div>

<div class="mw b1 rn bg11 parameterCon">
    <strong>parameter</strong>
    <table>
        <tr>
            <td>Number：<span id='number'>${stock.number}</span></td><td>price：0元</td>
        </tr>
        <tr>
            <td>Form a complete set of packages：<td>price：${stock.packages.packagesRmbPrice}元</td>
        </tr>
    </table>
    <p>
        　　${stock.packages.packagesDesc}
    </p>
    <div class="space"></div>
    <p>Scope of application: China </p>
    <div class="space"></div>
    <p>Operator：${stock.dataCarriers.carriersName} <a href="/store?language=en">Operators center</a></p>
    <p>　　　　　<i></i><i></i><i></i><i></i><i></i><font>5.0</font></p>
    <div class="space"></div>
    <p>　　Card：
    	<c:if test="${stock.areBind==1}">
                <!-- 绑卡贴 -->
              binding
                </c:if>
                <c:if test="${stock.areBind==0}">
                	no binding
                </c:if>
    </p>
    <div class="space"></div>
    <p>Use time: 10 days after activation package</p>
</div>

<div class="space30"></div>

<div class="recommend">
    <div class="fl">
        <a href="##"></a>
        <p><strong>170 4563 8647</strong><i>￥166</i></p>
        <div class="space20"></div>
        本地通话226min+1024MB4G流量，超出套餐部分本地主叫0.34元/min，流量0.1元/MB，被叫免费
        <div class="space"></div>
        Scope of application: China Beijin
        <div class="space"></div>
       operator：<font>中国联通</font>
        <div class="space"></div>
        <p class="tac"><button class="btn">　buy　</button></p>
    </div>
    <div class="interval"></div>
    <div class="fl">
        <a href="##"></a>
        <p><strong>170 4563 8647</strong><i>￥166</i></p>
        <div class="space20"></div>
        本地通话226min+1024MB4G流量，超出套餐部分本地主叫0.34元/min，流量0.1元/MB，被叫免费
        <div class="space"></div>
        Scope of application: China Beijin
        <div class="space"></div>
       operator：<font>中国联通</font>
        <div class="space"></div>
        <p class="tac"><button class="btn">　buy　</button></p>
    </div>
    <div class="fr">
        <a href="##"></a>
        <p><strong>170 4563 8647</strong><i>￥166</i></p>
        <div class="space20"></div>
        本地通话226min+1024MB4G流量，超出套餐部分本地主叫0.34元/min，流量0.1元/MB，被叫免费
        <div class="space"></div>
        Scope of application: China Beijin
        <div class="space"></div>
        operator：<font>中国联通</font>
        <div class="space"></div>
        <p class="tac"><button class="btn">　buy　</button></p>
    </div>
</div>

<div class="space30"></div>

<div class="mw rn b1 bg11 question">
    <table class="fl">
        <tr><th>购物上有问题？</th></tr>
        <tr><td><span>+</span><a>卡贴是什么？</a></td></tr>
        <tr><td><span>+</span><a>手机制式是什么？</a></td></tr>
        <tr><td><span>+</span><a>卡贴使用方法？</a></td></tr>
        <tr><td><span>+</span><a>不要卡贴时怎么使用？</a></td></tr>
    </table>
    <table class="fr">
        <tr><th colspan="2">Do you have any questions?</th></tr>
        <tr><th><img src="${CONTEXT_PATH}/static/img/icon_question.png" /></th><td><b>400-6754-7867</b><br>Customer service hotline<!-- 悠游宝客服热线 --></td></tr>
        <tr><th colspan="2">Contact us now!</a></th></tr>
    </table>
</div>

<div class="space100"></div>
	<%@include file="/commons/usersbottom.rec.en.jsp"  %>

</body>
</html>