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

<title><s:property value="#session.user.userName" /> - 本科数据管理系统</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="<%=basePath%>css/com.css" />
<!-- 导出模态框css -->
<link rel="stylesheet" href="<%=basePath%>css/export_modal.css" />
</head>
<body>
	<s:action name="page_nav" namespace="/Page" executeResult="true" />

	<jsp:include page="/modal/addInfo/award_modal.jsp" flush="true"></jsp:include>
	<jsp:include page="/modal/addInfo/info_modal.jsp" flush="true"></jsp:include>
	<jsp:include page="/modal/addInfo/paper_modal.jsp" flush="true"></jsp:include>
	<jsp:include page="/modal/addInfo/works_modal.jsp" flush="true"></jsp:include>
	<jsp:include page="/modal/addInfo/project_modal.jsp" flush="true"></jsp:include>
	<jsp:include page="/modal/addInfo/patent_modal.jsp" flush="true"></jsp:include>
	<jsp:include page="/modal/addInfo/user_info_modal.jsp" flush="true"></jsp:include>
	<jsp:include page="/modal/addInfo/userSetting.jsp" flush="true"></jsp:include>

	<jsp:include page="/modal/exportInfo/info_modal.jsp" flush="true"></jsp:include>
	<jsp:include page="/modal/exportInfo/award_modal.jsp" flush="true"></jsp:include>
	<jsp:include page="/modal/exportInfo/paper_modal.jsp" flush="true"></jsp:include>
	<jsp:include page="/modal/exportInfo/patent_modal.jsp" flush="true"></jsp:include>
	<jsp:include page="/modal/exportInfo/project_modal.jsp" flush="true"></jsp:include>
	<jsp:include page="/modal/exportInfo/works_modal.jsp" flush="true"></jsp:include>
<%-- 	
	
	<jsp:include page="/modal/student_audit/award_modal.jsp" flush="true"></jsp:include>
	<jsp:include page="/modal/student_audit/info_modal.jsp" flush="true"></jsp:include>
	<jsp:include page="/modal/student_audit/paper_modal.jsp" flush="true"></jsp:include>
	<jsp:include page="/modal/student_audit/patent_modal.jsp" flush="true"></jsp:include>
	<jsp:include page="/modal/student_audit/project_modal.jsp" flush="true"></jsp:include>
	<jsp:include page="/modal/student_check/award_modal.jsp" flush="true"></jsp:include>
	<jsp:include page="/modal/student_check/info_modal.jsp" flush="true"></jsp:include>
	<jsp:include page="/modal/student_check/paper_modal.jsp" flush="true"></jsp:include>
	<jsp:include page="/modal/student_check/patent_modal.jsp" flush="true"></jsp:include>
	<jsp:include page="/modal/student_check/project_modal.jsp" flush="true"></jsp:include> --%>


	<script type="text/javascript" src="<%=basePath%>js/teacher/main_index.js"></script>
</body>
</html>
