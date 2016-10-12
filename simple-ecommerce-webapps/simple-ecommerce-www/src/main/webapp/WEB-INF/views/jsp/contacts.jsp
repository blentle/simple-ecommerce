<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>${site_title} - 联系我们</title>
    <%@include file="/common/include.rec.jsp"  %>
</head>
<body>
<!-- 引用TOP -->
<%@include file="/common/topOne.rec.jsp" %>
<%@include file="/common/include.menu.rec.jsp" %>
<div class="contact">
    <div class="banner">
        <div class="board rs ss">
            <b>北京XX科技有限公司</b>
            <div class="space20"></div>
            <p>地址：北京海淀区成府路甲45好海升A座210
            <div class="space"></div>
            邮编：100083
            <div class="space"></div>
            客服电话：028-62997200<br>举报电话：028-26447896<br>公司电话：010-55779966
            <div class="space"></div>
            解封相关事宜，请到<br><a href="http://www.immomo.com/my">http://www.immomo.com/my</a><br>自助查询解封</p>
        </div>
    </div>
    <div class="mw">
        <div class="space50"></div>
        <table>
            <tr>
                <th>
                    <b class="space40 db">广告业务</b>
                    <i>联系人：张颖<br>邮箱：<a href="mailto:zhangying@immomo.conm">zhangying@immomo.conm</a></i>
                    <div class="space50"></div>
                    <b class="space40 db">商务洽谈</b>
                    <i>联系电话：400-800-4848<br>邮箱：<a href="mailto:shigesha@immomo.conm">shigesha@immomo.conm</a></i>
                    <div class="space50"></div>
                    <b class="space40 db">客服帮助</b>
                    <i>为及时解决您的问题，建议您通过客户端提交意见反馈，我们会在24小时内受理您的问题<br>1、客服热线：028-6631547875（服务时间8:30-22:00）<br>2、在XX科技官方微博留言@XX科技（<a
                            href="http://weibo.com/momotech">http://weibo.com/momotech</a>）</i>
                </th>
                <td>
                    <b class="space40 db tac">商务合作申请</b>
                    <div class="space50"><b>国家　</b><select><option>中国</option></select></div>
                    <div class="space50"><b>地区　</b><select><option>北京</option></select></div>
                    <div class="space50"><b>名称　</b><input type="text" /></div>
                    <div class="space50"><b>电话　</b><input type="text" /></div>
                    <div class="space50"><b>邮箱　</b><input type="text" /></div>
                    <div class="space100 tac" style="padding: 30px;"><input class="btn" type="button" value="立即申请" /></div>
                </td>
            </tr>
        </table>
    </div>
</div>
<!-- 引用bottom -->
<%@include file="/common/usersbottom.rec.jsp" %>
</body>
</html>