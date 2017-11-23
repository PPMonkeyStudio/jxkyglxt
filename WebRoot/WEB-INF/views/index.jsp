<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link rel="stylesheet" href="<%=basePath%>/css/index.css" />
<script type="text/javascript" src="<%=basePath%>/js/index.js"></script>
<jsp:include page="/top_nav.jsp"></jsp:include>
</head>
<body>
	<div id="info_content">
		<div class="top_line">
			<h4 class="h4_style">教师信息</h4>
			<hr class="hr_style" />
		</div>
			<ul id="info_ul">
			<li>
				<ul class="innner_ul">
					<li>
						<h3>周锦春</h3> <span>信息与计算机工程学院副院长周锦春教授</span>
					</li>
				</ul>
			</li>
			<li>
				<ul class="innner_ul">
					<li>
						<h3>肖俊宇</h3> <span>信息与计算机工程学党总支书记肖俊宇教授</span>
					</li>
				</ul>
			</li>
			<li>
				<ul class="innner_ul">
					<li>
						<h3>李希勇</h3> <span>信息与计算机工程学院副院长李希勇教授</span>
					</li>
				</ul>
			</li>
			<li>
				<ul class="innner_ul">
					<li>
						<h3>彭新平</h3> <span>信息与计算机工程学院党总支副书记彭新平副教授</span>
					</li>
				</ul>
			</li>
			<li>
				<ul class="innner_ul">
					<li>
						<h3>危远峰</h3> <span>信息与计算机工程学院办公室主任危远峰老师</span>
					</li>
				</ul>
			</li>
			<li>
				<ul class="innner_ul">
					<li>
						<h3>何志芬</h3> <span>信息与计算机工程学院教师何志芬博士</span>
					</li>
				</ul>
			</li>
			<li>
				<ul class="innner_ul">
					<li>
						<h3>罗晓娟</h3> <span>信息与计算机工程学院教师罗晓娟副教授</span>
					</li>
				</ul>
			</li>
			<li>
				<ul id="last_ul">
					<li onmouseover="afterAdd()" onmouseleave="beforeAdd()"><img
						id="addImg" src="<%=basePath%>/img/add(2).png" />
						<h3 id="addInfo">添加信息</h3></li>
				</ul>
			</li>
		</ul>
		
	</div>
	<%-- 	<div>
		<iframe src="<%=basePath%>/views/teacher_award.jsp"></iframe>
	</div>
 --%>
</body>
</html>