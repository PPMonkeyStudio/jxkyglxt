
var data = {
	tableName : "TeacherAward",
	dataState : "",
	page : 1,
	time_interval : "",
	tableId : "",
}

$(function() {
	//查询所有奖励信息
	getinfo();
	//添加按钮设置事件
	$('.add_button button').click(function() {
		$('#award').modal({
			keyboard : true
		})
		$('.tab tr td input').val("");
		$('.table_infomation').removeAttr("disabled");
		$('#dataStatus').val('10').attr("disabled", "disabled");
		$(".basic").hide();
		$('.review-info').removeClass("btn-danger").addClass("btn-primary").html("确认添加").one("click", function() {
			var str = $(this).text();
			var review_data = $("#info_form").serialize() + "&tableName=" + data.tableName;
			$.post("/teacherms/Teacher/teacher_userSetTableInfo", review_data, function(sxh_data) {
				if (sxh_data.result == "success") {
					alert("添加成功");
					getinfo();
				}
			}, "json")
		});
	});
})

function img_click() {

	//查看
	$('.checkimg').click(function() {
		//显示出模态框
		$('#award').modal({
			keyboard : true
		})
		//工号名字信息显示
		$(".basic").show();
		//设置为不可更改
		$('.table_infomation').attr("disabled", "disabled");
		//设置为导出，类型为primary
		$('.review-info').removeClass("btn-danger").addClass("btn-primary").html("导出");
		//获取在img标签的上一1个兄弟元素存入的id值
		var id = $(this).siblings("input").val();
		//id值存入到模态框中按钮的上一个兄弟元素中
		$("#tableid").val(id);
		//全局对象中data的tableId赋值为id的值
		data.tableId = id;
		//查询指定id的信息
		getInfoByTableId(data);
		//模态框出现后给按钮一次性的点击事件
		$('.review-info').one("click", function() {
			var review_data = "query_id=" + $("#tableid").val() + ",&tableName=" + data.tableName;
			$(location).attr('href', '/teacherms/Teacher/teacher_ExportExcelCollection?' + review_data);
		});
	});

	//修改
	$('.modfiimg').click(function() {
		//显示出模态框
		$('#award').modal({
			keyboard : true
		})
		//工号名字信息显示
		$(".basic").show();
		//设置为可更改
		$('.table_infomation').removeAttr("disabled");
		//数据状态设置为10,不可更改
		$("#dataStatus").val("10").attr("disabled", "disabled");
		//设置为导出，类型为primary
		$('.review-info').removeClass("btn-danger").addClass("btn-primary").html("修改");
		//获取在img标签的同辈元素的input中存入的id值
		var id = $(this).siblings("input").val();
		//id值存入到模态框中按钮的上一个兄弟元素中
		$("#tableid").val(id);
		//全局对象中data的tableId赋值为id的值
		data.tableId = id;
		//查询指定id的信息
		getInfoByTableId(data);
		//模态框出现后给按钮一次性的点击事件
		$('.review-info').one("click", function() {
			var modfi_data = $('#info_form').serialize() + "&tableName=" + data.tableName;
			$.post("/teacherms/Teacher/teacher_userSetTableInfo", modfi_data, function(xhr_data) {
				alert(xhr_data.result);
			}, "json");
		});

	});


	//提交审核
	$('.submitimg').click(function() {
		var img = this;
		$.confirm({
			title : '提交!',
			content : '确定提交至院管理员审核？',
			buttons : {
				确定 : {
					btnClass : 'btn-blue',
					theme : "material",
					keys : [ 'enter' ],
					action : function() {
						var id = $(img).siblings("input").val();
						var _data = "tableName=" + data.tableName + "&tableId=" + id;
						$.post("/teacherms/Teacher/teacher_userPuchInfoToadmin", _data, function(xhr_data) {
							if (xhr_data.result == "success") {
								$(img).parent().children().unbind();
								$(img).parent().html("✔");
							}
						}, "json");
					}
				},
				取消 : {
					btnClass : 'btn-blue',
					keys : [ 'esc' ],
					action : function() {}
				},
			}
		});
	});
}
function export_to_execl() {
	//添加按钮设置模态框初始化清空内容
	$('.export_button button').unbind().click(function() {
		var export_button = $(this);
		export_button.html("导出");
		$('#export_award').modal({
			keyboard : true,
		})

		$('.export-info').click(function() {
			$('#info_table tbody tr').click(function() {
				var tr_html = $(this).children("td:last").html();
				var img_export = '<img class="export_img" src="/teacherms/img/export.png" />';
				//alert($(this).children("td:last").children().is("img[class='export_img']"));
				if (!$(this).children("td:last").children().is("img[class='export_img']")) {
					$(this).children("td:last").append(img_export);
					data.query_id += $(this).children("td:last").children("input").val() + ",";
				} else {
					$(this).children("td:last").children("img[class='export_img']").remove();
					data.query_id = (data.query_id).replaceAll($(this).children("td:last").children("input").val() + ",", "");
				}
				export_button.html("确认导出");
			})

			export_button.unbind().click(function() {
				if (data.query_id != "" && data.query_num != "") {
					location.href = "/teacherms/Admin/admin_ExportExcelCollection?tableName=" + data.tableName + "&query_id=" + data.query_id + "&query_num=" + data.query_num;
					export_button.unbind();
					getinfo();
				} else {
					alert("请选择数据");
				}
			});

		});
	})
}