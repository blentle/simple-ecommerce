<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-录入入库明细</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
    <script type="text/javascript" src="${ctx}/static/js/entrybill-goods-detail.js"></script>
</head>
<body>
<table class="table">
    <tr>
        <%--<td><button type="submit" class="btn btn-primary" onclick="downloadTemplate('${ctx}','${entryDetail.goodsType.code}');">下载Excel模板</button></td>--%>
        <%--<td><button type="submit" class="btn btn-primary" onclick="imortGoodsDetailData('${ctx}',${entryDetail.id});">导入Excel数据</button></td>--%>
        <td><a class="btn btn-success" href="${ctx}/entry/preentry/${entryDetail.purchaseCode}">返回</a></td>
    </tr>
    <tr>
        <td colspan="3">
            <div id="errMsg">
                <span id="firstMsg"></span>
            </div>
        </td>
    </tr>
</table>
<form id="createForm" class="form-inline definewidth m20">
    <table class="table">
        <tr>
            <th>手机号码</th>
            <th>是否绑定卡贴</th>
            <th>绑定卡贴号</th>
            <th>是否绑定套餐</th>
            <th></th>
        </tr>
        <tr>
            <td><input id="mobile" type="text" name="mobile" class="required"></td>
            <td>
                <input  type="radio" name="bindCard" value="n" checked/>否
                <input  type="radio" name="bindCard" value="y"/>是
            </td>
            <td>
                <input id="cardNo"  type="text" name="cardNo"/>(<span class="emphasize">未绑定可不填写</span>)
            </td>
            <td>
                <input  type="radio" name="bindPackages" value="n" checked/>否
                <input  type="radio" name="bindPackages" value="y"/>是
            </td>
            <td></td>
        </tr>
        <tr>
            <th>绑定套餐</th>
            <th>靓号类型</th>
            <th>价格</th>
            <th>靓号价格</th>
            <th></th>
        </tr>
        <tr>
            <td>
                <span>
                   <select id="packagesId">
                       <option value="0">未绑定</option>
                       <c:if test="${not empty packagesList}">
                           <c:forEach items="${packagesList}" var="entity">
                               <option value="${entity.id}">${entity.packagesName}</option>
                           </c:forEach>
                       </c:if>
                   </select>
                </span>
                (<span class="emphasize">未绑定请选择未绑定</span>)
            </td>
            <td>
                <select id="liangType">
                    <c:if test="${not empty liangTypeList}">
                        <c:forEach items="${liangTypeList}" var="entity">
                            <c:if test="${entity.code ne 'def'}">
                                <option value="${entity.code}" <c:if test="${entity eq commonLiangType}"> selected="selected" </c:if>><fmt:message key="def.mobile.number.type.${entity.code}.name" bundle="${def}"/></option>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </select>
            </td>
            <td><input id="price" type="text" name="price" class="required number"/></td>
            <td><input id="prettyPrice" type="text" name="prettyPrice"/></td>
            <td><a type="submit" onclick="createMobileDetail();" class="btn btn-primary">确定录入</a></td>
        </tr>
    </table>
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
        <tr>
            <th><em>采购入库单号</em></th>
            <th><em>入库明细唯一标示</em></th>
            <th><em>商品类型</em></th>
            <th><em>手机号码</em></th>
            <th><em>是否绑定卡贴</em></th>
            <th><em>卡贴号码</em></th>
            <th><em>是否绑定套餐</em></th>
            <th><em>套餐ID</em></th>
            <th><em>靓号类型</em></th>
            <th><em>价格</em></th>
            <th><em>靓号价格</em></th>
            <th><em>数量</em></th>
            <th><em>操作</em></th>
        </tr>
    </thead>
    <tbody>
        <c:if test="${not empty pageInfo.list}">
            <c:forEach items="${pageInfo.list}" var="entity">
                <tr id="entry-goods-detail-${entity.id}">
                    <td><span>${entryDetail.purchaseCode}</span></td>
                    <td><span>${entryDetail.id}</span></td>
                    <td><span><fmt:message key="def.goods.type.${entity.goodsType.code}.name" bundle="${def}"/></span></td>
                    <td><span>${entity.phone}</span></td>
                    <td>
                        <span>
                            <c:choose>
                                <c:when test="${entity.bindCard}">
                                    是
                                </c:when>
                                <c:otherwise>
                                    否
                                </c:otherwise>
                            </c:choose>
                        </span>
                    </td>
                    <td><span>${entity.cardNo}</span></td>
                    <td>
                        <span>
                            <c:choose>
                                <c:when test="${entity.bindPackages}">
                                    是
                                </c:when>
                                <c:otherwise>
                                    否
                                </c:otherwise>
                            </c:choose>
                        </span>
                    </td>
                    <td><span>${entity.packagesId}</span></td>
                    <td><span><fmt:message key="def.mobile.number.type.${entity.prettyNumber.code}.name" bundle="${def}"/></span></td>
                    <td><span>${entity.price}</span></td>
                    <td><span>${entity.prettyPrice}</span></td>
                    <td><span>${entity.entryNum}</span></td>
                    <td>
                        <a class='btn btn-small btn-danger' href="javascript:void(0);" onclick="deleteEntryGoodsDetail('${ctx}',${entity.id});">删除</a>
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
        <pg:pager url="${ctx}/entry/entrybill/goods/detail/precreate/${entryDetail.id}"
                  items="${pageInfo.total}" isOffset="true"
                  maxPageItems="${pageInfo.pageSize}"
                  export="offset, currentPageNumber=pageNumber" scope="request">
            <pg:param name="maxPageItems" value="${page.pageSize}"/><!--不能缺少的-->
            <pg:param name="items" value="${pageInfo.total}"/>
            <%@ include file="/common/page.jsp" %>
        </pg:pager>
    </c:if>
</div>
</body>
<script type="text/javascript">
    function createMobileDetail() {
        if(validateForm("#createForm")) {
            var data = {
                purEntryDetailId:${entryDetail.id},
                mobile:$("#mobile").val(),
                bindCard:$("input[name='bindCard']:checked").val(),
                cardNo:$("#cardNo").val(),
                bindPackages:$("input[name='bindPackages']:checked").val(),
                packagesId:$("#packagesId").val(),
                liangType:$("#liangType").val(),
                prettyPrice:$("#prettyPrice").val(),
                price:$("#price").val()
            }
            $.post("${ctx}/entry/entrybill/goods/detail/mobile/create",data,function(result) {
                var data = eval(result);
                if(data.status_code == '1') {
                    window.location.reload();
                } else {
                    BUI.Message.Alert(data.msg,'error');
                }
            });
        }
    }
</script>
</html>