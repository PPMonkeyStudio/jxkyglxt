function examAward(){
	$(document).unbind().on("click",".modiButton",function(){
		//显示出模态框
		$('#award_modal').modal({
			keyboard : true
		})
		$.post("/teacherms/Admin/admin_getTeacherTableInfoById",
				{tableId:$(this).siblings().val(),tableName:"TeacherAward"},function(xsh_data){
				var inf = $('.table_infomation');
					xsh_data = xsh_data[0];
					for (var i = 0; i < xsh_data.length; i++) {
						if (i > 1) {
							for (var j = 0; j < xsh_data[i].length; j++) {
								$(inf[j + i]).val(xsh_data[i][j + 2]);
							}
						} else {
							$(inf[i]).val(xsh_data[i]);
						}
					
					}
				},"json");
	})
	$(document).on("click",".solidButton",function(){
		var id = $(this).siblings().val();
		data.dataState="40"
			$(this).siblings().remove();
	    $(this).children().remove();
		$(this).append("<img  src='img/ok1.png' />")
	})
}