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
<style type="text/css">
.centerBaseWindow {
	border: solid 1px #CCC;
	padding: 20px 20px;
	background: #FFF;
}

.centerBaseWindow table {
	border-collapse: collapse;
	width: 478px;
}

.centerBaseWindow th {
	text-align: right;
	width: 100px;
	padding: 0px 15px 0px 0px;
	line-height: 40px;
	font-size: 14px;
	font-weight: normal;
}

.centerBaseWindow td {
	text-align: left;
	line-height: 40px;
}

.centerBaseWindow .tip th,.centerBaseWindow .tip td {
	color: #999;
	line-height: 20px;
	padding: 0px 0px 10px 0px;
}

.centerBaseWindow b {
	color: #F00;
	font-size: 14px;
}

.centerBaseWindow select {
	width: 80px;
	border: solid 1px #CCC;
	height: 40px;
	line-height: 40px;
	padding: 0px 10px;
}

.centerBaseWindow input[type="file"] {
	width: 340px;
	border: solid 1px #CCC;
	height: 40px;
	line-height: 40px;
	padding: 0px;
}
</style>
<script>
function updateMemberData(){
	   $("#updateForm").submit();
 }
</script>
</head>
<body>

		<!-- 右侧信息开始 -->
		<div class="centerBaseWindow">
			<table>
			    <c:if test ="${path!=null}">
			    <script>parent.imgView ("${path}");</script>
					<tr>
						<th><i>upload OK！</i></th>
						<td></td>
					</tr>
					<tr class="tip">
						<th></th>
						<td></td>
					</tr>
					<tr>
						<th></th>
						<td><div class="space30"></div>
							<a class="btn boxer-close" onclick="parent.$.boxer('close');"> off</a></td>
					</tr>
				</c:if>
				<c:if test ="${path==null}">
				<form id="updateForm" action="${CONTEXT_PATH}/users/upload" method="post" enctype="multipart/form-data">
					<input type="hidden" name="language" value="en"/>
					<tr>
						<th><b>*</b>select photos：</th>
						<td><input type="file" name="photo" /></td>
					</tr>
					<tr class="tip">
						<th></th>
						<td>Please select a JPG, jpeg image format</td>
					</tr>
					<tr>
						<th></th>
						<td><div class="space30"></div>
							<a class="btn" onclick="updateMemberData();"> submit </a></td>
					</tr>
				</form>
				</c:if>
			</table>
		</div>


</body>
</html>