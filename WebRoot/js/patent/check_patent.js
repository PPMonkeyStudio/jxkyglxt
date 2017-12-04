function checkPatent(){
	//清楚原来的数据
	$('.table tbody').empty();
	$.ajax({
		url : "/teacherms/Admin/admin_getSpecifiedInformationByPaging",
		type : "post",
		async : false,
		timeout : 3000,
		data : data,
		dataType : "json",
		success : function(xhr_data) {
			var xhr=xhr_data.ObjDatas;
			var str="";
			for(i=0;i<xhr.length;i++){
				str+="<tr>";
			    str+="<td>"+(i+1)+"</td>";
			    str+="<td>"+xhr[i][0].patentName+"</td>";
			    str+="<td>"+xhr[i][0].authorUserNames+"</td>";
			    str+="<td>"+xhr[i][0].patentType+"</td>";
			    str+="<td>"+xhr[i][0].authorizationNo+"</td>";
			    str += '<td><input type="hidden" value="' + xhr[i][0].patentId  + '" ><button class="btn btn-default btn-xs relieveButton" title="解除固化"><i class="fa fa-chain-broken fa-lg"></i></button><button class="btn btn-default btn-xs viewButton" title="查看"><i class="fa fa-search-plus fa-lg"  aria-hidden="true"></i></button></td>';
			    str+="</tr>";   
			}
			$('.table').children('tbody').append(str);
		},
		error : function() {}
	});
	$(document).on("click",".relieveButton",function(){
		data.dataState="20"
		$(this).children().remove();
		$(this).append("<img  src='img/ok1.png' />");
		$(this).attr("title","已解除固化");
	});
	$(".viewButton").unbind().on("click",function(){
		//显示出模态框
		$('#patent_modal').modal({
			keyboard : true
		})
		$.post("/teacherms/Admin/admin_getTeacherTableInfoById",
				{tableId:$(this).siblings().val(),tableName:"TeacherPatent"},function(xsh_data){
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
		$(".review-info").remove();
	})
}