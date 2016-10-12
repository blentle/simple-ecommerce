<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>我的订单</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <%@include file="/commons/include.rec.jsp"  %>
    <script src="${CONTEXT_PATH}/static/js/users/menus.en.js" type="text/javascript"></script>
    <script src="${CONTEXT_PATH}/static/js/users/jquery.fs.boxer.js" type="text/javascript"></script>
    <link  href="${CONTEXT_PATH}/static/js/users/jquery.fs.boxer.css" rel="stylesheet" type="text/css" />
    <script>
    
    $(document).ready(function() {
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
    	  /* 
    	  	var birthday = $("#birthdayYear").val() + "-" + $("#birthdayMonth").val() + "-" + $("#birthdayDay").val();
    	    $("input[name=memberBirth]").val(birthday); 
    	   */
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
<%@include file="/commons/usershead.rec.en.jsp"  %>
<div class="mw panel"><span>service &gt;Account Center &gt; The net data</span></div>

<div class="space20"></div>

<div class="mw">
<!-- 左侧导航菜单 -->
	<dl class="centerMenu"></dl>
<!-- 右侧信息开始 -->	
	<div class="centerCon centerBaseInfo centerWebInfo">
		<table>
		<form id="updateForm" action="${CONTEXT_PATH}/users/updateNetData" method="post">
			<input type="hidden" name="memberId" value="${memberCenter.memberId}">
			<input type="hidden" id="mpp" name="memberPaperworkPhoto" value="${memberCenter.memberPaperworkPhoto }">
			<input type="hidden" name="language" value="en"/>
			<tr><th>realname：</th><td><input type="text" name="memberName" value="${memberCenter.memberName }"/></td></tr>
			<tr class="tip"><th></th><td>Please enter the real name, 20 in English or Chinese characters or less</td></tr>
			<tr><th>papers type：<div class="space"></div></th><td><select><option>身份证</option></select></td></tr>
			<tr class="tip"><th></th><td>　</td></tr>
			<tr><th>papers number：</th><td><input type="text"  name="memberPaperworkNum" value="${memberCenter.memberPaperworkNum }"/></td></tr>
			<tr class="tip"><th></th><td>　</td></tr>
			
			<tr><th>remark：</th><td><input type="text"  name="remark1" value="${memberCenter.remark1 }"/></td></tr>
			<tr class="tip"><th></th><td>　</td></tr>
			<tr><th></th><td><input type="checkbox" id="ischeck" value="1"/> I do <a>network access license</a></td></tr>
			<tr><th></th><td><div class="space30"></div><a class="btn" onclick="updateMemberData();">　submit　</a></td></tr>
			</form>
		</table>
		<div class="headPic">
		<img id = "imgview"class="rn" src="" />
		<a href="${CONTEXT_PATH}/users/loadfile?language=en" class="boxer btn btn-ss" data-boxer-height="180" data-boxer-width="510">upload photo</a>
		</div>
	</div>
</div>
<%@include file="/commons/usersbottom.rec.en.jsp"  %>

</body>
</html>