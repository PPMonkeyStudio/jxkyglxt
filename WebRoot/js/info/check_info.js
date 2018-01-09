function check_selectAllInfo() {
	$.ajax({
		url : "/teacherms/Admin/admin_getSpecifiedInformationByPaging",
		type : "post",
		async : false,
		timeout : 3000,
		data : data,
		dataType : "json",
		success : function(xhr_data) {
			var xhr = xhr_data.ObjDatas;
			var str = "";
			for (i = 0; i < xhr.length; i++) {
				str += "<tr>";
				str += "<td>" + (i + 1) + "</td>";
				str += "<td>" + xhr[i][0].userId + "</td>";
				str += "<td>" + xhr[i][1].userName + "</td>";
				str += "<td>" + xhr[i][0].professionalGrade + "</td>";
				str += "<td>" + xhr[i][0].employeeType + "</td>";
				str += "<td>" + xhr[i][0].teachingType + "</td>";
				str += "<td>" + xhr[i][0].teachingStatus + "</td>";
				str += '<td><input type="hidden" value="' + xhr[i][0].teacherInfoId + '" >'
					+ '<button class="btn btn-default btn-xs  relieveButton" title="解除固化"><i class="fa fa-chain-broken fa-lg"></i></button>'
					+ '<button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg" ></i></button>'
					+ '<button class="btn btn-default btn-xs setButton" title="设置"><i class="fa fa-cog fa-lg" ></i></button>'
					+ '</td></tr>';
			}
			$('.table').children('tbody').html(str);
			$('.relieveButton').click(UserrelieveInfo);
		},
		error : function() {}
	});
}
function checkInfo() {
	check_selectAllInfo();
	$(".modiButton").unbind().on("click", function() {
		//显示出模态框
		$('#info_modal').modal({
			keyboard : true
		});
		$('#info_modal .basic').show();
		$.post("/teacherms/Admin/admin_getTeacherTableInfoById",
			{
				tableId : $(this).siblings().val(),
				tableName : "TeacherInfo"
			}, function(xhr) {
				$("#info_modal input,select").each(function() {
					var na = $(this).attr('name').split(".")[1];
					if (na == "userId") {
						$(this).val(xhr.user.userId);
					} else if ($(this).attr('name') == "userName") {
						$(this).val(xhr.user.userName);
					}
					else $(this).val(xhr.object[na]);
				})
			}, "json");
	})
	$(".setButton").on("click", function() {
		//显示出模态框
		$('#user_info_modal').modal({
			keyboard : true
		});
	})


	$(".export_button").unbind().on("click", function() {
		//显示出模态框
		$('#export_info').modal({
			keyboard : true
		});
	});


	/*导出*/
	$('.export-info').unbind().click(function() {
		$('.second-panel-heading').append('<button class="btn btn-primary end-button">确认导出</button>');
		$('#info_table tbody tr').each(function() {
			$(this).find("td:first").empty().append('<input name="check" type="checkbox">');
			$(this).on("click", function() {
				var check_attr = $(this).find('td input[name="check"]').is(":checked");
				if (check_attr == false) {
					$(this).find('td input[name="check"]').attr("checked", "true");
				} else {
					$(this).find('td input[name="check"]').removeAttr("checked");
				}
			})
		});


		$('.end-button').unbind().on("click", function() {

			$('#info_table tbody tr').each(function() {
				if (($(this).find(' input[name="check"]').is(':checked')) == true) {
					data.export_id += $(this).find('input[type="hidden"]').val() + ',';
				}
			})
			$('#export_info .group-list button').each(function() {
				if (($(this).children('i').hasClass('fa-check')) && $(this).attr('value') != undefined) {
					data.export_name += $(this).val() + ',';
				}
			})
			if (data.export_id != "" && data.export_name != "") {
				console.log("export_id=" + (data.export_id).substring(0, data.export_id.length - 1) + "&export_name=" + (data.export_name).substring(0, data.export_name.length - 1));
				location.href = "/teacherms/Admin/admin_ExportExcelCollection?tableName=TeacherInfo&export_id=" + (data.export_id).substring(0, data.export_id.length - 1) + "&export_name=" + (data.export_name).substring(0, data.export_name.length - 1);
			} else {
				toastr.error("请选择数据");
			}
			data.export_id = "";
			$('.end-button').unbind().remove();
			$('#info_table tbody tr').each(function(i, v) {
				$(this).children('td:first-child').empty().html(i + 1);
			})
		});
	});
	//用户信息添加
	$('.add_button').unbind().on("click", function() {
		$('#add_user_modal').modal({
			keyboard : true
		});
		formValidate();
		$('.review-info').unbind().click(function() {
			var review_data = $("#add_user_modal form").serialize() + "&tableName=" + data.tableName;
			$.post("/teacherms/Admin/admin_addTeacherInfo", review_data, function(sxh_data) {
				if (sxh_data.result == "success") {
					toastr.success("添加成功！")
				}
			}, "json")

		})
	});
}

/*解除固化*/
var UserrelieveInfo = function() {
	var infoid = $(this).siblings('input').val();
	$(this).children().remove();
	$(this).append("<img  src='img/ok1.png' />");
	$(this).attr("title", "已解除固化");
	$.post('/teacherms/Admin/admin_LiftCuring', {
		tableId : infoid,
		tableName : "TeacherInfo",
		dataState : "10"
	}, function(xhr) {
		if (xhr.result == "success") {
			toastr.success("信息解除固化成功");
		} else {
			return;
		}
	}, 'json')
}