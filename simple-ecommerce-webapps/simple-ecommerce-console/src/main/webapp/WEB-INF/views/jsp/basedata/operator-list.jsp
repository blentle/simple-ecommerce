<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-运营商列表</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>
<body>
<form class="form-inline definewidth m20" action="${ctx}/basedata/operator/list" method="post">
    运营商名称：
    <input type="text" name="operatorName" id="operatorName" class="input-default" value="${operatorName}">&nbsp;&nbsp;
    有效状态：
    <select name="validStatus" id="validStatus" class="input-normal">
    	<option value="">全部</option>
    	<option value="valid">有效</option>
    	<option value="invalid">无效</option>
    </select>
    <button type="submit" class="btn btn-primary">查询</button>
    <button type="button" class="btn btn-success" id="addnew" onclick="addOperator()">新增运营商</button>
  
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>序号</th>
        <th>运营商名称</th>
        <th>所属国家</th>
        <th>运营商级别</th>
        <th>排序值</th>
        <th>联系人</th>
        <th>联系人电话</th>
        <th>有效状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <c:forEach items="${pageInfo.list}" var="item">
	    <tr>
	        <td>${item.id}</td>
	        <td>${item.operatorName}</td>
	        <td>${item.countryCode}</td>
	        <td>${item.operatorLevel}</td>
	        <td>${item.seqKey}</td>
	        <td>${item.contactName}</td>
	        <td>${item.contactPhone}</td>
	        <td><fmt:message key="def.global.validstatus.${item.validStatus.code}.name" bundle="${def}"/></td>
	        <td>
	            <a href="${ctx}/basedata/operator/toedit?id=${item.id}" class="btn btn-primary">编辑</a>
	        </td>
	    </tr>
    </c:forEach>
</table>
<div class="inline pull-right page">
    <c:if test="${pageInfo.pages > 1}">
        <pg:pager url="${ctx}/basedata/operator/list"
                  items="${pageInfo.total}" isOffset="true"
                  maxPageItems="${pageInfo.pageSize}"
                  export="offset, currentPageNumber=pageNumber" scope="request">
            <pg:param name="maxPageItems" value="${page.pageSize}"/><!--不能缺少的-->
            <pg:param name="items" value="${pageInfo.total}"/>
            <pg:param name="operatorName" value="${operatorName}"/>
            <pg:param name="validStatus" value="${validStatus}"/>
            <%@ include file="/common/page.jsp" %>
        </pg:pager>
    </c:if>
</div>
<script type="text/javascript">
	$(function () {
		$("#validStatus option[value='${param.validStatus}']").attr("selected",true);
	});

	function addOperator(){
		location.href="${ctx}/basedata/operator/toedit";
	}

</script>
</body>
</html>