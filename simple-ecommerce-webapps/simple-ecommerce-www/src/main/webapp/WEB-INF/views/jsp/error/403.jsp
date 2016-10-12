<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>403</title>
</head>
<body>
	<!-- BEGIN PAGE HEADER-->
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->			
						<h3 class="page-title">
							403 Page				<small>403 page sample</small>
						</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="${ctx }/management/main">首页</a> 
								<i class="icon-angle-right"></i>
							</li>
							<li><a href="#">403 页面</a></li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->				
				<div class="row-fluid">
					<div class="span12">
						<div class="row-fluid page-500">
							<div class="span5 number">
								403
							</div>
							<div class="span7 details">
								<h3>对不起，您访问的页面不存在.</h3>
								<p>
									Sorry!<br />
									请检查您访问的路径是否正确.<br />
								</p>
							</div>
						</div>
					</div>
				</div>
				<!-- END PAGE CONTENT-->
</body>
</html>