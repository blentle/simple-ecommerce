<%@ page contentType="text/html;charset=UTF-8" %>
<div class="menu">
    <div>
        <a href="${ctx}/index" <c:if test="${headerMenu == 'index'}">class="sel"</c:if>>首页</a>
        <a href="${ctx}/about" <c:if test="${headerMenu == 'about'}">class="sel"</c:if>>关于悠游宝</a>
        <a href="${ctx}/service/list" <c:if test="${headerMenu == 'service'}">class="sel"</c:if>>服务</a>
        <a href="${ctx}/operator" <c:if test="${headerMenu == 'operator'}">class="sel"</c:if>>运营商</a>
        <a href="${ctx}/partner" <c:if test="${headerMenu == 'partner'}">class="sel"</c:if>>合作商</a>
        <a href="${ctx}/contact" <c:if test="${headerMenu == 'contact'}">class="sel"</c:if>>联系我们</a>
    </div>
</div>
