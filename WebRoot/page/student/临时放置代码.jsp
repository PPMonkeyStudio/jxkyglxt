<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP '临时放置代码.jsp' starting page</title>
    
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
页面/sim
	<!-- 搜索框 -->
											<div id="search">
												<label>指定条件搜索：</label> <select id="all_options"
													class="all_options form-control ">
													<option value="">请选择</option>
													<option value="student_name">姓名</option>
													<option value="studentId">学号</option>
													<option value="studentName">姓名</option>
													<option value="calendarYear">年制</option>
													
													<option value="enrolmentYear">入学年份</option>
													
													<option value="certificateType">证件类型</option>
													
													
													<option value="certificateNo">身份证/护照号码</option>
													
													<option value="sex">性别</option>
													<option value="nation">民族</option>
													<option value="politicalStatus">政治面貌</option>
													<option value="studentSource">生源地</option>
													<option value="studentType">学生类型</option>
													<option value="enrolmentType">招生类型</option>
													<option value="classType">授课方式</option>
													<option value="classNumber">专业代码</option>
													<option value="className">专业名称</option>
													<option value="inClassName">自主专业名称</option>
													<option value="departmentId">所在学院</option>
													<option value="teacherTraining">是否师范类</option>
													<option value="deformed">是否残疾</option>
													<option value="changes">异动类型</option>
													<option value="entranceRecord">入学学历</option>、
													<option value="enrolmentStyle">招生方式</option>
													<option value="droppingReason">休退学原因</option>
													<option value="registeredType">户口类型</option>
													<option value="degree">是否授予学位</option>
													<option value="alterTime">修改时间</option>
												</select>

												<button style="float: right; margin-left: 6px;"
													class="btn btn-danger search_info">
													<i class="fa fa-exclamation-circle" aria-hidden="true"></i>清空搜索
												</button>

												<button style="float: right;"
													class="btn btn-info search_info">
													<i class="fa fa-check-square-o" aria-hidden="true"></i>确认搜索
												</button>

												<div style="width: 100%; margin-top: 6px;" id="search_input"></div>
											</div>
											
											<!-- 搜索框end -->


  </body>
</html>
