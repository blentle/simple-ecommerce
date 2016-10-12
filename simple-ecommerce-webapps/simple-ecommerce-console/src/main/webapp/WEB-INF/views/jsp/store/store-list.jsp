<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-店铺列表</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
    <script type="text/javascript" src="${ctx}/static/js/store.js"></script>
</head>
<body>
<form class="form-inline definewidth m20" action="${ctx}/store/store/list" method="post">
    <table class="table">
        <tr>
            <td>店铺名称</td>
            <td><input type="text" name="storeName" value="${storeName}"></td>
            <td>所属国家</td>
            <td>
               <select name="countryCode" onchange="loadOperatorsByCountry('${ctx}',this.value,'firstOperatorValue');">
                   <option value="">请选择</option>
                   <c:if test="${not empty countryList}">
                       <c:forEach var="countryEntity" items="${countryList}">
                           <option value="${countryEntity.countryCode}" <c:if test="${countryEntity.countryCode eq countryCode}"> selected="selected" </c:if>>${countryEntity.countryName}</option>
                       </c:forEach>
                   </c:if>
               </select>
            </td>
            <td>所属运营商</td>
            <td>
                <select name="operatorId">
                    <option id="firstOperatorValue" value="">请选择</option>
                    <c:if test="${not empty operatorList}">
                        <c:forEach var="operatorEntity" items="${operatorList}">
                            <option value="${operatorEntity.id}" <c:if test="${operatorEntity.id eq operatorId}"> selected="selected" </c:if>>${operatorEntity.operatorName}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </td>
            <td>
                <button type="submit" class="btn btn-primary">查询</button>
                <button type="button" class="btn btn-success" id="addnew">添加店铺</button>
            </td>
        </tr>
    </table>
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
        <tr>
            <th>店铺</th>
            <th>所属国家</th>
            <th>所属运营商</th>
            <th>联系电话</th>
            <th>星级</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody>
        <c:if test="${not empty rows}">
            <c:forEach items="${rows}" var="entity">
                <tr>
                    <td>${entity.store.storeName}</td>
                    <td>${entity.country.countryName}</td>
                    <td>${entity.operator.operatorName}</td>
                    <td>${entity.store.storePhone}</td>
                    <td>${entity.store.storeStar}</td>
                    <td>
                        <a href="${ctx}/store/store/preedit/${entity.store.id}" class="btn btn-success">编辑</a>
                    </td>
                </tr>
            </c:forEach>
        </c:if>
        <tr>
        </tr>
    </tbody>
</table>
<div class="inline pull-right page">
    <c:if test="${pageInfo.pages > 1}">
        <pg:pager url="${ctx}/store/store/list"
                  items="${pageInfo.total}" isOffset="true"
                  maxPageItems="${pageInfo.pageSize}"
                  export="offset, currentPageNumber=pageNumber" scope="request">
            <pg:param name="maxPageItems" value="${page.pageSize}"/><!--不能缺少的-->
            <pg:param name="items" value="${pageInfo.total}"/>
            <pg:param name="storeName" value="${storeName}"/>
            <pg:param name="countryCode" value="${countryCode}"/>
            <pg:param name="operatorId" value="${operatorId}"/>
            <%@ include file="/common/page.jsp" %>
        </pg:pager>
    </c:if>
</div>
</body>
</html>
<script>
    $(function () {
        $('#addnew').click(function () {
            window.location.href = "${ctx}/store/store/precreate";
        });
    });
</script>
</body>
</html>