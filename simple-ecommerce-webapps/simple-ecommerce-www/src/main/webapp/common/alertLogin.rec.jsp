<%@ page contentType="text/html;charset=UTF-8" %>
<!-- 弹出层的登陆 -->
<form:form name="alertLoginForm" id="alertLoginForm" method="post" 
		modelAttribute="member">
		<input type="hidden" name="locale" value="zh_CN">
		<div class="alertLoginCover" onClick="hideALW();"></div>
		<div class="rn login alertLoginWindow">
			<h2>登录悠游宝</h2>
			<div class="formList">
				<div style="color: #ff0000; height: 22px; margin-top: 0px"
					align="center">
					<form:errors path="memberMobilePhone"></form:errors>
				</div>
				<div class="formRow formRowBorder">
					<div>
						<input type="text" name="memberMobilePhone" placeholder="手机号"
							style="background:url(${CONTEXT_PATH}/static/img/icon_tel.png) left center no-repeat; padding-left:35px;" />
					</div>
				</div>
				<div style="color: #ff0000; height: 22px; margin-top: 0px"
					align="center">
					<form:errors path="memberPassword"></form:errors>
				</div>
				<div class="formRow formRowBorder">
					<div>
						<input type="password" name="memberPassword" placeholder="密码"
							style="background:url(${CONTEXT_PATH}/static/img/icon_password.png) left center no-repeat; padding-left:35px;" />
					</div>
				</div>
				<div style="color: #ff0000; height: 22px; margin-top: 0px"
					align="center"></div>
				<div class="formRow">
					<div>
						<input type="text" placeholder="验证码"
							style="width: 120px; text-align: center;" />
					</div>
					<div>
						<img src="${CONTEXT_PATH}/static/img/codeCheck.png">
					</div>
					<div>
						<a>刷新</a>
					</div>
				</div>
				<div id="message"
					style="color: #ff0000; height: 22px; margin-top: 0px"
					align="center"></div>
				<input class="btn" type="button" value="登 录" />

				<div class="space"></div>
				<a href="/findpwPhone">忘记密码?</a> 没有账号? <a href="/users/reg">立即注册</a>
			</div>
		</div>
	</form:form>