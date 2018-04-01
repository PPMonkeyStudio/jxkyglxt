<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="project_modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class=" modal-dialog">
			<form id="info_form">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">项目(课题)</h4>
					</div>
					<div class="modal-body">
						<div id="main_body">
							<table class="tab com-table">
								<tr>
									<td>项目名称:</td>
									<td><input name="teacherProject.projectName"
										class="form-control table_infomation" type="text"></td>
									<td>项目来源:</td>
									<td><select name="teacherProject.projectSource"
										class="form-control table_infomation">
											<option>国家自然科学基金项目</option>
											<option>国家社会科学基金项目</option>
											<option>全国教育规划项目</option>
											<option>全国艺术规划项目</option>
											<option>教育部人文社会科学项目</option>
											<option>全国各类学会研究课题</option>
											<option>江西省教育厅高校人文社科项目</option>
											<option>江西省教育厅教改课题项目</option>
											<option>江西省教育厅教育规划项目</option>
											<option>江西省社会科学规划项目</option>
											<option>江西省党建研究项目</option>
											<option>江西省文化厅艺术科学规划项目</option>
											<option>江西省科技厅计划项目</option>
											<option>江西省教育考试院项目</option>
											<option>江西省体育局科技项目</option>
											<option>萍乡市科技局项目</option>
											<option>萍乡学院校级课题</option>
											<option>升级科研平台</option>
											<option>校级科研平台</option>
									</select></td>
								</tr>
								<tr>
									<td>成员姓名:</td>
									<td><input name="teacherProject.projectUserNames"
										class="form-control table_infomation" type="text"></td>
									<td>成员工号_排名:</td>
									<td><input name="teacherProject.projectUserIds"
										class="form-control table_infomation" type="text"></td>
								</tr>
								<tr>
									<td>立项编号(批准文号):</td>
									<td><input name="teacherProject.projectNo"
										class="form-control table_infomation" type="text"></td>
									<td>项目类别:</td>
									<td><input name="teacherProject.projectType"
										class="form-control table_infomation" type="text"></td>
								</tr>
								<tr>
									<td>立项日期:</td>
									<td><input name="teacherProject.approvalDate"
										class="form-control table_infomation laydate-icon"
										onfocus="time()" type="text"></td>
									<td>结题验收(鉴定日期):</td>
									<td><input name="teacherProject.endUpDate"
										class="form-control table_infomation laydate-icon"
										onfocus="time()" type="text"></td>
								</tr>
								<tr>
									<td>经费:</td>
									<td><input name="teacherProject.funds"
										class="form-control table_infomation" type="text"></td>
									<td>参与教师数:</td>
									<td><input name="teacherProject.memberNum"
										class="form-control table_infomation" type="text"></td>
								</tr>
								<tr>
									<td>级别:</td>
									<td><select name="teacherProject.level"
										class="form-control table_infomation">
											<option>国家级</option>
											<option>省部级</option>
									</select></td>
									<td>是否重点:</td>
									<td><select name="teacherProject.isImportant"
										class="form-control table_infomation">
											<option>否</option>
											<option>是</option>
									</select></td>
								</tr>
								<tr class="img-control">
									<td>附件:</td>
									<td colspan="3" class="img-upload">
										<div class="addInfo">
											<div class="img-control-btn">
												<img effect="imgadd" src="img/add.png" />
											</div>
										</div> <input name="" upload-type="project" type="file" multiple
										onchange="ImgManiFunc.previewFile(this)"
										accept="image/gif, image/pdf, image/png, image/jpeg"
										style="display:none">
									</td>
								</tr>
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
						<input name="teacherProject.projectId" id="tableid" type="hidden" />
						<!-- <button type="button" class="btn btn-danger review-info"
							data-dismiss="modal">信息未审核</button> -->
					</div>
				</div>
			</form>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
</body>
</html>