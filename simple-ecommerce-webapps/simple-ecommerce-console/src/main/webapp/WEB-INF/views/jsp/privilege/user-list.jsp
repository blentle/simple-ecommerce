<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-资源列表</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>


<body>
<form class="form-inline definewidth m20" action="${ctx}/privilege/user/list" method="post">
    用户名称：
    <input type="text" name="userName" id="userName" class="input-default" value="${userName}">&nbsp;&nbsp;

    <button type="submit" class="btn btn-primary">查询</button>
    <button type="button" class="btn btn-success" id="btnNewUser">新增</button>

</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>ID</th>
        <th>登录名</th>
        <th>用户名称</th>
        <th>手机</th>
        <th>电话</th>
        <th>email</th>
        <th>状态</th>
        <th>创建时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <c:forEach items="${pageInfo.list}" var="item">
        <tr id="u-${item.id}">
            <td>${item.id}</td>
            <td>${item.userId}</td>
            <td>${item.userName}</td>
            <td>${item.mobile}</td>
            <td>${item.tel}</td>
            <td>${item.email}</td>
            <td>
                <c:if test="${item.validStatus.code == 'valid'}">有效</c:if>
                <c:if test="${item.validStatus.code == 'invalid'}">无效</c:if>
            </td>
            <td><fmt:formatDate value="${item.createDate}" pattern="yyyy/MM/dd  HH:mm:ss"/></td>
            <td>
                <span name="btnEditUser" editId="${item.id}" class="x-icon x-icon-warning"><i class="icon icon-white icon-edit"></i></span>
                <span name="btnDelUser" delId="${item.id}" class="x-icon x-icon-error"><i class="icon icon-white icon-trash"></i></span>
                <span name="btnPosition" positionId="${item.id}" class="x-icon x-icon-warning">岗</span>
                <span name="btnRole" roleId="${item.id}" class="x-icon x-icon-warning">角</span>
            </td>

        </tr>
    </c:forEach>
</table>
<div class="inline pull-right page">
    <c:if test="${pageInfo.pages > 1}">
        <pg:pager url="${ctx}/privilege/user/list"
                  items="${pageInfo.total}" isOffset="true"
                  maxPageItems="${pageInfo.pageSize}"
                  export="offset, currentPageNumber=pageNumber" scope="request">
            <pg:param name="maxPageItems" value="${pageInfo.pageSize}"/><!--不能缺少的-->
            <pg:param name="items" value="${pageInfo.total}"/>
            <pg:param name="userName" value="${userName}"/>
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
            height:440,
            loader : {
                url : '${ctx}/privilege/user/pre-add',
                autoLoad : false, //不自动加载
                lazyLoad : false //不延迟加载
            },
            success:function(){
                var path = "${ctx}/privilege/user/add";
                $('#createForm').attr("action", path).submit();;
//                this.close();
            },
            mask:true
        });
        $('#btnNewUser').on('click',function () {
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
                url: '${ctx}/privilege/user/pre-edit',
                autoLoad: false, //不自动加载
                params: {uId: 'uId'},//附加的参数
                lazyLoad: false //不延迟加载
            },
            success: function () {
                var path = "${ctx}/privilege/user/edit";
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
        $('span[name=btnEditUser]').on('click', function () {
            dialog.show();
            dialog.get('loader').load({uId: $(this).attr("editId")});
        });


    });

    BUI.use('bui/overlay', function (overlay) {
        function show(uId) {
            BUI.Message.Alert('确定要删除吗', function () {
                $.post('${ctx}/privilege/user/del', 'uId=' + uId, function () {
//                    var code = 'success';
                    $('#u-' + uId).remove();
                })

            }, 'warning');
        }

        $('span[name=btnDelUser]').on('click', function () {
            show($(this).attr("delId"));
        });
    });


    BUI.use(['bui/overlay', 'bui/mask'], function (Overlay) {
        var dialog = new Overlay.Dialog({
            title: '岗位分配',
            width: 500,
            height: 480,
            loader: {
                url: '${ctx}/privilege/user/pre-at-position',
                autoLoad: false, //不自动加载
                params: {uId: 'uId'},//附加的参数
                lazyLoad: false //不延迟加载
            },
            success: function () {
                var path = "${ctx}/privilege/user/edit-at-position";
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
        $('span[name=btnPosition]').on('click', function () {
            dialog.show();
            dialog.get('loader').load({uId: $(this).attr("positionId")});
        });


    });

    BUI.use(['bui/overlay', 'bui/mask'], function (Overlay) {
        var dialog = new Overlay.Dialog({
            title: '角色分配',
            width: 700,
            height: 480,
            loader: {
                url: '${ctx}/privilege/user/pre-at-role',
                autoLoad: false, //不自动加载
                params: {uId: 'uId'},//附加的参数
                lazyLoad: false //不延迟加载
            },
            success: function () {
                var path = "${ctx}/privilege/user/user-at-role";
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
        $('span[name=btnRole]').on('click', function () {
            dialog.show();
            dialog.get('loader').load({uId: $(this).attr("roleId")});
        });


    });


</script>
</body>
</html>