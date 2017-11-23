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
<title>Insert title here</title>
<link rel="stylesheet" href="<%=basePath%>/css/top_nav.css" />
</head>
<body>
	<div class="total_nav">
		<div id="logo_]nav">
			<img src="img/logo5.jpg" />
		</div>
		<div class="content_nav">
			<ul class="nav_ul" id="nav_ul">
				<li>首页</li>
				<li>信息查看</li>
				<li onmouseover="afterImg()" onmouseleave="beforeImg()"><span>
						<img id="roleImg" src="img/管理员(5).png" />
				</span>admin</li>
			</ul>
		</div>

	</div>
	<div class="clear"></div>
	<script type="text/javascript" src="js/top_nav.js"></script>
</body>
</html>