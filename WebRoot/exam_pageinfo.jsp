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

	<!--管理员审核信息时右侧内容-->
	<section class="content" id="content">
	<div class="row">
		<div class="col-md-12">
			<!--breadcrumbs start -->
			<ul class="breadcrumb">
				<li><a><i class="fa fa-home"></i> 首页</a></li>
				<li class="active">信息审核</li>
			</ul>
			<!--breadcrumbs end -->
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<!--breadcrumbs start -->
			<section class="panel general"> <header
				class="panel-heading tab-bg-dark-navy-blue">
			<ul class="nav nav-tabs">
				<li class=""><a data-toggle="tab" href="#user">用户</a></li>
				<li class=""><a data-toggle="tab" href="#award">奖励</a></li>
				<li class=""><a data-toggle="tab" href="#works">著作</a></li>
				<li class=""><a data-toggle="tab" href="#paper">论文</a></li>
				<li class=""><a data-toggle="tab" href="#patent">专利</a></li>
				<li class=""><a data-toggle="tab" href="#project">项目(课题)</a></li>
			</ul>
			</header>
			<div class="panel-body">
				<div class="tab-content">
					<div id="user" class="tab-pane">
						<!--管理员审核用户信息的表格-->
						<div id="user_table_audit">
							<!--表头上按钮组-->
							<div class="box-tools m-b-15">
								<div class="input-group">
									<!--筛选&查询&添加按钮位置-->
									<!--按条件筛选-->
									<div id="search">
										<form>
											<label>按条件搜索：</label> <select id="all_options"
												class="all_options form-control ">
												<option value="">请选择</option>
												<option value="userName">姓名</option>
												<option value="userId">工号</option>
												<option value="jobStatue">任职状态</option>
												<option value="highestDegree">最高学位</option>
												<option value="highestEducation">最高学历</option>
												<option value="learnEdgeStructure">学缘</option>
												<option value="professionalTitle">专业技术职称</option>
												<option value="subjectCategory">学科类别</option>
												<option value="teachingProfessionName">任教专业名称</option>
												<option value="professionTeachingDate">专业任教时间</option>
												<option value="workDate">参加工作时间</option>
											</select>
										</form>
										<button class="btn btn-default btn-addon btn-sm">
											<i class="fa fa-search"></i>搜索
										</button>

									</div>
								</div>
							</div>
							<!--查询存放信息的表格-->
							<section class="panel"> <header class="panel-heading">
							用户信息 </header>
							<div class="panel-body table-responsive">
								<table class="table table-hover ">
									<thead>
										<tr>
											<th>序号</th>
											<th>工号</th>
											<th>姓名</th>
											<th>职工类型</th>
											<th>职工状态</th>
											<th>授课类型</th>
											<th>授课状态</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
								<div id="page">
									<ul class="pager">
										<li><a onclick="page(1)">首页</a></li>
										<li><a onclick="prepage()">上一页</a></li>
										<li><a onclick="nextpage()">下一页</a></li>
										<li><a onclick="page(999)">尾页</a></li>
									</ul>
								</div>
							</div>
							</section>
						</div>
					</div>
					<div id="award" class="tab-pane">
						<!--管理员审核奖励信息的表格-->
						<div id="award_table_audit">
							<!--表投上按钮组-->
							<div class="box-tools m-b-15">
								<div class="input-group">
									<!--筛选&查询&添加按钮位置-->
									<div id="search">
										<form>
											<label>按条件搜索：</label> <select id="all_options"
												class="all_options form-control">
												<option value="">请选择</option>
												<option value="awardType">获奖类型</option>
												<option value="awardName">获奖名称</option>
												<option value="awardUserNames">获奖者姓名</option>
												<option value="awardGrade">获奖等级</option>
												<option value="awardLevel">获奖级别</option>
												<option value="awardTime">获奖时间</option>
											</select>
										</form>
										<button class="btn btn-default btn-addon btn-sm">
											<i class="fa fa-search"></i>搜索
										</button>

									</div>

									<!--<input type="text" class="form-control" />-->
								</div>
							</div>
							<!--查询存放信息的表格-->
							<section class="panel"> <header class="panel-heading">
							奖励信息 </header>
							<div class="panel-body table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>序号</th>
											<th>奖励名称</th>
											<th>获奖者姓名</th>
											<th>获奖级别</th>
											<th>获奖时间</th>
											<th>授予单位</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
								<div id="page">
									<ul class="pager">
										<li><a onclick="page(1)">首页</a></li>
										<li><a onclick="prepage()">上一页</a></li>
										<li><a onclick="nextpage()">下一页</a></li>
										<li><a onclick="page(999)">尾页</a></li>
									</ul>
								</div>
							</div>
							</section>
						</div>
					</div>
					<div id="works" class="tab-pane">
						<div id="works_table_audit">
							<!--表投上按钮组-->
							<div class="box-tools m-b-15">
								<div class="input-group">
									<!--筛选&查询&添加按钮位置-->
									<div id="search">
										<form>
											<label>按条件搜索：</label> <select id="all_options"
												class="all_options form-control">
												<option value="">请选择</option>
												<option value="worksName">著作（专著）名称</option>
												<option value="worksType">著作类别</option>
												<option value="press">出版社</option>
												<option value="isbn">ISBN</option>
												<option value="publishTime">出版时间</option>
												<option value="selectedSituation">入选情况</option>
												<option value="selectedDate">入选时间</option>
												<option value="editorUserNames">主编（作者）</option>
											</select>
										</form>
										<button class="btn btn-default btn-addon btn-sm">
											<i class="fa fa-search"></i>搜索
										</button>

									</div>
									<!--<input type="text" class="form-control" />-->
								</div>
							</div>
							<!--查询存放信息的表格-->
							<section class="panel"> <header class="panel-heading">
							著作信息 </header>
							<div class="panel-body table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>序号</th>
											<th>著作名称</th>
											<th>主编</th>
											<th>ISBN</th>
											<th>出版时间</th>
											<th>出版社</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
								<div id="page">
									<ul class="pager">
										<li><a onclick="page(1)">首页</a></li>
										<li><a onclick="prepage()">上一页</a></li>
										<li><a onclick="nextpage()">下一页</a></li>
										<li><a onclick="page(999)">尾页</a></li>
									</ul>
								</div>
							</div>
							</section>
						</div>
					</div>
					<div id="paper" class="tab-pane">
						<div id="paper_table_audit">
							<!--表投上按钮组-->
							<div class="box-tools m-b-15">
								<div class="input-group">
									<!--筛选&查询&添加按钮位置-->
									<div id="search">
										<form>
											<label>按条件搜索：</label> <select id="all_options"
												class="all_options form-control">
												<option value="">请选择</option>
												<option value="userName">姓名</option>
												<option value="userId">工号</option>
												<option value="paperName">论文名称</option>
												<option value="paperType">论文类别</option>
												<option value="periodical">发表期刊</option>
												<option value="periodicalNo">期号</option>
												<option value="includedSituation">收录情况</option>
												<option value="totalCitations">他引次数</option>
												<option value="wordsNum">成果字数</option>
											</select>
										</form>
										<button class="btn btn-default btn-addon btn-sm">
											<i class="fa fa-search"></i>搜索
										</button>

									</div>
									<!--<input type="text" class="form-control" />-->
								</div>
							</div>
							<!--查询存放信息的表格-->
							<section class="panel"> <header class="panel-heading">
							论文信息 </header>
							<div class="panel-body table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>序号</th>
											<th>论文名称</th>
											<th>作者</th>
											<th>发表期刊</th>
											<th>期号</th>
											<th>发表日期</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
								<div id="page">
									<ul class="pager">
										<li><a onclick="page(1)">首页</a></li>
										<li><a onclick="prepage()">上一页</a></li>
										<li><a onclick="nextpage()">下一页</a></li>
										<li><a onclick="page(999)">尾页</a></li>
									</ul>
								</div>
							</div>
							</section>
						</div>
					</div>
					<div id="patent" class="tab-pane">
						<div id="patent_table_audit">
							<!--表投上按钮组-->
							<div class="box-tools m-b-15">
								<div class="input-group">
									<!--筛选&查询&添加按钮位置-->
									<div id="search">
										<form>
											<label>按条件搜索：</label> <select id="all_options"
												class="all_options form-control">
												<option value="">请选择</option>
												<option value="userName">姓名</option>
												<option value="userId">工号</option>
												<option value="patentName">专利名称</option>
												<option value="patentType">专利类型</option>
												<option value="authorizationNo">授权号</option>
												<option value="approvedDate">获批时间</option>
											</select>
										</form>
										<button class="btn btn-default btn-addon btn-sm">
											<i class="fa fa-search"></i>搜索
										</button>

									</div>
									<!--<input type="text" class="form-control" />-->
								</div>
							</div>
							<!--查询存放信息的表格-->
							<section class="panel"> <header class="panel-heading">
							专利信息 </header>
							<div class="panel-body table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>专利名称</th>
											<th>作者</th>
											<th>专利类型</th>
											<th>授权号</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
								<div id="page">
									<ul class="pager">
										<li><a onclick="page(1)">首页</a></li>
										<li><a onclick="prepage()">上一页</a></li>
										<li><a onclick="nextpage()">下一页</a></li>
										<li><a onclick="page(999)">尾页</a></li>
									</ul>
								</div>
							</div>
							</section>
						</div>
					</div>
					<div id="project" class="tab-pane">
						<div id="project_table_audit">
							<!--表投上按钮组-->
							<div class="box-tools m-b-15">
								<div class="input-group">
									<!--筛选&查询&添加按钮位置-->
									<div id="search">
										<form>
											<label>按条件搜索：</label> <select id="all_options"
												class="all_options form-control">
												<option value="">请选择</option>
												<option value="projectName">项目名称</option>
												<option value="projectType">项目类型</option>
												<option value="projectSource">项目来源</option>
												<option value="projectUserNames">成员姓名</option>
												<option value="approvalDate">立项时间</option>
												<option value="endUpDate">结题验收时间</option>
											</select>
										</form>
										<button class="btn btn-default btn-addon btn-sm">
											<i class="fa fa-search"></i>搜索
										</button>

									</div>
									<!--<input type="text" class="form-control" />-->
								</div>
							</div>
							<!--查询存放信息的表格-->
							<section class="panel"> <header class="panel-heading">
							课题(项目)信息 </header>
							<div class="panel-body table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>序号</th>
											<th>课题(项目)名称</th>
											<th>成员姓名</th>
											<th>项目来源</th>
											<th>立项编号或批准文号</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
								<div id="page">
									<ul class="pager">
										<li><a onclick="page(1)">首页</a></li>
										<li><a onclick="prepage()">上一页</a></li>
										<li><a onclick="nextpage()">下一页</a></li>
										<li><a onclick="page(999)">尾页</a></li>
									</ul>
								</div>
							</div>
							</section>
						</div>
					</div>
				</div>
			</div>
			</section>
			<!--breadcrumbs end -->
		</div>
	</div>
	</section>

	<!----------------------------------------------------------------------------------->
	<!--管理员审核用户信息的表格-->
	<div id="user_table_audit">
		<!--表头上按钮组-->
		<div class="box-tools m-b-15">
			<div class="input-group">
				<!--筛选&查询&添加按钮位置-->
				<!--按条件筛选-->
				<div id="search">
					<form>
						<label>按条件搜索：</label> <select id="all_options"
							class="all_options form-control ">
							<option value="">请选择</option>
							<option value="userName">姓名</option>
							<option value="userId">工号</option>
							<option value="jobStatue">任职状态</option>
							<option value="highestDegree">最高学位</option>
							<option value="highestEducation">最高学历</option>
							<option value="learnEdgeStructure">学缘</option>
							<option value="professionalTitle">专业技术职称</option>
							<option value="subjectCategory">学科类别</option>
							<option value="teachingProfessionName">任教专业名称</option>
							<option value="professionTeachingDate">专业任教时间</option>
							<option value="workDate">参加工作时间</option>
						</select>
					</form>
					<button class="btn btn-default btn-addon btn-sm">
						<i class="fa fa-search"></i>搜索
					</button>

				</div>
			</div>
		</div>
		<!--查询存放信息的表格-->
		<section class="panel"> <header class="panel-heading">
		用户信息 </header>
		<div class="panel-body table-responsive">
			<table class="table table-hover ">
				<thead>
					<tr>
						<th>序号</th>
						<th>工号</th>
						<th>姓名</th>
						<th>职工类型</th>
						<th>职工状态</th>
						<th>授课类型</th>
						<th>授课状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
			<div id="page">
				<ul class="pager">
					<li><a onclick="page(1)">首页</a></li>
					<li><a onclick="prepage()">上一页</a></li>
					<li><a onclick="nextpage()">下一页</a></li>
					<li><a onclick="page(999)">尾页</a></li>
				</ul>
			</div>
		</div>
		</section>
	</div>

	<!--管理员审核奖励信息的表格-->
	<div id="award_table_audit">
		<!--表投上按钮组-->
		<div class="box-tools m-b-15">
			<div class="input-group">
				<!--筛选&查询&添加按钮位置-->
				<div id="search">
					<form>
						<label>按条件搜索：</label> <select id="all_options"
							class="all_options form-control">
							<option value="">请选择</option>
							<option value="awardType">获奖类型</option>
							<option value="awardName">获奖名称</option>
							<option value="awardUserNames">获奖者姓名</option>
							<option value="awardGrade">获奖等级</option>
							<option value="awardLevel">获奖级别</option>
							<option value="awardTime">获奖时间</option>
						</select>
					</form>
					<button class="btn btn-default btn-addon btn-sm">
						<i class="fa fa-search"></i>搜索
					</button>

				</div>

				<!--<input type="text" class="form-control" />-->
			</div>
		</div>
		<!--查询存放信息的表格-->
		<section class="panel"> <header class="panel-heading">
		奖励信息 </header>
		<div class="panel-body table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>序号</th>
						<th>奖励名称</th>
						<th>获奖者姓名</th>
						<th>获奖级别</th>
						<th>获奖时间</th>
						<th>授予单位</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
			<div id="page">
				<ul class="pager">
					<li><a onclick="page(1)">首页</a></li>
					<li><a onclick="prepage()">上一页</a></li>
					<li><a onclick="nextpage()">下一页</a></li>
					<li><a onclick="page(999)">尾页</a></li>
				</ul>
			</div>
		</div>
		</section>
	</div>

	<!--管理员审核著作信息的表格-->
	<div id="works_table_audit">
		<!--表投上按钮组-->
		<div class="box-tools m-b-15">
			<div class="input-group">
				<!--筛选&查询&添加按钮位置-->
				<div id="search">
					<form>
						<label>按条件搜索：</label> <select id="all_options"
							class="all_options form-control">
							<option value="">请选择</option>
							<option value="worksName">著作（专著）名称</option>
							<option value="worksType">著作类别</option>
							<option value="press">出版社</option>
							<option value="isbn">ISBN</option>
							<option value="publishTime">出版时间</option>
							<option value="selectedSituation">入选情况</option>
							<option value="selectedDate">入选时间</option>
							<option value="editorUserNames">主编（作者）</option>
						</select>
					</form>
					<button class="btn btn-default btn-addon btn-sm">
						<i class="fa fa-search"></i>搜索
					</button>

				</div>
				<!--<input type="text" class="form-control" />-->
			</div>
		</div>
		<!--查询存放信息的表格-->
		<section class="panel"> <header class="panel-heading">
		著作信息 </header>
		<div class="panel-body table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>序号</th>
						<th>著作名称</th>
						<th>主编</th>
						<th>ISBN</th>
						<th>出版时间</th>
						<th>出版社</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
			<div id="page">
				<ul class="pager">
					<li><a onclick="page(1)">首页</a></li>
					<li><a onclick="prepage()">上一页</a></li>
					<li><a onclick="nextpage()">下一页</a></li>
					<li><a onclick="page(999)">尾页</a></li>
				</ul>
			</div>
		</div>
		</section>
	</div>

	<!--管理员审核论文信息的表格-->
	<div id="paper_table_audit">
		<!--表投上按钮组-->
		<div class="box-tools m-b-15">
			<div class="input-group">
				<!--筛选&查询&添加按钮位置-->
				<div id="search">
					<form>
						<label>按条件搜索：</label> <select id="all_options"
							class="all_options form-control">
							<option value="">请选择</option>
							<option value="userName">姓名</option>
							<option value="userId">工号</option>
							<option value="paperName">论文名称</option>
							<option value="paperType">论文类别</option>
							<option value="periodical">发表期刊</option>
							<option value="periodicalNo">期号</option>
							<option value="includedSituation">收录情况</option>
							<option value="totalCitations">他引次数</option>
							<option value="wordsNum">成果字数</option>
						</select>
					</form>
					<button class="btn btn-default btn-addon btn-sm">
						<i class="fa fa-search"></i>搜索
					</button>

				</div>
				<!--<input type="text" class="form-control" />-->
			</div>
		</div>
		<!--查询存放信息的表格-->
		<section class="panel"> <header class="panel-heading">
		论文信息 </header>
		<div class="panel-body table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>序号</th>
						<th>论文名称</th>
						<th>作者</th>
						<th>发表期刊</th>
						<th>期号</th>
						<th>发表日期</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
			<div id="page">
				<ul class="pager">
					<li><a onclick="page(1)">首页</a></li>
					<li><a onclick="prepage()">上一页</a></li>
					<li><a onclick="nextpage()">下一页</a></li>
					<li><a onclick="page(999)">尾页</a></li>
				</ul>
			</div>
		</div>
		</section>
	</div>

	<!--管理员审核专利信息的表格-->
	<div id="patent_table_audit">
		<!--表投上按钮组-->
		<div class="box-tools m-b-15">
			<div class="input-group">
				<!--筛选&查询&添加按钮位置-->
				<div id="search">
					<form>
						<label>按条件搜索：</label> <select id="all_options"
							class="all_options form-control">
							<option value="">请选择</option>
							<option value="userName">姓名</option>
							<option value="userId">工号</option>
							<option value="patentName">专利名称</option>
							<option value="patentType">专利类型</option>
							<option value="authorizationNo">授权号</option>
							<option value="approvedDate">获批时间</option>
						</select>
					</form>
					<button class="btn btn-default btn-addon btn-sm">
						<i class="fa fa-search"></i>搜索
					</button>
				</div>
				<!--<input type="text" class="form-control" />-->
			</div>
		</div>
		<!--查询存放信息的表格-->
		<section class="panel"> <header class="panel-heading">
		专利信息 </header>
		<div class="panel-body table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>专利名称</th>
						<th>作者</th>
						<th>专利类型</th>
						<th>授权号</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
			<div id="page">
				<ul class="pager">
					<li><a onclick="page(1)">首页</a></li>
					<li><a onclick="prepage()">上一页</a></li>
					<li><a onclick="nextpage()">下一页</a></li>
					<li><a onclick="page(999)">尾页</a></li>
				</ul>
			</div>
		</div>
		</section>
	</div>

	<!--管理员审核课题(项目)信息的表格-->
	<div id="project_table_audit">
		<!--表投上按钮组-->
		<div class="box-tools m-b-15">
			<div class="input-group">
				<!--筛选&查询&添加按钮位置-->
				<div id="search">
					<form>
						<label>按条件搜索：</label> <select id="all_options"
							class="all_options form-control">
							<option value="">请选择</option>
							<option value="projectName">项目名称</option>
							<option value="projectType">项目类型</option>
							<option value="projectSource">项目来源</option>
							<option value="projectUserNames">成员姓名</option>
							<option value="approvalDate">立项时间</option>
							<option value="endUpDate">结题验收时间</option>
						</select>
					</form>
					<button class="btn btn-default btn-addon btn-sm">
						<i class="fa fa-search"></i>搜索
					</button>

				</div>
				<!--<input type="text" class="form-control" />-->
			</div>
		</div>
		<!--查询存放信息的表格-->
		<section class="panel"> <header class="panel-heading">
		课题(项目)信息 </header>
		<div class="panel-body table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>序号</th>
						<th>课题(项目)名称</th>
						<th>成员姓名</th>
						<th>项目来源</th>
						<th>立项编号或批准文号</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
			<div id="page">
				<ul class="pager">
					<li><a onclick="page(1)">首页</a></li>
					<li><a onclick="prepage()">上一页</a></li>
					<li><a onclick="nextpage()">下一页</a></li>
					<li><a onclick="page(999)">尾页</a></li>
				</ul>
			</div>
		</div>
		</section>
	</div>
</body>
</html>
