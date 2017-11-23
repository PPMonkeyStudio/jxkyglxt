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

<title>My JSP 'MyJsp.jsp' starting page</title>
<script type="text/javascript"
	src="<%=basePath%>/js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath%>/css/teacher_award.css" />
<link rel="stylesheet" href="<%=basePath%>/css/user_form.css" />
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
	This is my JSP page.
	<br>
	<div id="main"></div>
	<div id="account"></div>
	<input multiple id="importdata" onchange="upload()" type="file"
		value="上传">

	<!-- <div id="mian">
		<div id="info_table" class="table-responsive">
			<div id="table_content"></div>
		</div>
	</div> -->

	<script type="text/javascript">
		/* $('#main').load('left_nav.jsp', function() {
			$('#left_nav_ul li a').click(function() {
				$(this).removeAttr('href');
				$('#account').load('top_nav.jsp');
				$('#table_content').load('exam_award.jsp #info_table', function(xhr) {
					alert(xhr);
				});
			});
		}); */
		function upload() {
			var formData = new FormData();
			for (var i = 0; i < document.getElementById("importdata").files.length; i++) {
				formData.append("file", document.getElementById("importdata").files[i]);
			}
			formData.append("tableName", "TeacherAward");
			$.ajax({
				url : "/teacherms/Teacher/teacher_uploadAttachment",
				type : "post",
				timeout : 3000,
				data : formData,
				contentType : false,
				processData : false,
				success : function(xhr) {},
				error : function() {}
			});
		}
	</script>
</body>
</html>
