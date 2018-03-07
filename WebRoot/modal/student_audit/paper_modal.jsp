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
									<td>论文名称：</td>
									<td><input name="studentPaper.paperName"
										class="form-control table_infomation" type="text"></td>
								</tr>
								<tr>
									<td>作者：</td>
									<td><input name="studentPaper.authorUserNames"
										class="form-control table_infomation" type="text"></td>
								</tr>
								<tr>
									<td>作者工号_排名：</td>
									<td><input name="studentPaper.authorUserIds"
										class="form-control table_infomation" type="text"></td>
								</tr>
								<tr>
									<td>论文类别：</td>
									<td><select name="studentPaper.paperType"
										class="form-control table_infomation">
											<option>科研</option>
											<option>教研</option>
									</select></td>
								</tr>
								<tr>
									<td>发表期刊：</td>
									<td><input name="studentPaper.periodical"
										class="form-control table_infomation" type="text"></td>
								</tr>
								<tr>
									<td>期号：</td>
									<td><input name="studentPaper.periodicalNo"
										class="form-control table_infomation" type="text"></td>
								</tr>
								<tr>
									<td>发表日期：</td>
									<td><input name="studentPaper.publishTime"
										class="form-control  table_infomation laydate-icon"
										onfocus="time()" type="text"></td>
								</tr>
								<tr>
									<td>收录情况：</td>
									<td><select name="studentPaper.includedSituation"
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
									<td>他引次数：</td>
									<td><input name="studentPaper.totalCitations"
										class="form-control table_infomation" type="text"></td>
								</tr>
								<tr>
									<td>是否与行业联合发表：</td>
									<td><select name="studentPaper.sfyhylhfb"
										class="form-control table_infomation">
											<option>否</option>
											<option>是</option>
									</select></td>
								</tr>
								<tr>
									<td>是否与地方联合发表：</td>
									<td><select name="studentPaper.sfydflhfb"
										class="form-control table_infomation">
											<option>否</option>
											<option>是</option>
									</select></td>
								</tr>
								<tr>
									<td>是否与国际联合发表：</td>
									<td><select name="studentPaper.sfygjlhfb"
										class="form-control table_infomation">
											<option>否</option>
											<option>是</option>
									</select></td>
								</tr>
								<tr>
									<td>是否是跨学科论文：</td>
									<td><select name="studentPaper.sfskxklw"
										class="form-control table_infomation">
											<option>否</option>
											<option>是</option>
									</select></td>
								</tr>
								<tr>
									<td>成果字数：</td>
									<td><input name="studentPaper.wordsNum"
										class="form-control table_infomation" type="text"></td>
								</tr>

								<tr class="img-control">
									<td>附件：</td>
									<td class="img-upload">
										<div class="addInfo">
											<div class="img-control-btn add-btn">
												<img src="img/add.png" />
											</div>
										</div>
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
						<input name="studentPatent.patentId" id="tableid" type="hidden" />
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
