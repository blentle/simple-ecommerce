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
<%@include file="/commons/uservalidation.rec.jsp"%>
<script src="${CONTEXT_PATH}/static/js/users/menus.js"
	type="text/javascript"></script>
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
	<%@include file="/commons/usershead.rec.jsp"%>
	<div class="mw panel">
		<span>服务 &gt; 账户中心 &gt; 基础资料</span>
	</div>

	<div class="space20"></div>

	<div class="mw">
		<!-- 左侧导航菜单 -->
		<dl class="centerMenu"></dl>
		<!-- 右侧信息开始 -->
		<div class="centerCon centerBaseInfo">
			<form:form id="updateForm" name="form"
				action="${CONTEXT_PATH}/users/updateBaseData" method="post"
				modelAttribute="memberCenter" class="form-horizontal">
				<table>
					<input type="hidden" name="locale" value="zh_CN">
					<input type="hidden" name="memberId"
						value="${memberCenter.memberId}">
					<input type="hidden" name="memberBirth"
						value="${memberCenter.memberBirth}">
					<tr>
						<th><b>*</b>昵称：</th>
						<td for="nc"><input type="text" id="nc" name="memberNickname"
							placeholder="昵称" value="${memberCenter.memberNickname}"
							class="required" minlength="4" maxlength="12" /><span
							style="color: #ff0000"><form:errors path="memberNickname" /></span></td>
					</tr>
					<tr class="tip">
						<th></th>
						<td>4-12个字符，可由中英文、数字、“-”、“_”组成</td>
					</tr>
					<tr>
						<th><b>*</b>性别：
							<div class="space"></div></th>
						<td><input type="radio" name="memberSex" value="0"
							class="required" />男 <input type="radio" name="memberSex"
							value="1" />女 <input type="radio" name="memberSex" value="2" />保密
							<div class="space"></div></td>
					</tr>
					<tr>
						<th>生日：</th>
						<td><select name="" id="birthdayYear"></select> 年 <select
							name="" id="birthdayMonth"></select> 月 <select name=""
							id="birthdayDay"></select> 日</td>
					</tr>
					<tr class="tip">
						<th></th>
						<td>填生日有惊喜哦~</td>
					</tr>
					<tr>
						<th>邮箱：</th>
						<td><input type="text" name="memberMail"
							value="${memberCenter.memberMail}" class="email" /></td>
					</tr>
					<tr class="tip">
						<th></th>
						<td>绑定邮箱用于找回登录密码</td>
					</tr>
					<tr class="tip">
						<th></th>
						<td></td>
					</tr>
					<tr>
						<th>国 家：</th>
						<td id="chkaddress"><select id="openarea" name="memberCoutry"></select></td>
					</tr>
					<tr class="tip">
						<th></th>
						<td></td>
					</tr>
					<tr>
						<th>详细地址：</th>
						<td><input type="text" name="memberAddress"
							value="${memberCenter.memberAddress }" /></td>
					</tr>
					<tr>
						<th></th>
						<td><div class="space30"></div>
							<a class="btn" onclick="updateMemberData();"> 提 交 </a></td>
					</tr>
				</table>
			</form:form>
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
	</script>
	<script type="text/javascript"
		src="${CONTEXT_PATH}/static/js/users/birthday.js"></script>
	<%@include file="/commons/usersbottom.rec.jsp"%>

</body>
</html>