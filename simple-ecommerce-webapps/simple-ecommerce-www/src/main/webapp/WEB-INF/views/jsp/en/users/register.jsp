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
			<a href="/users/order?language=en">personal center</a>
			｜
			<a href="users/logout?language=en">logout</a>
		</i>
	</p>
	</c:if>
	<c:if test="${member.memberNickname==null}">
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
    </div>
</div>
<div class="mainHome">
    <div>
        <form:form name="form"  method="post"
                   modelAttribute="member" onsubmit="return checkMobile();">
            <input type="hidden" name="locale" value="zh">
            <input type="hidden" name="language" value="en">
        <div class="homePanel rn">
            <h2>register</h2>
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
                    <b>Phone</b>
                    <div><input type="text"name="memberMobilePhone" id="memberMobilePhone" /></div>
                </div>
                <div style="color: #ff0000;height: 22px;margin-top: 0px"  align="center">
                    <form:errors path="memberPassword"></form:errors>
                </div>
                <div class="formRow formRowBorder">
                    <b>Password</b>
                    <div><input type="password" name="memberPassword"/></div>
                </div>
                <div style="color: #ff0000;height: 22px;margin-top: 0px"  align="center">
                </div>
                <div class="formRow">
                    <b>identifying</b>
                    <div><input type="text" /></div>
                    <div><button>免费获取</button></div>
                </div>
                <div style="color: #ff0000;height: 22px;margin-top: 0px"  align="center">
                        ${message}
                </div>
                <div class="formRow">
                    <input name="xz" id="xz" type="checkbox" checked="checked" />I do <a href="">agreement</a> or <a href="">clause</a>
                </div>
                <div style="color: #ff0000;height: 22px;margin-top: 0px"  align="center">
                </div>
                <input  type="submit" value="register" />
            </div>
        </div>
        </form:form>
    </div>
</div>
<%@include file="/commons/usersbottom.rec.en.jsp"  %>
</body>
</html>