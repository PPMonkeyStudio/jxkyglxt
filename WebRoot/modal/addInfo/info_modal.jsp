<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
	<div class="modal fade" id="info_modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class=" modal-dialog modal-lg">
			<form id="info_form">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">用户信息</h4>
					</div>
					<div class="modal-body">
						<div id="main_body">
							<table class="tab user-table">
								<tbody>
									<tr class="title"></tr>
									<tr>
										<td>工号：</td>
										<td><input name="teacherInfo.userId"
											class="form-control table_infomation" type="text"></td>
									</tr>
								</tbody>
								<tbody class="basic">
									<tr>
										<!-- name="teacherInfo." -->
										<td>姓名：</td>
										<td><input name="userName"
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
												<option>共产党员</option>
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
											class="form-control table_infomation laydate-icon"
											onfocus="time()" type="text">
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
											class="form-control table_infomation laydate-icon"
											onfocus="time()" type="text"></td>
										<td>入校时间：</td>
										<td><input name="teacherInfo.inductionDate"
											class="form-control table_infomation  laydate-icon"
											onfocus="time()" type="text"></td>
										<td>教师资格证号：</td>
										<td><input name="teacherInfo.teacherCertificateNo"
											class="form-control table_infomation" type="text"></td>
									</tr>
									<tr></tr>
									<tr class="title"></tr>
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
						<button style="display: none;" type="button"
							class="btn btn-danger sure_add">添加</button>
						<button style="display: none;" type="button"
							class="btn btn-danger sure_mod">修改</button>
						<button type="button" class="btn btn-default close-btn"
							data-dismiss="modal">关闭</button>
						<input name="teacherInfo.teacherInfoId" id="tableid" type="hidden" />
					</div>
				</div>
			</form>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
</body>
</html>
