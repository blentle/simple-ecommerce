<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-请求的参数错误</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>
<body>
<div class="row-fluid" >
    <div class="span12">
        <div class="widget-body">
            <div class="error-page">
                <img src="${ctx}/static/images/400.png" alt="400 error">
                <h1>
                    <strong>400</strong> <br/>
                    错误的请求参数
                </h1>
                <p>Wrong parameters !</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
