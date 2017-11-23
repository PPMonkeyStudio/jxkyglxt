
var data = {
	tableName : "TeacherProject",
	dataState : "20",
	page : 1,
	time_interval : "", //导出筛选用，时间区段用逗号隔开
	tableId : "", //记录id使用
}

$(function() {
	//查询所有奖励信息
	getinfo();
})

function img_click() {
	$('.checkimg1').hover(function() {
		$(this).attr("src", "http://localhost:8080/teacherms/img/check1.png");
	}, function() {
		$(this).attr("src", "http://localhost:8080/teacherms/img/check.png");
	});
	$('.checkimg2').hover(function() {
		$(this).attr("src", "http://localhost:8080/teacherms/img/unlock1.png");
	}, function() {
		$(this).attr("src", "http://localhost:8080/teacherms/img/unlock.png");
	});

	//查看
	$('.checkimg1').click(function() {
		//显示出模态框
		$('#project').modal({
			keyboard : true
		})
		//设置为不可更改
		$('.table_infomation').attr("disabled", "disabled");
		//设置为导出，类型为primary
		$('.review-info').removeClass("btn-danger").addClass("btn-primary").html("导出");
		//获取在img标签的上一1个兄弟元素存入的id值
		var id = $(this).prev().val();
		//id值存入到模态框中按钮的上一个兄弟元素中
		$("#tableid").val(id);
		//全局对象中data的tableId赋值为id的值
		data.tableId = id;
		//查询指定id的信息
		getInfoByTableId(data);
		//模态框出现后给按钮一次性的点击事件
		$('.review-info').one("click", function() {
			var review_data = "query_id=" + $("#tableid").val() + ",&tableName=" + data.tableName;
			$(location).attr('href', '/teacherms/Admin/admin_ExportExcelCollection?' + review_data);
		});
	});

	//解除固化
	$('.checkimg2').click(function() {
		var img_element = $(this);
		var id = $('.checkimg1').prev().val();
		var jc = $.confirm({
			theme : 'material',
			title : '解除固化',
			content : $('select[id=dataStatus]').parent().html(),
			onContentReady : function() {
				$('.jconfirm-content').find('select[id=dataStatus]').removeAttr("disabled").change(function() {
					var Status = $(this).val();
					if (Status == "40") {
						jc.buttons.confirm.setText("信息已固化");
						jc.buttons.confirm.disable();
					} else if (Status == "10") {
						jc.buttons.confirm.setText("解除固化-用户信息修改");
						//jc.buttons.confirm.removeClass("btn-danger")
						//jc.buttons.confirm.addClass("btn-danger")
						jc.buttons.confirm.enable();
					} else if (Status == "20" || Status == "30") {
						jc.buttons.confirm.setText("解除固化-管理员审核");
						jc.buttons.confirm.enable();
					}
				})
			},
			buttons : {
				cancel : {
					text : '取消',
					keys : [ 'esc' ],
				},
				confirm : {
					text : '解除',
					btnClass : 'btn-blue',
					keys : [ 'enter' ],
					action : function() {
						var LiftCuring_data = "tableName=" + data.tableName
							+ "&dataState=" + $('.jconfirm-content').find('select[id=dataStatus]').val()
							+ "&tableId=" + id;
						$.post("/teacherms/Admin/admin_LiftCuring", LiftCuring_data, function(sxh_data) {
							if (sxh_data.result == "success") {
								img_element.attr({
									src : "test.jpg"
								}).unbind();
							}
						}, "json")
					}
				},
			}
		});
	});
}