<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-资源列表</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>

<body>
<form class="form-inline definewidth m20" action="${ctx}/privilege/resource/list" method="post">
    资源名称：
    <input type="text" name="resourceName" id="resourceName" class="input-default" value="${resourceName}">&nbsp;&nbsp;

    <button type="submit" class="btn btn-primary">查询</button>
    <button type="button" class="btn btn-success" id="btnNewRes">新增</button>

</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>资源ID</th>
        <th>资源名称</th>
        <th>资源路径</th>
        <th>资源类型</th>
        <th>排序</th>
        <th>状态</th>
        <th>创建时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <c:forEach items="${pageInfo.list}" var="res">
        <tr id="res-${res.id}">
            <td>${res.id}</td>
            <td>${res.resourceName}</td>
            <td>${res.resourceUrl}</td>
            <td>
                <c:if test="${res.resourceType == '1'}">菜单</c:if>
                <c:if test="${res.resourceType == '2'}">功能</c:if>
            </td>
            <td>${res.seqKey}</td>
            <td>
                <c:if test="${res.validStatus.code == 'valid'}">有效</c:if>
                <c:if test="${res.validStatus.code == 'invalid'}">无效</c:if>
            </td>
            <td><fmt:formatDate value="${res.createDate}" pattern="yyyy/MM/dd  HH:mm:ss"/></td>
            <td>
                <span name="btnEditRes" editId="${res.id}" class="x-icon x-icon-warning"><i
                        class="icon icon-white icon-edit"></i></span>
                <span name="btnDelRes" delId="${res.id}" class="x-icon x-icon-error"><i
                        class="icon icon-white icon-trash"></i></span>
            </td>

        </tr>
    </c:forEach>
</table>
<div class="inline pull-right page">
    <c:if test="${pageInfo.pages > 1}">
        <pg:pager url="${ctx}/privilege/resource/list"
                  items="${pageInfo.total}" isOffset="true"
                  maxPageItems="${pageInfo.pageSize}"
                  export="offset, currentPageNumber=pageNumber" scope="request">
            <pg:param name="maxPageItems" value="${pageInfo.pageSize}"/><!--不能缺少的-->
            <pg:param name="items" value="${pageInfo.total}"/>
            <pg:param name="resourceName" value="${resourceName}"/>
            <pg:param name="validStatus" value="${validStatus}"/>
            <%@ include file="/common/page.jsp" %>
        </pg:pager>
    </c:if>
</div>


<script type="text/javascript">
    $(function () {
        $("#openStatus option[value='${param.openStatus}']").attr("selected", true);
    });

    BUI.use(['bui/overlay', 'bui/mask'], function (Overlay) {
        var dialog = new Overlay.Dialog({
            title: '新增',
            width: 500,
            height: 420,
            loader: {
                url: '${ctx}/privilege/resource/preadd',
                autoLoad: false, //不自动加载
                params: {a: 'a'},//附加的参数
                lazyLoad: false //不延迟加载
                /*, //以下是默认选项
                 dataType : 'text',   //加载的数据类型
                 property : 'bodyContent', //将加载的内容设置到对应的属性
                 loadMask : {
                 //el , dialog 的body
                 },
                 lazyLoad : {
                 event : 'show', //显示的时候触发加载
                 repeat : true //是否重复加载
                 },
                 callback : function(text){
                 var loader = this,
                 target = loader.get('target'); //使用Loader的控件，此处是dialog
                 //
                 }
                 */
            },
            success: function () {
                var path = "${ctx}/privilege/resource/add";
                $('#createForm').attr("action", path).submit();
                ;
//                this.close();
            },
            mask: true
        });
        var count = 0;
        $('#btnNewRes').on('click', function () {
            dialog.show();
            dialog.get('loader').load({a: count});
            count++;
        });


    });

    BUI.use(['bui/overlay', 'bui/mask'], function (Overlay) {
        var dialog = new Overlay.Dialog({
            title: '修改',
            width: 500,
            height: 480,
            loader: {
                url: '${ctx}/privilege/resource/pre-edit',
                autoLoad: false, //不自动加载
                params: {resId: 'resId'},//附加的参数
                lazyLoad: false //不延迟加载
            },
            success: function () {
                var path = "${ctx}/privilege/resource/edit";
//                $('#createForm').attr("action", path).submit();
                var param = $('#createForm').serialize();
                $.post(path, param, function (text) {
                    var code = 'success';
                    if (text.status_code != '1') {
                        code = 'error';
                    }
                    BUI.Message.Alert(text.msg, code);
                }, "json")
                this.close();
            },

            mask: true
        });
        $('span[name=btnEditRes]').on('click', function () {
            dialog.show();
            dialog.get('loader').load({resId: $(this).attr("editId")});
        });


    });

    BUI.use('bui/overlay', function (overlay) {
        function show(resId) {
            BUI.Message.Alert('确定要删除吗', function () {

                <%--window.location.href='${ctx}/privilege/resource/del?resourceId='+resId;--%>

                $.post('${ctx}/privilege/resource/del', 'resourceId=' + resId, function () {
//                    var code = 'success';
                    $('#res-' + resId).remove();
                })

            }, 'warning');
        }

        $('span[name=btnDelRes]').on('click', function () {
            show($(this).attr("delId"));
        });
    });


</script>
</body>
</html>