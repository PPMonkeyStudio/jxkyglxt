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
	<link rel="stylesheet" href="css/com.css" />
	<link rel="stylesheet" href="css/need/laydate.css" />
	<link rel="stylesheet" href="/css/bootstrap.min.css" />
	
 <jsp:include page="/modal/addInfo/award_modal.html" flush="true"></jsp:include>
	<jsp:include page="/modal/addInfo/info_modal.html" flush="true"></jsp:include>
	<jsp:include page="/modal/addInfo/paper_modal.html" flush="true"></jsp:include>
	<jsp:include page="/modal/addInfo/works_modal.html" flush="true"></jsp:include>
	<jsp:include page="/modal/addInfo/project_modal.html" flush="true"></jsp:include>
	<jsp:include page="/modal/addInfo/patent_modal.html" flush="true"></jsp:include> 
	<jsp:include page="/modal/addInfo/ user_info_modal.html" flush="true"></jsp:include> 
  </head>
  
 <body>
		<s:action name="page_nav" namespace="/Page" executeResult="true" />
		<!-- 模态框（Modal） -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">模态框（Modal）标题</h4>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">提交更改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
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
			<script type="text/javascript" src="js/jquery-3.1.1.min.js" ></script>
			<script type="text/javascript" src="js/bootstrap.min.js"></script>
			<script type="text/javascript" src="js/com/exam_com.js" ></script>
			<script type="text/javascript" src="js/com/check_com.js" ></script>
			
			<script type="text/javascript" src="js/main_index.js" ></script>
			<script type="text/javascript" src="js/info/exam_info.js" ></script>
			<script type="text/javascript" src="js/award/exam_award.js" ></script>
			<script type="text/javascript" src="js/paper/exam_paper.js" ></script>
			<script type="text/javascript" src="js/works/exam_works.js" ></script>
			<script type="text/javascript" src="js/project/exam_project.js" ></script>
			<script type="text/javascript" src="js/patent/exam_patent.js" ></script>
			
			<script type="text/javascript" src="js/info/check_info.js" ></script>
			<script type="text/javascript" src="js/award/check_award.js" ></script>
			<script type="text/javascript" src="js/paper/check_paper.js" ></script>
			<script type="text/javascript" src="js/patent/check_patent.js" ></script>
			<script type="text/javascript" src="js/project/check_project.js" ></script>
			<script type="text/javascript" src="js/works/check_works.js" ></script>
		<script type="text/javascript" src="js/main.js" ></script>
		<script type="text/javascript" src="js/laydate.js" ></script>
	</body>
</html>
