<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/commons/include.rec.jsp"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>用户注册</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
        function checkMobile(){

            var obj = document.getElementById('memberCoutry'); //定位id
            var ind = obj.selectedIndex; // 选中索引
            var svalue = obj.options[ind].value; // 选中值
            var sMobile = document.form.memberMobilePhone.value
           // alert(svalue);
            if(svalue=='中国大陆'){
                if(!(/^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/.test(sMobile))){
                    document.getElementById('phoneError').innerHTML="非大陆手机号";
                    document.form.memberMobilePhone.focus();
                    return false;
                }
            }
            if(svalue=='香港'){
                if(!(/^\d{8}$/.test(sMobile))){
                    document.getElementById('phoneError').innerHTML="非香港手机号";
                    document.form.memberMobilePhone.focus();
                    return false;
                }
            }
            if(svalue=='台湾'){
                if(!(/^\d{10}$/.test(sMobile))){
                    document.getElementById('phoneError').innerHTML="非台湾手机号";
                    document.form.memberMobilePhone.focus();
                    return false;
                }
            }
            var xz=document.getElementById('xz');
            if(xz.checked==false){
                document.getElementById('message').innerHTML="请勾选服务条款";
                return false;
            }
            return true;

        }

	</script>
  </head>
<body>
<div class="topS">
    <div>
        <a class="logo"><img src="${CONTEXT_PATH}/static/img/logo.png" /></a>
        <c:if test="${member.memberNickname!=null}">
	<p>
		<i>
			<a href="##">${member.memberNickname}</a>，欢迎您！　　　
			<a href="/users/order">个人中心</a>
			｜
			<a href="users/logout">退出</a>
		</i>
	</p>
	</c:if>
	<c:if test="${member.memberNickname==null}">
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
    </div>
</div>
<div class="mainHome">
    <div>
        <form:form name="form"  method="post"
                   modelAttribute="member" onsubmit="return checkMobile();">
            <input type="hidden" name="locale" value="zh">
        <div class="homePanel rn">
            <h2>注册</h2>
            <div class="formList">
                <div class="formRow formRowBorder">
                    <b>国家地区</b>
                    <div>
                        <select name="memberCoutry" id="memberCoutry">
                            <option value="中国大陆">中国大陆</option>
                            <option value="香港">香港</option>
                            <option value="台湾">台湾</option>
                        </select>
                    </div>
                </div>
                <div id="phoneError" style="color: #ff0000;height: 22px;margin-top: 0px"  align="center"></div>
                <div class="formRow formRowBorder">
                    <b>手机号码</b>
                    <div><input type="text"name="memberMobilePhone" id="memberMobilePhone" /></div>
                </div>
                <div style="color: #ff0000;height: 22px;margin-top: 0px"  align="center">
                    <form:errors path="memberPassword"></form:errors>
                </div>
                <div class="formRow formRowBorder">
                    <b>密码</b>
                    <div><input type="password" name="memberPassword"/></div>
                </div>
                <div style="color: #ff0000;height: 22px;margin-top: 0px"  align="center">
                </div>
                <div class="formRow">
                    <b>验证码</b>
                    <div><input type="text" /></div>
                    <div><button>免费获取</button></div>
                </div>
                <div style="color: #ff0000;height: 22px;margin-top: 0px"  align="center">
                        ${message}
                </div>
                <div class="formRow">
                    <input name="xz" id="xz" type="checkbox" checked="checked" />我已阅读并同意 <a href="">用户协议</a> 和 <a href="">会员条款</a>
                </div>
                <div style="color: #ff0000;height: 22px;margin-top: 0px"  align="center">
                </div>
                <input  type="submit" value="立即注册" />
            </div>
        </div>
        </form:form>
    </div>
</div>
<div class="bottomS">
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