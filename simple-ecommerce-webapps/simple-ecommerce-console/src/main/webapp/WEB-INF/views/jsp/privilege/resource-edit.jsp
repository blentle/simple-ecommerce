<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>权限-资源管理-修改资源</title>
    <%@ include file="/common/meta.jsp" %>
    <%--<%@ include file="/common/link.jsp" %>--%>
</head>
<body>
<form id="createForm" class="definewidth m20">
	<table class="table table-bordered table-hover definewidth m10">
		<tr>
			<td class="tableleft">资源ID</td>
			<td><c:out value="${resource.id}"/>
            <input type="hidden" name="resourceId" value="${resource.id}">
            </td>
		</tr>
		<tr>
			<td class="tableleft">资源CODE</td>
			<td><input id="resourceCode" type="text" name="resourceCode" value="<c:out value="${resource.resourceCode}"/>"/></td>
		</tr>
        <tr>
			<td class="tableleft">资源名称</td>
			<td><input id="resourceName" type="text" name="resourceName" value="<c:out value="${resource.resourceName}"/>"/></td>
		</tr>
		<tr>
			<td class="tableleft">资源URL</td>
			<td><input id="resourceUrl" type="text" name="resourceUrl" value="<c:out value="${resource.resourceUrl}"/>"/></td>
		</tr>
		<tr>
			<td class="tableleft">资源ICON</td>
			<td><input id="resourceIcon" type="text" name="resourceIcon" value="<c:out value="${resource.resourceIcon}"/>"/></td>
		</tr>
        <tr>
            <td class="tableleft">排序</td>
            <td><input id="seqKey" type="text" name="seqKey" value="<c:out value="${resource.seqKey}"/>"/></td>
        </tr>
		<tr>
			<td class="tableleft">资源类型</td>
			<td>
				<input type="radio" name="resourceType" value="1" <c:if test="${resource.resourceType=='1'}">checked</c:if>/> 菜单
				<input type="radio" name="resourceType" value="2" <c:if test="${resource.resourceType=='2'}">checked</c:if>/> 按钮
			</td>
		</tr>
		<tr>
			<td class="tableleft">资源是否有效</td>
			<td>
				<input type="radio" name="validStatus" value="valid" <c:if test="${resource.validStatus.code=='valid'}">checked</c:if>/> 有效
				<input type="radio" name="validStatus" value="invalid"  <c:if test="${resource.validStatus.code=='invalid'}">checked</c:if>/> 无效

			</td>
		</tr>

        <tr>
            <td class="tableleft">上级菜单 </td>
            <td>
                <div >
                    <input type="text" id="show" name="show" editPid="${resource.pid}"/>
                    <input type="hidden" id="pId" name="pId"/>
                </div>
            </td>
		</tr>
	</table>
</form>
<script type="text/javascript" src="${ctx}/static/lib/bui/treepicker-min.js"></script>
<%--<script type="text/javascript" src="${ctx}/static/lib/bui/tree-min.js"></script>--%>
<%--<script type="text/javascript" src="${ctx}/static/lib/bui/data-min.js"></script>--%>
<script type="text/javascript">
    BUI.use(['bui/extensions/treepicker','bui/tree','bui/data'],function(TreePicker,Tree,Data){

        //树节点数据，
        //text : 文本，
        //id : 节点的id,
        //leaf ：标示是否叶子节点，可以不提供，根据childern,是否为空判断
        //expanded ： 是否默认展开
        var store = new Data.TreeStore({
                    root : {
                        id : '0',
                        text : '0'
                    },
                    url : '${ctx}/privilege/resource/ajax/query-res-tree',
                    expanded:true,
                    autoLoad : true/**/
                }),
        //由于这个树，不显示根节点，所以可以不指定根节点
                tree = new Tree.TreeList({
                    store : store,
                    //dirSelectable : false,//阻止树节点选中
                    showLine : true //显示连接线
                });

        var  picker = new TreePicker({
            trigger : '#show',
            valueField : '#pId', //如果需要列表返回的value，放在隐藏域，那么指定隐藏域
            width:150,  //指定宽度
            children : [tree] //配置picker内的列表

        });
        picker.render();
        //数据加载完成后，执行选中操作
        store.on('load',function(){
            var value =$("#show").attr("editPid");
            picker.setSelectedValue(value);
        });
    });
</script>
</body>
</html>