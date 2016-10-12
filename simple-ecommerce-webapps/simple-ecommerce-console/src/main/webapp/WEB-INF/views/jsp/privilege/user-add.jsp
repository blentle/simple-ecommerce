<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>权限-用户管理-新建</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>
<body>
<form id="createForm" class="definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td class="tableleft">登录名称</td>
            <td><input id="userId" type="text" name="userId"/></td>
        </tr>
        <tr>
            <td class="tableleft">用户名</td>
            <td><input id="userName" type="text" name="userName"/></td>
        </tr>
        <tr>
            <td class="tableleft">密码</td>
            <td><input id="password" type="password" name="password"/></td>
        </tr>
        <tr>
            <td class="tableleft">确认密码</td>
            <td><input id="password2" type="password" name="password2"/></td>
        </tr>
        <tr>
            <td class="tableleft">手机</td>
            <td><input id="mobile" type="text" name="mobile"/></td>
        </tr>
        <tr>
            <td class="tableleft">电话</td>
            <td><input id="tel" type="text" name="tel"/></td>
        </tr>
        <tr>
            <td class="tableleft">email</td>
            <td><input id="email" type="text" name="email"/></td>
        </tr>
        <tr>
            <td class="tableleft">是否有效</td>
            <td>
                <input type="radio" name="validStatus" value="valid" checked/> 有效
                <input type="radio" name="validStatus" value="invalid"/> 无效

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