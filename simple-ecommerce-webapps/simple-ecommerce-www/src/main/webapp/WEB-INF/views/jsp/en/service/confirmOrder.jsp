<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>确认订单</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script type="text/javascript">

    </script>
    <style type="text/css">

    </style>
    <link href="${CONTEXT_PATH}/static/css/layout.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="container">
    <div id="header">
        <div id="header-1">EN|登陆|注册</div>
        <table border="0" width="100%">
            <tr>
                <td width="20%"><h1>悠游宝</h1></td>


                <td>
                    <form action="#" method="post">
                        <table align="center">
                            <tr>

                                <td><input style="width: 350px;height: 20px" name="search"/>
                                    <input type="submit" value="搜索">
                                </td>
                            </tr>
                            <tr>

                                <td align="center">

                                    热门搜索：

                                    <a href="#">香港套餐 </a>

                                    <a href="#">台湾套餐 </a>

                                    <a href="#">热卖排行 </a>

                                    <a href="#">选号入网 </a>
                                </td>
                            </tr>
                        </table>
                    </form>
                </td>
            </tr>

        </table>
    </div>
    <div class="clearfloat"></div>
    <div id="nav">
        <ul>
            <li><a href="http://localhost:8080">首页</a></li>
            <li><a href="/aboutyyb">关于悠游宝</a></li>
            <li><a href="/service">服务</a></li>
            <li><a href="/operators">运营商</a></li>
            <li><a href="/partners">合作商</a></li>
            <li><a href="/contacts">联系我们</a></li>
        </ul>
    </div>
    <div id="mainContent">
        <div id="main">
            <div class="mainbox">
                <h2>广告/充值</h2>
                <table border="0" width="100%" height="475">
                    <tr >

                        <td width="60%">
                            广告图片
                        </td>
                        <td>
                            <form action="#" method="post">
                            <table>
                                <tr>

                                    <td>
                                          充值提示
                                    </td>
                                    <td>
                                        充值提示
                                    </td>
                                </tr>
                                <tr>
                                   <td>充值号码：</td>
                                    <td>
                                         <input style="width: 150px"/>
                                    </td>

                                </tr>
                                <tr>
                                    <td>充值金额：</td>
                                    <td>
                                        <select style='width:157px;'>
                                            <option value="100">充值100元</option>
                                            <option value="90">充值90元</option>
                                            <option value="50">充值50元</option>
                                        </select>
                                    </td>

                                </tr>
                                <tr>

                                    <td>

                                    </td>
                                    <td>
                                            ￥90.00-99.99
                                    </td>
                                </tr>
                                <tr>

                                    <td colspan="2" align="center">
                                        <input type="button"  value="立即充值">
                                    </td>

                                </tr>
                                <tr style="height: 100px">

                                    <td >
                                        <input type="button"  value="我的订单">

                                    </td>
                                    <td >
                                        <input type="button"  value="预约中心">

                                    </td>
                                </tr>

                            </table>
                            </form>
                        </td>
                    </tr>

                </table>
            </div>
        </div>
        <div id="side">
            <div class="sidebox">
                <h4>更多套餐/更多号码</h4>
                <table width="100%">
                    <tr>
                        <td width="50%">
                           <table border="0">
                               <tr>
                                  <td rowspan="2" style="width: 400px;height: 470px">图片</td>
                                   <td width="200">套餐文字说明</td>
                               </tr>
                               <tr>
                                    <td>
                                    <input type="button"  value="更多套餐">
                                   </td>
                               </tr>
                           </table>

                        </td>
                        <td>
                            <table border="0">
                                <tr>
                                    <td rowspan="2" style="width: 400px;height: 470px">图片</td>
                                    <td width="200">号码文字说明</td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="button"  value="更多号码">
                                    </td>
                                </tr>
                            </table>

                        </td>
                    </tr>

                </table>
            </div>
        </div>
        <div id="side">
            <div class="sidebox">
                <h4>精选套餐</h4>
                <ul>块内容</ul>
            </div>
        </div>
        <div id="side">
            <div class="sidebox">
                <h4>热销号码</h4>
                <ul>块内容</ul>
            </div>
        </div>
    </div>
    <div class="clearfloat"></div>
    <div id="footer">


        版权所有：1998-2014 悠游集团 法律公告 | 隐私保护 Boss网京ICP备11035381 满意度调查 | 联系我们 | 工作机会 | 合作伙伴认证 | 帮助中心

    </div>
</div>

</body>
</html>