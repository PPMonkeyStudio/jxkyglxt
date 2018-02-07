<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>登录</title>

<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath%>/css/login.css" />
</head>
<body>
	<div id="main_container">
		<div id="login_content">
			<div id="login_logo">
				<img src="<%=basePath%>/img/logo5.jpg" />
			</div>
			<div id="login_form">

				<form action="">
					<div class="group-form">
						<input class="form-control" type="text" name="user_id"
							placeholder="请输入用户名">
					</div>
					<div class="group-form">
						<input class="form-control" type="password" name="password"
							placeholder="请输入密码">
					</div>
					<div class="group-form">
						<input class="login_button" onclick="fun()" type="button"
							value="登录">
					</div>

				</form>

			</div>
		</div>
		<div id="copyRight">CopyRight@2017教学科研管理系统版权所有</div>
	</div>


	<script type="text/javascript"
		src="<%=basePath%>js/jquery-3.1.1.min.js"></script>

	<script type="text/javascript">
		function fun() {
			$.ajax({
				url : "System/system_login",
				type : "get",
				timeout : 3000,
				data : $("form").serialize(),
				dataType : "json",
				success : function(xhr_data) {
					if (xhr_data.result == "success") {
						location.href = "page/teacher/main_index.jsp";
					}
				},
				error : function() {}
			});
		}
	</script>
</body>
</html>