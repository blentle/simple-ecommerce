<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>${site_title} - 登录</title>
    <%@include file="/common/include.rec.jsp"%>
    <script type="text/javascript">
        $(function(){
            $(".ulyh li").each(function(){
                $(this).click(function(){
                    $(this).removeClass("lglinots").siblings().addClass("lglinots");
                    $("#user"+$(this).index()).show().siblings(".user").hide();
                })
            });

            changeCode();
            $("#revcode").bind("click",changeCode);
        });

        function changeCode(){
            $("#codeImg").attr("src","/verify/code?t="+genTimestamp());
        }

        function login(){
            $(".user").each(function () {
                if($(this).is(":visible")){
                    if ($(this).attr("id") == 'user0') {
                        phoneLogin();
                    } else {
                        emailLogin();
                    }
                }
            });
        }

        function phoneLogin(){
            var phone = $("#phone").val();
            var password = $("#password").val();
            var validateCode = $("#validateCode").val();
            if(checkPassword(password) && checkMobile(phone)){
                $.post("/phone/login",{phone:phone,password:password, validateCode:validateCode},function(resultJson){
                    if(resultJson.status_code == '1'){
                        window.location.href="/index";
                    }else{
                        $("#errorTips").html(resultJson.msg);
                    }
                });
            }
        }

        function emailLogin(){
            var email = $("#email").val();
            var pwd = $("#pwd").val();

            if(checkPassword(pwd) && checkEmail(email)){
                var validateCode = $("#validateCode").val();
                $.post("/phone/login",{email:email,pwd:pwd,validateCode:validateCode},function(resultJson){
                    if(resultJson.status_code == '1'){
                        window.location.href="/index";
                    }else{
                        $("#errorTips").html(resultJson.msg);
                    }
                });
            }
        }
    </script>
</head>
<body>
<div class="topS">
    <div>
        <a class="logo"><img src="${CONTEXT_PATH}/static/img/logo.png" /><button class="logoen" style="margin-left:10px">Eglish</button></a>
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
                <div class="user"  id="user0">
                    <div class="formRow formRowBorder" style="margin-top:30px">
                        <div><input type="tel" placeholder="手机号" name="phone" id="phone"/></div>
                    </div>
                    <div class="formRow formRowBorder">
                        <div><input type="password" placeholder="密码" name="password" id="password"/></div>
                    </div>
                </div>
                <div class="user" id="user1" style="display: none">
                    <div class="formRow formRowBorder" style="margin-top:30px">
                        <div><input type="tel" placeholder="邮箱" name="email" id="email"/></div>
                    </div>
                    <div class="formRow formRowBorder">
                        <div><input type="password" placeholder="密码" name="pwd" id="pwd"/></div>
                    </div>

                </div>
                <div>
                    <h3><a href="/account/findpwd" style="color:#999">忘记密码</a></h3>
                    <div class="formRow">
                        <div><input type="text" placeholder="验证码" name="validateCode" id="validateCode"/></div>
                        <div><img id="codeImg" src=""></div>
                        <div><a href="javascript:changeCode();">刷新</a></div>
                    </div>
                    <div class="space20" id="errorTips" style="color:red"></div>
                    <input type="button" value="登录" onclick="login()"/>
                    没有账号？<a href="/register/page">立即注册</a>
                </div>
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