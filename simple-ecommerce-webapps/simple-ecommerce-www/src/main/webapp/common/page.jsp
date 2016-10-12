<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%@ taglib prefix="pg" uri="/WEB-INF/tags/pager-taglib.tld" %>

<script type="text/javascript">
    $(document).ready(function() {
        $("#goPageSet").live('keydown keyup', function(e) {
            if (e.which == 13) {
                gopagecom2($("#goPageUrl").val());
            }
        })
    })
    function gopagecom(pageUrl) {

        if (pageUrl != null && pageUrl != "") {
            var url = pageUrl.substring(0, pageUrl.indexOf("?"));
            var paramstr = pageUrl.substring(pageUrl.indexOf("?") + 1, pageUrl.length); //参数字符串
            var paramarr = paramstr.split("&");//参数数组

            var goPageForm = document.createElement("FORM");
            document.body.appendChild(goPageForm);
            for (var i = 0; i < paramarr.length; i++) {
                var paramandvalue = paramarr[i];
                var paramname = paramandvalue.substring(0, paramandvalue.indexOf("="));
                var paramvalue = paramandvalue.substring(paramandvalue.indexOf("=") + 1, paramandvalue.length);
                var paramHidden = null;
                if (window.navigator.userAgent.indexOf("MSIE") >= 1 || !!window.ActiveXObject || "ActiveXObject" in window) {//ie
                	paramHidden = document.createElement("input");
                    paramHidden.name = paramname;
                    paramHidden.type = "hidden";
                    paramHidden.value = paramvalue;
                } else {
                    if (navigator.userAgent.indexOf("Firefox") > 0) {//fox
                        paramHidden = document.createElement("input");
                        paramHidden.setAttribute("type", "hidden");
                        paramHidden.setAttribute("name", paramname);
                        paramHidden.setAttribute("value", paramvalue);
                    } else
                    if (navigator.userAgent.indexOf("Chrome") > 0) {//fox
                        paramHidden = document.createElement("input");
                        paramHidden.setAttribute("type", "hidden");
                        paramHidden.setAttribute("name", paramname);
                        paramHidden.setAttribute("value", paramvalue);
                    }else
                    {
                    	 paramHidden = document.createElement("input");
                         paramHidden.setAttribute("type", "hidden");
                         paramHidden.setAttribute("name", paramname);
                         paramHidden.setAttribute("value", paramvalue);
                    }
                }
                goPageForm.appendChild(paramHidden);
            }
            goPageForm.method = "post";
            goPageForm.action = url;
            goPageForm.submit();
        }
    }

    function gopagecom2(pageUrl) {
        var goPageSets = document.getElementsByName("goPageSet");
        var goPageSet = null;
        if (goPageSets.length > 1) {
            for (var i = 0; i < goPageSets.length; i++) {
                if (goPageSets[i].value != "" && goPageSets[i].value != null) {
                    goPageSet = goPageSets[i].value;
                }
            }
        } else {
            goPageSet = goPageSets[0].value;
        }

        if (!checkNumberPage(goPageSet)) {
            alert("请输入整页数");
//            document.getElementById("goPageSet").focus();
            var goPageSets = document.getElementsByName("goPageSet");
            for (var i = 0; i < goPageSets.length; i++) {
                if (goPageSets[i].value != "" && goPageSets[i].value != null) {
                    goPageSets[i].focus();
                }
            }

            return;
        }
        var pageMaxItems = document.getElementById("maxPageItems").value;

        if (pageUrl != null && pageUrl != "") {
            var url = pageUrl.substring(0, pageUrl.indexOf("?"));
            var paramstr = pageUrl.substring(pageUrl.indexOf("?") + 1, pageUrl.length); //参数字符串
            var paramarr = paramstr.split("&");//参数数组

            var goPageForm = document.createElement("FORM");
            document.body.appendChild(goPageForm);
            for (var i = 0; i < paramarr.length; i++) {
                var paramandvalue = paramarr[i];
                var paramname = paramandvalue.substring(0, paramandvalue.indexOf("="));
                var paramvalue = paramandvalue.substring(paramandvalue.indexOf("=") + 1, paramandvalue.length);
                if (paramname == "pager.offset") {
                    paramvalue = (goPageSet - 1) * pageMaxItems;
                }

                var paramHidden = null;
                if (window.navigator.userAgent.indexOf("MSIE") >= 1 || !!window.ActiveXObject || "ActiveXObject" in window) {//ie
                    paramHidden = document.createElement("input");
                    paramHidden.name = paramname;
                    paramHidden.type = "hidden";
                    paramHidden.value = paramvalue;
                } else {
                    if (navigator.userAgent.indexOf("Firefox") > 0) {//fox
                        paramHidden = document.createElement("input");
                        paramHidden.setAttribute("type", "hidden");
                        paramHidden.setAttribute("name", paramname);
                        paramHidden.setAttribute("value", paramvalue);
                    } else {
                        if (navigator.userAgent.indexOf("Firefox") > 0) {//fox
                            paramHidden = document.createElement("input");
                            paramHidden.setAttribute("type", "hidden");
                            paramHidden.setAttribute("name", paramname);
                            paramHidden.setAttribute("value", paramvalue);
                        } else
                        if (navigator.userAgent.indexOf("Chrome") > 0) {//fox
                            paramHidden = document.createElement("input");
                            paramHidden.setAttribute("type", "hidden");
                            paramHidden.setAttribute("name", paramname);
                            paramHidden.setAttribute("value", paramvalue);
                        }else
                        {
                        	paramHidden = document.createElement("input");
                            paramHidden.setAttribute("type", "hidden");
                            paramHidden.setAttribute("name", paramname);
                            paramHidden.setAttribute("value", paramvalue);
                        }
                    }
                }
                goPageForm.appendChild(paramHidden);
            }
            goPageForm.method = "post";
            goPageForm.action = url;
            goPageForm.submit();
        }
    }

    function checkNumberPage(str) {
        var i;
        var len = str.length;
        if (len <= 0) {
            return false;
        }

        var chkStr = "1234567890";
        if (len == 1) {
            if (chkStr.indexOf(str.charAt(i)) < 0) {
                return false;
            }
        } else {
            if ((chkStr.indexOf(str.charAt(0)) < 0)) {
                return false;
            }
            for (i = 1; i < len; i++) {
                if (chkStr.indexOf(str.charAt(i)) < 0) {
                    return false;
                }
            }
        }
        return true;
    }
</script>

<input type="hidden" id="maxPageItems" name="maxPageItems" value="${page.pageSize}">
<dl class="pageNum">
<pg:index export="total=itemCount,pages,items">

    <c:choose>
        <c:when test="${1 eq currentPageNumber }">
            <dt>首页</dt>
        	<dt>&lt;上一页</dt>
        </c:when>
        <c:otherwise>
            <pg:first>
                <dt onclick="gopagecom('${pageUrl}')">首页</dt>
            </pg:first>
            <pg:prev>
                <dt onclick="gopagecom('${pageUrl}')">上一页</dt>
            </pg:prev>
        </c:otherwise>
    </c:choose>
    <pg:pages>
        <c:choose>
            <c:when test="${pageNumber eq currentPageNumber }">
                <dt class="sel">${pageNumber }</dt>
            </c:when>
            <c:otherwise>
                <dt onclick="gopagecom('${pageUrl}')">${pageNumber}</dt>
            </c:otherwise>
        </c:choose>
    </pg:pages>
    <c:choose>
        <c:when test="${pages eq currentPageNumber }">
           <dt>下一页&gt;</dt>
           <dt>尾页</dt>
        </c:when>
        <c:otherwise>
            <pg:next>
                <dt onclick="gopagecom('${pageUrl}')">下一页&gt;</dt>
            </pg:next>
            <pg:last>
                <dt onclick="gopagecom('${pageUrl}')">尾页</dt>
            </pg:last>
        </c:otherwise>
    </c:choose>
    <dd>共 ${pages}页， 跳转到：</dd>
    <pg:page>
        <dt><input type="text" name="goPageSet" id="goPageSet" /></dt>
        <input type="hidden" value="${pageUrl}" name="goPageUrl" id="goPageUrl">
        <dt onclick="gopagecom2('${pageUrl}')">GO</dt>
    </pg:page>
</pg:index>
</dl>