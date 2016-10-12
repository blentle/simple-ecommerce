<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pg" uri="/WEB-INF/tags/pager-taglib.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0" />
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="userSession" value="${sessionScope.userSession}"/>
<c:set var="headerMenu" value="${sessionScope.headerMenu}"/>
<fmt:setBundle basename="i18n.default" var="def"/>
<fmt:setBundle basename="i18n.error" var="error"/>
<c:set var="site_title" value="悠游宝"/>
<link  href="${ctx}/static/css/normal.css" type="text/css" rel="stylesheet"/>
<link  href="${ctx}/static/css/mstyle.css" type="text/css" rel="stylesheet"/>
<script src="${ctx}/static/js/jquery.js" type="text/javascript"></script>
<script src="${ctx}/static/js/common.js" type="text/javascript"></script>
<script src="${ctx}/static/js/bottom.js" type="text/javascript"></script>
<script type="text/javascript">
    var yybConfig = {
        ctx : '${ctx}',
        accountId : '${userSession.account.id}'
    }
</script>