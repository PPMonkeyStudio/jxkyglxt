<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'MyJsp.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- bootstrap 3.0.2 -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- font Awesome -->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- 提示框css -->
<link rel="stylesheet" href="<%=basePath%>css/toastr.css" />
<!-- 模版自带css -->
<link rel="stylesheet" href="<%=basePath%>css/style.css" />
<!-- 自定义css -->
<link rel="stylesheet" href="<%=basePath%>css/top_left.css" />
<!-- 弹出提示框插件css -->
<link rel="stylesheet" href="<%=basePath%>css/jquery-confirm.css" />
<!-- 图片查看插件css -->
<link rel="stylesheet" href="<%=basePath%>css/zoomify.min.css" />

<%-- <link rel="stylesheet" href="<%=basePath%>css/need/laydate.css" /> --%>
<%-- <link rel="stylesheet" href="<%=basePath%>css/calendar.css" /> --%>
<link rel="stylesheet" href="<%=basePath%>css/flatpickr.min.css" />

<script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>

<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>

<script type="text/javascript" src="<%=basePath%>js/app.js"></script>

<script type="text/javascript" src="<%=basePath%>js/jquery-confirm.js"></script>

<script type="text/javascript" src="<%=basePath%>js/toastr.js"></script>

<script type="text/javascript" src="<%=basePath%>js/zoomify.min.js"></script>

<%-- <script type="text/javascript" src="<%=basePath%>js/laydate.js"></script> --%>
<%-- <script type="text/javascript" src="<%=basePath%>js/calendar.js"></script> --%>
<script type="text/javascript" src="<%=basePath%>js/flatpickr.min.js"></script>

</head>

<body class="skin-black">
	<!-- header logo: style can be found in header.less -->
	<header class="header"> <a class="logo"> 本科数据管理系统 </a> <!-- Header Navbar: style can be found in header.less -->
	<nav class="navbar navbar-static-top" role="navigation"> <!-- Sidebar toggle button-->
	<a class="navbar-btn sidebar-toggle" data-toggle="offcanvas"
		role="button"> <span class="sr-only">Toggle navigation</span> <span
		class="icon-bar"></span> <span class="icon-bar"></span> <span
		class="icon-bar"></span>
	</a>
	<div class="navbar-right">
		<ul class="nav navbar-nav">
			<!--通知信息--------------------->
			<!-- Messages: style can be found in dropdown.less-->
			<li class="dropdown messages-menu"><a class="dropdown-toggle"
				data-toggle="dropdown"> <i class="fa fa-envelope"></i> <span
					class="label label-success">1</span>
			</a>
				<ul class="dropdown-menu">
					<li class="header">You have 1 messages</li>
					<li>
						<!-- inner menu: contains the actual data -->
						<ul class="menu">
							<li>
								<!-- start message --> <a>
									<div class="pull-left">
										<img src="img/26115.jpg" class="img-circle" alt="User Image" />
									</div>
									<h4>Support Team</h4>
									<p>Why not buy a new awesome theme?</p> <small
									class="pull-right"><i class="fa fa-clock-o"></i> 5 mins</small>
							</a>
							</li>
							<!-- end message -->
						</ul>
					</li>
					<li class="footer"><a>See All Messages</a></li>
				</ul></li>
			<!--任务信息---------------------------------->
			<!----------=略=-------->
			<!--用户信息------------------------------>
			<!-- User Account: style can be found in dropdown.less -->
			<li class="dropdown user user-menu"><a class="dropdown-toggle"
				data-toggle="dropdown"> <i class="fa fa-user"></i> <span
					class="userName_info"><s:property
							value="#session.user.userName" /> <i class="caret"></i> </span>
			</a>
				<ul class="dropdown-menu dropdown-custom dropdown-menu-right">
					<li class="dropdown-header text-center">Account</li>
					<li><a> <i class="fa fa-clock-o fa-fw pull-right"></i> <span
							class="badge badge-success pull-right">10</span> 更新首页信息
					</a></li>
					<li class="divider"></li>
					<li>
						<!-- 判断是否为管理员 --> <s:if test="#session.role=='院系管理员'">
							<a href="javascript:import_to_database()"> <i
								class="fa fa-magnet fa-fw pull-right" aria-hidden="true"></i>
								导入信息
							</a>
						</s:if> <!-- end --> <a href="javascript:user_setting()"> <i
							class="fa fa-cog fa-fw pull-right"></i> 修改信息
					</a>
					</li>
					<li class="divider"></li>
					<li><a
						href="javascript:location.href = '/jxkyglxt/System/system_exit'"><i
							class="fa fa-ban fa-fw pull-right"></i> 退出系统</a></li>
				</ul></li>
		</ul>
	</div>
	</nav> </header>
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="left-side sidebar-offcanvas"> <!-- sidebar: style can be found in sidebar.less -->
		<section class="sidebar"> <!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="img/login.jpg" class="img-circle" alt="User Image" />
			</div>
			<div class="pull-left info">
				<p>
					Hello,
					<s:property value="#session.user.userName" />
				</p>

				<a><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>
		<!-- search form -->
		<form action="#" method="get" class="sidebar-form">
			<div class="input-group">
				<input type="text" name="q" class="form-control"
					placeholder="Search..." /> <span class="input-group-btn">
					<button type='submit' name='seach' id='search-btn'
						class="btn btn-flat">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		<!-- /.search form --> <!-- sidebar menu: : style can be found in sidebar.less -->
		
		
		<s:if test="#session.role=='院系管理员'">
			<ul class="sidebar-menu">
				<li><a href="#sub" data-toggle="collapse" class="collapsed"
					aria-expanded="false"><i class="fa fa-user"></i> <span>教师信息</span>
						<i class="icon-submenu fa fa-angle-left"></i></a>
					<div id="sub" class="collapse" aria-expanded="false"
						style="height: 0px;">
						<ul class="nav">
							<li><a class="">信息审核</a></li>
							<li><a class="">信息管理</a></li>
							<li><a onclick="user_setting(user_setting)"
								class=" setButton">重置密码</a></li>
						</ul>
					</div></li>

			</ul>
		</s:if> 
		
		<s:if test="#session.role=='教职工'">
			<ul class="sidebar-menu">
				<li><a href="#subPages" data-toggle="collapse"
					class="collapsed" aria-expanded="false"><i class="fa fa-user"></i>
						<span>教师信息</span> <i class="icon-submenu fa fa-angle-left"></i></a>
					<div id="subPages" class="collapse" aria-expanded="false"
						style="height: 0px;">
						<ul class="nav">
							<li><a class="">信息查看</a></li>
						</ul>
					</div></li>
			</ul>
		</s:if>
		
		
		
		<s:if test="#session.role=='学生'">
		<ul class="sidebar-menu">
			<li><a href="#sub" data-toggle="collapse" class="collapsed"
					aria-expanded="false">
			<i class="fa fa-user"></i>
						<span>学生信息</span>  <i class="icon-submenu fa fa-angle-left"></i></a>
			<div id="subPages" class="collapse" aria-expanded="false"
						style="height: 0px;">
						<ul class="nav">
							<li><a class="">信息查看</a></li>
						</ul>
					</div>
			</li>			
		</ul>
		</s:if>
		
		
		</aside>
		<aside class="right-side"> <section class="content">
		<div class="row">
			<div class="col-md-12">
				<!--breadcrumbs start -->
				<ul class="breadcrumb">
					<li><a><i class="fa fa-home"></i> 首页</a></li>
				</ul>
				<!--breadcrumbs end -->
			</div>
		</div>
		</section> </aside>
		<!-- /.right-side -->
	</div>
	<!-- ./wrapper -->
	<!-- Director App -->
	<script type="text/javascript">
		document.getElementsByClassName("riliDate").flatpickr();
		//创建一个当前日期对象
		var now = new Date();
		//格式化日，如果小于9，前面补0
		var day = ("0" + now.getDate()).slice(-2);
		//格式化月，如果小于9，前面补0
		var month = ("0" + (now.getMonth() + 1)).slice(-2);
		//拼装完整日期格式
		var today = now.getFullYear() + "-" + (month) + "-" + (day);
		$(".riliDate").val(today);
	</script>
</body>
</html>
