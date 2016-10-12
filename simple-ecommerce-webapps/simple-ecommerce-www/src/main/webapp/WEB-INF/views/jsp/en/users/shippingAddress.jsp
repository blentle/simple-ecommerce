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
    <script src="${CONTEXT_PATH}/static/js/users/menus.en.js" type="text/javascript"></script>
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
    </script>
  </head>
<body>
<!-- 引用用户页部  -->
<%@include file="/commons/usershead.rec.en.jsp"  %>
<div class="mw panel"><span>service &gt; Account Center&gt; Address</span></div>

<div class="space20"></div>

<div class="mw">
<!-- 左侧导航菜单 -->
	<dl class="centerMenu"></dl>
<!-- 右侧信息开始 -->	
	<div class="centerCon centerAddress">
		<div class="panel">
			<div class="centerAddressList">
				<div class="space40"><a href="${CONTEXT_PATH}/users/createAddress?language=en" class="boxer btn btn-ss" data-boxer-height="220" data-boxer-width="510">Add Address</a>　You have created <b>7</b> shipping address, can create up to 20　<b>20</b></div><div class="space"></div>
				<ul>
					<c:forEach var="mo" items="${malist}" varStatus="status">
					<li>
						<div class="space30"><strong class="fl">北京市海淀区五环到六环之间</strong><div class="fr"><a href="${CONTEXT_PATH}/users/updateAddress/1?language=en" class="boxer btn btn-ss" data-boxer-height="220" data-boxer-width="510"> Edit</a>　<a class="btn btn-ss"> Remove </a></div></div>
						　consignee：拆在平<br>
							region：北京市海淀区五环到六环之间<br>
						　　address：中关村北大街圆明园东门某小区29号楼一单元102<br>
						　　phone：13161109786<br>
					</li>
					</c:forEach>
				
				<%-- 
					<li>
						<div class="space30"><strong class="fl">北京市海淀区五环到六环之间</strong><div class="fr"><a href="${CONTEXT_PATH}/users/updateAddress/1" class="boxer btn btn-ss" data-boxer-height="220" data-boxer-width="510"> Edit </a>　<a class="btn btn-ss"> Remove</a></div></div>
						　收货人：拆在平<br>
						所在地区：北京市海淀区五环到六环之间<br>
						　　地址：中关村北大街圆明园东门某小区29号楼一单元102<br>
						　　手机：13161109786<br>
					</li> --%>
				</ul>
				
			</div>
		</div>
	</div>

</div>
<script>
//初始化菜单
initLeftMenu('${menuItem}','${CONTEXT_PATH}');
</script>
<%@include file="/commons/usersbottom.rec.en.jsp"  %>

</body>
</html>