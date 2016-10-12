<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-编辑服务站点</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>
<body>
<form id="createForm" class="definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
        <input type="hidden" id="siteId" value="${site.id}"/>
        <tr>
            <td class="tableleft">站点名称</td>
            <td><input id="siteName" type="text" name="siteName" value="${site.serviceSiteName}" class="required"/></td>
        </tr>
        <tr>
            <td class="tableleft">联系人姓名</td>
            <td><input id="contactName" name="contactName" type="text" value="${site.contactName}" class="required"/></td>
        </tr>
        <tr>
            <td class="tableleft">联系电话</td>
            <td><input id="tel" type="text" name="tel" value="${site.contactPhone}" class="required"/></td>
        </tr>
        <tr>
            <td class="tableleft">所属国家</td>
            <td>
                <select id="countryCode" name="countryCode" class="required">
                    <option value="">请选择</option>
                    <c:if test="${not empty countryList}">
                        <c:forEach items="${countryList}" var="country">
                            <option value="${country.countryCode}" <c:if test="${site.countryCode eq country.countryCode}">selected="selected" </c:if>>${country.countryName}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </td>
        </tr>
        <tr>
            <td class="tableleft">所属地区</td>
            <td>
                <span>省</span>
                <span>
                    <select id="province" name="province" onchange="loadCity(this.value);">
                        <option value="">请选择</option>
                        <c:if test="${not empty provinceList}">
                            <c:forEach items="${provinceList}" var="provinceEntity">
                                <option value="${provinceEntity.id}" <c:if test="${site.provinceCode eq provinceEntity.id}">selected="selected" </c:if>>${provinceEntity.regionName}</option>
                            </c:forEach>
                        </c:if>
                    </select>
                </span>
                <span>市</span>
                <span>
                    <select id="city" name="city" onchange="loadDistrict(this.value);">
                        <option id="firstCityValue" value="">请选择</option>
                        <c:if test="${not empty cityList}">
                            <c:forEach items="${cityList}" var="cityEntity">
                                <option value="${cityEntity.id}" <c:if test="${site.cityCode eq cityEntity.id}">selected="selected" </c:if>>${cityEntity.regionName}</option>
                            </c:forEach>
                        </c:if>
                    </select>
                </span>
                <span>区</span>
                <span>
                    <select id="district" name="district">
                        <option id="firstDistrictValue" value="">请选择</option>
                        <c:if test="${not empty districtList}">
                            <c:forEach items="${districtList}" var="districtEntity">
                                <option value="${districtEntity.id}" <c:if test="${site.countyCode eq districtEntity.id}">selected="selected" </c:if>>${districtEntity.regionName}</option>
                            </c:forEach>
                        </c:if>
                    </select>
                </span>
            </td>
        </tr>
        <tr>
            <td class="tableleft">详细地址</td>
            <td>
                <textarea id="address" name="address" class="required">${site.serviceSiteAddress}</textarea>
            </td>
        </tr>
        <tr>
            <td class="tableleft">排序值</td>
            <td>
                <input id="orderIndex" name="orderIndex" class="required digits" ${site.seqKey}>
            </td>
        </tr>
        <tr>
            <td class="tableleft"></td>
            <td>
                <a id="sbtn" class="btn btn-primary">保存</a> &nbsp;&nbsp;
                <button type="button" class="btn btn-success" onclick="javascript:history.go(-1);">返回列表</button>
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript">
    function loadCity(provinceCode) {
        //clear city and district list
        $("#firstCityValue").siblings().remove();
        $("#firstDistrictValue").siblings().remove();
        $.post("${ctx}/basedata/region/children/load",{regionId:provinceCode},function(result){
            var data = eval(result);
            if(data.status_code == "1") {
                $.each(data.result,function(i,entity) {
                    var opt = '<option value="' + entity.id + '">' + entity.regionName + '</option>';
                    $(opt).insertAfter("#firstCityValue");
                });
            }
        });
    }
    function loadDistrict(cityCode) {
        //clear district list
        $("#firstDistrictValue").siblings().remove();
        $.post("${ctx}/basedata/region/children/load",{regionId:cityCode},function(result){
            var data = eval(result);
            if(data.status_code == "1") {
                $.each(data.result,function(i,entity) {
                    var opt = '<option value="' + entity.id + '">' + entity.regionName + '</option>';
                    $(opt).insertAfter("#firstDistrictValue");
                });
            }
        });
    }
    $(function() {
       $("#sbtn").bind("click",function() {
           var siteName = $("#siteName").val();
           var contactName = $("#contactName").val();
           var tel = $("#tel").val();
           var countryCode = $("#countryCode").val();
           var provinceCode = $("#province").val();
           var cityCode = $("#city").val();
           var districtCode = $("#district").val();
           var address = $("#address").val();
           var orderIndex = $("#orderIndex").val();
           var data = {
               siteId:$("#siteId").val(),
               siteName:siteName,
               contactName:contactName,
               phone:tel,
               countryCode:countryCode,
               provinceCode:provinceCode,
               cityCode:cityCode,
               districtCode:districtCode,
               address:address,
               orderIndex:orderIndex
           };
           if(validateForm("#createForm")) {
               $.post("${ctx}/basedata/servicesite/edit",data,function(result){
                   if(result.status_code == "1") {
                       window.location.href = "${ctx}/basedata/servicesite/list";
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