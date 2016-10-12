<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>权限-用户管理-修改</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>
<body>
<form id="createForm" class="definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td class="tableleft">用户ID</td>
            <td><c:out value="${user.id}"/>
                <input type="hidden" id="uId" name="uId" value="${user.id}"></td>
        </tr>

        <tr>
            <td class="tableleft">登录名称</td>
            <td><input id="userId" type="text" name="userId" value="${user.userId}"/></td>
        </tr>
        <tr>
            <td class="tableleft">用户名</td>
            <td><input id="userName" type="text" name="userName" value="${user.userName}"/></td>
        </tr>

        <tr>
            <td class="tableleft">手机</td>
            <td><input id="mobile" type="text" name="mobile" value="${user.mobile}"/></td>
        </tr>
        <tr>
            <td class="tableleft">电话</td>
            <td><input id="tel" type="text" name="tel" value="${user.tel}"/></td>
        </tr>
        <tr>
            <td class="tableleft">email</td>
            <td><input id="email" type="text" name="email" value="${user.email}"/></td>
        </tr>
        <tr>
            <td class="tableleft">是否有效</td>
            <td>
                <input type="radio" name="validStatus" value="valid" <c:if test="${user.validStatus.code=='valid'}">checked</c:if>/> 有效
                <input type="radio" name="validStatus" value="invalid"  <c:if test="${user.validStatus.code=='invalid'}">checked</c:if>/> 无效
            </td>
        </tr>

        <%--<tr>--%>
            <%--<td class="tableleft">资源</td>--%>
            <%--<td>--%>
                <%--<div>--%>
                    <%--<input type="text" id="show" name="show">--%>
                    <%--<input type="hidden" id="pId" name="pId">--%>
                <%--</div>--%>
            <%--</td>--%>
        <%--</tr>--%>
    </table>
</form>
</body>
</html>