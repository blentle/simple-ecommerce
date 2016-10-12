<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-添加物流公司</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>
<body>
<form id="createForm" class="definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td class="tableleft">物流公司</td>
            <td><input id="companyName" type="text" name="dealerName" class="required "/></td>
        </tr>
        <tr>
            <td class="tableleft">联系人姓名</td>
            <td><input id="contactName" type="text" class="required "/></td>
        </tr>
        <tr>
            <td class="tableleft">联系电话</td>
            <td><input id="tel" type="text" name="tel" class="required "/></td>
        </tr>
        <tr>
            <td class="tableleft">备注</td>
            <td>
                <textarea id="desc"></textarea>
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
                <a id="sbtn"  class="btn btn-primary">保存</a> &nbsp;&nbsp;
                <button type="button" class="btn btn-success" onclick="javascript:history.go(-1);">返回列表</button>
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript">
    $(function() {
       $("#sbtn").bind("click",function() {
           var companyName = $("#companyName").val();
           var contactName = $("#contactName").val();
           var tel = $("#tel").val();
           var orderIndex = $("#orderIndex").val();
           var desc = $("#desc").val();
           var data = {
               logisticsName:companyName,
               contactName:contactName,
               phone:tel,
               desc:desc,
               orderIndex:orderIndex
           };
           if(validateForm("#createForm")) {
               $.post("${ctx}/basedata/logisticscompany/create",data,function(result){
                   var data = eval(result);
                   if(data.status_code == "1") {
                       window.location.href = "${ctx}/basedata/logisticscompany/list";
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