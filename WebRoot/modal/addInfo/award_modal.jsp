<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
	<div class="modal fade" id="award_modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class=" modal-dialog">
			<form id="info_form">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">奖励</h4>
					</div>
					<div class="modal-body">
						<div id="main_body">
							<table class="tab com-table">
								<tr>
									<td>奖励名称:</td>
									<td><input name="teacherAward.awardName"
										class="form-control table_infomation" type="text"></td>
									<td>获奖者姓名:</td>
									<td><input name="teacherAward.awardUserNames"
										class="form-control table_infomation" type="text"></td>
								</tr>
								<tr>
									<td>获奖者工号_排名:</td>
									<td><input name="teacherAward.awardUserIds"
										class="form-control table_infomation" type="text"></td>
									<td>奖励类型:</td>
									<td><select name="teacherAward.awardType" draggable="true"
										class="form-control table_infomation">
											<option>教学成果</option>
											<option>科研成果</option>
											<option>指导学生获奖</option>
											<option>个人业绩获奖</option>
									</select></td>
								</tr>
								<tr>
									<td>获奖类别:</td>
									<td><select name="teacherAward.awardClass"
										class="form-control table_infomation">
											<option>国家自然科学奖</option>
											<option>国家技术发明奖</option>
											<option>国家科技进步奖</option>
											<option>教育部高校科研成果奖（科学技术、人文社科）</option>
											<option>省（市、自治区）政府自然科学奖</option>
											<option>省（市、自治区）政府技术发明奖</option>
											<option>省（市、自治区）政府科技进步奖</option>
											<option>省（市、自治区）政府哲学社科奖</option>
									</select></td>
									<td>获奖等级:</td>
									<td><select name="teacherAward.awardGrade"
										class="form-control table_infomation">
											<option>特等奖</option>
											<option>一等奖</option>
											<option>二等奖</option>
											<option>三等奖</option>
									</select></td>
								</tr>
								<tr>
									<td>获奖级别:</td>
									<td><select name="teacherAward.awardLevel"
										class="form-control table_infomation">
											<option>国家</option>
											<option>省级</option>
											<option>市级</option>
									</select></td>
									<td>获奖时间:</td>
									<td><input name="teacherAward.awardDate"
										class="form-control table_infomation laydate-icon"
										onfocus="time()" type="text"></td>
								</tr>
								<tr>
									<td>获奖证书编号:</td>
									<td><input name="teacherAward.awardCertificationNo"
										class="form-control table_infomation" type="text"></td>
									<td>授予单位:</td>
									<td><input name="teacherAward.grantUnit"
										class="form-control table_infomation" type="text"></td>
								</tr>
								<tr class="img-control">
									<td>附件:</td>
									<td colspan="3" class="img-upload">
										<div class="addInfo"
											onclick="javascript:$(this).next().click()">
											<div class="img-control-btn add-btn">
												<img src="img/add.png" />
											</div>
										</div> <input name="" type="file" multiple
										onchange="previewFile(this)"
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
						<input name="teacherAward.awardId" id="tableid" type="hidden" />
					</div>
				</div>
			</form>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
</body>
</html>
