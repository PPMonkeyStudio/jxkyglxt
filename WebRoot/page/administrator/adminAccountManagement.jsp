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
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>

<body>
<body>
	<!--管理员审核信息时右侧内容-->
	<section class="content" id="content">
	<div class="row">
		<div class="col-md-12">
			<!--breadcrumbs start -->
			<ul class="breadcrumb">
				<li><a href="javascript:location.reload();"><i class="fa fa-home"></i> 首页</a></li>
				<li class="active">管理员帐号管理</li>
			</ul>
			<!--breadcrumbs end -->
		</div>
	</div>
	<s:action namespace="/System" name="system_getAllAdminUser"
		executeResult="false"></s:action>
	<div class="row">
		<div class="col-md-12">
			<!--breadcrumbs start -->
			<section class="panel general">
			<div class="panel-group" id="accordion" role="tablist"
				aria-multiselectable="true">

				<div class="list-group">
					<a class="list-group-item"><button
							class="btn btn-default user_add btn-sm">
							<i class="fa fa-plus"></i>添加管理
						</button></a>

					<s:iterator value="#request.adminList" status="st">
						<a class="list-group-item"
							introduction-id="<s:property value="userId"/>"><span
							class="badge"><s:property value="departmentId" /></span> <s:property
								value="userName" /> </a>
					</s:iterator>
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