<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="0">
<title>教师-教职工信息</title>
<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath%>/css/user_form.css" />
<link rel="stylesheet" href="<%=basePath%>/css/jquery-confirm.css" />
<script type="text/javascript"
	src="<%=basePath%>/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/checkImgChange.js"></script>
<jsp:include page="/modal/export/info_modal.html" flush="true"></jsp:include>
<jsp:include page="/top_nav.jsp" flush="true"></jsp:include>
<jsp:include page="/user_left_nav.jsp" flush="true"></jsp:include>
</head>
<body>
	<div id="info_type">
		<div id="type_content">教职工信息</div>
		<div class="modifi_button">
			<button class="btn btn-sm btn-primary btn-default">修改</button>
		</div>
		<div class="export_button">
			<button class="btn btn-sm btn-primary btn-default">导出</button>
		</div>
	</div>
	<div id="mian_content">
		<div id="info_table" class="table-responsive">

			<form id="info-form">
				<table class="tab">
					<tr>
						<!-- name="teacherInfo." -->
						<td>工号：</td>
						<td><input class="form-control table_infomation" type="text"></td>
						<td>姓名</td>
						<td><input name="username"
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
						<td>证件号码</td>
						<td><input name="teacherInfo.certificateNo"
							class="form-control table_infomation" type="text"></td>
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
								<option>中共党员</option>
								<option>民主党派</option>
								<option>群众</option>
						</select></td>
						<td>性别：</td>
						<td><select name="teacherInfo.sex"
							class="form-control table_infomation">
								<option>男</option>
								<option>女</option>
						</select></td>
						<td>出生年月：</td>
						<td><input name="teacherInfo.birthday"
							class="form-control table_infomation mh_date" type="text"></td>
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
							class="form-control table_infomation " type="text"></td>
						<td>入校时间：</td>
						<td><input name="teacherInfo.inductionDate"
							class="form-control table_infomation " type="text"></td>
						<td>教师资格证号：</td>
						<td><input name="teacherInfo.teacherCertificateNo"
							class="form-control table_infomation" type="text"></td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td>授课类型：</td>
						<td><select class="form-control table_infomation">
								<option>公共课、专业课</option>
								<option>公共课</option>
								<option>专业课</option>
								<option>无授课</option>
						</select></td>
						<td>授课状态：</td>
						<td><select class="form-control table_infomation">
								<option>授课</option>
								<option>不授课进修</option>
								<option>不授课病休</option>
								<option>不授课科研</option>
								<option>不授课其他</option>
						</select></td>
						<td>任教专业名称：</td>
						<td><input class="form-control table_infomation" type="text"
							placeholder="请输入任教专业名称"></td>

					</tr>
					<tr>
						<td>任教专业代码：</td>
						<td><input class="form-control table_infomation" type="text"
							placeholder="请输入任教专业代码"></td>
						<td>专业任教时间：</td>
						<td><input class="form-control table_infomation mh_date"
							type="text" placeholder="请输入专业任教时间"></td>
						<td>是否实验技术人员：</td>
						<td><select class="form-control table_infomation">
								<option>否</option>
								<option>是</option>
						</select></td>

					</tr>
					<tr>
						<td>是否双师型：</td>
						<td><select class="form-control table_infomation">
								<option>否</option>
								<option>是</option>
						</select></td>
						<td>是否工程背景：</td>
						<td><select class="form-control table_infomation">
								<option>否</option>
								<option>是</option>
						</select></td>
						<td>是否行业背景：</td>
						<td><select class="form-control table_infomation">
								<option>否</option>
								<option>是</option>
						</select></td>


					</tr>
					<tr>
						<td>行政职务级别：</td>
						<td><select class="form-control table_infomation">
								<option>正厅级</option>
								<option>副厅级</option>
								<option>正处级</option>
								<option>副处级</option>
								<option>正科级</option>
								<option>副科级及以下</option>
						</select></td>
						<td>研究生导师类型：</td>
						<td><select class="form-control table_infomation">
								<option>否</option>
								<option>硕士生导师</option>
								<option>博士生导师</option>
								<option>硕士、博士生导师</option>
						</select></td>
						<td>校内指导博士生人数：</td>
						<td><input class="form-control table_infomation" type="text"
							placeholder="请输入校内指导博士生人数"></td>

					</tr>
					<tr>
						<td>校内指导硕士生人数：</td>
						<td><input class="form-control table_infomation" type="text"
							placeholder="请输入校内指导硕士生人数"></td>
						<td>职工类型：</td>
						<td><select class="form-control table_infomation">
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
						<td><select class="form-control table_infomation">
								<option>在编</option>
								<option>聘任</option>
						</select></td>

					</tr>
					<tr>
						<td>任职状态：</td>
						<td><select class="form-control table_infomation">
								<option>在职</option>
								<option>当年离职</option>
								<option>请假</option>
								<option>进修</option>
								<option>无</option>
						</select></td>
						<td>异动类型：</td>
						<td><select class="form-control table_infomation">
								<option>无</option>
								<option>录用毕业生</option>
								<option>外单位教师调入</option>
								<option>校外非教师调入</option>
								<option>调离教师岗位</option>
								<option>其他（减少）</option>
								<option>自然减员</option>
						</select></td>
						<td>高校调入：</td>
						<td><select class="form-control table_infomation">
								<option>否</option>
								<option>是</option>
						</select></td>
					</tr>
					<tr>
						<td>本校毕业：</td>
						<td><select class="form-control table_infomation">
								<option>否</option>
								<option>是</option>
						</select></td>
						<td>本校调整：</td>
						<td><select class="form-control table_infomation">
								<option>否</option>
								<option>是</option>
						</select></td>
						<td>校外教师类型：</td>
						<td><select class="form-control table_infomation">
								<option>否</option>
								<option>外籍教师</option>
								<option>其他高校教师</option>
								<option>其他</option>
						</select></td>

					</tr>
					<tr>
						<td>数据状态：</td>
						<td><select class="form-control table_infomation">
								<option value="10">个人可添加、修改</option>
								<option value="20">审核中</option>
								<option value="20">人事处管理员修改、审核</option>
								<option value="40">信息已固化</option>
						</select></td>
					</tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
				</table>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="<%=basePath%>/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/jquery-confirm.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/info/user_info.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>/js/user_checkImgChange.js"></script>
</body>
</html>