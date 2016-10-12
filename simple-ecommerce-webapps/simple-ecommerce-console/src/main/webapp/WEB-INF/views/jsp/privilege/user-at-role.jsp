<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>权限-角色管理-用户分配角色</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>

<body>
<style>
    /**内容超出 出现滚动条 **/
    .bui-stdmod-body {
        overflow-x: hidden;
        overflow-y: auto;
    }
</style>
<form id="createForm">


    <table class="table table-bordered ">
        <thead>
        <tr>
            <th>用户ID</th>
            <th>登录名</th>
            <th>用户名</th>
            <th>状态</th>
            <th>创建时间</th>
        </tr>
        </thead>
        <tr>
            <td>${user.id}
                <input type="hidden" id="uId" name="uId" value="${user.id}"/>
            </td>
            <td>${user.userId}</td>
            <td>${user.userName}</td>
            <td>
                <c:if test="${user.validStatus.code == 'valid'}">有效</c:if>
                <c:if test="${user.validStatus.code == 'invalid'}">无效</c:if>
            </td>
            <td><fmt:formatDate value="${user.createDate}" pattern="yyyy/MM/dd  HH:mm:ss"/></td>
        </tr>
    </table>
    <br/>

    <table cellspacing="0" class="table table-bordered">
        <thead>
        <tr>
            <th width="15"><label><input type="checkbox" id="ckAll"></label></th>
            <th>角色ID</th>
            <th>角色名称</th>
            <th>角色状态</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${roleList}" var="item">
            <tr id="role-${item.id}">
                <td><input type="checkbox" name="rIds" value="${item.id}"
                <c:forEach items="${checkRoles}" var="crs">
                           <c:if test="${crs.id==item.id}">checked="true"</c:if>
                </c:forEach>></td>
                <td>${item.id}</td>
                <td>${item.roleName}</td>
                <td>
                    <c:if test="${item.validStatus.code == 'valid'}">有效</c:if>
                    <c:if test="${item.validStatus.code == 'invalid'}">无效</c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</form>

<script type="text/javascript">
    $("#ckAll").click(function () {
        $("input[name='rIds']").prop("checked", this.checked);
    });

    $("input[name='rIds']").click(function () {
        var $subs = $("input[name='rIds']");
        $("#ckAll").prop("checked", $subs.length == $subs.filter(":checked").length ? true : false);
    });
</script>

</body>
</html>