<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>我的订单</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<%@include file="/commons/include.rec.jsp"%>
<script src="${CONTEXT_PATH}/static/js/users/menus.en.js"
	type="text/javascript"></script>
<script src="${CONTEXT_PATH}/static/js/users/jquery.fs.boxer.js"
	type="text/javascript"></script>
<link href="${CONTEXT_PATH}/static/js/users/jquery.fs.boxer.css"
	rel="stylesheet" type="text/css" />
<script>
	$(document)
			.ready(
					function() {
						initLeftMenu('${menuItem}', '${CONTEXT_PATH}');
						$(".boxer")
								.not(
										".retina, .boxer_fixed, .boxer_top, .boxer_format, .boxer_mobile, .boxer_object")
								.boxer();

					});
	function updateMemberData() {
		$("#updateForm").submit();
	}
</script>
</head>
<body>
	<!-- 引用用户页部  -->
	<%@include file="/commons/usershead.rec.en.jsp"%>
	<div class="mw panel">
		<span>Service &gt; Account Central&gt; Message</span>
	</div>

	<div class="space20"></div>

	<div class="mw">
		<!-- 左侧导航菜单 -->
		<dl class="centerMenu"></dl>
		<!-- 右侧信息开始 -->
		<div class="centerCon centerMail">
			<div class="centerMailList">
				<div class="space40 bg15">
					<img src="${CONTEXT_PATH}/static/img/icon_mail.png" /> 
					Stand inside letter (2 seal, including <a>1 unread email seal</a>)
				</div>
				<table>
					<thead>
						<th></th>
						<th>status</th>
						<th>title</th>
						<th>addresser</th>
					</thead>
					<tbody>
						<c:forEach var="mp" items="${bulletinListPage }" varStatus="s">
							<tr>
								<th></th>
								<th><img src="${CONTEXT_PATH}/static/img/icon_mailOpen.png" /></th>
								<td><a>${mp.bulletinDetailContents }</a></td>
								<th>system</th>
							</tr>

						</c:forEach>
					</tbody>
				</table>
				
				<div class="space50">
					<div class="pagination">
					</div>
					<web:pager pageNo="${pageNo}" currentClass="sel"
						pageSize="${pageSize}" url="/users/mail?language=en" btnNum="5" totalCount="${totalCount}" pageStyles="center">
					</web:pager>
					<!-- <dl class="pageNum pageNumSmall fr">
						<dt>&lt;上一页</dt>
						<dt class="sel">1</dt>
						<dt>2</dt>
						<dt>3</dt>
						<dt>4</dt>
						<dd>...</dd>
						<dt>下一页&gt;</dt>
						<dd>共 14 页， 跳转到：</dd>
						<dt>
							<input type="text" />
						</dt>
						<dt>GO</dt>
					</dl>  -->
					
				</div>
			</div>
		</div>
	</div>

	<%@include file="/commons/usersbottom.rec.en.jsp"%>

</body>
</html>