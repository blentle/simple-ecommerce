<%@ page contentType="text/html;charset=UTF-8" %>
<div class="top">
    <p>
        <i>
            <a href="${ctx}/trolley/goods/show"><img src="${ctx}/static/img/topcoin_shoppingcar.png"  class="topcar" /></a>
            <c:choose>
              <c:when test="${userSession != null}">
                  ${userSession.account.nickName}，欢迎来到悠悠宝！
                  <a href="${ctx}/logout">[退出]</a>
                  ｜
                  <a href="${ctx}/account/center">个人中心</a>
              </c:when>
              <c:otherwise>
                  <a href="${ctx}/login">登录</a>｜<a href="${ctx}/register/page">注册</a>
              </c:otherwise>
            </c:choose>
        </i>
    </p>
    <div>
        <a class="logo"><img src="${ctx}/static/img/logo.png" /><button class="logoen">Eglish</button></a>
        <dl>
            <dt><input type="text" placeholder="搜索关键字" /><button></button></dt>
            <dd>
                <a href="##">香港套餐</a>
                <a href="##">澳门套餐</a>
                <a href="##">热门套餐</a>
                <a href="##">热门搜索词</a>
            </dd>
        </dl>
    </div>
</div>