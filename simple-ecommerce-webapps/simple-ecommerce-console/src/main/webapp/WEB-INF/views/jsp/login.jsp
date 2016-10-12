<%--
  Created by IntelliJ IDEA.
  User: zxdev
  Date: 15/3/13
  Time: 上午10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>后台管理-登录</title>
    <%@ include file="/common/meta.jsp" %>
    <link href="${ctx}/static/css/dpl-min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/css/bui-min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/css/main.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<form class="form-horizontal" name="fm-login" action="${ctx}/login" method="post">
    <div class="row show-grid">
        <div class="span8">
            <div class="control-group">
                <br/>
                <label class="control-label">用户名：</label>

                <div class="controls"><input class="input-normal control-text" type="text" id="userId" name="userId">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">密码：</label>

                <div class="controls"><input class="input-normal control-text" type="text" id="password"
                                             name="password"></div>
            </div>
            <div class="control-group">
                <label class="control-label">验证码：</label>

                <div class="controls"><input class="input-normal control-text" type="text" id="checkCode"
                                             name="checkCode"></div>
            </div>


            <c:out value="${resultMsg.msg}"/>

            <div class="control-group">
                    <button type="submit" class="button">登录</button>
                    <button type="button" class="button">注册</button>
            </div>


        </div>


    </div>
    </div>
</form>


</body>
</html>
