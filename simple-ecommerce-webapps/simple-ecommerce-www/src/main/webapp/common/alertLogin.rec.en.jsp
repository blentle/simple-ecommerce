<%@ page contentType="text/html;charset=UTF-8" %>
<!-- 弹出层的登陆 -->
<form:form name="alertLoginForm" id="alertLoginForm" method="post"
		modelAttribute="member">
		<input type="hidden" name="locale" value="zh">
		<input type="hidden" name="language" value="en">
		<div class="alertLoginCover" onClick="hideALW();"></div>
		<div class="rn login alertLoginWindow">
			<h2>Login</h2>
			<div class="formList">
				<div style="color: #ff0000; height: 22px; margin-top: 0px"
					align="center">
					<form:errors path="memberMobilePhone"></form:errors>
				</div>
				<div class="formRow formRowBorder">
					<div>
						<input type="text" name="memberMobilePhone" placeholder="Phone Number"
							style="background:url(${CONTEXT_PATH}/static/img/icon_tel.png) left center no-repeat; padding-left:35px;" />
					</div>
				</div>
				<div style="color: #ff0000; height: 22px; margin-top: 0px"
					align="center">
					<form:errors path="memberPassword"></form:errors>
				</div>
				<div class="formRow formRowBorder">
					<div>
						<input type="password" name="memberPassword" placeholder="PassWord"
							style="background:url(${CONTEXT_PATH}/static/img/icon_password.png) left center no-repeat; padding-left:35px;" />
					</div>
				</div>
				<div style="color: #ff0000; height: 22px; margin-top: 0px"
					align="center"></div>
				<div class="formRow">
					<div>
						<input type="text" placeholder="identifying code"
							style="width: 120px; text-align: center;" />
					</div>
					<div>
						<img src="${CONTEXT_PATH}/static/img/codeCheck.png">
					</div>
					<div>
						<a>refresh</a>
					</div>
				</div>
				<div id="message"
					style="color: #ff0000; height: 22px; margin-top: 0px"
					align="center"></div>
				<input class="btn" type="button" value="Login" />

				<div class="space"></div>
				<a href="/en/findpwPhone">forget password?</a> no account? <a href="/users/reg?language=en">register</a>
			</div>
		</div>
	</form:form>