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
				<li class="active">人员调动 <i
					class="fa fa-spinner fa-spin PersonnelRedeploy-loading"></i></li>
			</ul>
			<!--breadcrumbs end -->
		</div>
	</div>
	<s:action namespace="/System"
		name="system_GetTheDepartmentWithTheCollege" executeResult="false"></s:action>
	<div class="row">
		<div class="col-md-12">
			<!--breadcrumbs start -->
			<section class="panel general">

			<div>

				<!-- Nav tabs -->
				<ul class="nav nav-tabs personnelRedeploy-tabs" role="tablist">

					<s:iterator id="DL" value="#request.DepartmentList" status="st">
						<li role="presentation" class=""><a
							href="#<s:property value="#DL.department.departmentId" />"
							aria-controls="home" role="tab" data-toggle="tab"><s:property
									value="#DL.department.departmentName" /></a></li>
					</s:iterator>

				</ul>
				<!-- Tab panes -->
				<div class="tab-content personnelRedeploy">

					<s:iterator id="DL" value="#request.DepartmentList" status="st">

						<div role="tabpanel" class="tab-pane"
							id="<s:property value="#DL.department.departmentId" />">
							<div class="list-group">
								<s:iterator id="list" value="#DL.list" status="st">
									<a href="javascript:void(0);" class="list-group-item col-md-2"
										user-id="<s:property value="#list.userId" />"><s:property
											value="#list.userName" /></a>
								</s:iterator>
							</div>
						</div>

					</s:iterator>

				</div>
			</div>
			</section>
			<!--breadcrumbs end -->
		</div>
	</div>
	</section> 
</body>
</html>