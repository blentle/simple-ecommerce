<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>我的订单</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<%@include file="/commons/include.rec.jsp"%>
<script src="${CONTEXT_PATH}/static/js/users/menus.en.js"
	type="text/javascript"></script>
<script src="${CONTEXT_PATH}/static/js/users/jquery.fs.boxer.js"
	type="text/javascript"></script>
<link href="${CONTEXT_PATH}/static/js/users/jquery.fs.boxer.css"
	rel="stylesheet" type="text/css" />
<script>
    $(document).ready(function() {
    	initLeftMenu('${menuItem}','${CONTEXT_PATH}');
		$(".boxer").not(".retina, .boxer_fixed, .boxer_top, .boxer_format, .boxer_mobile, .boxer_object").boxer();

	
         });
       function delData(delid){
    	   alert(delid);
    	   $.ajax({
               type: "GET",
               url: "${CONTEXT_PATH}/users/delfavorites",
               data: {id:delid},
               dataType: "text",
               success: function(data){
            	   alert(data);
                   if(data=="1"){
                	   $("#tab_"+delid).remove();
                	   //location.href = "${CONTEXT_PATH}/users/favoritesproduct";
                   }
              }

      });
}
    
</script>
</head>
<body>
	<!-- 引用用户页部  -->
	<%@include file="/commons/usershead.rec.en.jsp"%>
	<div class="mw panel">
		<span>Service &gt;My Enshrine&gt; Enshrine Commodity</span>
	</div>

	<div class="space20"></div>

	<div class="mw">
		<!-- 左侧导航菜单 -->
		<dl class="centerMenu"></dl>
		<!-- 右侧信息开始 -->
		<div class="centerCon collectGoods">
			<div class="panel">
				<div class="collectGoodsList">
					<c:forEach var="mo" items="${favoriteslist}" varStatus="status">
						<table id="tab_${mo.favoritesId}">
							<tr>
								<td colspan="4" class="tar"><a>more&gt;</a></td>
							</tr>
							<tr>
								<th><img src="${CONTEXT_PATH}/static/img/icon_del.png" onclick="delData('${mo.favoritesId}')"/></th>
								<th><a><img
										src="${CONTEXT_PATH}${mo.packages.packagesPcImage}" /></a></th>
								<th><a href="${CONTEXT_PATH}/mall/oneNumber?language=en&id=18610111111">${ mo.packages.packagesName}</a><font>北京联通官方旗舰店</font><b>￥${mo.packages.packagesRmbPrice }</b></th>
								<td><a><img
										src="${CONTEXT_PATH}/static/img/servePanelSlide_2.png" /></a> <a><img
										src="${CONTEXT_PATH}/static/img/servePanelSlide_2.png" /></a> <a><img
										src="${CONTEXT_PATH}/static/img/servePanelSlide_2.png" /></a> <a><img
										src="${CONTEXT_PATH}/static/img/servePanelSlide_2.png" /></a></td>
							</tr>
							<tr>
								<th colspan="4"><div class="space30"></div></th>
							</tr>
						</table>
					</c:forEach>
					<table>
						<tr>
							<td colspan="4" class="tar"><a>more&gt;</a></td>
						</tr>
						<tr>
							<th><img src="${CONTEXT_PATH}/static/img/icon_del.png" /></th>
							<th><a><img
									src="${CONTEXT_PATH}/static/img/servePanelSlide_1.png" /></a></th>
							<th><a href="${CONTEXT_PATH}/mall/oneNumber?language=en&id=18610111111">北京联通沃4G手机卡(1G流量+300跳短信+通话时长40min)</a><font>北京联通官方旗舰店</font><b>￥118.00</b></th>
							<td><a><img
									src="${CONTEXT_PATH}/static/img/servePanelSlide_2.png" /></a> <a><img
									src="${CONTEXT_PATH}/static/img/servePanelSlide_2.png" /></a> <a><img
									src="${CONTEXT_PATH}/static/img/servePanelSlide_2.png" /></a> <a><img
									src="${CONTEXT_PATH}/static/img/servePanelSlide_2.png" /></a></td>
						</tr>
						<tr>
							<th colspan="4"><div class="space30"></div></th>
						</tr>
					</table>
				</div>
			</div>
			<%@include file="/commons/userspanel.rec.en.jsp"%>
		</div>
	</div>

	<%@include file="/commons/usersbottom.rec.en.jsp"%>

</body>
</html>