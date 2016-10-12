<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-添加套餐</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
    <script type="text/javascript" src="${ctx}/static/lib/plupload/js/plupload.full.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/progressbar.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/store.js"></script>
</head>
<body>
<form id="createForm" class="definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td class="tableleft">所属国家</td>
            <td>
                <select id="countryCode" name="countryCode" onchange="loadStoresByCountry('${ctx}',this.value,'firstStoreValue');" class="required">
                    <option value="">请选择</option>
                    <c:if test="${not empty countryList}">
                        <c:forEach var="countryEntity" items="${countryList}">
                            <option value="${countryEntity.countryCode}">${countryEntity.countryName}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </td>
        </tr>
        <tr>
            <td class="tableleft">所属店铺</td>
            <td>
                <select id="storeId" name="storeId" class="required">
                    <option id="firstStoreValue" value="">请选择</option>
                </select>
            </td>
        </tr>
        <tr>
            <td class="tableleft">套餐名称</td>
            <td><input id="packagesName" name="packagesName" type="text" class="required"/></td>
        </tr>
        <tr>
            <td class="tableleft">套餐价格</td>
            <td>
                <input id="price" name="price" type="text" class="required number"/>
            </td>
        </tr>
        <tr>
            <td class="tableleft">套餐类型</td>
            <td>
                <select id="packagesType" name="packagesType" class="required">
                    <option value="">请选择</option>
                    <c:forEach var="typeEntity" items="${typeList}">
                        <option value="${typeEntity.code}"><fmt:message key="def.packages.type.${typeEntity.code}.name" bundle="${def}"/></option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td class="tableleft">销售量初始值</td>
            <td>
                <input id="salesVolume" name="salesVolume" type="text" class="required digits">
            </td>
        </tr>
        <tr>
            <td class="tableleft">热度初始值</td>
            <td>
                <input id="hotVolume" name="hotVolume" type="text" class="required digits">
            </td>
        </tr>
        <tr>
            <td class="tableleft">标签</td>
            <td>
                <input type="checkbox" name="packagesTags" value="1"/>新品&nbsp;&nbsp;
                <input type="checkbox" name="packagesTags" value="2"/>推荐&nbsp;&nbsp;
                <input type="checkbox" name="packagesTags" value="4"/>热销&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td class="tableleft">套餐图片</td>
            <td>
                <button id="pickfiles" class="btn btn-info">选择图片</button>
                <div id="progressbar"></div>
                <div id="imgshow"></div>
                <input id="imgJson" type="hidden">
            </td>
        </tr>
        <tr>
            <td class="tableleft">是否上架</td>
            <td>
                <input type="radio" name="packagesStatus" value="y" checked/>上架
                <input type="radio" name="packagesStatus" value="n"/>下架
            </td>
        </tr>
        <tr>
            <td class="tableleft">适用范围</td>
            <td>
                <input id="range" name="range" type="text" class="required"/>
            </td>
        </tr>
        <tr>
            <td class="tableleft">简介</td>
            <td>
                <textarea id="introduction"></textarea>
            </td>
        </tr>
        <tr>
            <td class="tableleft">有效期</td>
            <td>
                <input id="validTime" name="validTime" type="text" class="required digits"/>(<span class="emphasize">单位:天</span>)
            </td>
        </tr>
        <tr>
            <td class="tableleft">描述</td>
            <td>
                <textarea id="desc"></textarea>
            </td>
        </tr>
        <tr>
            <td class="tableleft"></td>
            <td>
                <a id="sbtn" class="btn btn-primary" href="javascript:void(0);">保存</a> &nbsp;&nbsp;
                <a class="btn btn-success" href="javascript:void(0);" onclick="javascript:history.go(-1);">返回列表</a>
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
        //$("#progressBar").html(file.percent + "%");
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
           var countryCode = $("#countryCode").val();
           var storeId = $("#storeId").val();
           var packagesName = $("#packagesName").val();
           var price = $("#price").val();
           var packagesType = $("#packagesType").val();
           var salesVolume = $("#salesVolume").val();
           var hotVolume = $("#hotVolume").val();
           var range = $("#range").val();
           var packagesTagsArr =[];
           $('input[name="packagesTags"]:checked').each(function(){
               packagesTagsArr.push($(this).val());
           });
           var desc = $("#desc").val();
           var imgJson = $("#imgJson").val();
           var introduction = $("#introduction").val();
           var validTime = $("#validTime").val();
           if(imgJson != null && imgJson !="") {
               var data = {
                   countryCode:countryCode,
                   storeId:storeId,
                   packagesName:packagesName,
                   price:price,
                   packagesType:packagesType,
                   salesVolume:salesVolume,
                   hotVolume:hotVolume,
                   packagesTags:packagesTagsArr.join(","),
                   packagesStatus:$("input[name='packagesStatus']:checked").val(),
                   packagesImage:imgJson,
                   range:range,
                   desc:desc,
                   introduction:introduction,
                   validTime:validTime
               };
               if(validateForm("#createForm")) {
                   $.post("${ctx}/store/packages/create",data,function(result){
                       var data = eval(result);
                       if(data.status_code == "1") {
                           window.location.href = "${ctx}/store/packages/list";
                       } else {
                           BUI.Message.Alert(data.msg);
                       }
                   });
               }
           }
       });
    })
</script>
</body>
</html>