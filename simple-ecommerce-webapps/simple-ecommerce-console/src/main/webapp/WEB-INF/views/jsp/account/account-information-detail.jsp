<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>${platform_title}-查看会员信息</title>
    <%@ include file="/common/meta.jsp" %>
    <%@ include file="/common/link.jsp" %>
</head>
<body>
<div class="container">
    <div class="detail-page">
        <h2>会员详细信息</h2>
        <div class="detail-section">
            <h3>基本信息</h3>
            <div class="row detail-row">
                <c:if test="${not empty account}">
                    <table class="table table-bordered table-hover definewidth m10">
                        <thead>
                        <tr>
                            <th><em>登录名</em></th>
                            <th><em>昵称</em></th>
                            <th><em>注册类型</em></th>
                            <th><em>会员状态</em></th>
                            <th><em>所属国家</em></th>
                            <th><em>设备序列号</em></th>
                            <th><em>接口访问Key</em></th>
                            <th><em>注册日期</em></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <span class="detail-text">${account.accountName}</span>
                            </td>
                            <td>
                                <span class="detail-text">${account.nickName}</span>
                            </td>
                            <td>
                                <span class="detail-text">
                                    <fmt:message key="def.account.register.type.${account.registerType.code}.name" bundle="${def}"/>
                                </span>
                            </td>
                            <td>
                                <span class="detail-text">
                                    <fmt:message key="def.account.status.${account.accountStatus.code}.name" bundle="${def}"/>
                                </span>
                            </td>
                            <td>
                                <span>${country.countryName}</span>
                            </td>
                            <td>
                                <span>${account.serialNumber}</span>
                            </td>
                            <td>
                                <span>${account.accessToken}</span>
                            </td>
                            <td>
                                <span>
                                    <fmt:formatDate value="${account.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                </span>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>
        <div class="detail-section">
            <h3>其他信息</h3>
            <div class="row detail-row">
                <c:if test="${not empty profile}">
                    <form id="packagesForm">
                        <table class="table table-bordered table-hover definewidth m10">
                            <thead>
                            <tr>
                                <th><em>真实姓名</em></th>
                                <th><em>性别</em></th>
                                <th><em>生日</em></th>
                                <th><em>手机号码</em></th>
                                <th><em>邮箱</em></th>
                                <th><em>地址</em></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                    <span class="detail-text">${profile.realName}</span>
                                </td>
                                <td>
                                    <span class="detail-text">${profile.sex}</span>
                                </td>
                                <td>
                                    <span class="detail-text">
                                        <c:if test="${not empty profile.birthDate}">
                                            <fmt:formatDate value="${profile.birthDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        </c:if>
                                    </span>
                                </td>
                                <td>
                                    <span class="detail-text">${profile.phone}</span>
                                </td>
                                <td>
                                    <span class="detail-text">${profile.verifyEmail}</span>
                                </td>
                                <td>
                                    <span class="detail-text">${profile.address}</span>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </c:if>
            </div>
        </div>

    </div>
    <button type="submit" class="btn btn-success" onclick="javascript:history.go(-1);">返回</button>
</div>
</body>
</html>