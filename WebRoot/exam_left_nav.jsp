<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息查看左列表</title>
<script type="text/javascript" src="<%=basePath%>/js/left_nav.js"></script>
<link rel="stylesheet" href="<%=basePath%>/css/left_nav.css" />
</head>
<body>
	<div id="left_nav">
		<ul class="left_nav_ul" id="left_nav_ul">
			<li>信息查看</li>
			<li><a href="/teacherms/Page/page_exam_user">用户</a></li>
			<li><a href="/teacherms/Page/page_exam_award">奖励</a></li>
			<li><a href="/teacherms/Page/page_exam_works">著作</a></li>
			<li><a href="/teacherms/Page/page_exam_patent">专利</a></li>
			<li><a href="/teacherms/Page/page_exam_paper">论文</a></li>
			<li><a href="/teacherms/Page/page_exam_project">教师项目(课题)</a></li>
		</ul>
	</div>
	<script>
	/* var leftNavUl = document.getElementById("left_nav_ul");
	var leftNavLi = leftNavUl.getElementsByTagName("li");
	for (i = 2; i < leftNavLi.length; i++) {
		leftNavUl.children[i].style.color = "#616161";
	} */
	</script>
</body>
</html>