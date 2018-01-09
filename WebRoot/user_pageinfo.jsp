<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
	<!--管理员审核信息时右侧内容-->
	<section class="content" id="content">
	<div class="row">
		<div class="col-md-12">
			<!--breadcrumbs start -->
			<ul class="breadcrumb">
				<li><a><i class="fa fa-home"></i> 首页</a></li>
				<li class="active">信息</li>
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
				<li><a data-toggle="tab" href="#user">教师信息</a></li>
				<li class=""><a data-toggle="tab" href="#award">奖励</a></li>
				<li class=""><a data-toggle="tab" href="#works">著作</a></li>
				<li class=""><a data-toggle="tab" href="#paper">论文</a></li>
				<li class=""><a data-toggle="tab" href="#patent">专利</a></li>
				<li class=""><a data-toggle="tab" href="#project">项目(课题)</a></li>
			</ul>
			</header>
			<div class="panel-body">
				<div class="tab-content">
					<div id="user" class="tab-pane active"></div>
					<div id="award" class="tab-pane">奖励</div>
					<div id="works" class="tab-pane">著作</div>
					<div id="paper" class="tab-pane">论文</div>
					<div id="patent" class="tab-pane">专利</div>
					<div id="project" class="tab-pane">项目(课题)</div>
				</div>
			</div>
			</section>
			<!--breadcrumbs end -->
		</div>
	</div>
	</section>
	<!----------------------------------------------------------------------------------->
	<!--管理员审核用户信息的表格-->
	<div id="user_info_table_audit">
		<!--表头上按钮组-->
		<div class="box-tools m-b-15">
			<div class="input-group">
				<!--筛选&查询&添加按钮位置-->
				<!-- <button class="btn btn-default btn-addon btn-sm add-btn">
					<i class="fa fa-plus"></i>添加
				</button> -->
				<button class="btn btn-default btn-addon btn-sm export_button">
					<i class="fa fa-share-square"></i>导出
				</button>
				<!--按条件筛选-->
				<div id="search"></div>
			</div>
		</div>
		<!--查询存放信息的表格-->
		<section class="panel"> <header
			class="panel-heading second-panel-heading"> 用户信息 </header>
		<div class="panel-body table-responsive" id="panel-body">
			<form id="info-form">

				<table class="tab " id="info_table">
					<tr></tr>
					<tr class="title">
						<td>基本信息</td>
					</tr>
					<tr>
						<!-- name="teacherInfo." -->
						<td>工号：</td>
						<td><input name="teacherInfo.userId"
							class="form-control table_infomation" type="text"></td>
						<td>姓名:</td>
						<td><input name="teacherInfo.userName"
							class="form-control table_infomation" type="text"></td>
					</tr>
					<tr>
						<td>证件类型：</td>
						<td><select name="teacherInfo.certificateType"
							class="form-control table_infomation">
								<option>居民身份证</option>
								<option>军人证</option>
								<option>护照</option>
						</select></td>
						<td>证件号码:</td>
						<td><input name="teacherInfo.certificateNo"
							class="form-control table_infomation  card_num" type="text"></td>
						<td>民族：</td>
						<td><select name="teacherInfo.nation"
							class="form-control table_infomation">
								<option>汉族</option>
								<option>少数民族</option>
						</select></td>
					</tr>
					<tr>
						<td>国籍：</td>
						<td><select name="teacherInfo.nationality"
							class="form-control table_infomation">
								<option>中国</option>
								<option>国外</option>
						</select></td>
						<td>港澳台：</td>
						<td><select name="teacherInfo.GAT"
							class="form-control table_infomation">
								<option>否</option>
								<option>是</option>
						</select></td>
						<td>华侨：</td>
						<td><select name="teacherInfo.huaQiao"
							class="form-control table_infomation">
								<option>否</option>
								<option>是</option>
						</select></td>
					</tr>
					<tr>
						<td>政治面貌：</td>
						<td><select name="teacherInfo.politicalStatus"
							class="form-control table_infomation">
								<option>共青团员</option>
								<option>共产党员</option>
								<option>民主党派</option>
								<option>群众</option>
						</select></td>
						<td>性别：</td>
						<td><select name="teacherInfo.sex"
							class="form-control table_infomation sele">
								<option value="男">男</option>
								<option value="女">女</option>
						</select></td>
						<td>出生年月：</td>
						<td><input name="teacherInfo.birthday"
							class="form-control table_infomation laydate-icon bir"
							type="text" value="出生日期"></td>
					</tr>
					<tr>
						<td>最高学历：</td>
						<td><select name="teacherInfo.highestEducation"
							class="form-control table_infomation">
								<option>博士研究生</option>
								<option>硕士研究生</option>
								<option>本科</option>
								<option>专科</option>
								<option>专科以下</option>
						</select></td>
						<td>最高学位：</td>
						<td><select name="teacherInfo.highestDegree"
							class="form-control table_infomation">
								<option>博士</option>
								<option>硕士</option>
								<option>学士</option>
								<option>无</option>
						</select></td>
						<td>学缘：</td>
						<td><select name="teacherInfo.learnEdgeStructure"
							class="form-control table_infomation">
								<option>本校</option>
								<option>外校（境内）</option>
								<option>外校（境外）</option>
						</select></td>
					</tr>
					<tr>
						<td>专业技术职称：</td>
						<td><select name="teacherInfo.professionalTitle"
							class="form-control table_infomation">
								<option>教授</option>
								<option>副教授</option>
								<option>讲师</option>
								<option>助教</option>
								<option>未评级</option>
								<option>其他</option>
						</select></td>
						<td>职称级别：</td>
						<td><select name="teacherInfo.professionalGrade"
							class="form-control table_infomation">
								<option>正高级</option>
								<option>副高级</option>
								<option>中级</option>
								<option>初级</option>
								<option>未定职级</option>
						</select></td>
						<td>学科类别：</td>
						<td><input name="teacherInfo.subjectCategory"
							class="form-control table_infomation " type="text"></td>
					</tr>
					<tr>
						<td>参加工作时间：</td>
						<td><input name="teacherInfo.workDate"
							class="form-control table_infomation laydate-icon " type="text"></td>
						<td>入校时间：</td>
						<td><input name="teacherInfo.inductionDate"
							class="form-control table_infomation  laydate-icon" type="text"></td>
						<td>教师资格证号：</td>
						<td><input name="teacherInfo.teacherCertificateNo"
							class="form-control table_infomation" type="text"></td>
					</tr>
					<tr></tr>
					<tr class="title">
						<td>其他信息</td>
					</tr>
					<tr>
						<td>授课类型：</td>
						<td><select name="teacherInfo.teachingType"
							class="form-control table_infomation">
								<option>公共课、专业课</option>
								<option>公共课</option>
								<option>专业课</option>
								<option>无授课</option>
						</select></td>
						<td>授课状态：</td>
						<td><select name="teacherInfo.teachingStatus"
							class="form-control table_infomation">
								<option>授课</option>
								<option>不授课进修</option>
								<option>不授课病休</option>
								<option>不授课科研</option>
								<option>不授课其他</option>
						</select></td>
						<td>任教专业名称：</td>
						<td><input name="teacherInfo.teachingProfessionName"
							class="form-control table_infomation" type="text"
							placeholder="请输入任教专业名称"></td>

					</tr>
					<tr>
						<td>任教专业代码：</td>
						<td><input name="teacherInfo.teachingProfessionNo"
							class="form-control table_infomation" type="text"
							placeholder="请输入任教专业代码"></td>
						<td>专业任教时间：</td>
						<td><input name="teacherInfo.professionTeachingDate"
							class="form-control table_infomation " type="text"
							placeholder="请输入专业任教时间"></td>
						<td>是否实验技术人员：</td>
						<td><select name="teacherInfo.experimentalTechnicalPersonnel"
							class="form-control table_infomation">
								<option>否</option>
								<option>是</option>
						</select></td>

					</tr>
					<tr>
						<td>是否双师型：</td>
						<td><select name="teacherInfo.doubleTeacherType"
							class="form-control table_infomation">
								<option>否</option>
								<option>是</option>
						</select></td>
						<td>是否工程背景：</td>
						<td><select name="teacherInfo.engineeringBackground"
							class="form-control table_infomation">
								<option>否</option>
								<option>是</option>
						</select></td>
						<td>是否行业背景：</td>
						<td><select name="teacherInfo.industryBackground"
							class="form-control table_infomation">
								<option>否</option>
								<option>是</option>
						</select></td>


					</tr>
					<tr>
						<td>行政职务级别：</td>
						<td><select name="teacherInfo.administrativeRank"
							class="form-control table_infomation">
								<option>正厅级</option>
								<option>副厅级</option>
								<option>正处级</option>
								<option>副处级</option>
								<option>正科级</option>
								<option>副科级及以下</option>
						</select></td>
						<td>研究生导师类型：</td>
						<td><select name="teacherInfo.graduateTutorType"
							class="form-control table_infomation">
								<option>否</option>
								<option>硕士生导师</option>
								<option>博士生导师</option>
								<option>硕士、博士生导师</option>
						</select></td>
						<td>校内指导博士生人数：</td>
						<td><input name="teacherInfo.numberOfDoctor"
							class="form-control table_infomation" type="text"
							placeholder="请输入校内指导博士生人数"></td>

					</tr>
					<tr>
						<td>校内指导硕士生人数：</td>
						<td><input name="teacherInfo.numberOfMaster"
							class="form-control table_infomation" type="text"
							placeholder="请输入校内指导硕士生人数"></td>
						<td>职工类型：</td>
						<td><select name="teacherInfo.employeeType"
							class="form-control table_infomation">
								<option>专任教师</option>
								<option>行政人员</option>
								<option>教辅人员</option>
								<option>工勤人员</option>
								<option>科研机构人员</option>
								<option>聘请校外教师</option>
								<option>本科生专职辅导员</option>
								<option>研究生专职辅导员</option>
								<option>心理咨询人员</option>
						</select></td>
						<td>录用类型：</td>
						<td><select name="teacherInfo.employmentType"
							class="form-control table_infomation">
								<option>在编</option>
								<option>聘任</option>
						</select></td>

					</tr>
					<tr>
						<td>任职状态：</td>
						<td><select name="teacherInfo.jobStatue"
							class="form-control table_infomation">
								<option>在职</option>
								<option>当年离职</option>
								<option>请假</option>
								<option>进修</option>
								<option>无</option>
						</select></td>
						<td>异动类型：</td>
						<td><select name="teacherInfo.transactionType"
							class="form-control table_infomation">
								<option>无</option>
								<option>录用毕业生</option>
								<option>外单位教师调入</option>
								<option>校外非教师调入</option>
								<option>调离教师岗位</option>
								<option>其他（减少）</option>
								<option>自然减员</option>
						</select></td>
						<td>高校调入：</td>
						<td><select name="teacherInfo.universityTransfer"
							class="form-control table_infomation">
								<option>否</option>
								<option>是</option>
						</select></td>
					</tr>
					<tr>
						<td>本校毕业：</td>
						<td><select name="teacherInfo.schoolGraduation"
							class="form-control table_infomation">
								<option>否</option>
								<option>是</option>
						</select></td>
						<td>本校调整：</td>
						<td><select name="teacherInfo.schoolAdjustment"
							class="form-control table_infomation">
								<option>否</option>
								<option>是</option>
						</select></td>
						<td>校外教师类型：</td>
						<td><select name="teacherInfo.offCampusTeacherType"
							class="form-control table_infomation">
								<option>否</option>
								<option>外籍教师</option>
								<option>其他高校教师</option>
								<option>其他</option>
						</select></td>

					</tr>
					<!--<tr>
						<td>数据状态：</td>
						<td><select name="teacherInfo.dataStatus" id="dataStatus"
							class="form-control table_infomation">
								<option value="10">个人可添加、修改</option>
								<option value="20">审核中</option>
								<option value="20">人事处管理员修改、审核</option>
								<option value="40">信息已固化</option>
						</select></td>
					</tr>-->
				</table>
			</form>
		</div>
		</section>
	</div>

	<!--管理员审核奖励信息的表格-->
	<div id="user_award_table_audit">
		<!--表投上按钮组-->
		<div class="box-tools m-b-15">
			<div style="width: 100%;" class="input-group">
				<!--筛选&查询&添加按钮位置-->
				<button class="btn btn-default btn-addon btn-sm add-btn">
					<i class="fa fa-plus"></i>添加
				</button>
				<button class="btn btn-default btn-addon btn-sm export_button">
					<i class="fa fa-share-square"></i>导出
				</button>

				<!--按条件筛选-->
				<button style="" class="btn btn-default btn-sm" type="button"
					data-toggle="collapse" data-target="#collapseExample"
					aria-expanded="false" aria-controls="collapseExample">
					<i class="fa fa-search" aria-hidden="true"></i> 条件筛选
				</button>
				<!-- 部分搜索 -->
				<div style="float: right;">
					<input name="table_search" class="form-control input-sm"
						style="width: 150px;" type="text" placeholder="Search">
					<div style="float: right; height: 30px;">
						<button class="btn btn-default fuzzy_query" style="height: 100%;">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>

				<div style="width: 100%; margin-top: 6px;" class="collapse"
					id="collapseExample">
					<div class="well">
						<div id="search">
							<label>指定条件搜索：</label> <select id="all_options"
								class="all_options form-control ">
								<option value="">请选择</option>
								<option value="awardType">获奖类型</option>
								<option value="awardName">获奖名称</option>
								<option value="awardUserNames">获奖者姓名</option>
								<option value="awardGrade">获奖等级</option>
								<option value="awardLevel">获奖级别</option>
								<option value="awardTime">获奖时间</option>
							</select>

							<button style="float: right; margin-left: 6px;"
								class="btn btn-danger search_info">
								<i class="fa fa-exclamation-circle" aria-hidden="true"></i>清空搜索
							</button>

							<button style="float: right;" class="btn btn-info search_info">
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
			class="panel-heading second-panel-heading"> 奖励信息 </header>
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
					<!-- 	<tr>
								<td>1</td>
								<td>Face</td>
								<td>Mark</td>
								<td>李希勇</td>
								<td>教学成果</td>
								<td>国家自然科学</td>
								<td>一等奖</td>
								<td>国家级</td>
								<td>
									<button class="btn btn-default btn-xs" title="修改"><i class="fa fa-pencil-square-o"></i></button>
									<button class="btn btn-default btn-xs" title="提交"><i class="fa fa-check" ></i></button>
								</td>
							</tr> -->
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
	<div id="user_works_table_audit">
		<!--表投上按钮组-->
		<div class="box-tools m-b-15">
			<div class="input-group">
				<!--筛选&查询&添加按钮位置-->
				<button class="btn btn-default btn-addon btn-sm add-btn">
					<i class="fa fa-plus"></i>添加
				</button>
				<button class="btn btn-default btn-addon btn-sm export_button">
					<i class="fa fa-share-square"></i>导出
				</button>
				<div id="search">
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
					<button class="btn btn-default btn-addon btn-sm">
						<i class="fa fa-search"></i>搜索
					</button>

				</div>
				<!--<input type="text" class="form-control" />-->
			</div>
		</div>
		<!--查询存放信息的表格-->
		<section class="panel"> <header
			class="panel-heading second-panel-heading"> 著作信息 </header>
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
					<!-- <tr>
								<td>1</td>
								<td>Face</td>
								<td>李希勇</td>
								<td>专著</td>
								<td>国家级规划教材</td>
								<td>
									<button class="btn btn-default btn-xs" title="修改"><i class="fa fa-pencil-square-o"></i></button>
									<button class="btn btn-default btn-xs" title="提交"><i class="fa fa-check" ></i></button>
								</td>
							</tr> -->
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
	<div id="user_paper_table_audit">
		<!--表投上按钮组-->
		<div class="box-tools m-b-15">
			<div class="input-group">
				<!--筛选&查询&添加按钮位置-->
				<button class="btn btn-default btn-addon btn-sm add-btn">
					<i class="fa fa-plus"></i>添加
				</button>
				<button class="btn btn-default btn-addon btn-sm export_button">
					<i class="fa fa-share-square"></i>导出
				</button>
				<div id="search">
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
					<button class="btn btn-default btn-addon btn-sm">
						<i class="fa fa-search"></i>搜索
					</button>

				</div>
				<!--<input type="text" class="form-control" />-->
			</div>
		</div>
		<!--查询存放信息的表格-->
		<section class="panel"> <header
			class="panel-heading second-panel-heading"> 论文信息 </header>
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
					<!-- <tr>
								<td>1</td>
								<td>Face</td>
								<td>李希勇</td>
								<td>科研</td>
								<td>SCI</td>
								<td>2017-2-2</td>
								<td>
									<button class="btn btn-default btn-xs" title="修改"><i class="fa fa-pencil-square-o"></i></button>
									<button class="btn btn-default btn-xs" title="提交"><i class="fa fa-check" ></i></button>
								</td>
							</tr> -->
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
	<div id="user_patent_table_audit">
		<!--表投上按钮组-->
		<div class="box-tools m-b-15">
			<div class="input-group">
				<!--筛选&查询&添加按钮位置-->
				<button class="btn btn-default btn-addon btn-sm add-btn">
					<i class="fa fa-plus"></i>添加
				</button>
				<button class="btn btn-default btn-addon btn-sm export_button">
					<i class="fa fa-share-square"></i>导出
				</button>
				<div id="search">
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
					<button class="btn btn-default btn-addon btn-sm">
						<i class="fa fa-search"></i>搜索
					</button>

				</div>
				<!--<input type="text" class="form-control" />-->
			</div>
		</div>
		<!--查询存放信息的表格-->
		<section class="panel"> <header
			class="panel-heading second-panel-heading"> 专利信息 </header>
		<div class="panel-body table-responsive">
			<table class="table table-hover" id="info_table">
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
					<!-- <tr>
								<td>1</td>
								<td>Face</td>
								<td>李希勇</td>
								<td>专利</td>
								<td>122455</td>
								<td>
									<button class="btn btn-default btn-xs" title="修改"><i class="fa fa-pencil-square-o"></i></button>
									<button class="btn btn-default btn-xs" title="提交"><i class="fa fa-check" ></i></button>
								</td>
							</tr>  -->
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
	<div id="user_project_table_audit">
		<!--表投上按钮组-->
		<div class="box-tools m-b-15">
			<div class="input-group">
				<!--筛选&查询&添加按钮位置-->
				<button class="btn btn-default btn-addon btn-sm add-btn">
					<i class="fa fa-plus"></i>添加
				</button>
				<button class="btn btn-default btn-addon btn-sm export_button">
					<i class="fa fa-share-square"></i>导出
				</button>
				<div id="search">
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
					<button class="btn btn-default btn-addon btn-sm">
						<i class="fa fa-search"></i>搜索
					</button>

				</div>
				<!--<input type="text" class="form-control" />-->
			</div>
		</div>
		<!--查询存放信息的表格-->
		<section class="panel"> <header
			class="panel-heading second-panel-heading"> 课题(项目)信息 </header>
		<div class="panel-body table-responsive">
			<table class="table table-hover" id="info_table">
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
					<tr>
						<td>1</td>
						<td>李希勇</td>
						<td>Face</td>
						<td>专利</td>
						<td>122455</td>
						<td>
							<button class="btn btn-default btn-xs" title="修改">
								<i class="fa fa-pencil-square-o"></i>
							</button>
							<button class="btn btn-default btn-xs" title="提交">
								<i class="fa fa-check"></i>
							</button>
						</td>
					</tr>
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
