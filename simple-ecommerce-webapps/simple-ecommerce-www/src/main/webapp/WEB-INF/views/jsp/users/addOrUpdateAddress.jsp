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
<%@include file="/commons/uservalidation.rec.jsp"  %>
<style type="text/css">
.centerBaseWindow {
	border: solid 1px #CCC;
	padding: 20px 20px;
	background: #FFF;
}

.centerBaseWindow table {
	border-collapse: collapse;
	width: 478px;
}

.centerBaseWindow th {
	text-align: right;
	width: 100px;
	padding: 0px 15px 0px 0px;
	line-height: 40px;
	font-size: 14px;
	font-weight: normal;
}

.centerBaseWindow td {
	text-align: left;
	line-height: 40px;
}

.centerBaseWindow .tip th,.centerBaseWindow .tip td {
	color: #999;
	line-height: 20px;
	padding: 0px 0px 10px 0px;
}

.centerBaseWindow b {
	color: #F00;
	font-size: 14px;
}

.centerBaseWindow select {
	width: 80px;
	border: solid 1px #CCC;
	height: 40px;
	line-height: 40px;
	padding: 0px 10px;
}

.centerBaseWindow input[type="text"] {
	width: 260px;
	border: solid 1px #CCC;
	height: 40px;
	line-height: 40px;
	padding: 0px 10px;
}
</style>
<script>

	$(function() {
		$("#updateForm").validate();
		var allAddress = '${memberDeliveryAddress.deliveryAddress}';
		if (allAddress != '') {
			var addsplit = '${memberDeliveryAddress.deliveryAddress}'
					.split("-");
			if (addsplit.length > 0) {
				var person = addsplit[0];
				var province = addsplit[1];
				var area = addsplit[2];
				var county = addsplit[3];
				var address = addsplit[4];
				var phone = addsplit[5];
				$("#person").val(person);
				$("#address").val(address);
				$("#phone").val(phone);
				getRegionByProvince(province, area, county);
			} 
		}else {
			getRegionByProvince();
		}
	});
	function updateAddressData() {
		if($("#updateForm").valid()){
			var person = $("#person").val();
			var province = $("#province").val();
			var area = $("#area").val();
			var county = $("#county").val();
			var address = $("#address").val();
			var phone = $("#phone").val();
			var provincetext = $("#province option:selected").text();
			var areatext = $("#area option:selected").text();
			var countytext = $("#county option:selected").text();
			var addressvalue = person + "-" + provincetext + "-" + areatext + "-"
					+ countytext + "-" + address + "-" + phone;
			var addressid = province + "-" + area + "-" + county;

			$("#deliveryAddress").val(addressvalue);
			$("#addressid").val(addressid);

			$
					.post(
							"${CONTEXT_PATH}/users/${action}",
							$("#updateForm").serialize(),
							function(data) {
								if (data == 0) {
									parent.location.href = '${CONTEXT_PATH}/users/shippingAddress';
									parent.$.boxer('close');
								}
								if(data == 1){
									parent.getAddressArray();
									parent.$.boxer('close');
								}
							});
		}else{
			return false;
		}
		
	}
	//省
	function getRegionByProvince(value, area, county) {
		var url = "${CONTEXT_PATH}/users/getDataRegionMain"
		jQuery.getJSON(url, null, function call(result) {
			$("#province").empty();
			$("#province").append("<option value='-1'>请选择</option>");
			jQuery.each(result, function(i, region) {
				$("#province").append(
						"<option value='" + region.id + "' "
								+ (region.text == value ? "selected" : "")
								+ " >" + region.text + "</option>");
			});
			if (area) {
				getRegionByArea(area, $("#province").val(), county);
			} else {
				getRegionByArea('', -1);
			}
		});
	}
	//市
	function getRegionByArea(value, pid, county) {
		var url = "${CONTEXT_PATH}/users/getDataRegionMain";
		url += "?pid=" + pid;
		jQuery.getJSON(url, null, function call(result) {
			$("#area").empty();
			$("#area").append("<option value='-1'>请选择</option>");
			jQuery.each(result, function(i, region) {
				$("#area").append(
						"<option value='" + region.id + "' "
								+ (region.text == value ? "selected" : "")
								+ " >" + region.text + "</option>");
			});
			if (county) {
				getRegionByCounty(county, $("#area").val());
			} else {
				getRegionByCounty('', -1);
			}
		});
	}
	//县
	function getRegionByCounty(value, pid) {
		var url = "${CONTEXT_PATH}/users/getDataRegionMain";
		url += "?pid=" + pid;
		jQuery.getJSON(url, null, function call(result) {
			$("#county").empty();
			$("#county").append("<option value='-1'>请选择</option>");
			jQuery.each(result, function(i, region) {
				$("#county").append(
						"<option value='" + region.id + "' "
								+ (region.text == value ? "selected" : "")
								+ " >" + region.text + "</option>");
			});
		});
	}
</script>

</head>
<body>

		<!-- 右侧信息开始 -->
		<div class="centerBaseWindow">
			<form id="updateForm" action="${CONTEXT_PATH}/users/${action}" method="post">
				<input type="hidden" name="type" value="${type}" />
				<input type="hidden" name="deliveryAddressId" value="${memberDeliveryAddress.deliveryAddressId}"/>
				<input type="hidden" id="deliveryAddress" name="deliveryAddress" value="${memberDeliveryAddress.deliveryAddress}"/>
				<input type="hidden" id="addressid" name="remark2" value="${memberDeliveryAddress.remark2 }"/>
			<table>
				<tr>
						<th><b>*</b>收货人：</th>
						<td><input type="text" id="person" name=""
							value="" class="required"/></td>
					</tr>
					<tr class="tip">
						<th></th>
						<td></td>
					</tr>
					<tr>
						<th><b>*</b>所在地区：</th>
						<td><select id="province" name="pac" onchange="getRegionByArea('',this.value)"><option value=''>请选择</option></select>　<select id="area" name="pac" onchange="getRegionByCounty('',this.value)"><option value=''>请选择</option></select>　<select id="county" name="pac" class="required " min="1"><option value=''>请选择</option></select></td>
					</tr>
					<tr class="tip">
						<th></th>
						<td></td>
					</tr>
					<tr>
						<th><b>*</b>地址：</th>
						<td><input type="text" id="address" name="adr" value="" class="required"/></td>
					</tr>
					<tr class="tip">
						<th></th>
						<td></td>
					</tr>
					<tr>
						<th><b>*</b>手机：</th>
						<td><input type="text" id="phone" name="dphone" value="" class="required number" minlength="11" maxlength="11"/></td>
					</tr>
					<tr class="tip">
						<th></th>
						<td></td>
					</tr>
					
					<tr>
						<th></th>
						<td><div class="space30"></div>
							<a class="btn" onclick="updateAddressData();"> 提 交 </a></td>
					</tr>				
			</table>
			</form>
		</div>


</body>
</html>