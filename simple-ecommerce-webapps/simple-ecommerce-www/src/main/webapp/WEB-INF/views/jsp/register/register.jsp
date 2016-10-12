<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>${site_title} - 注册</title>
    <%@include file="/common/include.rec.jsp" %>
    <script type="text/javascript">
        $(function () {
            $(".ulyh li").each(function () {
                $(this).click(function () {
                    $(this).removeClass("lglinots").siblings().addClass("lglinots");
                    $("#user" + $(this).index()).show().siblings(".user").hide();
                });
            });
        });

        function register() {
            $(".user").each(function () {
                if($(this).is(":visible")){
                    if ($(this).attr("id") == 'user0') {
                        mobileRegister();
                    } else {
                        emailRegister();
                    }
                }
            });
        }

        function mobileRegister() {
            var phone = $.trim($("#phone").val());
            var password = $.trim($("#password").val());
            var validateCode = $("#validateCode").val();

            if(checkPassword(password) && checkMobile(phone)){
                $.post("/register/phone", {phone:phone,password:password,validateCode:validateCode}, function (resultJson) {
                    if(resultJson.status_code == '1'){
                        window.location.href="/register/success";
                    }else{
                        $("#errorTips").html(resultJson.msg);
                    }
                });
            }
        }

        function emailRegister() {
            var email = $.trim($("#email").val());;
            var pwd = $.trim($("#pwd").val());
            var countryCode = $("#countryCode").val();
            if(checkPassword(pwd) && checkEmail(email)){
                $.post("/register/email", {email:email,pwd:pwd,countryCode:countryCode}, function (resultJson) {
                    if(resultJson.status_code == '1'){
                        window.location.href="/register/success";
                    }else{
                        $("#errorTips").html(resultJson.msg);
                    }
                });
            }
        }

        var count = 60;
        function timerTrigger(){
            $("#errorTips").html(count+"秒后重新发送邀请码");
            count--;
            if(count <= 0){
                $("#errorTips").html("免费获取短信验证码");
                clearInterval(timerInterval);
                $("#phoneVerifyCode").attr("href","javascript:phoneVerifyCode()");
                count = 60;
            }
        }

        var timerInterval;
        function phoneVerifyCode(){
            var phone = $("#phone").val();
            $.post("/verify/code/phone", {phone:phone}, function (resultJson) {
                if(resultJson.status_code == '1'){
                    $("#validateCode").val(resultJson.msg);
                    $("#phoneVerifyCode").attr("href","#");
                    timerInterval = setInterval("timerTrigger()",1000);
                }else{
                    $("#errorTips").html(resultJson.msg);
                }
            });
        }

    </script>
</head>
<body>
<div class="topS">
    <div>
        <a class="logo"><img src="${CONTEXT_PATH}/static/img/logo.png"/>
            <button class="logoen" style="margin-left:10px">English</button>
        </a>
    </div>
</div>
<div class="mainHome">
    <div>
        <div class="homePanel rn">
            <ul class="ulyh">
                <li>中国用户</li>
                <li class="lglinots" style="border-left:1px solid #ccc">国际用户</li>
            </ul>
            <div class="formList">
                <div class="user" id="user0">
                    <div class="formRow formRowBorder" style="margin-top:30px">
                        <div><input type="tel" placeholder="手机号" name="phone" id="phone"/></div>
                    </div>
                    <div class="formRow formRowBorder">
                        <div><input type="password" placeholder="密码" name="password" id="password"/></div>
                    </div>
                    <div class="formRow">
                        <div><input type="text" placeholder="验证码" style="width:160px;" name="validateCode" id="validateCode"/></div>
                        <div style="color: #333;background: #ccc;border: 1px solid #999;margin-left: 10px;width: 140px;text-align: center;">
                            <a href="javascript:phoneVerifyCode()" id="phoneVerifyCode">免费获取短信验证码</a>
                        </div>
                    </div>
                </div>
                <div id="user1" class="user" style="display:none">
                    <div class="formRow formRowBorder" style="margin-top:30px">
                        <div>
                            <select style="color:#999" name="countryCode" id="countryCode">
                                <c:forEach items="${countryList}" var="country">
                                    <option value="${country.countryCode}">${country.countryName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="formRow formRowBorder">
                        <div><input type="tel" placeholder="邮箱" name="email" id="email"/></div>
                    </div>
                    <div class="formRow formRowBorder">
                        <div><input type="password" placeholder="密码" name="pwd" id="pwd"/></div>
                    </div>
                </div>
                <input type="checkbox" id="agreement"/>我已阅读并同意<a href="/user/agreement" target="_blank">用户协议</a>和<a href="/user/terms"
                                                                                                     target="_blank">会员条款</a>

                <div class="space40" id="errorTips" style="color: red"></div>
                <input type="button" value="立即注册" onclick="register();"/>

                <div class="space20"></div>
            </div>
        </div>
    </div>
</div>
<div class="bottomS">
    <dl>
        <dt>
            版权所有：1998-2014 悠游集团　<a>法律公告</a>　｜　<a>隐私保护</a>　　Boss网京ICP备11035381
        </dt>
        <dd>
            <a>满意度调查</a>　｜　<a href="#">联系我们</a>　｜　<a href="#">工作机会</a>　｜　<a>合作伙伴认证</a>　｜　<a href="/help">帮助中心</a>
        </dd>
    </dl>
</div>
</body>
</html>