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
    <script>
       function updateMemberData(){
    	   var birthday = $("#birthdayYear").val() + "-" + $("#birthdayMonth").val() + "-" + $("#birthdayDay").val();
    	   $("input[name=memberBirth]").val(birthday);
    	   var address = $("#nation option:selected").text()+"-"+$("#province option:selected").text()+"-"+$("#area option:selected").text()+"-"+$("#county option:selected").text()+"-"+$("#address").val();
    	   $("#address").val(address);
    	   //alert(address);
    	   //return false;
    	   $("#updateForm").submit();
       }
       //国家
       function getRegionNation(value,province,area,county){
    	   var url ="${CONTEXT_PATH}/users/getDataRegionMain";
			jQuery.getJSON(url, null, function call(result) {
				$("#nation").empty();
				$("#nation").append("<option value='-1'>请选择</option>")
				jQuery.each(result, function(i, region) {
					$("#nation").append(
							"<option value='" + region.id + "' "+(region.text==value?"selected":"")+" >" + region.text
									+ "</option>");
				});
				if(province){
					getRegionByProvince(province,$("#nation").val(),area,county);
				}else{
					getRegionByProvince('',-1);
				}
			});
       }
       //省
       function getRegionByProvince(value,pid,area,county) {	
			var url = "${CONTEXT_PATH}/users/getDataRegionMain"
			url += "?pid="+pid;
			jQuery.getJSON(url, null, function call(result) {
				$("#province").empty();
				$("#province").append("<option value='-1'>请选择</option>");
				jQuery.each(result, function(i, region) {
					$("#province").append(
							"<option value='" + region.id + "' "+(region.text==value?"selected":"")+" >" + region.text
									+ "</option>");
				});
			if(area){
				getRegionByArea(area,$("#province").val(),county);
			}else{
				getRegionByArea('',-1);
			}
			});
		}
       //市
       function getRegionByArea(value,pid,county) {	
			var url = "${CONTEXT_PATH}/users/getDataRegionMain";
			url += "?pid="+pid;
			jQuery.getJSON(url, null, function call(result) {
				$("#area").empty();
				$("#area").append("<option value='-1'>请选择</option>");
				jQuery.each(result, function(i, region) {
					$("#area").append(
							"<option value='" + region.id + "' "+(region.text==value?"selected":"")+" >" + region.text
									+ "</option>");
				});
			if(county){
				getRegionByCounty(county,$("#area").val());
			}else{
				getRegionByCounty('',-1);
			}
			});
		}
       //县
       function getRegionByCounty(value,pid) {	
			var url = "${CONTEXT_PATH}/users/getDataRegionMain";
			url += "?pid="+pid;
			jQuery.getJSON(url, null, function call(result) {
				$("#county").empty();
				$("#county").append("<option value='-1'>请选择</option>");
				jQuery.each(result, function(i, region) {
					$("#county").append(
							"<option value='" + region.id + "' "+(region.text==value?"selected":"")+" >" + region.text
									+ "</option>");
				});
			});
		}
    </script>
  </head>
<body>
<!-- 引用用户页部  -->
<%@include file="/commons/usershead.rec.jsp"  %>
<div class="mw panel"><span>服务 &gt; 账户中心 &gt; 基础资料</span></div>

<div class="space20"></div>

<div class="mw">
<!-- 左侧导航菜单 -->
	<dl class="centerMenu"></dl>
<!-- 右侧信息开始 -->	
	<div class="centerCon centerBaseInfo">
		<table>
		<form id="updateForm" action="${CONTEXT_PATH}/users/updateBaseData" method="post">
			<input type="hidden" name="memberId" value="${memberCenter.memberId}">
			<input type="hidden" name="memberBirth" value="${memberCenter.memberBirth}">
			<tr><th><b>*</b>昵称：</th><td><input type="text" name="memberNickname" value="${memberCenter.memberNickname}"/></td></tr>
			<tr class="tip"><th></th><td>4-12个字符，可由中英文、数字、“-”、“_”组成</td></tr>
			<tr><th><b>*</b>性别：<div class="space"></div></th><td><input type="radio" name="memberSex" value="0"/>男　<input type="radio" name="memberSex" value="1"/>女　<input type="radio" name="memberSex" value="2"/>保密<div class="space"></div></td></tr>
			<tr><th>生日：</th><td>
			  <select name="" id="birthdayYear"></select> 年 <select name="" id="birthdayMonth"></select> 月 <select name="" id="birthdayDay"></select> 日
			</td></tr>
			<tr class="tip"><th></th><td>填生日有惊喜哦~</td></tr>
			<tr><th>邮箱：</th><td><input type="text" name="memberMail" value="${memberCenter.memberMail}" /></td></tr>
			<tr class="tip"><th></th><td>绑定邮箱用于找回登录密码</td></tr>
			<tr class="tip"><th></th><td>　</td></tr>
			<tr><th>所在地：</th><td><select id="nation" onchange="getRegionByProvince('',this.value)"></select>　<select id="province" onchange="getRegionByArea('',this.value)"><option value='-1'>请选择</option></select>　<select id="area" onchange="getRegionByCounty('',this.value)"><option value='-1'>请选择</option></select>　<select id="county"><option value='-1'>请选择</option></select></td></tr>
			<tr class="tip"><th></th><td>　</td></tr>
			<tr><th>详细地址：</th><td><input type="text" id="address" name="memberAddress" value="${memberCenter.memberAddress }"/></td></tr>
			<tr><th></th><td><div class="space30"></div><a class="btn" onclick="updateMemberData();">　提 交　</a></td></tr>
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
<%@include file="/commons/usersbottom.rec.jsp"  %>

</body>
</html>