function examWorks(){
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
			    str+="<td>"+xhr[i][0].worksName+"</td>";
			    str+="<td>"+xhr[i][0].editorUserNames+"</td>";
			    str+="<td>"+xhr[i][0].worksType+"</td>";
			    str+="<td>"+xhr[i][0].selectedSituation+"</td>";
			    str+="<td>"+xhr[i][0].press+"</td>"; 
			    str+='<td><input type="hidden" value="' + xhr[i][0].awardId + '" ><button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button><button class="btn btn-default btn-xs solidButton" title="固化"><i class="fa fa-chain fa-lg" ></i></button></td>';
			   str+="</tr>";   
			}
			$('.table').children('tbody').append(str);
		},
		error : function() {}
	});
	$(".modiButton").unbind().on("click",function(){
		//显示出模态框
		$('#works_modal').modal({
			keyboard : true
		})
		$.post("/teacherms/Admin/admin_getTeacherTableInfoById",
				{tableId:$(this).siblings().val(),tableName:"TeacherWorks"},function(xsh_data){
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
		$(".solidButton").on("click",function(){
		var id = $(this).siblings().val();
		data.dataState="40"
			$(this).siblings().remove();
			$(this).children().remove();
		$(this).append("<img  src='img/ok1.png' />")
	})
}