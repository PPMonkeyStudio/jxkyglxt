<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
	<div class="modal fade" id="export_project" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class=" modal-dialog modal-lg">

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">信息管理-导出</h4>
				</div>
				<div class="modal-body  " id="modal-content">
					<div class="tab_content">
						<div id="check" class="checkbox">
							<ul class="group-list">
								<li><button id="all" class="btn btn-info btn-sm">
										<i class="fa fa-times" aria-hidden="true"></i> <span>全选</span>
									</button></li>
								<li><button id="inverse" class="btn btn-info btn-sm">
										<i class="fa fa-times" aria-hidden="true"></i> <span>反选</span>
									</button></li>

							</ul>
							<ul class="group-list">
								<li><button value="2" class="btn btn-info btn-sm pro">
										<i class="fa fa-times" aria-hidden="true"></i> <span>项目名称</span>
									</button></li>
								<li><button value="3" class="btn btn-info btn-sm pro">
										<i class="fa fa-times" aria-hidden="true"></i> <span>项目来源</span>
									</button></li>
								<li><button value="4" class="btn btn-info btn-sm pro">
										<i class="fa fa-times" aria-hidden="true"></i> <span>成员姓名</span>
									</button></li>
								<li><button value="5" class="btn btn-info btn-sm pro">
										<i class="fa fa-times" aria-hidden="true"></i> <span>成员工号_排名</span>
									</button></li>
								<li><button value="6" class="btn btn-info btn-sm pro">
										<i class="fa fa-times" aria-hidden="true"></i> <span>立项编号或批准文号</span>
									</button></li>
								<li><button value="7" class="btn btn-info btn-sm pro">
										<i class="fa fa-times" aria-hidden="true"></i> <span>项目类别</span>
									</button></li>
								<li><button value="8" class="btn btn-info btn-sm pro">
										<i class="fa fa-times" aria-hidden="true"></i> <span>立项日期</span>
									</button></li>
							</ul>
							<ul class="group-list">
								<li><button value="9" class="btn btn-info btn-sm pro">
										<i class="fa fa-times" aria-hidden="true"></i> <span>结题验收或鉴定日期</span>
									</button></li>
								<li><button value="10" class="btn btn-info btn-sm pro">
										<i class="fa fa-times" aria-hidden="true"></i> <span>经费</span>
									</button></li>
								<li><button value="11" class="btn btn-info btn-sm pro">
										<i class="fa fa-times" aria-hidden="true"></i> <span>级别</span>
									</button></li>
								<li><button value="12" class="btn btn-info btn-sm pro">
										<i class="fa fa-times" aria-hidden="true"></i> <span>是否重点</span>
									</button></li>
							</ul>
						</div>
						<div class="tab-inneed"></div>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-primary export_button"
						data-dismiss="modal">导出</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<input name="teacherProject.projectId" id="tableid" type="hidden" />

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
</body>
</html>
