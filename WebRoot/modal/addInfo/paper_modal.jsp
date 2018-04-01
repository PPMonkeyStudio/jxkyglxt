<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="paper_modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class=" modal-dialog">
			<form id="info_form">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">论文</h4>
					</div>
					<div class="modal-body">
						<div id="main_body">
							<table class="tab com-table">
								<tr>
									<td>论文名称:</td>
									<td><input name="teacherPaper.paperName"
										class="form-control table_infomation" type="text"></td>
									<td>作者:</td>
									<td><input name="teacherPaper.authorUserNames"
										class="form-control table_infomation" type="text"></td>
								</tr>
								<tr>
									<td>作者工号_排名:</td>
									<td><input name="teacherPaper.authorUserIds"
										class="form-control table_infomation" type="text"></td>
									<td>论文类别:</td>
									<td><select name="teacherPaper.paperType"
										class="form-control table_infomation">
											<option>科研</option>
											<option>教研</option>
									</select></td>
								</tr>
								<tr>
									<td>发表期刊:</td>
									<td><input name="teacherPaper.periodical"
										class="form-control table_infomation" type="text"></td>
									<td>期号:</td>
									<td><input name="teacherPaper.periodicalNo"
										class="form-control table_infomation" type="text"></td>
								</tr>
								<tr>
									<td>发表日期:</td>
									<td><input name="teacherPaper.publishTime"
										class="form-control  table_infomation laydate-icon"
										onfocus="time()" type="text"></td>
									<td>收录情况:</td>
									<td><select name="teacherPaper.includedSituation"
										class="form-control table_infomation">
											<option>SCI</option>
											<option>SSCI</option>
											<option>EI</option>
											<option>ISTP</option>
											<option>CSCD</option>
											<option>CSSCI</option>
									</select></td>
								</tr>
								<tr>
									<td>他引次数:</td>
									<td><input name="teacherPaper.totalCitations"
										class="form-control table_infomation" type="text"></td>
									<td>与行业联合发表:</td>
									<td><select name="teacherPaper.sfyhylhfb"
										class="form-control table_infomation">
											<option>否</option>
											<option>是</option>
									</select></td>
								</tr>
								<tr>
									<td>与地方联合发表:</td>
									<td><select name="teacherPaper.sfydflhfb"
										class="form-control table_infomation">
											<option>否</option>
											<option>是</option>
									</select></td>
									<td>与国际联合发表:</td>
									<td><select name="teacherPaper.sfygjlhfb"
										class="form-control table_infomation">
											<option>否</option>
											<option>是</option>
									</select></td>
								</tr>
								<tr>
									<td>跨学科论文:</td>
									<td><select name="teacherPaper.sfskxklw"
										class="form-control table_infomation">
											<option>否</option>
											<option>是</option>
									</select></td>
									<td>成果字数:</td>
									<td><input name="teacherPaper.wordsNum"
										class="form-control table_infomation" type="text"></td>
								</tr>
								<tr class="img-control">
									<td>附件:</td>
									<td colspan="3" class="img-upload">
										<div class="addInfo">
											<div class="img-control-btn">
												<img effect="imgadd" src="img/add.png" />
											</div>
										</div> <input name="" upload-type="paper" type="file" multiple
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
						<input name="teacherPatent.patentId" id="tableid" type="hidden" />
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
