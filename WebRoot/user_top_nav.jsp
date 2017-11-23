<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="<%=basePath%>/js/laydate.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/js/jquery-3.1.1.min.js"></script>


</head>
<body>
	<div class="total_nav">
		<div id="logo_nav">
			<img src="<%=basePath%>/img/logo5.jpg" />
		</div>


		<div class="content_nav">
			<ul class="nav_ul" id="nav_ul">
				<li class=".foncolo"><a href="">首页</a></li>
				<li><a href="">信息</a></li>
				<li id="role_li" onmouseover="afterImg()" onmouseleave="beforeImg()"><span>
						<img id="roleImg"
						src="http://localhost:8080/teacherms/img/admin5.png" />
				</span>www
					<ul id="second_ul" class="second_ul">
						<li>修改密码</li>
						<li>退出</li>
					</ul></li>
			</ul>
		</div>

	</div>
	<div class="clear"></div>
	<script type="text/javascript" src="<%=basePath%>/js/top_nav.js"></script>
	<script>
		$(function() {
			$('#role_li').hover(function() {
				$('#second_ul').fadeIn();
	
			}, function() {
				$('#second_ul').fadeOut();
			});
			$('.nav_ul li').click(function() {
				$('.left_nav_ul li').removeClass('foncolo');
				$(this).addClass('foncolo');
	
	
			})
		});
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