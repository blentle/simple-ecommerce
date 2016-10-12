<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-会员列表</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>
<body>
<form class="form-inline definewidth m20" action="${ctx}/account/list" method="post">
    <table class="table">
        <tr>
            <td>登录名</td>
            <td><input type="text" name="loginName" value="${loginName}"><span class="emphasize">(支持模糊查询)</span></td>
            <td>昵称</td>
            <td><input type="text" name="nickName" value="${nickName}"><span class="emphasize">(支持模糊查询)</span></td>
            <td>国家</td>
            <td>
                <select name="countryCode">
                    <option value="">全部</option>
                    <c:if test="${not empty countryList}">
                        <c:forEach var="entity" items="${countryList}">
                            <option value="${entity.countryCode}" <c:if
                                    test="${entity.countryCode eq countryCode}"> selected="selected" </c:if>>${entity.countryName}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </td>
        </tr>
        <tr>
            <td>注册日期</td>
            <td>
                开始日期：<input name="startDate" class="calendar calendar-time" value="${startDate}" type="text"/>
                结束日期：<input name="endDate" class="calendar calendar-time" value="${endDate}" type="text"/>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td>
                <button type="submit" class="btn btn-primary">查询</button>
            </td>
        </tr>
    </table>
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th><em>登录名</em></th>
        <th><em>昵称</em></th>
        <th><em>注册类型</em></th>
        <th><em>所属国家</em></th>
        <th><em>会员状态</em></th>
        <th><em>注册日期</em></th>
        <th><em>操作</em></th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${not empty rows}">
        <c:forEach items="${rows}" var="entity">
            <tr>
                <td><span>${entity.account.accountName}</span></td>
                <td><span>${entity.account.nickName}</span></td>
                <td><span><fmt:message key="def.account.register.type.${entity.account.registerType.code}.name"
                                       bundle="${def}"/></span></td>
                <td><span>${entity.country.countryName}</span></td>
                <td>
                    <span id="account-status-${entity.account.id}" <c:if
                            test="${entity.account.accountStatus eq lockedStatus}"> class="emphasize" </c:if>>
                        <fmt:message key="def.account.status.${entity.account.accountStatus.code}.name"
                                     bundle="${def}"/>
                    </span>
                </td>
                <td><span><fmt:formatDate value="${entity.account.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${entity.account.accountStatus eq activeStatus}">
                            <a id="operation-${entity.account.id}" class='btn btn-info'
                               onclick="operateAccount('${ctx}',${entity.account.id});"
                               href="javascript:void(0);">冻结</a>
                        </c:when>
                        <c:when test="${entity.account.accountStatus eq lockedStatus}">
                            <a id="operation-${entity.account.id}" class='btn btn-info'
                               onclick="operateAccount('${ctx}',${entity.account.id});"
                               href="javascript:void(0);">激活</a>
                        </c:when>
                        <c:otherwise>

                        </c:otherwise>
                    </c:choose>
                    <a class='btn btn-success' href = "${ctx}/account/information/detail/${entity.account.id}">查看</a>
                </td>
            </tr>
        </c:forEach>
    </c:if>
    </tbody>
</table>
<div class="inline pull-right page">
    <c:if test="${pageInfo.pages > 1}">
        <pg:pager url="${ctx}/account/list"
                  items="${pageInfo.total}" isOffset="true"
                  maxPageItems="${pageInfo.pageSize}"
                  export="offset, currentPageNumber=pageNumber" scope="request">
            <pg:param name="maxPageItems" value="${pageInfo.pageSize}"/><!--不能缺少的-->
            <pg:param name="items" value="${pageInfo.total}"/>
            <pg:param name="loginName" value="${loginName}"/>
            <pg:param name="nickName" value="${nickName}"/>
            <pg:param name="countryCode" value="${countryCode}"/>
            <pg:param name="startDate" value="${startDate}"/>
            <pg:param name="endDate" value="${endDate}"/>
            <%@ include file="/common/page.jsp" %>
        </pg:pager>
    </c:if>
</div>
</body>
<script type="text/javascript">
    BUI.use('bui/calendar',function(Calendar){
        var datepicker = new Calendar.DatePicker({
            trigger:'.calendar-time',
            showTime:true,
            autoRender : true
        });
    });
    function operateAccount(contextPath, accountId) {
        $.post(contextPath + "/account/operate", {accountId: accountId}, function (result) {
            var data = eval(result);
            if (data.status_code == '1') {
                var orignal = $("#account-status-" + accountId).html();
                $("#account-status-" + accountId).html(data.msg);
                if (data.msg == '冻结' || data.msg == 'Frozen') {
                    $("#account-status-" + accountId).addClass('emphasize');
                } else {
                    $("#account-status-" + accountId).removeClass('emphasize');
                }
                $("#operation-" + accountId).html(orignal);
            } else {
                BUI.Message.Alert(data.msg, 'error');
            }
        });
    }
</script>
</html>