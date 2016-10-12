<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>我的订单</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <%@include file="/commons/include.rec.jsp"  %>
    <script src="${CONTEXT_PATH}/static/js/users/menus.js" type="text/javascript"></script>
    <script src="${CONTEXT_PATH}/static/js/users/jquery.fs.boxer.js" type="text/javascript"></script>
    <link  href="${CONTEXT_PATH}/static/js/users/jquery.fs.boxer.css" rel="stylesheet" type="text/css" />
    <script>
    $(document).ready(function() {
		$(".boxer").not(".retina, .boxer_fixed, .boxer_top, .boxer_format, .boxer_mobile, .boxer_object").boxer();

		$(".boxer.boxer_fixed").boxer({
			fixed: true
		});

		$(".boxer.boxer_top").boxer({
			top: 50
		});

		$(".boxer.retina").boxer({
			retina: true
		});

		$(".boxer.boxer_format").boxer({
			formatter: function($target) {
				return '<h3>' + $target.attr("title") + "</h3>";
			}
		});

		$(".boxer.boxer_object").click(function(e) {
			e.preventDefault();
			e.stopPropagation();

			$.boxer( $('<div class="inline_content"><h2>More Content!</h2><p>This was created by jQuery and loaded into the new Boxer instance.</p></div>') );
		});

		$(".boxer.boxer_mobile").boxer({
			mobile: true
		});

		$(window).one("pronto.load", function() {
			$.boxer("close");
			$(".boxer").boxer("destroy");
		});
	});
    function printmsg(id,value){
    	var msgcontent = value.split("-");
    	var person = msgcontent[0];
    	var province = msgcontent[1];
    	var area = msgcontent[2];
    	var county = msgcontent[3];
    	var address = msgcontent[4];
    	var phone = msgcontent[5];
    	var viewmsg = "<div class=\"space30\"><strong class=\"fl\">";
    	viewmsg+=""+province+area+county+"";
    	viewmsg+="</strong>";
    	viewmsg+="<div class=\"fr\">";
    	viewmsg+="<a href=\"${CONTEXT_PATH}/users/updateAddress/"+id+"\" class=\"boxer btn btn-ss\" data-boxer-height=\"320\" data-boxer-width=\"510\"> 编 辑 </a>　<a class=\"btn btn-ss\" href=\"#\" onclick=\"del("+id+");\"> 删 除 </a></div></div>";
    	viewmsg+="　收货人："+person+"<br>";
    	viewmsg+="所在地区："+province+area+county+"<br>";
    	viewmsg+="　　地址："+address+"<br>";
    	viewmsg+="　　手机："+phone+"<br>";
    	var msgid = $("#msg_"+id).html(viewmsg);
    	
    }
    function del(id){
    	$.post("${CONTEXT_PATH}/users/delAddressJson/"+id,
			function(data) {
				if (data == 0) {
					parent.location.href = '${CONTEXT_PATH}/users/shippingAddress';
					parent.$.boxer('close');
				}
			});
    }
    </script>
  </head>
<body>
<!-- 引用用户页部  -->
<%@include file="/commons/usershead.rec.jsp"  %>
<div class="mw panel"><span>服务 &gt; 账号中心 &gt; 收货地址</span></div>

<div class="space20"></div>

<div class="mw">
<!-- 左侧导航菜单 -->
	<dl class="centerMenu"></dl>
<!-- 右侧信息开始 -->	
	<div class="centerCon centerAddress">
		<div class="panel">
			<div class="centerAddressList">
				<div class="space40">
				<c:if test="${sizenum==20}">
				<a href="#">地址已到上限</a>
				</c:if>
				<c:if test="${sizenum<20}">
				<a href="${CONTEXT_PATH}/users/createAddress" class="boxer btn btn-ss" data-boxer-height="320" data-boxer-width="510">新增收货地址</a>
				</c:if>　　您已创建<b>${sizenum }</b>个收货地址，最多可创建<b>20</b>个</div><div class="space"></div>
				<ul>
					<c:forEach var="mo" items="${malist}" varStatus="status">
					<li id="msg_${mo.deliveryAddressId }">
						
						<script>printmsg('${mo.deliveryAddressId }','${mo.deliveryAddress }');</script>
						
					</li>
					</c:forEach>
				</ul>
				
			</div>
		</div>
	</div>

</div>
<script>
//初始化菜单
initLeftMenu('${menuItem}','${CONTEXT_PATH}');
</script>
<%@include file="/commons/usersbottom.rec.jsp"  %>

</body>
</html>