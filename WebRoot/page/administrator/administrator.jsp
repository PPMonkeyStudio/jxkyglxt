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

<title>My JSP 'administrator.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
<body>
	<!--管理员审核信息时右侧内容-->
	<section class="content" id="content">
	<div class="row">
		<div class="col-md-12">
			<!--breadcrumbs start -->
			<ul class="breadcrumb">
				<li><a><i class="fa fa-home"></i> 首页</a></li>
				<li class="active">信息审核</li>
			</ul>
			<!--breadcrumbs end -->
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<!--breadcrumbs start -->
			<section class="panel general">
			<div class="panel-group" id="accordion" role="tablist"
				aria-multiselectable="true">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion"
								href="#collapseOne" aria-expanded="true"
								aria-controls="collapseOne"> Collapsible Group Item #1 </a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in"
						role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">
							<!--===================================================================================-->
							<div class="list-group">
								<a href="#" class="list-group-item active"> Cras justo odio
								</a> <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
								<a href="#" class="list-group-item">Morbi leo risus</a> <a
									href="#" class="list-group-item">Porta ac consectetur ac</a> <a
									href="#" class="list-group-item">Vestibulum at eros</a>
							</div>

						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingTwo">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#collapseTwo"
								aria-expanded="false" aria-controls="collapseTwo">
								Collapsible Group Item #2 </a>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingTwo">
						<div class="panel-body">
							<!--===================================================================================-->
							<div class="list-group">
								<a href="#" class="list-group-item active"> Cras justo odio
								</a> <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
								<a href="#" class="list-group-item">Morbi leo risus</a> <a
									href="#" class="list-group-item">Porta ac consectetur ac</a> <a
									href="#" class="list-group-item">Vestibulum at eros</a>
							</div>



						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingThree">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#collapseThree"
								aria-expanded="false" aria-controls="collapseThree">
								Collapsible Group Item #3 </a>
						</h4>
					</div>
					<div id="collapseThree" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingThree">
						<div class="panel-body">
							<!--===================================================================================-->
							<div class="list-group">
								<a href="#" class="list-group-item active"> Cras justo odio
								</a> <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
								<a href="#" class="list-group-item">Morbi leo risus</a> <a
									href="#" class="list-group-item">Porta ac consectetur ac</a> <a
									href="#" class="list-group-item">Vestibulum at eros</a>
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
</body>
</body>
</html>