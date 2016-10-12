<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-没有权限</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>
<body>
<div class="row-fluid" >
    <div class="span12">
        <div class="widget-body">
            <div class="error-page">
                <img src="${ctx}/static/images/403.png" alt="403 error">
                <h1>
                    <strong>403</strong> <br/>
                    对不起，您没有足够的权限
                </h1>
                <p>Sorry,unauthorized</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
