<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>后台管理</title>
    <%@ include file="/common/meta.jsp" %>
    <link href="${ctx}/static/css/dpl-min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/css/bui-min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/css/main.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<div class="header">

    <div class="dl-title">
        <!--system logo-->
        <%--<img src="${ctx}/static/images/top.png">--%>
    </div>

    <div class="dl-log">
        欢迎您，<span class="dl-log-user">超级管理员</span>
        <a href="${ctx}/logout" title="退出系统" class="dl-log-quit">[退出]</a>
    </div>
</div>
<div class="content">
    <div class="dl-main-nav">
        <div class="dl-inform">
            <div class="dl-inform-title"><s class="dl-inform-icon dl-up"></s></div>
        </div>
        <ul id="J_Nav" class="nav-list ks-clear">

            <c:forEach items="${tree}" var="item">
                <li class="nav-item dl-selected">
                    <div class="nav-item-inner nav-${item.resourceIcon}">${item.resourceName}</div>
                </li>
            </c:forEach>

        </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
</div>
<script type="text/javascript" src="${ctx}/static/lib/jquery/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="${ctx}/static/lib/bui/bui-min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/common/main.js"></script>
<script type="text/javascript" src="${ctx}/static/js/config.js"></script>
<script type="text/javascript">
    BUI.use('common/main', function () {

        $.getJSON('${ctx}/ajax/query-menu-tree', function (config) {

            new PageUtil.MainPage({
                modulesConfig: config
            });
        });
    });
</script>
</body>
</html>