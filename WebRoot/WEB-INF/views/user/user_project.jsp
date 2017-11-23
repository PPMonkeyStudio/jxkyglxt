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
<title>教师-项目</title>
<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath%>/css/user_table.css" />
<link rel="stylesheet" href="<%=basePath%>/css/user_form.css" />
<script type="text/javascript"
	src="<%=basePath%>/js/jquery-3.1.1.min.js"></script>
<jsp:include page="/modal/admin/projects_modal.html" flush="true"></jsp:include>
<jsp:include page="/modal/export/project_modal.html" flush="true"></jsp:include>
<jsp:include page="/top_nav.jsp" flush="true"></jsp:include>
<jsp:include page="/user_left_nav.jsp" flush="true"></jsp:include>
</head>
<body>
	<div id="info_type">
		<div id="type_content">教师项目(课题)</div>

		<div class="export_button">
			<button class="btn btn-sm btn-primary btn-default">导出</button>
		</div>
		<div class="add_button">
			<button class="btn btn-sm btn-primary btn-default">添加</button>
		</div>
	</div>
	<div id="mian">
		<div id="info_table" class="table-responsive">
			<div id="table_content">
				<table class="table   " id="user_award_table">
					<thead>
						<tr>

							<td>项目名称</td>
							<td>项目来源</td>
							<td>立项编号或批准文号</td>
							<td>创建时间</td>
							<td>操作</td>
						</tr>

					</thead>
					<tbody>
						<tr>
							<td>项目名称</td>
							<td>国家自然科学基金项目</td>
							<td>178956</td>
							<td>2017-10-29</td>
							<td><img class="checkimg1" data-toggle="modal"
								data-target="#check_project" src="img/查看(3).png" /><img
								class="checkimg2" data-toggle="modal"
								data-target="#modify_project" src="img/修改.png" /><img
								class="checkimg3" src="img/提交审核.png" /></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="page">
				<ul class="pager">
					<li><a onclick="page(1)">首页</a></li>
					<li><a onclick="prepage()">上一页</a></li>
					<li><a onclick="nextpage()">下一页</a></li>
					<li><a onclick="page(999)">尾页</a></li>
				</ul>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<%=basePath%>/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/jquery-confirm.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>/js/project/user_project.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/com/user_com.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>/js/user_checkImgChange.js"></script>
</body>
</html>