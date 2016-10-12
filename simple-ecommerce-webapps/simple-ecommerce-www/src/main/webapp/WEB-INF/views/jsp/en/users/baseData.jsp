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
<%@include file="/commons/uservalidation.rec.jsp"%>
    <script src="${CONTEXT_PATH}/static/js/users/menus.en.js" type="text/javascript"></script>
    <script>
    $(document).ready(function() {
		$("#updateForm").validate();
		getRegionOpenarea('${memberCenter.memberCoutry}');
	});
	function updateMemberData() {
		if ($("#updateForm").valid()) {
			var birthday = $("#birthdayYear").val() + "-"
					+ $("#birthdayMonth").val() + "-" + $("#birthdayDay").val();
			$("input[name=memberBirth]").val(birthday);
			$("#updateForm").submit();

		}
	}
	//国家
	function getRegionOpenarea(value) {
		var url = "${CONTEXT_PATH}/users/getOpenarea";
		jQuery.getJSON(url, null, function call(result) {
			$("#openarea").empty();
			$("#openarea").append("<option value='-1'>请选择</option>")
			jQuery.each(result, function(i, region) {
				$("#openarea").append(
						"<option value='" + region.id + "' "
								+ (region.id == value ? "selected" : "") + " >"
								+ region.text + "</option>");
			});
		});
	}
    </script>
  </head>
<body>
<!-- 引用用户页部  -->
<%@include file="/commons/usershead.rec.en.jsp"  %>
<div class="mw panel"><span>service &gt; Account Center &gt; basics information</span></div>

<div class="space20"></div>

<div class="mw">
<!-- 左侧导航菜单 -->
	<dl class="centerMenu"></dl>
<!-- 右侧信息开始 -->	
	<div class="centerCon centerBaseInfo">
		<table>
		<form id="updateForm" action="${CONTEXT_PATH}/users/updateBaseData" method="post">
			<input type="hidden" name="language" value="en"/>
			<input type="hidden" name="memberId" value="${memberCenter.memberId}">
			<input type="hidden" name="memberBirth" value="${memberCenter.memberBirth}">
			<tr><th><b>*</b>name：</th><td><input type="text" name="memberNickname" value="${memberCenter.memberNickname}"/></td></tr>
			<tr class="tip"><th></th><td>4 to 12 characters, by Chinese and English, Numbers, "-", "_"</td></tr>
			<tr><th><b>*</b>sex：<div class="space"></div></th><td><input type="radio" name="memberSex" value="0"/>boy　<input type="radio" name="memberSex" value="1"/>woman　<input type="radio" name="memberSex" value="2"/>secrecy<div class="space"></div></td></tr>
			<tr><th>birthday：</th><td>
			  <select name="" id="birthdayYear"></select> year<select name="" id="birthdayMonth"></select> month <select name="" id="birthdayDay"></select> day
			</td></tr>
			<tr class="tip"><th></th><td>Fill in the birthday surprise ~</td></tr>
			<tr><th>email：</th><td><input type="text" name="memberMail" value="${memberCenter.memberMail}" /></td></tr>
			<tr class="tip"><th></th><td>Binding a mailbox is used to retrieve the login password</td></tr>
			<tr class="tip"><th></th><td>　</td></tr>
			<tr><th>nationality：</th>
						<td id="chkaddress"><select id="openarea" name="memberCoutry"></select></td></tr>
			<tr class="tip"><th></th><td>　</td></tr>
			<tr><th>detailed address：</th><td><input type="text" id="address" name="memberAddress" value="${memberCenter.memberAddress }"/></td></tr>
			<tr><th></th><td><div class="space30"></div><a class="btn" onclick="updateMemberData();">　submit　</a></td></tr>
			</form>
		</table>
	</div>
</div>
<script>

	//初始化菜单
	initLeftMenu('${menuItem}', '${CONTEXT_PATH}');
	//初始化性别
	var sex = "${memberCenter.memberSex}";
	if (sex == 0) {
		$("input[name=memberSex]").get(0).checked = true;
	} else if (sex == 1) {
		$("input[name=memberSex]").get(1).checked = true;
	} else if (sex == 2) {
		$("input[name=memberSex]").get(2).checked = true;
	}
	//初始化生日
	var initBirthday = '${memberCenter.memberBirth}'.split("-");
	var initBirthdayYear = initBirthday[0]; // 原年份
	var initBirthdayMonth = parseInt(initBirthday[1], 10);// 原月份
	var initBirthdayDay = parseInt(initBirthday[2], 10);// 原日期
	var allAddress = '${memberCenter.memberAddress }'.split("-");
	if (allAddress.length > 0) {
		var nation = allAddress[0];
		var province = allAddress[1];
		var area = allAddress[2];
		var county = allAddress[3];
		var address = allAddress[4];

		getRegionNation(nation, province, area, county);
		$('#address').val(address);
	} else {
		getRegionNation();
	}
</script>
<script type="text/javascript" src="${CONTEXT_PATH}/static/js/users/birthday.js"></script>
<%@include file="/commons/usersbottom.rec.en.jsp"  %>

</body>
</html>