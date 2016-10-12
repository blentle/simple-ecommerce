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
                        alert('This email has been registered');
                        // $("#outstoregoodsid").html(str);
                        $("#memberMail").val("");//清空
                        $("#memberMail").focus();
                    }

                },
                error:function(data){
                    alert("error");
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
			<a href="/users/order?language=en">personal center</a>
			｜
			<a href="users/logout?language=en">logout</a>
		</i>
	</p>
	</c:if>
	<c:if test="${member==null}">
		<p>
			<i>
				<a href="/">CN</a>
				｜
				<a href="/users/login?language=en">login</a>
				｜
				<a href="/users/reg?language=en">register</a>
			</i>
		</p>
	</c:if>

    <div>
        <a class="logo"><img src="${CONTEXT_PATH}/static/img/logo.png"/></a>
        <b>welcome register</b>
    </div>
</div>
<form name="mailVerifyForm" action="/users/mailVerify" method="post">
    <input type="hidden" name="remark1" value="${mailVcode}">
    <input type="hidden" name="language" value="en"/>
    <input type="hidden" name="memberId" value="${memberId}">
    <table class="welRegister">
        <tr>
            <th rowspan="4">√</th>
            <td><b>${message} </b></td>
        </tr>
        <tr>
            <td>
                <div class="space40"></div>
                <button class="btn">shopping immediately</button>
                <div class="space20"></div>
            </td>
        </tr>
        <tr>
            <td><i>Your nickname: * * * will be displayed at the top of the page and the place such as evaluation, such as do not want to expose, suggest you：</i><a>edit username</a></td>
        </tr>
        <tr>
            <td>
			<span>
				<b>More than 80% of users chose to immediately verify the mailbox, account safer shopping more at ease.</b>
				<div class="space"></div>
				<font>your email：</font><input type="text" name="memberMail" id="memberMail" onchange="findMemberMail(this.value)"><button class="btn" type="submit">send email</button>
			</span>
            </td>
        </tr>
    </table>
</form>
	<%@include file="/commons/usersbottom.rec.en.jsp"  %>


</body>
</html>