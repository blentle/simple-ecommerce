<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
  <head>
    <title>我的订单</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@include file="/commons/include.rec.jsp"  %>
    <%@include file="/commons/uservalidation.rec.jsp"  %>
    <script src="${CONTEXT_PATH}/static/js/users/menus.js" type="text/javascript"></script>
    <script src="${CONTEXT_PATH}/static/js/users/jquery.fs.boxer.js" type="text/javascript"></script>
    <link  href="${CONTEXT_PATH}/static/js/users/jquery.fs.boxer.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    
    $(document).ready(function() {
    	$("#updateForm").validate();
    	initLeftMenu('${menuItem}','${CONTEXT_PATH}');
		$(".boxer").not(".retina, .boxer_fixed, .boxer_top, .boxer_format, .boxer_mobile, .boxer_object").boxer();

		$(".boxer.boxer_fixed").boxer({
			fixed: true
		});

		$(".boxer.boxer_top").boxer({
			top: 50
		});

		$(".boxer.retina").boxer({
			retina: true
		});

		$(".boxer.boxer_format").boxer({
			formatter: function($target) {
				return '<h3>' + $target.attr("title") + "</h3>";
			}
		});

		$(".boxer.boxer_object").click(function(e) {
			e.preventDefault();
			e.stopPropagation();

			$.boxer( $('<div class="inline_content"><h2>More Content!</h2><p>This was created by jQuery and loaded into the new Boxer instance.</p></div>') );
		});

		$(".boxer.boxer_mobile").boxer({
			mobile: true
		});

		$(window).one("pronto.load", function() {
			$.boxer("close");
			$(".boxer").boxer("destroy");
		});
		imgView("${memberCenter.memberPaperworkPhoto}");
	});

       function updateMemberData(){
    	   if(!$("#ischeck").is(':checked')) {
    		   return false;
    	   }
    	   $("#updateForm").submit();
       }
       function imgView (filename){
    	   var src = "${CONTEXT_PATH}/static/img/"+filename;
    	   $("#imgview").attr("src", src); 
    	   $("#mpp").val(filename);
       }
    
    </script>
  </head>
<body>
<!-- 引用用户页部  -->
<%@include file="/commons/usershead.rec.jsp"  %>
<div class="mw panel"><span>服务 &gt; 账户中心 &gt; 入网资料</span></div>

<div class="space20"></div>

<div class="mw">
<!-- 左侧导航菜单 -->
	<dl class="centerMenu"></dl>
<!-- 右侧信息开始 -->	
	<div class="centerCon centerBaseInfo centerWebInfo">
		<form id="updateForm" action="${CONTEXT_PATH}/users/updateNetData" method="post">
		<table>
			<input type="hidden" name="memberId" value="${memberCenter.memberId}">
			<input type="hidden" id="mpp" name="memberPaperworkPhoto" value="${memberCenter.memberPaperworkPhoto }">
			<tr><th>真实姓名：</th><td><input type="text" name="memberName" value="${memberCenter.memberName }" class="required" maxlength="20"/></td></tr>
			<tr class="tip"><th></th><td>请输入真实姓名，20个英文或汉字以内</td></tr>
			<tr><th>证件类型：<div class="space"></div></th><td><select><option>身份证</option></select></td></tr>
			<tr class="tip"><th></th><td>　</td></tr>
			<tr><th>证件号码：</th><td><input type="text"  name="memberPaperworkNum" value="${memberCenter.memberPaperworkNum }" class="required"/></td></tr>
			<tr class="tip"><th></th><td>　</td></tr>
			
			<tr><th>备注：</th><td><input type="text"  name="remark1" value="${memberCenter.remark1 }"/></td></tr>
			<tr class="tip"><th></th><td>　</td></tr>
			<tr><th></th><td><input type="checkbox" id="ischeck" value="1"/> 我已阅读并同意 <a>网协议</a></td></tr>
			<tr><th></th><td><div class="space30"></div><a class="btn" onclick="updateMemberData();">　提 交　</a></td></tr>
		</table>
			</form>
		<div class="headPic">
		<img id = "imgview"class="rn" src="" />
		<a href="${CONTEXT_PATH}/users/loadfile" class="boxer btn btn-ss" data-boxer-height="180" data-boxer-width="510">上传照片</a>
		</div>
	</div>
</div>
<%@include file="/commons/usersbottom.rec.jsp"  %>

</body>
</html>