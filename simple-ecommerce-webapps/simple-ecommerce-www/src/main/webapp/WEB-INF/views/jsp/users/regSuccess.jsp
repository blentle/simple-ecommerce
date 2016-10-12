<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>注册成功</title>
    <meta charset="utf-8"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <%@include file="/commons/include.rec.jsp" %>

    <script type="text/javascript">

        function findMemberMail(memberMail) {
            $ajax({
                url: "/users/findMemberMail",
                type:"post",
                dataType:"json",
                data:{"memberMail":memberMail},
                success: function(data){
                    if(data.rs!=0){
                        alert('该邮箱已经注册');
                        // $("#outstoregoodsid").html(str);
                        $("#memberMail").val("");//清空
                        $("#memberMail").focus();
                    }

                },
                error:function(data){
                    alert("错误");
                }
            });

        }
    </script>
</head>
<body>
<div class="topB">
    <c:if test="${member!=null}">
	<p>
		<i>
			<a href="##">${member.memberNickname}</a>，欢迎您！　　　
			<a href="/users/order">个人中心</a>
			｜
			<a href="users/logout">退出</a>
		</i>
	</p>
	</c:if>
	<c:if test="${member==null}">
		<p>
			<i>
				<a href="/en">EN</a>
				｜
				<a href="/users/login">登录</a>
				｜
				<a href="/users/reg">注册</a>
			</i>
		</p>
	</c:if>

    <div>
        <a class="logo"><img src="${CONTEXT_PATH}/static/img/logo.png"/></a>
        <b>欢迎注册</b>
    </div>
</div>
<form name="mailVerifyForm" action="/users/mailVerify" method="post">
    <input type="hidden" name="remark1" value="${mailVcode}">
    <input type="hidden" name="memberId" value="${memberId}">
    <table class="welRegister">
        <tr>
            <th rowspan="4">√</th>
            <td><b>${message} </b></td>
        </tr>
        <tr>
            <td>
                <div class="space40"></div>
                <button class="btn">立即购物</button>
                <div class="space20"></div>
            </td>
        </tr>
        <tr>
            <td><i>您的昵称：***会展示在页面顶部和商品评价等地方，如不希望暴露，建议您：</i><a>修改昵称</a></td>
        </tr>
        <tr>
            <td>
			<span>
				<b>超过 80% 的用户选择了立即验证邮箱，账户更安全购物更放心。</b>
				<div class="space"></div>
				<font>您的邮箱：</font><input type="text" name="memberMail" id="memberMail" onchange="findMemberMail(this.value)"><button class="btn" type="submit">发送验证邮件</button>
			</span>
            </td>
        </tr>
    </table>
</form>

<div class="bottom">
    <dl>
        <dt>
            版权所有：1998-2014 悠游集团　<a>法律公告</a>　｜　<a>隐私保护</a>　　Boss网京ICP备11035381
        </dt>
        <dd>
            <a>满意度调查</a>　｜　<a>联系我们</a>　｜　<a>工作机会</a>　｜　<a>合作伙伴认证</a>　｜　<a>帮助中心</a>
        </dd>
    </dl>
</div>


</body>
</html>