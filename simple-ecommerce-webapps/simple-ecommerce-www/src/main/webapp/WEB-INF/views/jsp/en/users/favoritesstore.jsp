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
	$(document)
			.ready(
					function() {
						initLeftMenu('${menuItem}', '${CONTEXT_PATH}');
						$(".boxer")
								.not(
										".retina, .boxer_fixed, .boxer_top, .boxer_format, .boxer_mobile, .boxer_object")
								.boxer();
						
					});
	function delData(delid) {
		$.ajax({
			type : "GET",
			url : "${CONTEXT_PATH}/users/delfavoritesstore",
			data : {
				id : delid
			},
			dataType : "text",
			success : function(data) {
				alert(data);
				if (data == "1") {
					$("#tab_" + delid).remove();
					//location.href = "${CONTEXT_PATH}/users/favoritesproduct";
				}
			}

		});
		
		
	}
	
	function getFavorites(delid,storeid) {
		$.ajax({
			type : "GET",
			url : "${CONTEXT_PATH}/users/getPackages",
			data : {
				id : storeid
			},
			dataType : "json",
			success : function(data) {
				jQuery.each(data.packagesList, function(i, packages) {
					var strContent = "";
					strContent+="<dt>";
					strContent+="	<a href='${CONTEXT_PATH}/mall/oneNumber?language=en&id=18610111111'></a>";
					strContent+="	<p>";
					strContent+="		<font>"+packages.packagesName+"</font>";
					strContent+="		<b>全国版/本地版/共享版</b>";
					strContent+="	</p>";
					strContent+="	<img src='${CONTEXT_PATH}"+packages.packagesPcImage+"' />";
					strContent+="	<p>"+packages.packagesName+"<b>"+packages.packagesDesc+"</b></p>";
					strContent+="	<div class='space'></div>";
					strContent+="	<font>￥"+packages.packagesRmbPrice+"</font>";
					strContent+="</dt><dd></dd>";
					$("#tab_" + delid).append(strContent);
				});
			}

		});
		
		
	}
</script>
</head>
<body>
<!-- 引用用户页部  -->
<%@include file="/commons/usershead.rec.en.jsp"  %>
<div class="mw panel"><span>Service &gt; My Enshrine&gt; Enshrine Store</span></div>

<div class="space20"></div>

<div class="mw">
<!-- 左侧导航菜单 -->
	<dl class="centerMenu"></dl>
<!-- 右侧信息开始 -->	
	<div class="centerCon collectShop">
	<c:forEach var="mo" items="${favoriteslist}" varStatus="status">
		<div class="panel" >
			<div>
				<div class="space30">
					<div class="fl"><img src="${CONTEXT_PATH}/static/img/icon_del.png" /> 北京联通官方旗舰店</div>
					<div class="fr"><a class="btn btn-ss">上新</a><a class="btn btn-s btn-ss">优惠 0</a><a class="btn btn-s btn-ss">热销 764</a></div>
				</div>
				<div class="space50 tar"> <a class="c13">more&gt;&gt;</a></div>
				<dl class="collectShopList" id="tab_${mo.favoritesId}">
					<script>getFavorites('${mo.favoritesId}','${mo.favoritesStoreId}');</script>
				</dl>
			</div>
		</div>
		<div class="space"></div>
		</c:forEach>
	
		<%@include file="/commons/userspanel.rec.en.jsp"  %>
	</div>	
</div>

<%@include file="/commons/usersbottom.rec.en.jsp"  %>

</body>
</html>