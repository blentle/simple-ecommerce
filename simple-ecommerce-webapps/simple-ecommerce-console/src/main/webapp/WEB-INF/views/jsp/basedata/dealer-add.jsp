<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-添加代理商</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>
<body>
<form id="createForm" class="definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td class="tableleft">代理商</td>
            <td><input id="dealerName" type="text" name="dealerName" placeholder="必填项" class="required"/></td>
        </tr>
        <tr>
            <td class="tableleft">联系人姓名</td>
            <td><input id="contactName" name="contactName" type="text"  class="required"/></td>
        </tr>
        <tr>
            <td class="tableleft">联系电话</td>
            <td><input id="tel" type="text" name="tel" class="required "/></td>
        </tr>
        <tr>
            <td class="tableleft">所属国家</td>
            <td>
                <select id="country" name="country" class="required ">
                    <option value="">请选择</option>
                    <c:if test="${not empty countryList}">
                        <c:forEach items="${countryList}" var="country">
                            <option value="${country.countryCode}">${country.countryName}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </td>
        </tr>
        <tr>
            <td class="tableleft">代理商级别</td>
            <td>
                <input type="radio" name="dealerlevel" value="1" checked/>一
                <input type="radio" name="dealerlevel" value="2"/>二
                <input type="radio" name="dealerlevel" value="3"/>三
            </td>
        </tr>
        <tr>
            <td class="tableleft">排序值</td>
            <td>
                <input id="orderIndex" name="orderIndex" class="required digits" type="text"/>
            </td>
        </tr>
        <tr>
            <td class="tableleft"></td>
            <td>
                <a id="sbtn" class="btn btn-primary" type="button">保存</a> &nbsp;&nbsp;
                <button type="button" class="btn btn-success" onclick="javascript:history.go(-1);">返回列表</button>
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript">
    $(function() {
       $("#sbtn").bind("click",function() {
           var dealerName = $("#dealerName").val();
           var contactName = $("#contactName").val();
           var tel = $("#tel").val();
           var countryCode = $("#country").val();
           var level =  $("input[name='dealerlevel']:checked").val();
           var orderIndex = $("#orderIndex").val();
           var data = {
               dealerName:dealerName,
               contactName:contactName,
               phone:tel,
               countryCode:countryCode,
               level:level,
               orderIndex:orderIndex
           };
           if(validateForm("#createForm")) {
               $.post("${ctx}/basedata/dealer/create",data,function(result){
                   var data = eval(result);
                   if(data.status_code == "1") {
                       window.location.href = "${ctx}/basedata/dealer/list";
                   } else {
                       BUI.Message.Alert(data.msg,"error");
                   }
               });
           }
       });
    })
</script>
</body>
</html>