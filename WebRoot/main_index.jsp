<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>管理员登录</title>


<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="styles.css">

<link rel="stylesheet" href="css/com.css" />
<link rel="stylesheet" href="css/toastr.css" />
<link rel="stylesheet" href="css/export_modal.css" />
<link rel="stylesheet" href="css/need/laydate.css" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>

<body>

	<s:action name="page_nav" namespace="/Page" executeResult="true" />

	<script type="text/javascript" src="js/com/check_com.js"></script>
	<script type="text/javascript" src="js/toastr.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	<script type="text/javascript" src="js/laydate.js"></script>

	<script type="text/javascript" src="js/info/exam_info.js"></script>
	<script type="text/javascript" src="js/award/exam_award.js"></script>
	<script type="text/javascript" src="js/paper/exam_paper.js"></script>
	<script type="text/javascript" src="js/works/exam_works.js"></script>
	<script type="text/javascript" src="js/project/exam_project.js"></script>
	<script type="text/javascript" src="js/patent/exam_patent.js"></script>

	<script type="text/javascript" src="js/info/check_info.js"></script>
	<script type="text/javascript" src="js/award/check_award.js"></script>
	<script type="text/javascript" src="js/paper/check_paper.js"></script>
	<script type="text/javascript" src="js/patent/check_patent.js"></script>
	<script type="text/javascript" src="js/project/check_project.js"></script>
	<script type="text/javascript" src="js/works/check_works.js"></script>

	<script type="text/javascript" src="js/info/user_info.js"></script>
	<script type="text/javascript" src="js/award/user_award.js"></script>
	<script type="text/javascript" src="js/paper/user_paper.js"></script>
	<script type="text/javascript" src="js/patent/user_patent.js"></script>
	<script type="text/javascript" src="js/project/user_project.js"></script>
	<script type="text/javascript" src="js/works/user_works.js"></script>


</body>
</html>
