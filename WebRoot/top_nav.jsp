<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<%=basePath%>/css/top_nav.css" />
<link rel="stylesheet" href="<%=basePath%>/css/need/laydate.css" />
<script type="text/javascript"
	src="<%=basePath%>/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/laydate.js"></script>
</head>
<body>
	<div class="total_nav">
		<div id="logo_nav">
			<img src="<%=basePath%>/img/logo5.jpg" />
		</div>
		<div class="content_nav">
			<ul class="nav_ul" id="nav_ul">
				<li><a href="/teacherms/Page/page_index">首页</a></li>
				<s:if test="#session.role=='院系管理员'">
					<li <s:if test="#page=='teacher'">class="top_after_li"</s:if>><a
						href="/teacherms/Page/page_teacher_award">信息审核</a></li>
					<li <s:if test="#page=='exam'">class="top_after_li"</s:if>><a
						href="/teacherms/Page/page_exam_user">信息查看</a></li>
					<li id="role_li" onmouseover="afterImg()"
						onmouseleave="beforeImg()"><span> <img id="roleImg"
							src="http://localhost:8080/teacherms/img/admin5.png" />
					</span> <s:property value="#session.user.userName" />
						<ul id="second_ul" class="second_ul">
							<li><a onclick="import_to_database()">导入信息</a></li>
							<li><a onclick="modifi_password()">修改密码</a></li>
							<li><a
								onclick="javascript:location.href='/teacherms/System/system_exit'">退出</a></li>
						</ul></li>
				</s:if>
				<s:if test="#session.role=='教职工'">
					<li <s:if test="#page=='user'">class="top_after_li"</s:if>><a
						href="/teacherms/Page/page_user_info">信息</a></li>
					<li id="role_li" onmouseover="afterImg()"
						onmouseleave="beforeImg()"><span> <img id="roleImg"
							src="http://localhost:8080/teacherms/img/admin5.png" />
					</span> <s:property value="#session.user.userName" />
						<ul id="user_second_ul" class="user_second_ul">
							<li>修改密码</li>
							<li><a
								onclick="javascript:location.href='/teacherms/System/system_exit'">退出</a></li>
						</ul></li>
				</s:if>
			</ul>
		</div>
	</div>

	<div class="clear"></div>
	<script type="text/javascript" src="<%=basePath%>/js/top_nav.js"></script>
	<script>
		$(function() {
			$('#role_li').hover(function() {
				$('#second_ul').show();
	
			}, function() {
				$('#second_ul').hide();
			});
			$('#role_li').hover(function() {
				$('#user_second_ul').show();
	
			}, function() {
				$('#user_second_ul').hide();
			});
		});
		function modifi_password() {
			$.alert({
				title : '修改密码!',
				content : '<input class="alert_password form-control" type="password" placeholder="新密码"><br><input class="alert_password form-control" type="password" placeholder="再次输入密码">',
				buttons : {
					confirm : {
						text : '确定',
						btnClass : 'btn-red',
						keys : [ 'enter' ],
						action : function() {
	
							var password1 = $('.alert_password').eq(0).val();
							var password2 = $('.alert_password').eq(1).val();
							if (password1 != password2) {
								$.alert('密码不一致!');
							} else {
								$.post("/teacherms/System/system_resetPassword", "password=" + password2, function(xhr_data) {
									if (xhr_data.result == "success") {
										alert("修改成功");
									}
								}, "json");
							}
						}
					},
					cancel : {
						text : '取消',
						btnClass : 'btn-blue',
						keys : [ 'esc' ],
					}
				}
			});
		}
		function import_to_database() {
			$.confirm({
				title : '导入数据',
				content : '选择导入的数据文件（仅限execl）：<input onchange="impot_data()" type="file" id="importdata" value="导入">',
				确认 : function() {
					alert("sss");
					var formData = new FormData();
					formData.append("file", document.getElementById("importdata").files[0]);
					$.ajax({
						url : "/teacherms/Admin/admin_importDatabase",
						type : "post",
						timeout : 3000,
						data : formData,
						contentType : false,
						processData : false,
						success : function(data) {
							$.alert('导入成功!')
						},
						error : function() {}
					});
				},
				取消 : function() {
					$.alert('Canceled!')
				}
			});
		}
	
		function impot_data() {
			var formData = new FormData();
			formData.append("file", document.getElementById("importdata").files[0]);
			$.ajax({
				url : "/teacherms/Admin/admin_importDatabase",
				type : "post",
				timeout : 3000,
				data : formData,
				contentType : false,
				processData : false,
				success : function(data) {
					$.alert('导入成功!')
				},
				error : function() {}
			});
		}
	</script>
	<script>
		!function() {
			laydate.skin('danlan'); //切换皮肤，请查看skins下面皮肤库
			laydate({
				elem : '#main_body .laydate-icon'
			}); //绑定元素
		}();
		//日期范围限制
		var start = {
			elem : '#start',
			format : 'YYYY-MM-DD',
			min : laydate.now(), //设定最小日期为当前日期
			max : '2099-06-16', //最大日期
			istime : true,
			istoday : false,
			choose : function(datas) {
				end.min = datas; //开始日选好后，重置结束日的最小日期
				end.start = datas //将结束日的初始值设定为开始日
			}
		};
	
		var end = {
			elem : '#end',
			format : 'YYYY-MM-DD',
			min : laydate.now(),
			max : '2099-06-16',
			istime : true,
			istoday : false,
			choose : function(datas) {
				start.max = datas; //结束日选好后，充值开始日的最大日期
			}
		};
		laydate(start);
		laydate(end);
	</script>
</body>
</html>