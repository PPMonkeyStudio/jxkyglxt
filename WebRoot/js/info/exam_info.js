function exam_selectAllInfo(){
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
			    str+='<td><input type="hidden" value="' + xhr[i][0].teacherInfoId + '" ><button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button><button class="btn btn-default btn-xs solidButton" title="固化"><i class="fa fa-chain fa-lg" ></i></button></td>';
			   str+="</tr>";   
			}
			$('.table').children('tbody').html(str);
			$('.solidButton').click(UsersolidInfo);	
		},
		error : function() {}
	});
}
function examInfo(){
	exam_selectAllInfo();
	$(".modiButton").unbind().on("click",function(){
		//显示出模态框
		$('#info_modal').modal({
			keyboard : true
		})
		$.post("/teacherms/Admin/admin_getTeacherTableInfoById",
				{tableId:$(this).siblings().val(),tableName:"TeacherInfo"},function(xhr){
					$("#info_modal input,select").each(function(){
						 var na= $(this).attr("name").split(".")[1];
					 if(na=="userId"){
							 $(this).val(xhr.user.userId);
						 }
					 else 	if(na=="userName"){
							 $(this).val(xhr.user.userName);
						 }
					 else $(this).val(xhr.object[na]);
					  })
				},"json");
	})
}
/*信息固化*/
var UsersolidInfo=function(){
   var infoid=$(this).siblings('input').val();
   $(this).siblings().remove();
   $(this).children().remove();
   $(this).append("<img  src='img/ok1.png' />")
   $(this).attr("title","已固化");
   $.post('/teacherms/Admin/admin_LiftCuring',{
	   tableId:infoid,
	   tableName:"TeacherInfo",
	   dataState:"40"},function(xhr){
		   if(xhr.result=="success"){
			   toastr.success("信息固化成功");
		   }else{
			 return;
		   }
   },'json')
   
}

