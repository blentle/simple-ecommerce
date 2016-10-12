<%@ page contentType="text/html;charset=UTF-8" %>
	<div class="top">
	<c:if test="${member!=null}">
	<p>
		<i>
			<a href="##">${member.memberNickname}</a>，Welcome you！　　　
			<a href="/users/order?language=en">personal center</a>
			｜
			<a href="/users/logout?language=en">logout</a>
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
		<a class="logo"><img src="${CONTEXT_PATH}/static/img/logo.png" /></a>
		<dl>
			<dt><input type="text" placeholder="keyword" /><button></button></dt>
			<dd>Hot Search： 
				<a href="##">Hong Kong package</a> 
				<a href="##">Taiwan package</a> 
				<!-- <a href="##">热门搜索词</a> 
				<a href="##">热门搜索词</a>  -->
			</dd>
		</dl>
	</div>
</div>
<div class="menu">
	<div>
		
		<a href="/en">Home</a> 
			<a href="/en/aboutyyb">AboutYyb</a>
			<a href="/en/service"  class="sel">Service</a> 
			<a href="/en/operators">Operators</a> 
			<a href="/en/partners" >Partners</a> 
			<a href="/en/contacts" >Contacts</a>
	</div>

</div>
<div class="space30"></div>