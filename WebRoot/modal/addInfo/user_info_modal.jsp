<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
	<div class="modal fade" id="add_info_modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class=" modal-dialog modal_lg">
			<form id="info_form">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">用户信息</h4>
					</div>
					<div class="modal-body">
						<div id="main_body">
							<table class="tab">
								<tbody>
									<tr>
										<td>工号：</td>
										<td><input name="teacherInfo.userId"
											class="form-control table_infomation" type="text"></td>
									</tr>
								</tbody>
								<tbody class="other">
									<tr>
										<td>授课类型：</td>
										<td><select name="teacherInfo.teachingType"
											class="form-control table_infomation">
												<option>公共课、专业课</option>
												<option>公共课</option>
												<option>专业课</option>
												<option>无授课</option>
										</select></td>
									</tr>
									<tr>
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
									</tr>
									<tr>
										<td>是否实验技术人员：</td>
										<td><select
											name="teacherInfo.experimentalTechnicalPersonnel"
											class="form-control table_infomation">
												<option>否</option>
												<option>是</option>
										</select></td>
										<td>是否双师型：</td>
										<td><select name="teacherInfo.doubleTeacherType"
											class="form-control table_infomation">
												<option>否</option>
												<option>是</option>
										</select></td>
									</tr>
									<tr>
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
									</tr>
									<tr>
										<td>校内指导博士生人数：</td>
										<td><input name="teacherInfo.numberOfDoctor"
											class="form-control table_infomation" type="text"
											placeholder="请输入校内指导博士生人数"></td>
										<td>校内指导硕士生人数：</td>
										<td><input name="teacherInfo.numberOfMaster"
											class="form-control table_infomation" type="text"
											placeholder="请输入校内指导硕士生人数"></td>
									</tr>
									<tr>
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
									</tr>
									<tr>
										<td>高校调入：</td>
										<td><select name="teacherInfo.universityTransfer"
											class="form-control table_infomation">
												<option>否</option>
												<option>是</option>
										</select></td>
										<td>本校毕业：</td>
										<td><select name="teacherInfo.schoolGraduation"
											class="form-control table_infomation">
												<option>否</option>
												<option>是</option>
										</select></td>
									</tr>
									<tr>
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
								</tbody>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger sure_add_info"
							data-dismiss="modal">确认添加</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<input name="teacherInfo.teacherInfoId" id="tableid" type="hidden" />
					</div>
				</div>
			</form>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	
		<div class="modal fade" id="student_info_modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class=" modal-dialog modal_lg">
			<form id="info_form">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel"> 添加学生信息</h4>
					</div>
					<div class="modal-body">
						<div id="main_body">
							<table class="tab">
								<tbody>
								<tr>
										<td>姓名：</td>
										<td><input name="studentInfo.studentName"
											class="form-control table_infomation" type="text"></td>
										<td>学号：</td>
										<td><input name="studentInfo.studentId"
											class="form-control table_infomation" type="text">
										</td>
									</tr>
								</tbody>
								<tbody class="other">
									<tr>
											<td>
											</td>
									</tr>
									<tr>
										<td>年制：</td>
										<td><select name="studentInfo.calendarYear"
											class="form-control table_infomation">
												<option></option>
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
										</select></td>
										<td>&nbsp;&nbsp;入学年份：</td>
										<td><input name="studentInfo.enrolmentYear"
											class="form-control table_infomation" type="text"
											placeholder="四位数，如2018"></td>
									</tr>
									
									<tr>
										<td>证件类型：</td>
										<td><select name="studentInfo.certificateType"
											class="form-control table_infomation">
												<option>身份证</option>
												<option>护照</option>
												<option>其他证件</option>
										</select></td>
										<td>&nbsp;&nbsp;证件编号：</td>
										<td>
											<input name="studentInfo.certificateNo"
											class="form-control table_infomation" type="text">
										</td>
									</tr>
							
										<tr>
										<td>性别：</td>
										<td>	<select name="studentInfo.sex"
											class="form-control table_infomation">
												<option></option>
												<option>男</option>
												<option>女</option>

											</select></td>
										<td>民族：</td>
										<td>
											<input name="studentInfo.nation"
											class="form-control table_infomation" type="text">
										</td>
									</tr>
										<tr>
										<td>政治面貌：</td>
										<td><input name="studentInfo.politicalStatus"
											class="form-control table_infomation" type="text"></td>
										<td>生源地：</td>
										<td><input name="studentInfo.studentSource"
											class="form-control table_infomation" type="text">
								
										</td>
									</tr>
										<tr>
										<td>学生类型：</td>
										<td><input name="studentInfo.studentType"
											class="form-control table_infomation" type="text"></td>
										<td>招生类型：</td>
										<td>
											<input name="studentInfo.enrolmentType"
											class="form-control table_infomation" type="text">
										</td>
									</tr>
									</tr>
										<tr>
										<td>授课方式：</td>
										<td><input name="studentInfo.classType"
											class="form-control table_infomation" type="text"></td>
										<td>专业代码：</td>
										<td>
											<input name="studentInfo.classNumber"
											class="form-control table_infomation" type="text">
										</td>
									</tr>
									</tr>
										<tr>
										<td>专业名称：</td>
										<td><input name="studentInfo.className"
											class="form-control table_infomation" type="text"></td>
										<td>自主专业名称：</td>
										<td>
											<input name="studentInfo.inClassName"
											class="form-control table_infomation" type="text">
										</td>
									</tr>
									</tr>
										<tr>
										<td>所在学院：</td>
										<td><input name="studentInfo.departmentId"
											class="form-control table_infomation" type="text"></td>
										<td>是否师范类专业：</td>
										<td>
											<select name="studentInfo.teacherTraining"
											class="form-control table_infomation">
												<option></option>
												<option>是</option>
												<option>否</option>
											</select>
										</td>
									</tr>
									</tr>
										<tr>
										<td>是否残疾：</td>
										<td>
											<select name="studentInfo.deformed"
											class="form-control table_infomation">
												<option></option>
												<option>是</option>
												<option>否</option>
											</select>
										</td>
										<td>异动类型：</td>
										<td><input name="studentInfo.changes"
											class="form-control table_infomation" type="text"></td>
									</tr>
								</tbody>	
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger sure_add_info"
							data-dismiss="modal">确认添加</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<input name="studentInfo.studentInfoId" id="tableid" type="hidden" />
					</div>
				</div>
			</form>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
</body>
</html>
