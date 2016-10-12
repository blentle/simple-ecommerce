<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>权限-资源管理-新建资源</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>

<body>
<form id="createForm" class="definewidth m20">
	<table class="table table-bordered table-hover definewidth m10">
		<tr>
			<td class="tableleft">资源编码</td>
			<td><input id="resourceCode" type="text" name="resourceCode"/></td>
		</tr>
		<tr>
			<td class="tableleft">资源名称</td>
			<td><input id="resourceName" type="text" name="resourceName" /></td>
		</tr>
		<tr>
			<td class="tableleft">资源URL</td>
			<td><input id="resourceUrl" type="text" name="resourceUrl"/></td>
		</tr>
		<tr>
			<td class="tableleft">资源ICON</td>
			<td><input id="resourceIcon" type="text" name="resourceIcon"/></td>
		</tr>
        <tr>
            <td class="tableleft">排序</td>
            <td><input id="seqKey" type="text" name="seqKey"/></td>
        </tr>
		<tr>
			<td class="tableleft">资源类型</td>
			<td>
				<input type="radio" name="resourceType" value="1" checked/> 菜单
				<input type="radio" name="resourceType" value="2"/> 按钮

			</td>
		</tr>
		<tr>
			<td class="tableleft">资源是否有效</td>
			<td>
				<input type="radio" name="validStatus" value="valid" checked/> 有效
				<input type="radio" name="validStatus" value="invalid"/> 无效

			</td>
		</tr>
		<%--<tr>--%>
			<%--<td class="tableleft">APP </td>--%>
			<%--<td>--%>
				<%--<select id="appId">--%>
					<%--<option value="0">请选择</option>--%>
					<%--<c:if test="${not empty countryList}">--%>
						<%--<c:forEach items="${countryList}" var="country">--%>
							<%--<option value="${country.countryCode}">${country.countryName}</option>--%>
						<%--</c:forEach>--%>
					<%--</c:if>--%>
				<%--</select>--%>
			<%--</td>--%>
		<%--</tr>--%>
		<tr>
			<td class="tableleft">上级菜单 </td>
			<td>
                <div >
                    <input type="text" id="show" name="show">
                    <input type="hidden" id="pId"  name="pId">
                </div>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript" src="${ctx}/static/lib/bui/treepicker-min.js"></script>
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
            var value = '1';
            picker.setSelectedValue(value);
        });
    });
</script>
</body>
</html>