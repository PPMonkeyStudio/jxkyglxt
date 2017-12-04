function checkInfo(){
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
			    str+="<td>"+xhr[i][0].userId+"</td>";
			    str+="<td>"+xhr[i][1].userName+"</td>";
			    str+="<td>"+xhr[i][0].professionalGrade+"</td>";
			    str+="<td>"+xhr[i][0].employeeType+"</td>";
			    str+="<td>"+xhr[i][0].teachingType+"</td>"; 
			    str+="<td>"+xhr[i][0].teachingStatus+"</td>";
				str += '<td><input type="hidden" value="' + xhr[i][0].teacherInfoId + '" ><button class="btn btn-default btn-xs  relieveButton" title="解除固化"><i class="fa fa-chain-broken fa-lg"></i></button><button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg" ></i></button><button class="btn btn-default btn-xs setButton" title="设置"><i class="fa fa-cog fa-lg" ></i></button></td>';
			    str+="</tr>";   
			}
			$('.table').children('tbody').append(str);
		},
		error : function() {}
	});
	$(".relieveButton").on("click",function(){
		data.dataState="20"
			$(this).children().remove();
			$(this).append("<img  src='img/ok1.png' />");
			$(this).attr("title","已解除固化");
	})
	$(".modiButton").unbind().on("click",function(){
		//显示出模态框
		$('#info_modal').modal({
			keyboard : true
		});
		$.post("/teacherms/Admin/admin_getTeacherTableInfoById",
				{tableId:$(this).siblings().val(),tableName:"TeacherInfo"},function(xhr){
				var inf = $('.table_infomation');
				var xh=xhr.ObjDatas[0];
				 $("#info_modal input,select").each(function(){
					 var na= $(this).attr("name").split(".")[1];
					 $(this).val(xh[0].na);
				},"json");
	})
	$(".setButton").on("click",function(){
		//显示出模态框
		$('#user_info_modal').modal({
			keyboard : true
		});
	})
	
	
	
	
}