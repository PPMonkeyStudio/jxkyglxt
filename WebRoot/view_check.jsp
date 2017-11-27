<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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

		<link href="css/style.css" rel="stylesheet" type="text/css" />
		
		<link rel="stylesheet" href="css/com.css" />
		

		<style type="text/css">
			.sidebar .sidebar-menu>li>a[data-toggle="collapse"]:hover {
				background-color: #425164;
			}
			
			.sidebar .sidebar-menu>li>a[data-toggle="collapse"]:hover,
			.sidebar .sidebar-menu>li>a[data-toggle="collapse"]:focus {
				background-color: #425164;
			}
			
			.sidebar .sidebar-menu>li>div>ul>li>a:hover {
				background-color: #425164;
			}
			
			.sidebar .sidebar-menu .nav>li>a {
				padding-left: 60px;
				padding-top: 10px;
				padding-bottom: 10px;
			}
			
			.sidebar .sidebar-menu>li>a[data-toggle="collapse"] .icon-submenu {
				display: inline-block;
				vertical-align: middle;
				*vertical-align: auto;
				*zoom: 1;
				*display: inline;
				-webkit-transition: all 0.2s ease-out;
				-moz-transition: all 0.2s ease-out;
				-ms-transition: all 0.2s ease-out;
				-o-transition: all 0.2s ease-out;
				transition: all 0.2s ease-out;
				float: right;
				position: relative;
				top: 5px;
				line-height: 1.1;
				-moz-transform: rotate(-90deg);
				-ms-transform: rotate(-90deg);
				-webkit-transform: rotate(-90deg);
				transform: rotate(-90deg);
			}
			
			.sidebar .sidebar-menu>li>a[data-toggle="collapse"] .icon-submenu {
				-moz-transform: rotate(0deg);
				-ms-transform: rotate(0deg);
				-webkit-transform: rotate(0deg);
				transform: rotate(0deg);
			}
			#search{
				margin-top:10px;
			}
		</style>
  </head>
  
 <body class="skin-black">
		<!-- header logo: style can be found in header.less -->
		<header class="header">
			<a class="logo">
				教学状态数据管理系统
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<div class="navbar-right">
					<ul class="nav navbar-nav">
						<!--通知信息--------------------->
						<!-- Messages: style can be found in dropdown.less-->
						<li class="dropdown messages-menu">
							<a class="dropdown-toggle" data-toggle="dropdown">
								<i class="fa fa-envelope"></i>
								<span class="label label-success">1</span>
							</a>
							<ul class="dropdown-menu">
								<li class="header">You have 1 messages</li>
								<li>
									<!-- inner menu: contains the actual data -->
									<ul class="menu">
										<li>
											<!-- start message -->
											<a>
												<div class="pull-left">
													<img src="img/26115.jpg" class="img-circle" alt="User Image" />
												</div>
												<h4>
                                                    Support Team
                                                </h4>
												<p>Why not buy a new awesome theme?</p>
												<small class="pull-right"><i class="fa fa-clock-o"></i> 5 mins</small>
											</a>
										</li>
										<!-- end message -->
									</ul>
								</li>
								<li class="footer">
									<a>See All Messages</a>
								</li>
							</ul>
						</li>
						<!--任务信息---------------------------------->
						<!----------=略=-------->
						<!--用户信息------------------------------>
						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu">
							<a class="dropdown-toggle" data-toggle="dropdown">
								<i class="fa fa-user"></i>
								<span>Jane Doe <i class="caret"></i></span>
							</a>
							<ul class="dropdown-menu dropdown-custom dropdown-menu-right">
								<li class="dropdown-header text-center">Account</li>
								<li>
									<a>
										<i class="fa fa-clock-o fa-fw pull-right"></i>
										<span class="badge badge-success pull-right">10</span> 更新首页信息</a>
								</li>
								<li class="divider"></li>
								<li>
									<a>
										<i class="fa fa-magnet fa-fw pull-right" aria-hidden="true"></i> 导入信息
									</a>
									<a data-toggle="modal" href="#modal-user-settings">
										<i class="fa fa-cog fa-fw pull-right"></i> 修改信息
									</a>
								</li>
								<li class="divider"></li>
								<li>
									<a><i class="fa fa-ban fa-fw pull-right"></i> 退出系统</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
		</header>
		<div class="wrapper row-offcanvas row-offcanvas-left">
			<!-- Left side column. contains the logo and sidebar -->
			<aside class="left-side sidebar-offcanvas">
				<!-- sidebar: style can be found in sidebar.less -->
				<section class="sidebar">
					<!-- Sidebar user panel -->
					<div class="user-panel">
						<div class="pull-left image">
							<img src="img/26115.jpg" class="img-circle" alt="User Image" />
						</div>
						<div class="pull-left info">
							<p>Hello, Jane</p>

							<a><i class="fa fa-circle text-success"></i> Online</a>
						</div>
					</div>
					<!-- search form -->
					<form action="#" method="get" class="sidebar-form">
						<div class="input-group">
							<input type="text" name="q" class="form-control" placeholder="Search..." />
							<span class="input-group-btn">
                                        <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                                    </span>
						</div>
					</form>
					<!-- /.search form -->
					<!-- sidebar menu: : style can be found in sidebar.less -->
					<ul class="sidebar-menu">

						<li>
							<a href="#subPages" data-toggle="collapse" class="collapsed" aria-expanded="false"><i class="fa fa-user"></i> <span>教师信息</span> <i class="icon-submenu fa fa-angle-left"></i></a>
							<div id="subPages" class="collapse" aria-expanded="false" style="height: 0px;">
								<ul class="nav">
									<li>
										<a href="" class="">信息审核</a>
									</li>
									<li>
										<a href="" class="">信息管理</a>
									</li>
								</ul>
							</div>
						</li>

						<!--<li class="active">
							<a href="index.html">
								<i class="fa fa-user"></i> <span>教师信息</span>
							</a>
						</li>-->
						<!--<li>
							<a href="general.html">
								<i class="fa fa-gavel"></i> <span>General</span>
							</a>
						</li>-->
					</ul>
				</section>
				<!-- /.sidebar -->
			</aside>

			<aside class="right-side">
				<section class="content">
					<div class="row">
						<div class="col-md-12">
							<!--breadcrumbs start -->
							<ul class="breadcrumb">
								<li>
									<a><i class="fa fa-home"></i> 首页</a>
								</li>
								<!--<li>
									<a >Dashboard</a>
								</li>-->
								<li class="active">信息审核</li>
							</ul>
							<!--breadcrumbs end -->
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<!--breadcrumbs start -->
							<section class="panel general">
								<header class="panel-heading tab-bg-dark-navy-blue">
									<ul class="nav nav-tabs">
										<li>
											<a data-toggle="tab" href="#user">用户</a>
										</li>
										<li class="">
											<a data-toggle="tab" href="#award">奖励</a>
										</li>
										<li class="">
											<a data-toggle="tab" href="#works">著作</a>
										</li>
										<li class="">
											<a data-toggle="tab" href="#paper">论文</a>
										</li>
										<li class="">
											<a data-toggle="tab" href="#patent">专利</a>
										</li>
										<li class="">
											<a data-toggle="tab" href="#project">项目(课题)</a>
										</li>
									</ul>
								</header>
								<div class="panel-body">
									<div class="tab-content">
										<div id="user" class="tab-pane active">
										</div>
										<div id="award" class="tab-pane">
										</div>
										<div id="works" class="tab-pane">
										</div>
										<div id="paper" class="tab-pane">
										</div>
										<div id="patent" class="tab-pane">
										</div>
										<div id="project" class="tab-pane">
										</div>
									</div>
								</div>
							</section>
							<!--breadcrumbs end -->
						</div>
					</div>
				</section>
			</aside>
			<!-- /.right-side -->
		</div>
		<!-- ./wrapper -->

		<!-- jQuery -->
		<script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
		<!-- Bootstrap -->
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
		<!-- Director App -->
		<script src="js/app.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/com.js" ></script>
		<script type="text/javascript">
			$('.nav-tabs li a').click(function() {
				if($(this).parent('li').attr('class') == 'active') return;
				var a_href = $(this).attr("href");
				switch(a_href) {
					case '#user':
						$('#user').load('exam_pageinfo.jsp #user_table_audit');
						break;
					case '#award':
						$('#award').load('exam_pageinfo.jsp #award_table_audit');
						break;
					case '#works':
						$('#works').load('exam_pageinfo.jsp #works_table_audit',selectSeacher());
						break;
					case '#paper':
						$('#paper').load('exam_pageinfo.jsp #paper_table_audit',selectSeacher());
						break;
					case '#patent':
						$('#patent').load('exam_pageinfo.jsp #patent_table_audit',selectSeacher());
						break;
					case '#project':
						$('#project').load('exam_pageinfo.jsp #project_table_audit',selectSeacher());
						break;
					default:
						break;
				}
				selectSeacher();
			})
			$(function() {
				$('a[href="#user"]').click();
			})
		</script>

	</body>
</html>
