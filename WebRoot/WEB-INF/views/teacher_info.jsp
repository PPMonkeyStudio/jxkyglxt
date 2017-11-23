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
<title>教职工信息</title>
<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath%>/css/teacher_award.css" />
<link rel="stylesheet" href="<%=basePath%>/css/user_form.css" />
<script type="text/javascript"
	src="<%=basePath%>/js/jquery-3.1.1.min.js"></script>
<jsp:include page="/modal/admin/info_modal.html" flush="true"></jsp:include>
<jsp:include page="/top_nav.jsp" flush="true"></jsp:include>
<jsp:include page="/left_nav.jsp" flush="true"></jsp:include>
</head>
<body>
	<div id="info_type">
		<div id="type_content">教职工信息</div>

	</div>

	<div id="mian">
		<div id="info_table" class="table-responsive">
			<div id="table_content">
				<table class="table">
					<thead>
						<tr>
							<td>工号</td>
							<td>姓名</td>
							<td>专业技术职称</td>
							<td>教师资格证号</td>
							<td>授课类型</td>
							<td>创建时间</td>
							<td>操作</td>
						</tr>

					</thead>
					<tbody>
						<!-- <tr>
						<td>15478011</td>
						<td>张三</td>
						<td>教授</td>
						<td>15478000</td>
						<td>专业课</td>
						<td>2017-10-29</td>
						<td><img class="checkimg" src="img/审核(6).png" /></td>
					</tr> -->
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
	<script type="text/javascript" src="<%=basePath%>/js/info/info.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/com/com.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/checkImgChange.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/bootstrap.min.js"></script>
</body>
</html>