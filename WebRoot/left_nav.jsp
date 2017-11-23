<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="<%=basePath%>/css/left_nav.css" />
</head>
<body>
	<div id="left_nav">
		<ul class="left_nav_ul" id="left_nav_ul">
			<li>信息审核</li>
			<li><a href="/teacherms/Page/page_teacher_award">奖励</a></li>
			<li><a href="/teacherms/Page/page_teacher_works">著作</a></li>
			<li><a href="/teacherms/Page/page_teacher_patent">专利</a></li>
			<li><a href="/teacherms/Page/page_teacher_paper">论文</a></li>
			<li><a href="/teacherms/Page/page_teacher_info">教职工信息</a></li>
			<li><a href="/teacherms/Page/page_teacher_project">教师项目(课题)</a></li>
		</ul>
	</div>

	<script type="text/javascript" src="<%=basePath%>/js/left_nav.js"></script>
</body>
</html>