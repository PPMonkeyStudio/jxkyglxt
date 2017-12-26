function userInfo() {
	$.ajax({
		url : "/teacherms/Teacher/teacher_userGetTeacherInfo",
		type : "post",
		timeout : 3000,
		data : {},
		dataType : "json",
		success : function(xhr_data) {
			$("#user_info_table_audit table").find('select,input').each(function() {
				var na = $(this).attr("name").split(".")[1];
				$(this).val(xhr_data.object[na]);
			});
			$('input[name="teacherInfo.userName"]').val(xhr_data.user.userName);
		},
		error : function() {}
	});
	$('.add-btn').unbind().click(function(){
		$('#info_modal').modal({
			keyboard : true
		});
		$(' #info_modal input').val("");
		if($('#info_modal .btn-danger').length>0){
			return;
		}else{
		$(' #info_modal .modal-footer .close-btn').before('<button type="button" class="btn btn-danger add-end-btn">添加</button>')
		}
		formValidate();
		/*添加信息*/
		$('.add-end-btn').unbind().click(function(){
			
			var review_data = $("#info_form").serialize() + "&tableName=" + data.tableName;
			$.post("/teacherms/Teacher/teacher_userSetTableInfo", review_data, function(sxh_data) {
				if (sxh_data.result == "success") {
					alert("添加成功");
				}
			}, "json")
		})
	})
	
/*	导出信息*/
	$('.export_button').unbind().on('click',function(){
		$('#export_info').modal({
			keyboard : true
		});
		
	});
	$('.export-info').unbind().click(function(){
		$('.second-panel-heading').append('<button class="btn btn-primary end-button">确认导出</button>');
		$('.end-button').unbind().on("click",function(){
			$('#info_table tbody tr').each(function(){
				if(($(this).find(' input[name="check"]').is(':checked'))==true){
				data.export_id+=$(this).find('input[type="hidden"]').val()+',';
				}
			})
			$('#export_project .group-list li input[name="checkbox"]').each(function(){
				if(($(this).is(':checked'))==true){
					data.export_name+=$(this).val()+',';
				}
			})
			if (data.export_id != "" && data.export_name != "") {
				location.href = "/teacherms/Teacher/teacher_userExportExcelCollection?tableName=TeacherInfo&export_id=" + (data.export_id).substring(0,data.export_id.length-1) + "&export_name=" + (data.export_name).substring(0,data.export_name.length-1);
			} else {
				alert("请选择数据");
			}
			data.export_id="";
			$('.end-button').unbind().remove();
		});
	});
}