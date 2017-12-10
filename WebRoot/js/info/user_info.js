function userInfo(){
	$.ajax({
		url : "/teacherms/Teacher/teacher_userGetTableInfoInPaging",
		type : "post",
		timeout : 3000,
		data : data,
		dataType : "json",
		success : function(xhr_data) {
			$("#user_info_table_audit select,input").each(function(){
			var na= $(this).attr("name").split(".")[1];
			 $(this).val(xhr_data.ObjDatas[0][na]);
			  });
			},
		error : function() {}
	});
	
}