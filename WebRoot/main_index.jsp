<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
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
		<%-- <section class="content"></section> --%>
	<!-- 	
		if(index)//主页
			$('right-side').load('index_pageinfo.html .content');
			if(view)//查看
			$('right-side').load('view_pageinfo.html .content',function(){
				$('.nav-tabs li a').click(function() {
				if($(this).parent('li').attr('class') == 'active') return;
				var a_href = $(this).attr("href");
				switch(a_href) {
					case '#user':
						$('#user').load('check_pageinfo.jsp #user_table_view');
						break;
					case '#award':
						$('#award').load('check_pageinfo.jsp #award_table_view');
						break;
					case '#works':
						$('#works').load('check_pageinfo.jsp #works_table_view');
						break;
					case '#paper':
						$('#paper').load('check_pageinfo.jsp #paper_table_view');
						break;
					case '#patent':
						$('#patent').load('check_pageinfo.jsp #patent_table_view');
						break;
					case '#project':
						$('#project').load('check_pageinfo.jsp #project_table_view');
						break;
					default:
						break;
				}
				$('a[href="#user"]').click();
			});
			});
			if(audit)//审核
			$('right-side').load('audit_pageinfo.html .content',function(){
				$('.nav-tabs li a').click(function() {
				if($(this).parent('li').attr('class') == 'active') return;
				var a_href = $(this).attr("href");
				switch(a_href) {
					case '#user':
						$('#user').load('exam_pageinfo.jsp  #user_table_audit');
						break;
					case '#award':
						$('#award').load('exam_pageinfo.jsp #user_table_audit');
						break;
					case '#works':
						$('#works').load('exam_pageinfo.jsp #user_table_audit');
						break;
					case '#paper':
						$('#paper').load('exam_pageinfo.jsp #user_table_audit');
						break;
					case '#patent':
						$('#patent').load('exam_pageinfo.jsp #user_table_audit');
						break;
					case '#project':
						$('#project').load('exam_pageinfo.jsp #user_table_audit');
						break;
					default:
						break;
				}
				$('a[href="#user"]').click();
			});
			
		 -->
		
	</body>
</html>
