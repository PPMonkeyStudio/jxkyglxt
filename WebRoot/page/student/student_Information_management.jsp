<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
	<!--管理员查看信息时右侧内容-->
	<section class="content" id="content">
	<div class="row">
		<div class="col-md-12">
			<!--breadcrumbs start -->
			<ul class="breadcrumb">
				<li><a><i class="fa fa-home"></i> 首页</a></li>
				<li class="active">学生信息管理</li>
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
				<li class=""><a data-toggle="tab" href="#info">学生信息</a></li>
				<li class=""><a data-toggle="tab" href="#award">学生奖励</a></li>
				<li class=""><a data-toggle="tab" href="#works">学生著作</a></li>
				<li class=""><a data-toggle="tab" href="#paper">学生论文</a></li>
				<li class=""><a data-toggle="tab" href="#patent">学生专利</a></li>
				<li class=""><a data-toggle="tab" href="#project">学生项目</a></li>
				<li class=""><a data-toggle="tab" href="#class">班级管理</a></li>
			</ul>
			</header>
			<div class="panel-body">
				<div class="tab-content">
					<div id="info" class="tab-pane">
						<!--管理员查看用户信息的表格-->
						<div id="user_table_view">
							<!--表投上按钮组-->
							<div class="box-tools m-b-15">
								<div style="width: 100%;" class="input-group">
									<!--筛选&查询&添加按钮位置-->
									<button data-toggle="modal" data-target="#add_info_modal"
										class="btn btn-default btn-addon btn-sm">
										<i class="fa fa-plus"></i>添加学生
									</button>
									<button data-toggle="modal" data-target="#export_info"
										class="btn btn-default btn-addon btn-sm">
										<i class="fa fa-share-square"></i>学生信息导出
									</button>
									<!--按条件筛选-->
									<button style="" class="btn btn-default btn-sm" type="button"
										data-toggle="collapse" data-target="#collapse_exam_user"
										aria-expanded="false" aria-controls="collapseExample">
										<i class="fa fa-search" aria-hidden="true"></i> 条件筛选
									</button>
									<!-- 部分搜索 -->
									<div style="float: right;">
										<input name="table_search" class="form-control input-sm"
											style="width: 150px;" type="text" placeholder="Search">
										<div style="float: right; height: 30px;">
											<button class="btn btn-default fuzzy_query"
												style="height: 100%;">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
									<div style="width: 100%; margin-top: 6px;" class="collapse"
										id="collapse_exam_user">
										<div class="well">
											<div id="search">
												<label>指定条件搜索：</label> <select id="all_options"
													class="all_options form-control ">
													<option value="">请选择</option>
													<!-- <option value="userName">姓名</option> -->
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
										</div>
									</div>

									<!--<input type="text" class="form-control" />-->
								</div>
							</div>
							<!--查询存放信息的表格-->
							<section class="panel"> <header
								class="panel-heading second-panel-heading"> 用户信息
								
							<button style="display: none;float: right;"
								class="btn btn-primary sure_export">确认导出</button>
								<button style="display: none;float: right;"
								class="btn btn-danger all_sure_export">导出全部</button>
							</header>
							<div class="panel-body table-responsive">
								<table class="table table-hover" id="info_table">
									<thead>
										<tr>
											<th>序号</th>
											<th>学号</th>
											<th>姓名</th>
											<th>学生类型</th>
											<th>学生状态</th>
											<th>专业</th>
											<th>所在班级</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
							</div>
							</section>
						</div>
					</div>
					<div id="award" class="tab-pane">
						<div id="award_table_view">
							<!--表投上按钮组-->
							<div class="box-tools m-b-15">
								<div style="width: 100%; margin-bottom: 15px;"
									class="input-group">
									<!--筛选&查询&添加按钮位置-->
									<button data-toggle="modal" data-target="#export_award"
										class="btn btn-default btn-addon btn-sm">
										<i class="fa fa-share-square"></i>奖励信息导出
									</button>
									<!--按条件筛选-->
									<button style="" class="btn btn-default btn-sm" type="button"
										data-toggle="collapse" data-target="#collapse_exam_award"
										aria-expanded="false" aria-controls="collapseExample">
										<i class="fa fa-search" aria-hidden="true"></i> 条件筛选
									</button>
									<!-- 部分搜索 -->
									<div style="float: right;">
										<input name="table_search" class="form-control input-sm"
											style="width: 150px;" type="text" placeholder="Search">
										<div style="float: right; height: 30px;">
											<button class="btn btn-default fuzzy_query"
												style="height: 100%;">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
									<div style="width: 100%; margin-top: 6px;" class="collapse"
										id="collapse_exam_award">
										<div class="well">
											<div id="search">
												<label>指定条件搜索：</label> <select id="all_options"
													class="all_options form-control ">
													<option value="">请选择</option>
													<option value="awardType">获奖类型</option>
													<option value="awardName">获奖名称</option>
													<option value="awardUserNames">获奖人姓名</option>
													<option value="awardGrade">获奖等级</option>
													<option value="awardLevel">获奖级别</option>
													<option value="awardTime">获奖时间</option>
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
										</div>
										<!--<input type="text" class="form-control" />-->
									</div>
								</div>
								<!--查询存放信息的表格-->
								<section class="panel"> <header
									class="panel-heading second-panel-heading"> 奖励信息
								<button style="display: none;float: right;"
									class="btn btn-primary sure_export">确认导出</button>
									<button style="display: none;float: right;"
								class="btn btn-danger all_sure_export">导出全部</button>
								</header>
								<div class="panel-body table-responsive">
									<table class="table table-hover" id="info_table">
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
								</div>
								</section>
							</div>
						</div>
					</div>
					<div id="works" class="tab-pane">
						<!--管理员查看著作信息的表格-->
						<div id="works_table_view">
							<!--表投上按钮组-->
							<div class="box-tools m-b-15">
								<div style="width: 100%;" class="input-group">
									<!--筛选&查询&添加按钮位置-->
									<button data-toggle="modal" data-target="#export_works"
										class="btn btn-default btn-addon btn-sm">
										<i class="fa fa-share-square"></i>著作信息导出
									</button>
									<!--按条件筛选-->
									<button style="" class="btn btn-default btn-sm" type="button"
										data-toggle="collapse" data-target="#collapse_exam_works"
										aria-expanded="false" aria-controls="collapseExample">
										<i class="fa fa-search" aria-hidden="true"></i> 条件筛选
									</button>
									<!-- 部分搜索 -->
									<div style="float: right;">
										<input name="table_search" class="form-control input-sm"
											style="width: 150px;" type="text" placeholder="Search">
										<div style="float: right; height: 30px;">
											<button class="btn btn-default fuzzy_query"
												style="height: 100%;">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>

									<div style="width: 100%; margin-top: 6px;" class="collapse"
										id="collapse_exam_works">
										<div class="well">
											<div id="search">
												<label>指定条件搜索：</label> <select id="all_options"
													class="all_options form-control ">
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
										</div>
										<!--<input type="text" class="form-control" />-->
									</div>
								</div>
							</div>
							<!--查询存放信息的表格-->
							<section class="panel"> <header
								class="panel-heading second-panel-heading"> 著作信息
							<button style="display: none;float: right;"
								class="btn btn-primary sure_export">确认导出</button>
								<button style="display: none;float: right;"
								class="btn btn-danger all_sure_export">导出全部</button>
							</header>
							<div class="panel-body table-responsive">
								<table class="table table-hover" id="info_table">
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
							</div>
							</section>
						</div>
					</div>
					<div id="paper" class="tab-pane">
						<!--管理员查看论文信息的表格-->
						<div id="paper_table_view">
							<!--表投上按钮组-->
							<div class="box-tools m-b-15">
								<div style="width: 100%;" class="input-group">
									<!--筛选&查询&添加按钮位置-->
									<button data-toggle="modal" data-target="#export_paper"
										class="btn btn-default btn-addon btn-sm">
										<i class="fa fa-share-square"></i>论文信息导出
									</button>
									<!--按条件筛选-->
									<button style="" class="btn btn-default btn-sm" type="button"
										data-toggle="collapse" data-target="#collapse_exam_paper"
										aria-expanded="false" aria-controls="collapseExample">
										<i class="fa fa-search" aria-hidden="true"></i> 条件筛选
									</button>
									<!-- 部分搜索 -->
									<div style="float: right;">
										<input name="table_search" class="form-control input-sm"
											style="width: 150px;" type="text" placeholder="Search">
										<div style="float: right; height: 30px;">
											<button class="btn btn-default fuzzy_query"
												style="height: 100%;">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>

									<div style="width: 100%; margin-top: 6px;" class="collapse"
										id="collapse_exam_paper">
										<div class="well">
											<div id="search">
												<label>指定条件搜索：</label> <select id="all_options"
													class="all_options form-control ">
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
													<option value="publishTime">发表日期</option>
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
										</div>
									</div>
									<!-- collapse end -->
								</div>
							</div>
							<!--查询存放信息的表格-->
							<section class="panel"> <header
								class="panel-heading second-panel-heading"> 论文信息
							<button style="display: none;float: right;"
								class="btn btn-primary sure_export">确认导出</button>
								<button style="display: none;float: right;"
								class="btn btn-danger all_sure_export">导出全部</button>
							</header>
							<div class="panel-body table-responsive">
								<table class="table table-hover" id="info_table">
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
							</div>
							</section>
						</div>
					</div>
					<div id="patent" class="tab-pane">
						<!--管理员查看专利信息的表格-->
						<div id="patent_table_view">
							<!--表投上按钮组-->
							<div class="box-tools m-b-15">
								<div style="width: 100%;" class="input-group">
									<!--筛选&查询&添加按钮位置-->
									<button data-toggle="modal" data-target="#export_patent"
										class="btn btn-default btn-addon btn-sm">
										<i class="fa fa-share-square"></i>专利信息导出
									</button>
									<!--按条件筛选-->
									<button style="" class="btn btn-default btn-sm" type="button"
										data-toggle="collapse" data-target="#collapse_exam_patent"
										aria-expanded="false" aria-controls="collapseExample">
										<i class="fa fa-search" aria-hidden="true"></i> 条件筛选
									</button>
									<!-- 部分搜索 -->
									<div style="float: right;">
										<input name="table_search" class="form-control input-sm"
											style="width: 150px;" type="text" placeholder="Search">
										<div style="float: right; height: 30px;">
											<button class="btn btn-default fuzzy_query"
												style="height: 100%;">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
									<!-- collapse start -->
									<div style="width: 100%; margin-top: 6px;" class="collapse"
										id="collapse_exam_patent">
										<div class="well">
											<div id="search">
												<label>指定条件搜索：</label> <select id="all_options"
													class="all_options form-control ">
													<option value="">请选择</option>
													<option value="userName">姓名</option>
													<option value="userId">工号</option>
													<option value="patentName">专利名称</option>
													<option value="patentType">专利类型</option>
													<option value="authorizationNo">授权号</option>
													<option value="approvedDate">获批日期</option>
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
										</div>
									</div>
									<!-- collapse end -->
								</div>
							</div>
							<!--查询存放信息的表格-->
							<section class="panel"> <header
								class="panel-heading second-panel-heading"> 专利信息
							<button style="display: none;float: right;"
								class="btn btn-primary sure_export">确认导出</button>
								<button style="display: none;float: right;"
								class="btn btn-danger all_sure_export">导出全部</button>
							</header>
							<div class="panel-body table-responsive">
								<table class="table table-hover" id="info_table">
									<thead>
										<tr>
											<th>#</th>
											<th>专利名称</th>
											<th>作者</th>
											<th>专利类型</th>
											<th>授权号</th>
											<th>获批日期</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
							</section>
						</div>
					</div>
					<div id="project" class="tab-pane">
						<!--管理员查看课题(项目)信息的表格-->
						<div id="project_table_view">
							<!--表投上按钮组-->
							<div class="box-tools m-b-15">
								<div style="width: 100%;" class="input-group">
									<!--筛选&查询&添加按钮位置-->
									<button data-toggle="modal" data-target="#export_project"
										class="btn btn-default btn-addon btn-sm">
										<i class="fa fa-share-square"></i>项目信息导出
									</button>
									<!--按条件筛选-->
									<button style="" class="btn btn-default btn-sm" type="button"
										data-toggle="collapse" data-target="#collapse_exam_project"
										aria-expanded="false" aria-controls="collapseExample">
										<i class="fa fa-search" aria-hidden="true"></i> 条件筛选
									</button>
									<!-- 部分搜索 -->
									<div style="float: right;">
										<input name="table_search" class="form-control input-sm"
											style="width: 150px;" type="text" placeholder="Search">
										<div style="float: right; height: 30px;">
											<button class="btn btn-default fuzzy_query"
												style="height: 100%;">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
									<!-- collapse start -->
									<div style="width: 100%; margin-top: 6px;" class="collapse"
										id="collapse_exam_project">
										<div class="well">
											<div id="search">
												<label>指定条件搜索：</label> <select id="all_options"
													class="all_options form-control ">
													<option value="">请选择</option>
													<option value="projectName">项目名称</option>
													<option value="projectType">项目类型</option>
													<option value="projectSource">项目来源</option>
													<option value="projectUserNames">成员姓名</option>
													<option value="approvalDate">立项时间</option>
													<option value="endUpDate">结题验收时间</option>
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
										</div>
									</div>
									<!-- collapse end -->
								</div>
							</div>
							<!--查询存放信息的表格-->
							<section class="panel"> <header
								class="panel-heading second-panel-heading"> 课题(项目)信息
							<button style="display: none;float: right;"
								class="btn btn-primary sure_export">确认导出</button>
								<button style="display: none;float: right;"
								class="btn btn-danger all_sure_export">导出全部</button>
							</header>
							<div class="panel-body table-responsive">
								<table class="table table-hover" id="info_table">
									<thead>
										<tr>
											<th>序号</th>
											<th>课题(项目)名称</th>
											<th>成员姓名</th>
											<th>项目来源</th>
											<th>项目类别</th>
											<th>立项编号或批准文号</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
							</section>
						</div>
					</div>
					
						<div id="class" class="tab-pane">
						<!--管理员查看课题(项目)信息的表格-->
						<div id="project_table_view">
							<!--表投上按钮组-->
							<div class="box-tools m-b-15">
								<div style="width: 100%;" class="input-group">
									<!--筛选&查询&添加按钮位置-->
									<button data-toggle="modal" data-target="#export_project"
										class="btn btn-default btn-addon btn-sm">
										<i class="fa fa-share-square"></i>项目信息导出
									</button>
									<!--按条件筛选-->
									<button style="" class="btn btn-default btn-sm" type="button"
										data-toggle="collapse" data-target="#collapse_exam_project"
										aria-expanded="false" aria-controls="collapseExample">
										<i class="fa fa-search" aria-hidden="true"></i> 条件筛选
									</button>
									<!-- 部分搜索 -->
									<div style="float: right;">
										<input name="table_search" class="form-control input-sm"
											style="width: 150px;" type="text" placeholder="Search">
										<div style="float: right; height: 30px;">
											<button class="btn btn-default fuzzy_query"
												style="height: 100%;">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
									<!-- collapse start -->
									<div style="width: 100%; margin-top: 6px;" class="collapse"
										id="collapse_exam_project">
										<div class="well">
											<div id="search">
												<label>指定条件搜索：</label> <select id="all_options"
													class="all_options form-control ">
													<option value="">请选择</option>
													<option value="className">班级名称</option>
													<option value="classId">班级ID</option>
													<option value="userId">班主任</option>

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
										</div>
									</div>
									<!-- collapse end -->
								</div>
							</div>
							<!--查询存放信息的表格-->
							<section class="panel"> <header
								class="panel-heading second-panel-heading"> 课题(项目)信息
							<button style="display: none;float: right;"
								class="btn btn-primary sure_export">确认导出</button>
								<button style="display: none;float: right;"
								class="btn btn-danger all_sure_export">导出全部</button>
							</header>
							<div class="panel-body table-responsive">
								<table class="table table-hover" id="info_table">
									<thead>
										<tr>
											<th>序号</th>
											<th>课题(项目)名称</th>
											<th>成员姓名</th>
											<th>项目来源</th>
											<th>项目类别</th>
											<th>立项编号或批准文号</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
							</section>
						</div>
					</div>




					</div>
				</div>
			</div>
			<div class="panel-footer">
				<div id="page">
					<ul class="pager">
						<li><a>首页</a></li>
						<li><a>上一页</a></li>
						<li>management</li>
						<li><a>下一页</a></li>
						<li><a>尾页</a></li>
						
						
						
					</ul>
				</div>
			</div>
			</section>
			<!--breadcrumbs end -->
		</div>
	</div>
	</section>
</body>
</html>