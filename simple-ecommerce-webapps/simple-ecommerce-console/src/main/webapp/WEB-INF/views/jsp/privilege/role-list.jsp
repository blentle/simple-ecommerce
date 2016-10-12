<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-角色列表</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>


<body>
<form class="form-inline definewidth m20" action="${ctx}/privilege/role/list" method="post">
    角色名称：
    <input type="text" name="roleName" id="resourceName" class="input-default" value="${roleName}">&nbsp;&nbsp;

    <button type="submit" class="btn btn-primary">查询</button>
    <button type="button" class="btn btn-success" id="btnNewRole">新增</button>

</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>角色ID</th>
        <th>角色名称</th>
        <th>状态</th>
        <th>创建时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <c:forEach items="${pageInfo.list}" var="item">
        <tr id="role-${item.id}">
            <td>${item.id}</td>
            <td>${item.roleName}</td>
            <td>
                <c:if test="${item.validStatus.code == 'valid'}">有效</c:if>
                <c:if test="${item.validStatus.code == 'invalid'}">无效</c:if>
            </td>
            <td><fmt:formatDate value="${item.createDate}" pattern="yyyy/MM/dd  HH:mm:ss"/></td>

            <td>
                <span name="btnEditRole" editId="${item.id}" class="x-icon x-icon-warning"><i class="icon icon-white icon-edit"></i></span>
                <span name="btnDelRole" delId="${item.id}" class="x-icon x-icon-error"><i class="icon icon-white icon-trash"></i></span>
                <span name="btnRes" roleId="${item.id}" class="x-icon x-icon-warning">授</span>
            </td>

        </tr>
    </c:forEach>
</table>
<div class="inline pull-right page">
    <c:if test="${pageInfo.pages > 1}">
        <pg:pager url="${ctx}/privilege/role/list"
                  items="${pageInfo.total}" isOffset="true"
                  maxPageItems="${pageInfo.pageSize}"
                  export="offset, currentPageNumber=pageNumber" scope="request">
            <pg:param name="maxPageItems" value="${pageInfo.pageSize}"/><!--不能缺少的-->
            <pg:param name="items" value="${pageInfo.total}"/>
            <pg:param name="resourceName" value="${roleName}"/>
            <pg:param name="validStatus" value="${validStatus}"/>
            <%@ include file="/common/page.jsp" %>
        </pg:pager>
    </c:if>
</div>
<script type="text/javascript">
    $(function () {
        $("#openStatus option[value='${param.openStatus}']").attr("selected", true);
    });

    BUI.use(['bui/overlay','bui/mask'],function(Overlay){
        var dialog = new Overlay.Dialog({
            title:'新增',
            width:500,
            height:340,
            loader : {
                url : '${ctx}/privilege/role/pre-add',
                autoLoad : false, //不自动加载
                lazyLoad : false //不延迟加载
            },
            success:function(){
                var path = "${ctx}/privilege/role/add";
                $('#createForm').attr("action", path).submit();
            },
            mask:true
        });
        $('#btnNewRole').on('click',function () {
            dialog.show();
            dialog.get('loader').load();
        });


    });

    BUI.use(['bui/overlay', 'bui/mask'], function (Overlay) {
        var dialog = new Overlay.Dialog({
            title: '修改',
            width: 500,
            height: 480,
            loader: {
                url: '${ctx}/privilege/role/pre-edit',
                autoLoad: false, //不自动加载
                params: {roleId: 'roleId'},//附加的参数
                lazyLoad: false //不延迟加载
            },
            success: function () {
                var path = "${ctx}/privilege/role/edit";
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
        $('span[name=btnEditRole]').on('click', function () {
            dialog.show();
            dialog.get('loader').load({roleId: $(this).attr("editId")});
        });


    });

    BUI.use('bui/overlay', function (overlay) {
        function show(roleId) {
            BUI.Message.Alert('确定要删除吗', function () {
                $.post('${ctx}/privilege/role/del', 'roleId=' + roleId, function () {
//                    var code = 'success';
                    $('#role-' + roleId).remove();
                })

            }, 'warning');
        }

        $('span[name=btnDelRole]').on('click', function () {
            show($(this).attr("delId"));
        });
    });


    BUI.use(['bui/overlay', 'bui/mask'], function (Overlay) {
        var dialog = new Overlay.Dialog({
            title: '授权',
            width: 500,
            height: 480,
            loader: {
                url: '${ctx}/privilege/role/pre-at-res',
                autoLoad: false, //不自动加载
                params: {roleId: 'roleId'},//附加的参数
                lazyLoad: false //不延迟加载
            },
            success: function () {
                var path = "${ctx}/privilege/role/role-at-res";
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
        $('span[name=btnRes]').on('click', function () {
            dialog.show();
            dialog.get('loader').load({roleId: $(this).attr("roleId")});
        });
    });

</script>
</body>
</html>