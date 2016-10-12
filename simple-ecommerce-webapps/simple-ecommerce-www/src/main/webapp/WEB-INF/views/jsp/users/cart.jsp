<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>我的购物车</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<%@include file="/commons/include.rec.jsp"%>
<script src="${CONTEXT_PATH}/static/js/users/menus.js"
	type="text/javascript"></script>
<script>
	$(function() {
		initLeftMenu('${menuItem}', '${CONTEXT_PATH}');
		getchknum();
	});

	function chkall() {

		$("input[name='chk_ids']").each(function() {
			if (this.checked) {
				this.checked = false;
			} else {
				this.checked = true;
			}
		});
		getchknum();
	}
	function getchknum() {
		var cartnum = 0;
		var chkall = 0;
		var sumprice = 0.00;
		$("input[name='chk_ids']").each(function() {
			if (this.checked == true) {
				sumprice += parseFloat($("#p_" + this.value).val());
				cartnum += 1;
			}
			if (this.checked == false) {
				chkall = 1;
				$("#chk_all").attr("checked", false);
			}
		});
		if (chkall == 0) {
			$("#chk_all").attr("checked");
		}
		$("#sumprice").html(sumprice.toFixed(2));
		$("#chknum").html(cartnum);
	}
	function delAllCart() {
		$("#form").attr("action", "${CONTEXT_PATH}/users/delAllCart");
		$("#form").submit();
	}
	
	
	function delCart(id) {
		$.ajax({
			type : "GET",
			url : "${CONTEXT_PATH}/users/delCart?id="+id,
			dataType : "text",
			success : function(data) {
				if(data)
					location.href= "${CONTEXT_PATH}/users/cart";
			}
		});

	}
	function accountCart() {
		/* 	var ids = "";
			var str = "${CONTEXT_PATH}/users/accountCart?q=w"
			$("input[name='chk_ids']").each(function(){
				if(this.checked == true) {
					ids +="&ids="+this.value;
				}
			}); 
			alert(ids);
			location.href = str + ids; */
		$("#form").attr("action", "${CONTEXT_PATH}/users/accountCart");
		$("#form").submit();
	}
</script>
</head>
<body>
	<!-- 引用用户页部  -->
	<%@include file="/commons/usershead.rec.jsp"%>
	<div class="mw panel">
		<span>服务 &gt; 我的订单 &gt; 我的购物车</span>
	</div>

	<div class="space20"></div>

	<div class="mw">
		<!-- 左侧导航菜单 -->
		<dl class="centerMenu"></dl>
		<!-- 右侧信息开始 -->
		<div class="centerCon centerShopping">
			<div class="title">
				<input type="checkbox" id="chk_all" onclick="chkall()" checked /> 全选
				<font>收藏时间<b>↓</b></font> <em onclick="delAllCart();">删除选中</em>
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
					<form id="form" method="post">
						<c:forEach var="mc" items="${mclist}" varStatus="status">
							<input type="hidden" id="p_${mc.cartId}" name="price"
								value="${mc.cartPackagePrice}" />
							<tr>
								<th colspan="6">店铺：${mc.store.storeName}</th>
							</tr>
							<tr>
								<td><input type="checkbox" name="chk_ids"
									value="${mc.cartId}" onclick="getchknum();" checked /><img
									src="${CONTEXT_PATH}${mc.packages.packagesPcImage}" /></td>
								<td><strong><b>${mc.cartPackageDesc}</b></strong></td>
								<td><i>${mc.cartPackageDetail}</i></td>
								<td>￥${mc.cartPackagePrice}</td>
								<td><a>收藏</a> <a onclick="delCart(${mc.cartId});">删除</a></td>
							</tr>
						</c:forEach>
					</form>
				</tbody>
			</table>
			<div class="amount">
				已选商品<b><span id="chknum">0</span></b>件 合计（不含运费）：￥<b><span
					id="sumprice">0.00</span></b> <a class="btn" onclick="accountCart();">
					结 算 </a>
			</div>
			<div class="space"></div>
			<%@include file="/commons/userspanel.rec.jsp"  %>
		</div>
	</div>

	<%@include file="/commons/usersbottom.rec.jsp"%>
</body>
</html>