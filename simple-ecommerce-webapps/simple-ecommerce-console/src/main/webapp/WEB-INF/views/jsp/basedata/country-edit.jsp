<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-编辑国家信息</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
	<script type="text/javascript" src="${ctx}/static/lib/plupload/js/plupload.full.min.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/progressbar.js"></script>
</head>
<body>
<form id="editForm" class="form-inline definewidth m20">
	<table class="table table-bordered table-hover definewidth m10">
		<input type="hidden" id="id" name="id" value="${country.id}" />
		<tr>
			<td class="tableleft">国家名称</td>
			<td><input type="text" id="countryName" name="countryName" class="required " value="${country.countryName}" /></td>
		</tr>
		<tr>
			<td class="tableleft">区号</td>
			<td><input type="text" id="countryCode" name="countryCode" class="required " value="${country.countryCode}" /></td>
		</tr>
		<tr>
			<td class="tableleft">英文名</td>
			<td><input type="text" id="englishName" name="englishName" class="required " value="${country.englishName}" /></td>
		</tr>
		<tr>
			<td class="tableleft">国家图片</td>
			<td>
				<button id="national_pickfiles" class="btn btn-info">选择图片</button>
				<div id="national_progressbar"></div>
				<div id="national_imgshow">
					<c:if test="${not empty country && not empty country.countryImage}">
						<img src="${resourceServer}${country.countryImage.m}"/>
					</c:if>
				</div>
				<input id="national_imgJson" type="hidden" value="${countryJson}">
			</td>
		</tr>
		<tr>
			<td class="tableleft">国旗图片</td>
			<td>
				<button id="flag_pickfiles" class="btn btn-info">选择图片</button>
				<div id="flag_progressbar"></div>
				<div id="flag_imgshow">
					<c:if test="${not empty country && not empty country.nationalFlag}">
						<img src="${resourceServer}${country.nationalFlag.m}"/>
					</c:if>
				</div>
				<input id="flag_imgJson" type="hidden" value="${flagJson}">
			</td>
		</tr>
		<tr>
			<td class="tableleft">是否开通</td>
			<td>
				<select name="openStatus" id="openStatus" class="required ">
					<option value="y">是</option>
					<option value="n">否</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="tableleft">是否开通手机注册</td>
			<td>
				<select name="registerStatus" id="registerStatus" class="required ">
					<option value="y">是</option>
					<option value="n">否</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="tableleft">是否开放充值</td>
			<td>
				<select name="rechargeStatus" id="rechargeStatus" class="required ">
					<option value="y">是</option>
					<option value="n">否</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="tableleft"></td>
			<td>
				<button type="button" onclick="editCountry();" class="btn btn-primary">提交</button>
				<button type="button" class="btn btn-primary" onclick="history.go(-1);">返回</button>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	var resourceServer = "${resourceServer}";
	var countryUplaoder = new plupload.Uploader({
		browse_button : 'national_pickfiles', //触发文件选择对话框的按钮，为那个元素id
		url : '${ctx}/ajax/file/images/upload', //服务器端的上传页面地址
		filters: {
			mime_types : [
				//只允许上传图片
				{ title : "Image files", extensions : "jpg,gif,png,jpeg" }
			],
			max_file_size : '8mb', //最大只能上传8mb的文件
			prevent_duplicates : true //不允许选取重复文件
		},
		max_retries:3,//发生错误时重试3次，
		multi_selection:false,//不允许选择多个文件
		file_data_name:'file',//后台接收的参数名称
		flash_swf_url : '${ctx}/static/lib/plupload/js/Moxie.swf', //swf文件，当需要使用swf方式进行上传时需要配置该参数
		silverlight_xap_url : '${ctx}/static/lib/plupload/js/Moxie.xap' //silverlight文件，当需要使用silverlight方式进行上传时需要配置该参数
	});
	countryUplaoder.bind('FilesAdded', function(up, files) {
		var progress = new FileProgress(files[0], "national_progressbar");
		progress.setStatus("正在上传(0%)...");
		countryUplaoder.start();
	});
	countryUplaoder.bind('UploadProgress', function(up, file) {
		//$("#progressBar").html(file.percent + "%");
		var progress = new FileProgress(file, "national_progressbar");
		progress.setProgress(file.percent);
		progress.setStatus("正在上传("+ file.percent +"%)...");
	});
	countryUplaoder.bind("FileUploaded",function(uploader,file,responseObject){
		var data = eval('(' + responseObject.response + ')');
		if(data.status_code == '1') {
			$("#national_imgJson").val(data.msg);
			var imgObject = eval('(' + data.msg +')');
			var progress = new FileProgress(file, "national_progressbar");
			progress.setComplete();
			progress.setStatus("上传成功");
			//$("#national_progressbar").empty();
			$("#national_imgshow").empty();
			var imgElement = '<img src="'+ resourceServer + imgObject.m +'"/>';
			$("#national_imgshow").append(imgElement);
		}
	});
	countryUplaoder.init();

	var flagUplaoder = new plupload.Uploader({
		browse_button : 'flag_pickfiles', //触发文件选择对话框的按钮，为那个元素id
		url : '${ctx}/ajax/file/images/upload', //服务器端的上传页面地址
		filters: {
			mime_types : [
				//只允许上传图片
				{ title : "Image files", extensions : "jpg,gif,png,jpeg" }
			],
			max_file_size : '8mb', //最大只能上传8mb的文件
			prevent_duplicates : true //不允许选取重复文件
		},
		max_retries:3,//发生错误时重试3次，
		multi_selection:false,//不允许选择多个文件
		file_data_name:'file',//后台接收的参数名称
		flash_swf_url : '${ctx}/static/lib/plupload/js/Moxie.swf', //swf文件，当需要使用swf方式进行上传时需要配置该参数
		silverlight_xap_url : '${ctx}/static/lib/plupload/js/Moxie.xap' //silverlight文件，当需要使用silverlight方式进行上传时需要配置该参数
	});
	flagUplaoder.bind('FilesAdded', function(up, files) {
		var progress = new FileProgress(files[0], "flag_progressbar");
		progress.setStatus("正在上传(0%)...");
		flagUplaoder.start();
	});
	flagUplaoder.bind('UploadProgress', function(up, file) {
		//$("#progressBar").html(file.percent + "%");
		var progress = new FileProgress(file, "flag_progressbar");
		progress.setProgress(file.percent);
		progress.setStatus("正在上传("+ file.percent +"%)...");
	});
	flagUplaoder.bind("FileUploaded",function(uploader,file,responseObject){
		var data = eval('(' + responseObject.response + ')');
		if(data.status_code == '1') {
			$("#flag_imgJson").val(data.msg);
			var imgObject = eval('(' + data.msg +')');
			var progress = new FileProgress(file, "flag_progressbar");
			progress.setComplete();
			progress.setStatus("上传成功");
			//$("#flag_progressbar").empty();
			$("#flag_imgshow").empty();
			var imgElement = '<img src="'+ resourceServer + imgObject.m +'"/>';
			$("#flag_imgshow").append(imgElement);
		}
	});
	flagUplaoder.init();
	$(function () {
		$("#openStatus option[value='${country.openStatus.code}']").attr("selected",true);
		$("#registerStatus option[value='${country.registerStatus.code}']").attr("selected",true);
		$("#rechargeStatus option[value='${country.rechargeStatus.code}']").attr("selected",true);
	});
	function editCountry(){
		var id=$("#id").val();
		var countryCode=$("#countryCode").val();
		var countryName=$("#countryName").val();
		var englishName=$("#englishName").val();
		var openStatus=$("#openStatus").val();
		var registerStatus=$("#registerStatus").val();
		var rechargeStatus=$("#rechargeStatus").val();
		var countryImg = $("#national_imgJson").val();
		var flagImg = $("#flag_imgJson").val();
		if(validateForm("#editForm")) {
            $.post("${ctx}/basedata/country/edit",
                    {
						id:id,
                        countryName:countryName,
                        countryCode:countryCode,
                        englishName:englishName,
                        openStatus:openStatus,
						countryImg:countryImg,
						flagImg:flagImg,
                        registerStatus:registerStatus,
                        rechargeStatus:rechargeStatus
                    }, function (data) {
                        var resultMsg = eval(data);
                        if (resultMsg.status_code == '1') {
                            location.href="${ctx}/basedata/country/list";
                        }else{
                            BUI.Message.Alert(data.msg,"error");
                        }
                    }
            );
		}
	}
</script>
</body>
</html>