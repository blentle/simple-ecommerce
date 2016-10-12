<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="web"  uri="/WEB-INF/taglib"%>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>手机套餐</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
<link  href="${CONTEXT_PATH}/static/css/normal.css" type="text/css" rel="stylesheet"/>
<link  href="${CONTEXT_PATH}/static/lib/pagination.css" rel="stylesheet" type="text/css" />
<script src="${CONTEXT_PATH}/static/lib/jquery.min.js" type="text/javascript"></script>
<script src="${CONTEXT_PATH}/static/lib/jquery.pagination.js" type="text/javascript"></script>
<script src="${CONTEXT_PATH}/static/js/bottom.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		var pageSize = 16;//每页显示
		var initPagination = function() {
			var num_entries = $("#hiddenresult li").length;
			// 创建分页
			$("#Pagination").pagination(num_entries, {
				num_edge_entries : 1, //边缘页数
				num_display_entries : 4, //主体页数
				callback : pageselectCallback,
				items_per_page : pageSize,
				prev_text : "Up",
				next_text : "Next"
			});
		}();
		/**
		 * 回调
		 */
		function pageselectCallback(page_index) {
			$("#Searchresult").empty();
			for (var i = 0; i < $("#hiddenresult li").length; i++) {
				var j = page_index * pageSize + i;
				var new_content = $("#hiddenresult li.awtli:eq(" + j + ")")
						.clone();
				$("#Searchresult").append(new_content);
				if ($("#Searchresult li").length == pageSize) {
					break;
				}
			}

			return false;

		}

		$("#Searchresult li").live("click", function() {
			//alert(1);
			var num = $(this).find("strong").html();
			var price = $(this).find("span").html();
			var stockId = $(this).find("font").html();//编号
			$(".dpaw font span").each(function() {
				if ($(this).attr("num") > 1) {
				} else {
					$(this).attr("num", num);
					//alert(stockId);
					$(this).attr("stockId",stockId);
					$(this).html(num + " <br>" + price);
					return false;
				}
			});
		});
		$(".dpaw font em").live("click", function() {
			$(this).prev().removeAttr("num").html("To add");
		});
		$("#pickNumber").live("click", function() {
			var nums = parseInt(0);
			$(".dpaw font span").each(function() {
				if ($(this).attr("num") > 1) {
					nums += parseInt(1);
					selTelNum = $(this).attr("num");
					stockId = $(this).attr("stockId");
				}
			});
			if (nums < 1) {
				alert("You haven't pick");
			} else if (nums > 1) {
				alert("You can only choose a number");
			} else {
				//alert("号码"+selTelNum+"已选择成功");
				$(".detailPackage .fr font").html(selTelNum + "<span></span>")
				$("#cart_stock_id").html(stockId);
				$("#packageNumber").html(selTelNum);
				hideDpaw();
			}
		});
		btn();//弹出层的登陆
		joinFavorites();//加入收藏
		joinCart();//加入购物车
	});
	/**
	* 加入收藏
	*/
	function joinFavorites() {
		$("#joinFavorites").bind("click",function(){
			var ft=$("#favorites_type").html();//收藏类型（0:店铺，1：套餐）
			var memberid=$("#memberid").html();//关联会员
			var csi=$("#cart_store_id").html();//关联所属店铺
			var cpi=$("#cart_package_id").html();//关郑所属套餐
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
					if(data==100){
						alert('You have already owned the meal')
					}else{
						alert('Collection of success');
					}
					
				},
				error : function(data) {
					alert("error");
				}
			});
		});
	}
	function hideDpaw() {
		$(".dpaw").hide();
	}
	/* 提交结果，执行ajax */
	function btn() {
		var $btn = $("input.btn");//获取按钮元素
		//给按钮绑定点击事件
		$btn.bind("click",function() {
			$.ajax({
					type : "post",
					url : "${CONTEXT_PATH}/users/alertLogin",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
					data : {memberMobilePhone : $("input[name=memberMobilePhone]").val(),
							memberPassword : $("input[name=memberPassword]").val()},
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
				url:"packageJoinCart",
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
					alert('已加入购物车');
				},
				error : function(data) {
					alert("error");
				}
			});
		});
	}
	/**
	* 购买套餐
	*/
	function buyPackage() {
		$("#buyPackage").bind("click",function(){
			
			$.ajax({
				type:"post",
				url:"buyPackage",
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
					alert('已加入购物车');
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
<%@include file="/commons/alertLogin.rec.en.jsp"  %>
<!-- 购物车和收藏用 -->
<div style="display: none;" id="favorites_type">1</div><!-- 收藏类型 -->
<div style="display: none;" id="memberid">${member.memberId}</div><!-- 会员编号 -->
<div style="display: none;" id="cart_store_id">${packages.store.storeId}</div><!-- 套餐所在店铺-->
<div style="display: none;" id="cart_package_id">${packages.packagesId}</div><!-- 套餐编号 -->
<div style="display: none;" id="cart_package_desc">${packages.packagesDesc}</div><!-- 商品明细-->
<div style="display: none;" id="cart_stock_id"></div><!-- 号码库存编号 -->
<div style="display: none;" id="cart_package_detail">
${packages.packagesName}X1<br>
号码<font id="packageNumber"></font>X1<br>
</div><!-- 商品组成 -->
<div style="display: none;" id=cart_package_price>${packages.packagesRmbPrice}</div><!-- 商品价格 -->



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
<div class="rn bg11 b1 p20 detailPackage">
    <div class="fl">
        <div class="share">
            <div class="bshare-custom icon-medium-plus"><a title="share" href="#" id="bshare-shareto" class="bshare-more">share</a><a title="分享到微信" class="bshare-weixin"></a><a title="分享到新浪微博" class="bshare-sinaminiblog"></a><a title="分享到Facebook" class="bshare-facebook"></a><a title="分享到Twitter" class="bshare-twitter"></a><a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a></div><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
        </div>
        <div class="space20"></div>
        <img src="${packages.packagesPcImage}" />
    </div>
    
    <div class="fr">
        <strong>${packages.packagesName}</strong>
  		Use time: 10 days after activation package      <i></i>
        <div class="space20"></div>
        <p>price：　<b>￥${packages.packagesRmbPrice}</b></p>
        <div class="space20"></div>
        <p>number：　<font onclick='$(".dpaw").show();'>New number<span></span></font></p>
        <div class="space"></div>
        <p>　　　　<input type="checkbox" name="areBind" />choose number</p>
        <div class="space"></div>
        <p>　　　　<em>(Posted on a mobile phone SIM card, smart phone customers only need when buying for the first time)</em></p>
        <div class="space40"></div>
        <p>
        	<c:if test="${member!=null}">
					<a href="#" id="buyPackage" class="btn">buy</a>　<a id="joincart" class="btn btn-s">Add to cart</a>
				</c:if>
				<c:if test="${member==null}">
					<a  class="btn" onClick="showALW();">buy</a>　
					<a class="btn btn-s" onClick="showALW();">Add to cart</a>
				</c:if>
       		
       	</p>
        <div class="space20"></div>
        <span><em>√</em>Have to sell<em>${packages.packagesSalesVolume}</em>piece　　<em>+</em>
        <c:if test="${member!=null}">
					 <a id="joinFavorites">Add favorite</a>
				</c:if>
				<c:if test="${member==null}">
					 <a onClick="showALW();" >Add favorite</a>
				</c:if>
       </span>
    </div>
</div>
<div class="mw parameterTab">
    <a class="sel"><img src="${CONTEXT_PATH}/static/img/icon_parameter.png" />parameter<i></i></a>
    <a><img src="${CONTEXT_PATH}/static/img/icon_recommend.png" />Hot recommended<i></i></a>
</div>
<div class="mw b1 rn bg11 parameterCon">
    <strong>parameter</strong>
    <p>
        Package content：<br>
        　　${packages.packagesDesc}
    </p>
    <div class="space"></div>
    <p>Scope of application: China </p>
    <div class="space"></div>
    <p>Ten days after the time of use: activate the package</p>
    <div class="space"></div>
    <p>operator：<a >${packages.store.storeName}</a></p>
</div>

<div class="space30"></div>

<div class="recommend">
    <div class="fl">
        <a href="##"></a>
        <strong>北京10天游据超市手机套餐计划</strong>
        <img src="${CONTEXT_PATH}/static/img/servePanelSlide_1.png" />
        <div class="space20"></div>
        <p><b>Sold ：<font>12768</font></b><i>￥166</i></p>
        <div class="space20"></div>
        本地通话226min+1024MB4G流量，超出套餐部分本地主叫0.34元/min，流量0.1元/MB，被叫免费
        <div class="space"></div>
        Scope of application: Beijing, China
        <div class="space"></div>
        operator：<font>中国联通</font>
        <div class="space"></div>
        <p class="tac"><button class="btn">　buy　</button></p>
    </div>
    <div class="interval"></div>
    <div class="fl">
        <a href="##"></a>
        <strong>北京10天游据超市手机套餐计划</strong>
        <img src="${CONTEXT_PATH}/static/img/servePanelSlide_1.png" />
        <div class="space20"></div>
        <p><b>Sold ：<font>12768</font></b><i>￥166</i></p>
        <div class="space20"></div>
        本地通话226min+1024MB4G流量，超出套餐部分本地主叫0.34元/min，流量0.1元/MB，被叫免费
        <div class="space"></div>
        Scope of application: Beijing, China
        <div class="space"></div>
        operator：<font>中国联通</font>
        <div class="space"></div>
        <p class="tac"><button class="btn">　buy　</button></p>
    </div>
    <div class="fr">
        <a href="##"></a>
        <strong>北京10天游据超市手机套餐计划</strong>
        <img src="${CONTEXT_PATH}/static/img/servePanelSlide_1.png" />
        <div class="space20"></div>
        <p><b>Sold ：<font>12768</font></b><i>￥166</i></p>
        <div class="space20"></div>
        本地通话226min+1024MB4G流量，超出套餐部分本地主叫0.34元/min，流量0.1元/MB，被叫免费
        <div class="space"></div>
        Scope of application: Beijing, China
        <div class="space"></div>
        operator：<font>中国联通</font>
        <div class="space"></div>
        <p class="tac"><button class="btn">　buy　</button></p>
    </div>
</div>
<div class="space30"></div>
<div class="mw rn b1 bg11 question">
    <table class="fl">
        <tr><th>There is a problem on shopping?</th></tr>
        <tr><td><span>+</span><a>What is card stick?</a></td></tr>
        <tr><td><span>+</span><a>手机制式是什么？</a></td></tr>
        <tr><td><span>+</span><a>卡贴使用方法？</a></td></tr>
        <tr><td><span>+</span><a>不要卡贴时怎么使用？</a></td></tr>
    </table>
    <table class="fr">
        <tr><th colspan="2">Do you have any questions?</th></tr>
        <tr><th><img src="${CONTEXT_PATH}/static/img/icon_question.png" /></th><td><b>400-6754-7867</b><br>Customer service hotline</td></tr>
        <tr><th colspan="2"><a>Contact us now!</a></th></tr>
    </table>
</div>
<%@include file="/commons/usersbottom.rec.en.jsp"  %>
<div class="dpaw">
    <h2><b>select number</b><i onClick="hideDpaw();">＋</i></h2>
    <dl class="awTab"><dt>recommended number</dt></dl>
    <div class="search">type：<select><option>全部</option></select>price：<input type="text" /> - <input type="text" />　tail number：<input type="text" placeholder="2-4位数字" />  <button class="btn">seek</button></div>

   <ul id="hiddenresult" style="display:none;">
	<!-- 列表元素 -->
        <c:forEach items="${numberList}" var="nl">
        	<li class="awtli">
        		<font style="display: none;">${nl.stockId}</font>
        		<strong>${nl.number}</strong>
        		<span>￥${nl.packages.packagesRmbPrice}</span>
        	</li>
        </c:forEach>
	</ul>
	<ul id="Searchresult" class="awtul"></ul>
    <div class="space"></div>
	<div align="center" id="Pagination" class="pagination"><!-- 这里显示分页 --></div>
    <div class="line1"></div>
    
    <p>Alternate number</p>
    <div class="space"></div>
    <p class="tac"><font><span>To add</span><em>＋</em></font><font><span>To add</span><em>＋</em></font><font><span>To add</span><em>＋</em></font></p>
    <div class="space"></div>
    <p class="tac"><input id="pickNumber" class="btn" type="button" value="Determine Number" /></p>
</div>

</body>
</html>