function userInfo() {
	$.ajax({
		url : "/teacherms/Teacher/teacher_userGetTableInfoInPaging",
		type : "post",
		timeout : 3000,
		data : data,
		dataType : "json",
		success : function(xhr_data) {
			$("#user_info_table_audit table").find('select,input').each(function() {
				console.log($(this).attr("name"));
				var na = $(this).attr("name").split(".")[1];
				$(this).val(xhr_data.ObjDatas[0][na]);
			});
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
}