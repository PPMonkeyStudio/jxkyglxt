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

<title>My JSP 'test.jsp' starting page</title>

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
	<s:action name="page_nav" namespace="/Page" executeResult="true" />
	This is my JSP page.
	<br>
	<input type="button" class="form-control" onclick="DownloadTest()" value="查看">
	<script type="text/javascript">
		function DownloadTest() {
			location.href = "/teacherms/Teacher/teacher_downloadAttachment?username=张三&tableName=TeacherAward&downloadInfoId=0c52c25a-b844-4e6d-9b33-576e8938c611,c40f4a5d-7d83-4729-bb1a-012c8ec796c1";
		}
	</script>
</body>
</html>
