<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>权限-角色管理-角色分配资源</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>

<body>
<style>
    /**内容超出 出现滚动条 **/
    .bui-stdmod-body{
        overflow-x : hidden;
        overflow-y : auto;
    }
    </style>
<form id="createForm">


    <table class="table table-bordered ">
        <thead>
        <tr>
            <th>角色ID</th>
            <th>角色名称</th>
            <th>状态</th>
            <th>创建时间</th>
        </tr>
        </thead>
        <tr>
            <td>${role.id}
            <input type="hidden" id="roleId" name="roleId" value="${role.id}"/>
            </td>
            <td>${role.roleName}</td>
            <td>
                <c:if test="${role.validStatus.code == 'valid'}">有效</c:if>
                <c:if test="${role.validStatus.code == 'invalid'}">无效</c:if>
            </td>
            <td><fmt:formatDate value="${role.createDate}" pattern="yyyy/MM/dd  HH:mm:ss"/></td>
        </tr>
    </table>
    <br/>

    <div id="tree">
        <%--<input type="text" id="show" name="show">--%>
        <%--<input type="hidden" id="pId" name="pId">--%>
    </div>
    <div class="log well"></div>
    <input type="hidden" id="resTreeIds" name="resTreeIds"/>

</form>
<script type="text/javascript" src="${ctx}/static/lib/bui/treepicker-min.js"></script>
<script type="text/javascript">
    BUI.use(['bui/tree', 'bui/data'], function (Tree, Data) {
        var store = new Data.TreeStore({
            url: '${ctx}/privilege/role/ajax/query-res-tree',
            pidField: 'pid',
            expanded: true,
            params: {roleId: '${role.id}'},//附加的参数
            autoLoad: true/**/
        });

        var tree = new Tree.TreeList({
            render: '#tree',
            store: store,
            checkType: 'all',
            expanded: true,
            showLine: true //显示连接线
        });

        tree.render();

        tree.on('checkedchange', function (ev) {
            var checkedNodes = tree.getCheckedNodes();
            var str = '';
            BUI.each(checkedNodes, function (node) {
                str += node.id + ',';
            });
            $('.log').text(str);
            $('#resTreeIds').val(str);
        });

    });

</script>
</body>
</html>