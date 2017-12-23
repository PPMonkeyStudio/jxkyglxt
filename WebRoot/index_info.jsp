<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
</head>
<body>
<section class="content" id="content">
			<div class="row">
				<div class="col-md-12">
					<!--breadcrumbs start -->
					<ul class="breadcrumb">
						<li>
							<a><i class="fa fa-home"></i> 首页</a>
						</li>
						
					</ul>
					<!--breadcrumbs end -->
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<!--breadcrumbs start -->
					<section class="panel general">
						<header class="panel-heading tab-bg-dark-navy-blue">
							<ul class="nav nav-tabs">
							</ul>
						</header>
						<div id="info_display"> 
						<div class="panel-body">
						
							<div class="tab-content">
								<div id="info_content">
		<div class="top_line">
			<h4 class="h4_style">教师信息</h4>
			<hr class="hr_style" />
		</div>
			<ul id="info_ul">
			<li>
				<ul class="innner_ul">
					<li>
						<h4>周锦春</h4> <span>信息与计算机工程学院院长周锦春教授</span>
					</li>
				</ul>
			</li>
			<li>
				<ul class="innner_ul">
					<li>
						<h4>肖俊宇</h4> <span>信息与计算机工程学党总支书记肖俊宇教授</span>
					</li>
				</ul>
			</li>
			<li>
				<ul class="innner_ul">
					<li>
						<h4>李希勇</h4> <span>信息与计算机工程学院副院长李希勇教授</span>
					</li>
				</ul>
			</li>
			<li>
				<ul class="innner_ul">
					<li>
						<h4>彭新平</h4> <span>信息与计算机工程学院党总支副书记彭新平副教授</span>
					</li>
				</ul>
			</li>
			<li>
				<ul class="innner_ul">
					<li>
						<h4>何志芬</h4> <span>信息与计算机工程学院教师何志芬博士</span>
					</li>
				</ul>
			</li>
			<li>
				<ul class="innner_ul">
					<li>
						<h4>罗晓娟</h4> <span>信息与计算机工程学院教师罗晓娟副教授</span>
					</li>
				</ul>
			</li>
			<li>
				<ul class="innner_ul">
					<li>
						<h4>梁莉菁</h4> <span>信息与计算机工程学院教师梁莉菁副教授</span>
					</li>
				</ul>
			</li>
			<li>
				<ul id="last_ul">
					<li><img
						id="addImg" src="<%=basePath%>/img/add(2).png" />
						<h4 id="addInfo">添加信息</h4></li>
				</ul>
			</li>
		</ul>
		
	</div>
							</div>
							</div>
						</div>
					</section>
					<!--breadcrumbs end -->
				</div>
			</div>
		</section>
	
</body>
</html>