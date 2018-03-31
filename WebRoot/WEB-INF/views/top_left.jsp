<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	Locale locale = request.getLocale();
	Calendar calendar = Calendar.getInstance(locale);
	int hour = calendar.get(Calendar.HOUR_OF_DAY);
	String greeting = "";
	if (hour <= 5) {
		greeting = "夜深了，";
	} else if (hour <= 9) {
		greeting = "早安了，";
	} else if (hour <= 11) {
		greeting = "上午好，";
	} else if (hour <= 13) {
		greeting = "中午好，";
	} else if (hour <= 18) {
		greeting = "下午好，";
	} else if (hour <= 22) {
		greeting = "晚上好，";
	} else if (hour <= 24) {
		greeting = "夜深了，";
	} else {
		greeting = "您好，";
	}
%>
<html>
<head>
<base href="<%=basePath%>">

<title>nav page</title>

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

<link rel="stylesheet" href="<%=basePath%>css/jquery.datetimepicker.css" />

<script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>

<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>

<script type="text/javascript" src="<%=basePath%>js/app.js"></script>

<script type="text/javascript" src="<%=basePath%>js/jquery-confirm.js"></script>

<script type="text/javascript" src="<%=basePath%>js/toastr.js"></script>

<script type="text/javascript" src="<%=basePath%>js/zoomify.min.js"></script>

<script type="text/javascript"
	src="<%=basePath%>js/jquery.datetimepicker.full.js"></script>

</head>

<body class="skin-black">
	<!-- 访问首页介绍的信息 -->
	<s:action namespace="/System" name="system_getIntroduction"
		executeResult="false"></s:action>
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
			<%-- <li class="dropdown messages-menu"><a class="dropdown-toggle"
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
										<img src="" class="img-circle" alt="" />
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
				</ul></li> --%>
			<!--任务信息---------------------------------->
			<!----------=略=-------->
			<!--用户信息------------------------------>
			<!-- User Account: style can be found in dropdown.less -->
			<li class="dropdown user user-menu"><a class="dropdown-toggle"
				data-toggle="dropdown"> <i class="fa fa-user"></i> <span
					class="userName_info"><s:property
							value="#session.loginuser.userName" /> <i class="caret"></i> </span>
			</a>
				<ul class="dropdown-menu dropdown-custom dropdown-menu-right">
					<li class="dropdown-header text-center">帐号</li>
					<s:if test="#session.role!='教职工'&&#session.role!='系统管理员'">
						<li><a href="javascript:toIntroductionModify()"> <i
								class="fa fa-clock-o fa-fw pull-right"></i> <span
								class="badge badge-success pull-right"><s:property
										value="#request.Introductions.size()" /></span> 更新首页信息
						</a></li>
					</s:if>
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
					<li><a href="javascript:exit_alert()"> <i
							class="fa fa-ban fa-fw pull-right"></i> 退出系统
					</a></li>
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
					<%=greeting%>
					<s:property value="#session.loginuser.userName" />
					。
				</p>
				<a><i class="fa fa-circle text-success"></i> 在线</a>
			</div>
		</div>
		<!-- search form --> <%-- <div class="input-group">
			<input type="text" name="q" class="form-control" placeholder="搜索功能" />
			<span class="input-group-btn">
				<button type='submit' name='seach' id='search-btn'
					class="btn btn-flat">
					<i class="fa fa-search"></i>
				</button>
			</span>
		</div> --%> <!-- /.search form --> <!-- sidebar menu: : style can be found in sidebar.less -->
		<s:if test="#session.role=='系统管理员'">
			<ul class="sidebar-menu">
				<li><a href="#sub0" data-toggle="collapse" class="collapsed"
					aria-expanded="false"> <i class="fa fa-user"></i> <span>管理员账户管理</span>
						<i class="icon-submenu fa fa-angle-left"></i>
				</a>
					<div id="sub0" class="collapse" aria-expanded="false"
						style="height: 0px;">
						<ul class="nav">
							<li><a class="">管理员帐号</a></li>
							<li><a class="">人员调动</a></li>
						</ul>
					</div></li>
			</ul>
			<ul class="sidebar-menu">
				<li><a href="#sub1" data-toggle="collapse" class="collapsed"
					aria-expanded="false"> <i class="fa fa-user"></i> <span>教师管理</span>
						<i class="icon-submenu fa fa-angle-left"></i>
				</a>
					<div id="sub1" class="collapse" aria-expanded="false"
						style="height: 0px;">
						<ul class="nav">
							<li><a class="">教师信息审核</a></li>
							<li><a class="">教师信息管理</a></li>
						</ul>
					</div></li>
			</ul>
			<ul class="sidebar-menu">
				<li><a href="#sub2" data-toggle="collapse" class="collapsed"
					aria-expanded="false"> <i class="fa fa-user"></i> <span>学生管理</span>
						<i class="icon-submenu fa fa-angle-left"></i>
				</a>
					<div id="sub2" class="collapse" aria-expanded="false"
						style="height: 0px;">
						<ul class="nav">
							<li><a class="">学生信息查看</a></li>
							<li><a class="">学生信息管理</a></li>
						</ul>
					</div></li>
			</ul>
		</s:if> <s:if test="#session.role=='院系管理员'">
			<ul class="sidebar-menu">
				<li><a href="#sub1" data-toggle="collapse" class="collapsed"
					aria-expanded="false"> <i class="fa fa-user"></i> <span>教师管理</span>
						<i class="icon-submenu fa fa-angle-left"></i>
				</a>
					<div id="sub1" class="collapse" aria-expanded="false"
						style="height: 0px;">
						<ul class="nav">
							<li><a class="">教师信息审核</a></li>
							<li><a class="">教师信息管理</a></li>
						</ul>
					</div></li>
			</ul>
			<ul class="sidebar-menu">
				<li><a href="#sub2" data-toggle="collapse" class="collapsed"
					aria-expanded="false"> <i class="fa fa-user"></i> <span>学生管理</span>
						<i class="icon-submenu fa fa-angle-left"></i>
				</a>
					<div id="sub2" class="collapse" aria-expanded="false"
						style="height: 0px;">
						<ul class="nav">
							<li><a class="">学生信息查看</a></li>
							<li><a class="">学生信息管理</a></li>
						</ul>
					</div></li>
			</ul>
		</s:if> <s:if test="#session.role=='教职工'">
			<ul class="sidebar-menu">
				<li><a href="#subPages" data-toggle="collapse"
					class="collapsed" aria-expanded="false"><i class="fa fa-user"></i>
						<span>教师信息</span> <i class="icon-submenu fa fa-angle-left"></i></a>
					<div id="subPages" class="collapse" aria-expanded="false"
						style="height: 0px;">
						<ul class="nav">
							<li><a class="">教师信息查看</a></li>
						</ul>
					</div></li>
			</ul>

			<ul class="sidebar-menu">
				<li><a href="#sub2" data-toggle="collapse" class="collapsed"
					aria-expanded="false"> <i class="fa fa-user"></i> <span>学生管理</span>
						<i class="icon-submenu fa fa-angle-left"></i>
				</a>

					<div id="sub2" class="collapse" aria-expanded="false"
						style="height: 0px;">
						<ul class="nav">
							<li><a class="">学生信息查看</a></li>
							<li><a class="">学生信息管理</a></li>
						</ul>
					</div></li>
			</ul>
		</s:if>
		<ul class="sidebar-menu">
			<li><a href="#sub3" data-toggle="collapse" class="collapsed"
				aria-expanded="false"> <i class="fa fa-user"></i> <span>我的账户</span>
					<i class="icon-submenu fa fa-angle-left"></i>
			</a>
				<div id="sub3" class="collapse" aria-expanded="false"
					style="height: 0px;">
					<ul class="nav">
						<!-- <li><a class="">账户设置</a></li> -->
						<li><a onclick="user_setting(user_setting)"
							class=" setButton">重置密码</a></li>
						<li><a href="javascript:exit_alert()"><i
								class="fa fa-ban fa-fw pull-right"></i> 退出系统</a></li>
					</ul>
				</div></li>

		</ul></aside>
		<aside class="right-side"> <section class="content">
		<div class="row">
			<div class="col-md-12">
				<!--breadcrumbs start -->
				<section class="content" id="content">
				<div class="row">
					<div class="col-md-12">
						<!--breadcrumbs start -->
						<ul class="breadcrumb">
							<li><a><i class="fa fa-home"></i> 首页</a></li>
						</ul>
						<section class="panel general"> <header
							class="panel-heading tab-bg-dark-navy-blue">
						<ul class="nav nav-tabs">
						</ul>
						</header>
						<div id="info_display">
							<div class="panel-body">
								<div class="tab-content">
									<div id="info_content">
										<div class="top_line">
											<h4 class="h4_style">教师信息</h4>
											<hr class="hr_style" />
										</div>
										<div class="top_content">
											<ul id="info_ul">
												<s:iterator value="#request.Introductions" status="st">
													<li>
														<ul
															class='innner_ul delay<s:property value="(#st.index+1)*200" /> '>
															<li>
																<h4>
																	<s:property value="introductionName" />
																</h4> <span><s:property value="introductionContent" /></span>
															</li>
														</ul>
													</li>
													<s:if test="#st.Last && #session.role!='教职工'">
														<li>
															<ul
																class='innner_ul delay<s:property value="(#st.index+2)*200" /> '>
																<li><img id="addImg"
																	src="<%=basePath%>/img/add(2).png" />
																	<h4 id="addInfo">添加信息</h4></li>
															</ul>
														</li>
													</s:if>
												</s:iterator>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						</section>
						<!--breadcrumbs end -->
					</div>
				</div>
				</section>
				<!--breadcrumbs end -->
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<!--breadcrumbs start -->

				<!-- <ul class="breadcrumb">
					<li><a><i class="fa fa-home"></i> 首页</a></li>
				</ul> -->
				<!--breadcrumbs end -->
			</div>
		</div>
		</section> </aside>
		<!-- /.right-side -->
	</div>
	<!-- ./wrapper -->
	<!-- Director App -->
	<script type="text/javascript">
		$.datetimepicker.setLocale('ch');
		
		/* document.getElementsByClassName("riliDate").flatpickr();
		//创建一个当前日期对象
		var now = new Date();
		//格式化日，如果小于9，前面补0
		var day = ("0" + now.getDate()).slice(-2);
		//格式化月，如果小于9，前面补0
		var month = ("0" + (now.getMonth() + 1)).slice(-2);
		//拼装完整日期格式
		var today = now.getFullYear() + "-" + (month) + "-" + (day);
		$(".riliDate").val(today); */
	
		$(function() {
			var top_val = 240 - (parseInt($("#info_ul li").length / 8) - 1) * 180;
			console.log(parseInt($("#info_ul li").length / 8));
			$("#info_ul").on({
				mousedown : function(e) {
					if (e.target.parentElement.id == "info_ul") {
						var el = $(this);
						var os = el.offset();
						//dx = e.pageX - os.left;  left : e.pageX - dx
						dy = e.pageY - os.top;
						$(document).on('mousemove.drag', function(e) {
							el.offset({
								top : e.pageY - dy,
							});
						});
					}
				},
				mouseup : function(e) {
					console.log(top_val);
					if ($(this).offset().top > 425) {
						$(this).css('transition', 'all 1s');
						$(this).offset({
							top : 425,
						});
					}
					if ($(this).offset().top < top_val) {
						$(this).css('transition', 'all 1s');
						$(this).offset({
							top : top_val,
						});
					}
					$(document).off('mousemove.drag');
					setTimeout(() => $(this).css('transition', ''), 1000);
				}
			})
		})
		function toIntroductionModify() {
			$('.right-side').load('page/teacher/IntroductionModify.jsp #content', function() {
				$.getScript("js/teacher/IntroductionModify.js");
			});
		}
		function exit_alert() {
			$.confirm({
				title : '退出登录',
				content : '即将退出系统,确定继续退出吗?',
				smoothContent : false,
				autoClose : 'cancelAction|10000',
				buttons : {
					deleteUser : {
						btnClass : 'btn-danger',
						text : '确定',
						action : function() {
							window.location.href = "/jxkyglxt/System/system_exit"
						}
					},
					cancelAction : {
						btnClass : 'btn-blue',
						text : '取消',
					}
				}
			});
		}
		//监听窗口关闭
		$(window).unload(function(evt) {
			if (typeof evt == 'undefined') {
				evt = window.event;
			}
			if (evt) {
				var n = window.event.screenX - window.screenLeft;
				var b = n > document.documentElement.scrollWidth - 20;
				if (b && window.event.clientY < 0 || window.event.altKey) {
					tosstr.info('已退出登录');
					$.post('/jxkyglxt/System/system_exit', {}, function(xhr) {}, 'json');
				}
			}
		});
	</script>
</body>
</html>
