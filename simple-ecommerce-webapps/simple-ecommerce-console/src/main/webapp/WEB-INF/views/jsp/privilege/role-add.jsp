<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>权限-角色管理-新建</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>

<body>
<form id="createForm" class="definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td class="tableleft">角色名称</td>
            <td><input id="roleName" type="text" name="roleName"/></td>
        </tr>
        <tr>
            <td class="tableleft">资源是否有效</td>
            <td>
                <input type="radio" name="validStatus" value="valid" checked/> 有效
                <input type="radio" name="validStatus" value="invalid"/> 无效

            </td>
        </tr>

        <tr>
            <td class="tableleft">拥有的资源</td>
            <td>
                <div>
                    <input type="text" id="show" name="show">
                    <input type="hidden" id="pId" name="pId">
                </div>
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript" src="${ctx}/static/lib/bui/treepicker-min.js"></script>
<script type="text/javascript">
    BUI.use(['bui/extensions/treepicker', 'bui/tree', 'bui/data'], function (TreePicker, Tree, Data) {

        var store = new Data.TreeStore({
                    url: '${ctx}/privilege/role/ajax/query-res-tree',
                    autoLoad: true/**/
                }),

                tree = new Tree.TreeList({
                    store: store,
//                    nodes: data,
                    checkType: 'all',
                    showLine: true //显示连接线
                });

        var picker = new TreePicker({
            trigger: '#show',
            valueField: '#pId', //如果需要列表返回的value，放在隐藏域，那么指定隐藏域
            selectStatus: 'checked',
//            filter: function (node) {
//                return node.leaf;
//            },
            width: 150,  //指定宽度
            children: [tree] //配置picker内的列表
        });
        picker.render();

    });

</script>
</body>
</html>