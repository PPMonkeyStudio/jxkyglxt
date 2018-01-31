<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
	<div class="modal fade" id="export_paper" tabindex="-1" role="dialog"
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

								<!-- <li><label><input id="btn1" type="checkbox"
										value="">全选</label></li>
								<li><label><input id="btn2" type="checkbox"
										value="">取消全选</label></li>
								<li><label><input id="btn3" type="checkbox"
										value="">反选</label></li> -->
							</ul>
							<ul class="group-list">

								<!--<li><button value="20" class="btn btn-info btn-sm">
										<i class="fa fa-times" aria-hidden="true"></i> <span>工号</span>
									</button></li>
								<li><button value="21" class="btn btn-info btn-sm">
										<i class="fa fa-times" aria-hidden="true"></i> <span>姓名</span>
									</button></li> -->
								<li><button value="2" class="btn btn-info btn-sm">
										<i class="fa fa-times" aria-hidden="true"></i> <span>论文名称</span>
									</button></li>
								<li><button value="3" class="btn btn-info btn-sm">
										<i class="fa fa-times" aria-hidden="true"></i> <span>作者</span>
									</button></li>
								<li><button value="4" class="btn btn-info btn-sm">
										<i class="fa fa-times" aria-hidden="true"></i> <span>作者工号_排名</span>
									</button></li>

								<!-- <li><label><input name="checkbox" type="checkbox"
										value="">工号</label></li>
								<li><label><input name="checkbox" type="checkbox"
										value="">姓名</label></li>
								<li><label><input name="checkbox" type="checkbox"
										value="">论文名称</label></li>
								<li><label><input name="checkbox" type="checkbox"
										value="">作者</label></li>
								<li><label><input name="checkbox" type="checkbox"
										value="">作者工号_排名</label></li> -->
							</ul>
							<ul class="group-list">

								<li><button value="5" class="btn btn-info btn-sm">
										<i class="fa fa-times" aria-hidden="true"></i> <span>论文类别</span>
									</button></li>
								<li><button value="6" class="btn btn-info btn-sm">
										<i class="fa fa-times" aria-hidden="true"></i> <span>发表期刊</span>
									</button></li>
								<li><button value="7" class="btn btn-info btn-sm">
										<i class="fa fa-times" aria-hidden="true"></i> <span>期号</span>
									</button></li>
								<li><button value="8" class="btn btn-info btn-sm">
										<i class="fa fa-times" aria-hidden="true"></i> <span>发表日期</span>
									</button></li>
								<li><button value="9" class="btn btn-info btn-sm">
										<i class="fa fa-times" aria-hidden="true"></i> <span>收录情况</span>
									</button></li>
								<!-- 
								<li><label><input name="checkbox" type="checkbox"
										value="">论文类别</label></li>
								<li><label><input name="checkbox" type="checkbox"
										value="">发表期刊</label></li>
								<li><label><input name="checkbox" type="checkbox"
										value="">期号</label></li>
								<li><label><input name="checkbox" type="checkbox"
										value="">发表日期</label></li>
								<li><label><input name="checkbox" type="checkbox"
										value="">收录情况</label></li> -->
							</ul>
							<ul class="group-list">
								<li><button value="10" class="btn btn-info btn-sm">
										<i class="fa fa-times" aria-hidden="true"></i> <span>他引次数</span>
									</button></li>
								<li><button value="11" class="btn btn-info btn-sm">
										<i class="fa fa-times" aria-hidden="true"></i> <span>是否与行业联合发表</span>
									</button></li>
								<li><button value="12" class="btn btn-info btn-sm">
										<i class="fa fa-times" aria-hidden="true"></i> <span>是否与地方联合发表</span>
									</button></li>
								<li><button value="13" class="btn btn-info btn-sm">
										<i class="fa fa-times" aria-hidden="true"></i> <span>是否与国际联合发表</span>
									</button></li>
								<li><button value="14" class="btn btn-info btn-sm">
										<i class="fa fa-times" aria-hidden="true"></i> <span>是否是跨学科论文</span>
									</button></li>

								<!-- <li><label><input name="checkbox" type="checkbox"
										value="">他引次数</label></li>
								<li><label><input name="checkbox" type="checkbox"
										value="">是否与行业联合发表</label></li>
								<li><label><input name="checkbox" type="checkbox"
										value="">是否与地方联合发表</label></li>
								<li><label><input name="checkbox" type="checkbox"
										value="">是否与国际联合发表</label></li>
								<li><label><input name="checkbox" type="checkbox"
										value="">是否是跨学科论文</label></li> -->
							</ul>
							<ul class="group-list">
								<li><button value="15" class="btn btn-info btn-sm">
										<i class="fa fa-times" aria-hidden="true"></i> <span>成果字数</span>
									</button></li>

								<!-- <li><label><input name="checkbox" type="checkbox"
										value="">成果字数</label></li>
								<li><label><input name="checkbox" type="checkbox"
										value="">附件地址</label></li>
								<li><label><input name="checkbox" type="checkbox"
										value="">数据状态</label></li>
								<li><label><input name="checkbox" type="checkbox"
										value="">创建时间</label></li>
 -->

							</ul>
						</div>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-primary export_button"
						data-dismiss="modal">导出</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<input name="teacherPaper.paperId" id="tableid" type="hidden" />
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
</body>
</html>
