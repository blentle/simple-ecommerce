<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-Internal Error</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>
<body>
<div class="row-fluid" >
    <div class="span12">
        <div class="widget-body">
            <div class="error-page">
                <img src="${ctx}/static/images/500.png" alt="500 error">
                <h1>
                    <strong>500,Internal Error</strong> <br/>
                    系统内部错误，我们会尽快修复！
                </h1>
                <p>OOPS! Something went wrong.</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
