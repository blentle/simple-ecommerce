<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-编辑运营商</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
    <script type="text/javascript" src="${ctx}/static/lib/plupload/js/plupload.full.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/progressbar.js"></script>
</head>
<body>
<form id="editForm" class="form-inline definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
        <input type="hidden" id="id" name="id" value="${operator.id}"/>
        <tr>
            <td class="tableleft">运营商名称</td>
            <td><input type="text" id="operatorName" name="operatorName" class="required"
                       value="${operator.operatorName}"/></td>
        </tr>
        <tr>
            <td class="tableleft">所属国家</td>
            <td>
                <select id="countryCode" name="countryCode" class="required">
                    <option value="">请选择</option>
                    <c:if test="${not empty countryList}">
                        <c:forEach items="${countryList}" var="countryEntity">
                            <option value="${countryEntity.countryCode}" <c:if test="${countryEntity.countryCode eq operator.countryCode}"> selected="selected" </c:if>>${countryEntity.countryName}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </td>
        </tr>
        <tr>
            <td class="tableleft">级别</td>
            <td>
                <input type="radio" name="dealerlevel" value="1" <c:if test="${operator.operatorLevel eq 1}"> checked</c:if>/>一
                <input type="radio" name="dealerlevel" value="2" <c:if test="${operator.operatorLevel eq 2}"> checked</c:if>/>二
                <input type="radio" name="dealerlevel" value="3" <c:if test="${operator.operatorLevel eq 3}"> checked</c:if>/>三
            </td>
        </tr>
        <tr>
            <td class="tableleft">排序值</td>
            <td><input type="text" id="seqKey" name="seqKey" class="required digits" value="${operator.seqKey}"/></td>
        </tr>
        <tr>
            <td class="tableleft">有效状态</td>
            <td>
                <select name="validStatus" id="validStatus" class="required">
                    <option value="valid">有效</option>
                    <option value="invalid">无效</option>
                </select>
            </td>
        </tr>
        <tr>
            <td class="tableleft">联系人</td>
            <td><input type="text" id="contactName" name="contactName" class="required"
                       value="${operator.contactName}"/></td>
        </tr>
        <tr>
            <td class="tableleft">联系电话</td>
            <td><input type="text" id="contactPhone" name="contactPhone" class="required"
                       value="${operator.contactPhone}"/></td>
        </tr>
        <tr>
            <td class="tableleft">Logo</td>
            <td>
                <button id="pickfiles" class="btn btn-info">选择图片</button>
                <div id="progressbar"></div>
                <div id="imgshow">
                    <c:if test="${not empty operator && not empty operator.operatorLogo}">
                        <img src="${resourceServer}${operator.operatorLogo.m}">
                    </c:if>
                </div>
                <input id="imgJson" type="hidden" value="${imgJson}">
            </td>
        </tr>
        <tr>
            <td class="tableleft">运营商说明</td>
            <td><textarea id="operatorDesc" name="operatorDesc">${operator.operatorDesc}</textarea>
            </td>
        </tr>
        <tr>
            <td class="tableleft"></td>
            <td>
                <a type="button" onclick="editOperator();" class="btn btn-primary">提交</a>
                <button type="button" class="btn btn-primary" onclick="history.go(-1);">返回</button>
            </td>
        </tr>
    </table>

</form>
<script type="text/javascript">
    var resourceServer = "${resourceServer}";
    var uploader = new plupload.Uploader({
        browse_button : 'pickfiles', //触发文件选择对话框的按钮，为那个元素id
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
    uploader.bind('FilesAdded', function(up, files) {
        var progress = new FileProgress(files[0], "progressbar");
        progress.setStatus("正在上传(0%)...");
        uploader.start();
    });
    uploader.bind('UploadProgress', function(up, file) {
        var progress = new FileProgress(file, "progressbar");
        progress.setProgress(file.percent);
        progress.setStatus("正在上传("+ file.percent +"%)...");
    });
    uploader.bind("FileUploaded",function(uploader,file,responseObject){
        var data = eval('(' + responseObject.response + ')');
        if(data.status_code == '1') {
            $("#imgJson").val(data.msg);
            var imgObject = eval('(' + data.msg +')');
            var progress = new FileProgress(file, "progressbar");
            progress.setComplete();
            progress.setStatus("上传成功");
            $("#progressbar").empty();
            $("#imgshow").empty();
            var imgElement = '<img src="'+ resourceServer + imgObject.m +'"/>';
            $("#imgshow").append(imgElement);
        }
    });
    uploader.init();
    $(function () {
        $("#validStatus option[value='${operator.validStatus.code}']").attr("selected", true);
    });
    function editOperator() {
        var id = $("#id").val();
        var countryCode = $("#countryCode").val();
        var operatorName = $("#operatorName").val();
        var operatorLevel = $("input[name='dealerlevel']:checked").val();
        var seqKey = $("#seqKey").val();
        var validStatus = $("#validStatus").val();
        var contactName = $("#contactName").val();
        var contactPhone = $("#contactPhone").val();
        var operatorDesc = $("#operatorDesc").val();
        var logo = $("#imgJson").val();
        if(operatorLevel == null || operatorLevel=="") {
            BUI.Message.Alert("请选择运营商级别","error");
            return;
        }
        if(logo == null || logo == "") {
            BUI.Message.Alert("请上传Logo","error");
            return;
        }
        if (validateForm("#editForm")) {
            $.post("${ctx}/basedata/operator/edit",
                    {
                        id: id,
                        operatorName: operatorName,
                        countryCode: countryCode,
                        operatorLevel: operatorLevel,
                        seqKey: seqKey,
                        validStatus: validStatus,
                        contactName: contactName,
                        contactPhone: contactPhone,
                        operatorDesc: operatorDesc,
                        operatorLogo:logo
                    }, function (data) {
                        var resultMsg = eval(data);
                        if (resultMsg.status_code == '1') {
                            location.href = "${ctx}/basedata/operator/list";
                        } else {
                            BUI.Message.Alert(resultMsg.msg,"error");
                        }
                    });
        }
    }
</script>
</body>
</html>