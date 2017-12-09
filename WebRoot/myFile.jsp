<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<script type="text/javascript" src="js/jquery-3.1.1.min.js" ></script>
  </head>
  
  <body onload="getinfo()">
  <div id="one">
 <table calss="table"></table>
  </div>
  
  <script>
  function getinfo() {
	  var data = {
				tableName : "TeacherAward",
				dataState : "20",
				page : 1,
				time_interval : "",
				tableId : "",
			}
		//清楚原来的数据
		$.ajax({
			url : "/teacherms/Admin/admin_getSpecifiedInformationByPaging",
			type : "post",
			async : false,
			timeout : 3000,
			data : data,
			dataType : "json",
			success : function(xhr_data) {
				alert(xhr_data);
				/*  for (var i = 0; i < xhr_data.ObjDatas.length; i++) {
					var str = "<tr>";
					for (var j = 0; j < xhr_data.ObjDatas[i].length; j++) {
						if (j == xhr_data.ObjDatas[i].length - 1) {
							str += '<td><input type="hidden" value="' + xhr_data.ObjDatas[i][j] + '" ><img class="checkimg" src="/teacherms/img/review6.png" /></td>'
							continue;
						}
						str += "<td>" + xhr_data.ObjDatas[i][j] + "</td>";
						alert(str);
					}
					
					str += '</tr>';
					$('.table').children('tbody').append(str); 
				}  */
			},
			error : function() {}
		});
	}

  </script>
   </body>
</html>
