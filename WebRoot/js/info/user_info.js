
var data = {
	tableName : "TeacherInfo",
	dataState : "",
	page : 1,
	time_interval : "",
	tableId : "",
}

$(function() {
	//查询所有奖励信息
	getInfoByTableId();
	
})

function getInfoByTableId() {
	$.ajax({
		url : "/teacherms/Teacher/teacher_userGetTeacherInfo",
		type : "post",
		cache : false,
		timeout : 3000,
		data : data,
		dataType : "json",
		success : function(xsh_data) {
			var inf = $('.table_infomation');
			xsh_data = xsh_data[0];
			//为id赋值
			inf.eq(0).val(xsh_data.userId).attr("disabled", "disabled");
			if (xsh_data.dataStatus == "10") {
				$('.export_button button').hide();
				var index = 0;
				for (var item in xsh_data) {
					if (index > 1 + 6) {
						var eq_num = index + 18 - 6;
						inf.eq(eq_num).val(xsh_data[item]).attr("disabled", "disabled");
					}
					index++;
				}
				$('.modifi_button button').html("提交修改").click(function() {
					var button1 = this;
					$.alert({
						title : '提交修改!',
						content : '确认提交至管理员审核？',
						buttons : {
							confirm : {
								text : '确定',
								btnClass : 'btn-red',
								keys : [ 'enter' ],
								action : function() {
									var send_data = $('#info-form').serialize();
									$(button1).html("信息待审核中").attr("disabled", "disabled");
									$(inf).attr("disabled", "disabled");
									$.post("/teacherms/Teacher/teacher_userCompleteBasicInformation", send_data, function(xhr_data) {
										alert("提交成功！");
									}, "json");
								}
							},
							cancel : {
								text : '取消',
								btnClass : 'btn-blue',
								keys : [ 'esc' ],
							}
						}
					});
				});
			} else if (xsh_data.dataStatus == "20" || xsh_data.dataStatus == "40") {
				//给name值
				$.post("/teacherms/Teacher/teacher_userGetUserName", function(data2_name) {
					inf.eq(1).val(data2_name.result).attr("disabled", "disabled");
				}, "json");
				var index = 0;
				for (var item in xsh_data) {
					if (index > 1) {
						var eq_num = index;
						inf.eq(eq_num).val(xsh_data[item]).attr("disabled", "disabled");
					}
					index++;
				}

				if (xsh_data.dataStatus == "20") {
					$('.export_button button').hide();
					$('.modifi_button button').html("信息待审核中").attr("disabled", "disabled");
				} else {
					$('.modifi_button button').hide();
				}
			}
		},
		error : function() {}
	});
}