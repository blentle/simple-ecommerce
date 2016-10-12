<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-采购单</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>
<body>
	<form class="form-inline definewidth m20">
	    <table class="table" width="100%">
	        <tr>
	            <td width="15%">商品名称 ：<input type="text" id="goodsName"></td>
	            <td width="10%">商品类型：
	            	<select id="goodsType" onchange="setPackage(this.value);">
	            		<option value="">请选择</option>
				    	<c:forEach var="item" items="${goodsTypes}">
				    		<option value="${item.code}"><fmt:message key="def.goods.type.${item.code}.name" bundle="${def}"/></option>
				    	</c:forEach>	
	            	</select>
	            </td>
	            <td width="10%">国家：
	            	<select id="countryCode" onchange="loadOperator(this.value);">
	                    <option value="">请选择</option>
	                    <c:if test="${not empty countryList}">
	                        <c:forEach var="item" items="${countryList}">
	                            <option value="${item.countryCode}">${item.countryName}</option>
	                        </c:forEach>
	                    </c:if>
	                </select>
	            </td>
	            <td id="operatorTD" width="15%">运营商:
	            	<select id="operatorId" onchange="loadStore(this.value);">
	                    <option value="">请选择</option>
	                    <c:if test="${not empty operatorList}">
	                        <c:forEach var="item" items="${operatorList}">
	                            <option value="${item.id}">${item.operatorName}</option>
	                        </c:forEach>
	                    </c:if>
	                </select>
	            </td>
	            <td id="storeTD" width="20%">店铺：
	            	<select id="storeId" onchange="loadPackage(this.value);">
	                    <option value="">请选择</option>
	                    <c:if test="${not empty storeList}">
	                        <c:forEach var="item" items="${storeList}">
	                            <option value="${item.id}">${item.storeName}</option>
	                        </c:forEach>
	                    </c:if>
	                </select>
	            </td>
	            <td id="packageTD" width="20%">套餐：
	            	<select id="packageId">
	                    <option value="">请选择</option>
	                    <c:if test="${not empty packageList}">
	                        <c:forEach var="item" items="${packageList}">
	                            <option value="${item.id}">${item.packagesName}</option>
	                        </c:forEach>
	                    </c:if>
	                </select>
	            </td>
	            <td width="10%">
	            	<button type="button" class="btn btn-success" id="addnew" onclick="addTR();">添加</button>
	            </td>
	        </tr>
	    </table>
   </form> 
<form id="purchaseform" class="form-inline definewidth m20" action="${ctx}/purchase/add" method="post">
	<input type="hidden" value="${purchaseCode}" />
	<table class="table table-bordered table-hover definewidth m10" width="100%">
	    <thead id="addDataHtml">
	    <tr>
	        <th>商品名称</th>
	        <th>商品类型</th>
	        <th>国家</th>
	        <th>运营商</th>
	        <th>店铺</th>
	        <th>套餐</th>
	        <th>申请数量</th>
	        <th>操作</th>
	    </tr>
	    </thead>
	    <c:forEach items="${purDetailList}" var="item" varStatus="st">
		    <tr id="del${st.index}">
		        <td>${item.detail.goodsName}<input type="hidden" name="purDetailArray[${st.index}].goodsName" value="${item.detail.goodsName}" /></td>
		        <td>${item.detail.goodsType}<input type="hidden" name="purDetailArray[${st.index}].goodsType" value="${item.detail.goodsName}" /></td>
		        <td>${item.country.countryName}<input type="hidden" name="purDetailArray[${st.index}].countryCode" value="${item.detail.goodsName}" /></td>
		        <td>${item.operator.operatorName}<input type="hidden" name="purDetailArray[${st.index}].operatorId" value="${item.detail.goodsName}" /></td>
		        <td>${item.store.storeName}<input type="hidden" name="purDetailArray[${st.index}].storeId" value="${item.detail.goodsName}" /></td>
		        <td>${item.packages.packagesName}<input type="hidden" name="purDetailArray[${st.index}].relationId" value="${item.detail.goodsName}" /></td>
		        <td><input name="purDetailArray[${st.index}].applyNum" type="text" class="required" value="${item.detail.applyNum}"/></td>
		        <td><a href="javascript:void(0)" onclick="removeTR('del${st.index}')" >删除</a></td>
		    </tr>
    	</c:forEach>
	</table>
	<br/>
	<p>&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="history.go(-1);" class="btn btn-success">返回</button>
	   &nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="addPurchase();" class="btn btn-success">生成采购单</button>
	</p>
</form>


<script type="text/javascript">
	
	function setPackage(goodsType){
		if(goodsType=="card"){
			$("#operatorTD").hide();
			$("#storeTD").hide();
			$("#packageTD").hide();
		}else if(goodsType=="number"){
			$("#operatorTD").show();
			$("#storeTD").show();
			$("#packageTD").hide();
		}else if(goodsType=="package"){
			$("#operatorTD").show();
			$("#storeTD").show();
			$("#packageTD").show();
		}
	}

	function loadOperator(countryCode){
		var options = '<option value="">请选择</option>';
		$("#storeId").html(options); 
		$("#packageId").html(options);
		if(countryCode){
			$.post("${ctx}/basedata/operator/loadbycountry",{countryCode:countryCode},function(result) {
	            var data = eval(result);
	            if(data.status_code == '1') {
	            	
	            	if(data.result){
		                $.each(data.result,function(index,entity) {
		                   options += '<option value="'+ entity.id +'">'+ entity.operatorName +'</option>'
		                });
	            	}
	            	$("#operatorId").html(options);
	            }
	        });
		}else{
			$("#operatorId").html(options);
		}
	}

	function loadStore(operatorId){
		var options = '<option value="">请选择</option>';
		$("#packageId").html(options);
		if(operatorId){
			$.post("${ctx}/store/store/loadbyoperator",{operatorId:operatorId},function(result) {
	            var data = eval(result);
	            if(data.status_code == '1') {
	            	
	            	if(data.result){
		                $.each(data.result,function(index,entity) {
		                   options += '<option value="'+ entity.id +'">'+ entity.storeName +'</option>'
		                });
	            	}
	            	$("#storeId").html(options);
	            }
	        });
		}else{
			$("#storeId").html(options);   
		}
	}
	
	function loadPackage(storeId){
		var options = '<option value="">请选择</option>';
		if(storeId){
			$.post("${ctx}/store/packages/loadbystore",{storeId:storeId},function(result) {
	            var data = eval(result);
	            if(data.status_code == '1') {
	                
	                if(data.result){
		                $.each(data.result,function(index,entity) {
		                   options += '<option value="'+ entity.id +'">'+ entity.packagesName +'</option>'
		                });
	                }
	                $("#packageId").html(options);
	            }
	        });
		}else{
			$("#packageId").html(options);
		}
	}
	 var num = 0;
	 if(!"${purchaseCode}"){
		num = ${fn:length(purDetailList)};
	 }
     function addTR(){
         var goodsName=$("#goodsName").val();
         var goodsType=$("#goodsType").val();
         var goodsTypeName=$("#goodsType option[value='"+goodsType+"']").text();
         var countryCode=$("#countryCode").val();
         var countryName=$("#countryCode option[value='"+countryCode+"']").text();
         var operatorId=$("#operatorId").val();
         var operatorName=operatorId==""?"":$("#operatorId option[value='"+operatorId+"']").text();
         var storeId=$("#storeId").val();
         var storeName=storeId==""?"":$("#storeId option[value='"+storeId+"']").text();
         var relationId=$("#packageId").val();
         var relationName=relationId==""?"":$("#packageId option[value='"+relationId+"']").text();

         if(!goodsName){
			alert("请输入商品名称");
			return false;
         }
         if(!goodsType){
        	alert("请选择商品类型");
 			return false;
         }
         if(!countryCode){
         	alert("请选择国家");
  			return false;
         }
         if(goodsType!="card"){
        	 if(!operatorId){
     			alert("请选择运营商");
     			return false;
              }
              if(!storeId){
             	alert("请选择店铺");
      			return false;
              }
              if(goodsType=="package"){
            	  if(!relationId){
            	  	alert("请选择套餐");
        			return false;
            	  }
              }
         }
         var html ="<tr id='del"+num+"'>";
         html += "<td>" + goodsName + "<input name='purDetailArray["+num+"].goodsName' type='hidden' value='"+goodsName+"'/> </td>";
         html += "<td>" + goodsTypeName + "<input name='purDetailArray["+num+"].goodsType' type='hidden' value='"+goodsType+"'/></td>";
         html += "<td>" + countryName + "<input name='purDetailArray["+num+"].countryCode' type='hidden' value='"+countryCode+"'/></td>";
         html += "<td>" + operatorName + "<input name='purDetailArray["+num+"].operatorId' type='hidden' value='"+operatorId+"'/></td>";
         html += "<td>" + storeName + "<input name='purDetailArray["+num+"].storeId' type='hidden' value='"+storeId+"'/></td>";
         html += "<td>" + relationName + "<input name='purDetailArray["+num+"].relationId' type='hidden' value='"+relationId+"'/></td>";
         html += "<td><input name='purDetailArray["+num+"].applyNum' type='text' class='required' /></td> ";
         html += "<td><a href=\"javascript:void(0)\" onclick=\"removeTR(\'del"+num+"\')\">删除</a></td>";
         html += "</tr>";
         $("#addDataHtml").after(html);
         num++;
     }
     function removeTR(obj){
         $("#"+obj).remove();
     }

     function addPurchase(){
		if(validateForm("#purchaseform")){
			if($("input[name^='purDetailArray']").length>0){
				$("#purchaseform").submit();
			}
		}	
     }

</script>
</body>
</html>