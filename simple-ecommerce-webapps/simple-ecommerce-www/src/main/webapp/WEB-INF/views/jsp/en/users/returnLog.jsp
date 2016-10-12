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
    	initLeftMenu('${menuItem}','${CONTEXT_PATH}');
		$(".boxer").not(".retina, .boxer_fixed, .boxer_top, .boxer_format, .boxer_mobile, .boxer_object").boxer();

	
         });
       function updateMemberData(){
    	   $("#updateForm").submit();
       }
    
    </script>
  </head>
<body>
<!-- 引用用户页部  -->
<%@include file="/commons/usershead.rec.en.jsp"  %>
<div class="mw panel"><span>Service &gt; Account Central&gt; Information</span></div>

<div class="space20"></div>

<div class="mw">
<!-- 左侧导航菜单 -->
	<dl class="centerMenu"></dl>
<!-- 右侧信息开始 -->	
	<div class="centerCon centerAddress">
		<div class="centerAddressList">
			<div class="space40 bg11 b1">　　<a href="${CONTEXT_PATH}/users/returnApply?language=en"><i>申请返修/退换货</i></a>　　<b><a href="${CONTEXT_PATH}/users/returnLog?language=en">查看返修/退换货记录</a></b></div>
			<table class="shoppingTable">
				<thead>
					<tr><th>order number</th><th>order number</th><th>trade name</th><th>time</th><th>status</th></tr>
				</thead>
				<tbody>
					<tr>
						<td><b><a href="${CONTEXT_PATH}/users/returnBill?language=en">16416416411168416</a></b></td>
						<td><b>16416416411168416</b></td>
						<td><b>100元香港游</b></td>
						<td>2014-15-12 20:50</td>
						<td><b>等待审核</b></td>
					</tr>
					<tr>
						<td><b><a href="${CONTEXT_PATH}/users/returnBill?language=en">16416416411168416</a></b></td>
						<td><b>16416416411168416</b></td>
						<td><b>100元香港游</b></td>
						<td>2014-15-12 20:50</td>
						<td><b>等待审核</b></td>
					</tr>
					<tr>
						<td><b><a href="${CONTEXT_PATH}/users/returnBill?language=en">16416416411168416</a></b></td>
						<td><b>16416416411168416</b></td>
						<td><b>100元香港游</b></td>
						<td>2014-15-12 20:50</td>
						<td><b>等待审核</b></td>
					</tr>
				</tbody>
			</table>
			<div class="space50">
				<dl class="pageNum pageNumSmall fr">
					<dt>&lt;上一页</dt>
					<dt class="sel" >1</dt>
					<dt>2</dt>
					<dt>3</dt>
					<dt>4</dt>
					<dd>...</dd>
					<dt>下一页&gt;</dt>
					<dd>共 14 页， 跳转到：</dd>
					<dt><input type="text" /></dt>
					<dt>GO</dt>
				</dl>
			</div>
		</div>
		<div class="space20"></div>
		<div class="panel">
			<div>
				<p class="p10">
					<!-- 返修/退换货 申请常见问题<br><br>
					1、“申请”按钮若为灰色，可能是由于商品并未完成购买或正在返修或退货途中。<br><br>
					2、查看 <a>售后政策</a> 。 -->
					Repair/return and apply for common problems <br><br>
					1, "apply" button for gray, may be due to the goods did not complete the purchase or is repair or return of the goods on the way.<br><br>
					2, see <a> after-sale policy</a>.
				</p>
			</div>
		</div>
	</div>
</div>

<%@include file="/commons/usersbottom.rec.en.jsp"  %>

</body>
</html>