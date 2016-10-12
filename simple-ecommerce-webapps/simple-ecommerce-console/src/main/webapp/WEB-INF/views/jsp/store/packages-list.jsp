<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-套餐列表</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
    <script type="text/javascript" src="${ctx}/static/js/store.js"></script>
</head>
<body>
<form class="form-inline definewidth m20" action="${ctx}/store/packages/list" method="post">
    <table class="table">
        <tr>
            <td>套餐名称</td>
            <td><input type="text" name="packagesName" value="${packagesName}"></td>
            <td>所属国家</td>
            <td>
               <select name="countryCode" onchange="loadStoresByCountry('${ctx}',this.value,'firstStoreValue');">
                   <option value="">全部</option>
                   <c:if test="${not empty countryList}">
                       <c:forEach var="countryEntity" items="${countryList}">
                           <option value="${countryEntity.countryCode}" <c:if test="${countryEntity.countryCode eq countryCode}"> selected="selected" </c:if>>${countryEntity.countryName}</option>
                       </c:forEach>
                   </c:if>
               </select>
            </td>
            <td>所属店铺</td>
            <td>
                <select name="storeId">
                    <option id="firstStoreValue" value="">全部</option>
                    <c:if test="${not empty storeList}">
                        <c:forEach var="storeEntity" items="${storeList}">
                            <option value="${storeEntity.id}" <c:if test="${storeEntity.id eq storeId}"> selected="selected" </c:if>>${storeEntity.storeName}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </td>
            <td>
                <button type="submit" class="btn btn-primary">查询</button>
                <button type="button" class="btn btn-success" id="addnew">添加套餐</button>
            </td>
        </tr>
    </table>
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
        <tr>
            <th>套餐</th>
            <th>所属国家</th>
            <th>所属店铺</th>
            <th>套餐价格</th>
            <th>套餐类型</th>
            <th>有效期(天)</th>
            <th>销售量</th>
            <th>是否上架</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody>
        <c:if test="${not empty rows}">
            <c:forEach items="${rows}" var="entity">
                <tr>
                    <td>${entity.packages.packagesName}</td>
                    <td>${entity.country.countryName}</td>
                    <td>${entity.store.storeName}</td>
                    <td>${entity.packages.packagesPrice}</td>
                    <td><fmt:message key="def.packages.type.${entity.packages.packagesType.code}.name" bundle="${def}"/></td>
                    <td>${entity.packages.validTime}</td>
                    <td>${entity.packages.salesVolume}</td>
                    <td><fmt:message key="def.packages.status.${entity.packages.packagesStatus.code}.name" bundle="${def}"/> </td>
                    <td>
                        <a href="${ctx}/store/packages/preedit/${entity.packages.id}" class="btn btn-success" >编辑</a>
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
        <pg:pager url="${ctx}/store/packages/list"
                  items="${pageInfo.total}" isOffset="true"
                  maxPageItems="${pageInfo.pageSize}"
                  export="offset, currentPageNumber=pageNumber" scope="request">
            <pg:param name="maxPageItems" value="${page.pageSize}"/><!--不能缺少的-->
            <pg:param name="items" value="${pageInfo.total}"/>
            <pg:param name="packagesName" value="${packagesName}"/>
            <pg:param name="countryCode" value="${countryCode}"/>
            <pg:param name="storeId" value="${storeId}"/>
            <%@ include file="/common/page.jsp" %>
        </pg:pager>
    </c:if>
</div>
</body>
</html>
<script>
    $(function () {
        $('#addnew').click(function () {
            window.location.href = "${ctx}/store/packages/precreate";
        });
    });
</script>
</body>
</html>