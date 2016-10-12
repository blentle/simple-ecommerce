<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/commons/include.rec.jsp"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>确认订单</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <style type="text/css">
    	.buy .orderDitail p {
			color: #333;
			border: solid 1px #CCC;
			width: 500px; 
			padding: 10px;
			}
    </style>
    <script type="text/javascript">
    $(function(){
    	$(".sendAddressList .switch").each(function(){
    		$(this).click(function(){
    			$(this).closest("li").siblings().addClass("space40");
    			$(this).closest("li").removeClass("space40");
    		});
    	});
    	//$('#updateSM').hide();
    	//$('#updateWEB').hide();
    	//隐藏配送地址
    	$(".sendAddressList").slideToggle();
    	//隐藏入网信息
    	$("#winfo").slideToggle();
    	//确认收货信息按钮事件
    	$("#confirmSh").click(function(){
    		//判断提交信息类型
    		var sendtype = $("input[name='peisong1']:checked").val();
    		//处理快递
    		if(sendtype==0){
    			var sendData = $("input[name='peisong2']:checked").val();
    			if(sendData==0){
    				saveAddress();
    			}else{
    				getAddressArray(sendData);
    			}
    		}
    		$(".sendAddressList").slideToggle();//点击确认收货后隐藏
    		$('#updateSM').show();
    		//$("#shippingMethod").empty();
    		//$("#shipping").after("<b id='shippingMethod'>黎明　　北京市海淀区中关村北大街圆明园东门可是小区20号楼一单元102　　15847820653</b>");
    		//alert();
    		
        });
    	//确定入网信息
    	$("#confirmWEB").click(function(){
    		if(!$("#ischeck").is(':checked')) {
    	 		   return false;
    	 	   }
    		$("#winfo").slideToggle();//点击确认收货后隐藏
    		$('#updateWEB').show();
    		$("#mbwi").empty();
    		 $.post("${CONTEXT_PATH}/users/updateNetDataJson", $("#updateForm").serialize(),function(data) {
    			 getWebInfo();
    	 	 });
    		
    		//alert();
    		 
        });
    	$("#updateWEB").click(function(){
    		$('#updateWEB').hide();
    		$("#mbwi").empty();
			$("#winfo").slideToggle();//点击确认收货后隐藏
    	});
    	$("#updateSM").click(function(){
    		$('#updateSM').hide();
    		$("#shippingMethod").empty();
			$(".sendAddressList").slideToggle();//点击确认收货后隐藏
    	});
    	getRegionOpenarea('${memberCenter.memberCoutry}');
    	getAddressArray();
    	getRegionByProvince();
    	getWebInfo();
    	imgView('${memberCenter.memberPaperworkPhoto}');
    	getchknum();
    });
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
  //保存入网信息
    function updateMemberData(){
 	   if(!$("#ischeck").is(':checked')) {
 		   return false;
 	   }
 	   
 	  $.post("${CONTEXT_PATH}/users/updateNetDataJson", $("#updateForm").serialize(),function(data) {
 		 alert(data);
 		});
 	   //$("#updateForm").submit();
    }
  //初始化入网图片
    function imgView (filename){
 	   var src = "${CONTEXT_PATH}/static/img/"+filename;
 	   $("#imgview").attr("src", src); 
 	   $("#mpp").val(filename);
    }
  //读取配送地址数据
  	function getAddressArray(id){
  		var url = "${CONTEXT_PATH}/users/getShippingAddressJson";
  		jQuery.getJSON(url, null, function call(result) {
			$("#addressmsg").empty();
			$("#addressmsg").append("<li class=\"space40\"><p>收货地址：</p></li>");
			jQuery.each(result, function(i, address) {
				
				var printstr = "<li class=\"space40 line2\"><p class=\"space40\">";
				printstr+="<input class=\"switch\" type=\"radio\" name=\"peisong2\" value=\""+address.id+"\"";
				if(i==0){
					if(!id){
					$("#shipping").after("<b id='shippingMethod'>　　"+address.text+"</b>");
					$("#addressID").val(address.id);
					}
					printstr+=" checked ";
				}
				if(id==address.id){
						$("#addressID").val(address.id);
						$("#shipping").after("<b id='shippingMethod'>　　"+address.text+"</b>");
				}
				
				printstr+="/> ";
				printstr+=address.text;
				printstr+="<a href=\"${CONTEXT_PATH}/users/updateAddress/"+address.id+"?type=1\" class='boxer ' data-boxer-height=\"320\" data-boxer-width=\"510\" onclick=\"openboxer()\">编辑</a>　<a>删除</a></p></li>";
				$("#addressmsg").append(printstr);
			});
			$(".boxer").not(".retina, .boxer_fixed, .boxer_top, .boxer_format, .boxer_mobile, .boxer_object").boxer();
		});
  	}
  	//保存新配送地址
  	function saveAddress(){
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
		$.post(
						"${CONTEXT_PATH}/users/saveAddressJson",
						//$("#updateForm").serialize(),
						{deliveryAddress:addressvalue,remark2:addressid,type:1},
						function(data) {
							if(data == 1){
								$("#person").val("");
								$("#address").val("");
								$("#phone").val();
								getAddressArray();
								getRegionByProvince();
							}
						});
	}
  	function getWebInfo(){
  		$.ajax({
            type: "get",
            url: "${CONTEXT_PATH}/users/getWebInfoJson",
            dataType: "text",
            success: function (data) {
            	$("#webinfo").after("<b id='mbwi'>　　"+data+"</b>");
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                  alert(errorThrown);
            }
        });
  	}
  	function saveData(){
  		$("#sendData").submit();
  	}
  	function getchknum() {
		var sumprice = 0.00;
		$("input[name='chk_ids']").each(function() {
				sumprice += parseFloat($("#p_" + this.value).val());
		});
		$("#sumprice").html(sumprice.toFixed(2));
		$("#sumpriceSUM").html(sumprice.toFixed(2));
	}
	/* 页面加载完成，绑定事件 
	$(document).ready(function() {
		btn();//点击提交，执行ajax
	});
	function btn() {
		$("#payment").bind("click",function(){
			window.location.href='/payment';
		});
	} */
	</script>
</head>
<body>
<div class="top">
<c:if test="${member!=null}">
			<p>
				<i> <a href="##">${member.memberNickname}</a>，Welcome you！ <a href="/users/order?language=en">personal center</a>
					｜ <a href="users/logout?language=en">logout</a>
				</i>
			</p>
		</c:if>
		<c:if test="${member==null}">
			<p>
				<i> <a href="/" class="abcd">CN</a> ｜ <a href="/users/login?language=en">login</a>
					｜ <a href="/users/reg?language=en">register</a>
				</i>
			</p>
		</c:if>
    <div>
			<a class="logo"><img src="${CONTEXT_PATH}/static/img/logo.png" /></a>
			<dl>
				<dt>
					<input type="text" placeholder="keyword" /><button></button>
				</dt>
				<dd>
					Hot Search： <a href="#">Hong Kong package </a><a href="#">Taiwan package </a><!-- <a href="#">热卖排行 </a><a href="#">选号入网 </a> -->
				</dd>
			</dl>
		</div>
</div>
<div class="menu">
    <div>
			<a href="/en">Home</a> 
				<a href="/en/aboutyyb">AboutYyb</a>
				<a href="/en/service" class="sel" >Service</a> 
				<a href="/en/operators"  >Operators</a> 
				<a href="/en/partners">Partners</a> 
				<a href="/en/contacts" >Contacts</a>
		</div>
</div>
<div class="mw buy">
	<div class="space30"></div>
	<div class="panel">
		<div>
			<ul class="pBar ma"><li class="sel">1、confirm order<b></b><i></i></li><li>2、payment<b></b><i></i></li><li>3、accomplish</li></ul>
		</div>
	</div>
	<div class="space"></div>
	<div class="panel">
		<div>
		<form id="updateForm1">
			<h2 class="space40" id="shipping">Shipping Method：<a id='updateSM' >edit</a></h2>
			<ul class="sendAddressList">
				<li class="space40">
					<p class="space40"><input class="switch" type="radio" name="peisong1" value="0"/> expressage <i>(Currently only support China within the scope of delivery)</i></p>
					<ul id="addressmsg">
						<li class="space40"><p>shipping address：</p></li>
						<li class="space40 line2"><p class="space40"><input class="switch" type="radio" name="peisong2" /> 黎明　　北京市海淀区中关村北大街圆明园东门可是小区20号楼一单元102　　15847820653　　<a>edit</a>　<a>remove</a></p></li>
					</ul>
					<ul>
						<li class="space40"><p class="space40"><input class="switch" type="radio" name="peisong2" value="0"/>  add address</p>
							<ul>
								<li>
									<div class="centerBaseInfo centerWebInfo">
										<table>
											<tr>
												<th><b>*</b>consignee：</th>
												<td><input type="text" id="person" name="" value="" /></td>
											</tr>
											<tr class="tip">
												<th></th>
												<td></td>
											</tr>
											<tr>
												<th><b>*</b> region：</th>
												<td><select id="province" name="" onchange="getRegionByArea('',this.value)" style="width:100px;"> <option value='-1'>请选择</option></select>　<select id="area" name="" onchange="getRegionByCounty('',this.value)" style="width:100px;"><option value='-1'>请选择</option></select>　<select id="county" name="" style="width:100px;"><option value='-1'>请选择</option></select></td>
											</tr>
											<tr class="tip">
												<th></th>
												<td></td>
											</tr>
											<tr>
												<th><b>*</b>address：</th>
												<td><input type="text" id="address" value="" /></td>
											</tr>
											<tr class="tip">
												<th></th>
												<td></td>
											</tr>
											<tr>
												<th><b>*</b>phone：</th>
												<td><input type="text" id="phone" value="" /></td>
											</tr>
											<tr class="tip">
												<th></th>
												<td></td>
											</tr>
										</table>
									</div>
								</li>
							</ul>
						</li>
					</ul>
					<div class="space30"></div>
				</li>
				<li class="space40">
					<p class="space40"><input class="switch" type="radio" name="peisong1" value="1"/> Reservation service point for <i> (three days after payment successfully navigate treasure will put your goods in you specified service point)</i></p>
					<ul id="dss">
						<li class="space"></li>
						<li class="space30"><p>list of sites：</p></li>
						<li><p class="space40"><input type="radio" name="peisong2" /> 北京首都机场T1航站楼咨询台</p></li>
						<li><p class="space40"><input type="radio" name="peisong2" /> 北京首都机场T1航站楼咨询台</p></li>
						<li><p class="space40"><input type="radio" name="peisong2" /> 北京首都机场T1航站楼咨询台</p></li>
					</ul>
				</li>
				<li class="space40"></li>
				<li class="space40"><a id="confirmSh" class="btn">Confirm the receiving information</a></li>
			</ul>
			</form>
		</div>
	</div>
	<div class="space"></div>
	<div class="panel">
		<div>
			<h2 class="space40" id="webinfo">The net data：<a id='updateWEB' >edit</a></h2>
			<div class="centerBaseInfo centerWebInfo" id="winfo">
			<%-- <iframe src ='${CONTEXT_PATH}/users/netDataIframe' style="width:100%;border:0px" scrolling="no"></iframe> --%>
			<form id="updateForm" action="${CONTEXT_PATH}/users/updateNetDataJson" method="post">
			<input type="hidden" name="memberId" value="${memberCenter.memberId}">
			<input type="hidden" id="mpp" name="memberPaperworkPhoto" value="${memberCenter.memberPaperworkPhoto }">
				<table>
					<tr><th>United States：</th><td><select id="openarea" name="memberCoutry"></select></td></tr>
					<tr><th>RealName：</th><td><input type="text" name="memberName" value="${memberCenter.memberName }" placeholder="2-15个汉字" /></td></tr>
					<tr><th>Papers Type：</th><td><select><option>身份证</option></select></td></tr>
					<tr><th>Papers Number：</th><td><input type="text" name="memberPaperworkNum" value="${memberCenter.memberPaperworkNum }"/></td></tr>
					<tr><th></th><td><input type="checkbox" id="ischeck" value="1"/> I do<a>Service contract</a><div class="space30"></div></td></tr>
					<tr><td colspan="2"><a id="confirmWEB" class="btn">To confirm the net</a></td></tr>
				</table>
				<div class="headPic">
				<img id = "imgview"class="rn" src="" />
		<a href="${CONTEXT_PATH}/users/loadfile" class="boxer btn btn-ss" data-boxer-height="180" data-boxer-width="510">upload pictures</a>
				</div>
				</form>
			</div>
		</div>
	</div>
	<div class="space"></div>
	<div class="panel orderDitail">
		<div>
			<h2 class="space40">commodity list：</h2>
			<form id="sendData" action="${CONTEXT_PATH}/users/saveOrderData" method="post">
				<input type="hidden" id="addressID" name="addressID" value=""/>
				<input type="hidden" name="language" value="en"/>
			<table>
				<thead>
					<tr><th><b>commodity picture</b></th><th><b>commodity name</b></th><th><b>commodity constitute</b></th><th><b>amount</b></th><th><b>price</b></th></tr>
				</thead>
				<tbody>
				<c:forEach var="mc" items="${mclist}" varStatus="status">
				<input type="hidden" name="chk_ids" value="${mc.cartId}" />
				<input type="hidden" id="p_${mc.cartId}" value="${mc.cartPackagePrice}"/>
					<tr>
						<th><img src="${CONTEXT_PATH}${mc.packages.packagesPcImage}" width="85" height="70" /></th>
						<td><a>${mc.cartPackageDesc}</a></td>
						<td>${mc.cartPackageDetail}</td>
						<th>1</th>
						<th><i>￥${mc.cartPackagePrice}</i></th>
					</tr>
					<tr><td colspan="5"><div class="line2"></div></td></tr>
				</c:forEach>
					<%-- <tr>
						<th><img src="${CONTEXT_PATH}/static/img/homeImg_6.png" width="85" height="70" /></th>
						<td><a>北京联通沃4G手机卡</a>(1G流量+300跳短信+通话时长40min)</td>
						<td>套餐：A类3G基本套餐<br>协议：12个月<br>卡号：18366475521<br>卡贴：1</td>
						<th>1</th>
						<th><i>￥99.50</i></th>
					</tr> --%>
					<tr><td colspan="5"><div class="line2"></div></td></tr>
					<tr>
						<td colspan="3" rowspan="2">
							<h2><a>Invoice information</a></h2>Best treasure only provides card invoice, does not provide purchase CARDS and prepaid phone bill.
							<p>
								发票内容： <input type="radio" name="peisong3" /> office supplies　　 <input type="radio" name="peisong3" /> consumable　　 <input type="radio" name="peisong3" /> detail<br>
								发票抬头： <input type="radio" name="peisong4" /> private　　　　 <input type="radio" name="peisong4" /> unit
							</p>
						</td>
						<td class="tar"><b>ommodity price：<br>- Cash back：<br>+ freight：</b></td><td class="tal"><b>￥<span
					id="sumprice">0.00</span><br>￥0.00<br>￥0.00</b></td>
					</tr>
					<tr><td class="tar"><b>amount payable：</b></td><td class="tal"><strong>￥<span
					id="sumpriceSUM">0.00</span></strong></td></tr>
				</tbody>
			</table>
			</form>
			<div class="space50 tar"><input id="payment" type="button" value="submit order" class="btn w2p" onclick="saveData();"/>　　</div>
		</div>
	</div>
	<div class="space100"></div>
</div>
	<%@include file="/commons/usersbottom.rec.en.jsp"  %>
</body>
</html>