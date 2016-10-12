<%@ page contentType="text/html;charset=UTF-8" %>
	<div class="top">
	<c:if test="${userSession!=null && userSession.account!=null}">
	<p>
		<i>
			<a href="##">${userSession.account.nickName}</a>，Welcome you！　　　
			<a href="/users/order?language=en">personal center</a>
			｜
			<a href="users/logout?language=en">logout</a>
		</i>
	</p>
	</c:if>
	<c:if test="${member==null}">
			<p>
				<i> <a href="/" class="abcd" >CN</a> ｜ <a href="/users/login?language=en">login</a>
					｜ <a href="/users/reg?language=en">register</a>
				</i>
			</p>
		</c:if>
        <div>
            <a class="logo"><img src="${CONTEXT_PATH}/static/img/logo.png" /></a>
            <dl>
                <dt><input type="text" placeholder="搜索关键字" /><button></button></dt>
                <dd>热门搜索：
                    <a href="##">热门搜索词</a>
                    <a href="##">热门搜索词</a>
                    <a href="##">热门搜索词</a>
                    <a href="##">热门搜索词</a>
                </dd>
            </dl>
        </div>
</div>
