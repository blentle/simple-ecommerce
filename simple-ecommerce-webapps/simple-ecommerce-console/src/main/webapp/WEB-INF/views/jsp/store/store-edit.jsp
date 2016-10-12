<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-编辑店铺</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
    <script type="text/javascript" src="${ctx}/static/lib/plupload/js/plupload.full.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/progressbar.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/store.js"></script>
</head>
<body>
<form id="createForm" class="definewidth m20">
    <input id="storeId" type="hidden" value="${store.id}"/>
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td class="tableleft">所属国家</td>
            <td>
                <select id="countryCode" name="countryCode" onchange="loadOperatorsByCountry('${ctx}',this.value,'firstOperatorValue');" class="required">
                    <option value="">请选择</option>
                    <c:if test="${not empty countryList}">
                        <c:forEach var="countryEntity" items="${countryList}">
                            <option value="${countryEntity.countryCode}" <c:if test="${countryEntity.countryCode eq store.countryCode}"> selected="selected" </c:if>>${countryEntity.countryName}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </td>
        </tr>
        <tr>
            <td class="tableleft">所属运营商</td>
            <td>
                <select id="operatorId" name="operatorId" class="required">
                    <option id="firstOperatorValue" value="">请选择</option>
                    <c:if test="${not empty operatorList}">
                        <c:forEach var="operatorEntity" items="${operatorList}">
                            <option value="${operatorEntity.id}" <c:if test="${operatorEntity.id eq store.operatorId}"> selected="selected" </c:if>>${operatorEntity.operatorName}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </td>
        </tr>
        <tr>
            <td class="tableleft">店铺名称</td>
            <td><input id="storeName" name="storeName" type="text" class="required" value="${store.storeName}"/></td>
        </tr>
        <tr>
            <td class="tableleft">联系电话</td>
            <td>
                <input id="storePhone" name="storePhone" type="text" class="required" value="${store.storePhone}"/>
            </td>
        </tr>
        <tr>
            <td class="tableleft">星级</td>
            <td>
                <input id="star" name="star" type="text" class="required" value="${store.storeStar}"/>
            </td>
        </tr>
        <tr>
            <td class="tableleft">店铺Logo</td>
            <td>
                <button id="pickfiles" class="btn btn-info">选择图片</button>
                <div id="progressbar"></div>
                <div id="imgshow">
                    <c:if test="${not empty store.storeLogo}">
                        <img src="${resourceServer}${store.storeLogo.m}"/>
                    </c:if>
                </div>
                <input id="imgJson" type="hidden" value="${imgJson}">
            </td>
        </tr>
        <tr>
            <td class="tableleft">描述</td>
            <td>
                <textarea id="desc">${store.storeDesc}</textarea>
            </td>
        </tr>
        <tr>
            <td class="tableleft"></td>
            <td>
                <a id="sbtn" href="javascript:void(0);" class="btn btn-primary">保存</a>
                <a href="javascript:void(0);" class="btn btn-success" onclick="javascript:history.go(-1);">返回</a>
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
    $(function() {
       $("#sbtn").bind("click",function() {
           var storeId = $("#storeId").val();
           var countryCode = $("#countryCode").val();
           var operatorId = $("#operatorId").val();
           var storeName = $("#storeName").val();
           var storePhone = $("#storePhone").val();
           var star = $("#star").val();
           var logo = $("#imgJson").val();
           var desc = $("#desc").val();
           if(logo != null && logo != "") {
               var data = {
                   storeId:storeId,
                   countryCode:countryCode,
                   operatorId:operatorId,
                   storeName:storeName,
                   storePhone:storePhone,
                   logo:logo,
                   star:star,
                   desc:desc
               };
               if(validateForm("#createForm")) {
                   $.post("${ctx}/store/store/edit",data,function(result){
                       var data = eval(result);
                       if(data.status_code == "1") {
                           window.location.href = "${ctx}/store/store/list";
                       } else {
                           BUI.Message.Alert(data.msg,'error');
                       }
                   });
               }
           }
       });
    })
</script>
</body>
</html>