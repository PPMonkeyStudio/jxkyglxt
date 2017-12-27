/*获取全部信息*/
function user_selectAllWorks(){
	$.ajax({
		url : "/teacherms/Teacher/teacher_userGetTableInfoInPaging",
		type : "post",
		async : false,
		timeout : 3000,
		data : data,
		dataType : "json",
		success : function(xhr_data) {
			var xhr=xhr_data.ObjDatas;
			var str="";
			for(i=0;i<xhr.length;i++){
				var dataStatus=xhr[i].dataStatus;
				str+="<tr>";
			    str+="<td>"+(i+1)+"</td>";
			    str+="<td>"+xhr[i].worksName+"</td>";
			    str+="<td>"+xhr[i].editorUserNames+"</td>";
			    str+="<td>"+xhr[i].isbn+"</td>";
			    str+="<td>"+xhr[i].publishTime+"</td>";
			    str+="<td>"+xhr[i].press+"</td>"; 
			    if(dataStatus=="10"){
				    str += '<td><input type="hidden" value="' + xhr[i].worksId  + '" ><button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button><button class="btn btn-default btn-xs commmit-btn" title="提交审核"><i class="fa fa-sign-out fa-lg"  aria-hidden="true"></i></button></td>';		
			    }
			    if(dataStatus=="20"||dataStatus=="30"||dataStatus=="40"){
				    str += '<td><input type="hidden" value="' + xhr[i].worksId  + '" ><button class="btn btn-default btn-xs viewButton" title="查看"><i class="fa fa-eye fa-lg"  aria-hidden="true"></i></button></td>';		
			    }
			    
			    str+="</tr>";   
			}
			$('.table').children('tbody').html(str);
		},
		error : function() {}
	});
}
function userWorks(){
	user_selectAllWorks();
	$('.export_button').unbind().on('click',function(){
		$('#export_works').modal({
			keyboard : true
		});
	});
	$('.export-info').unbind().click(function(){
		$('.second-panel-heading').append('<button class="btn btn-primary end-button">确认导出</button>');
		$('#info_table tbody tr').each(function(){
			 $(this).find("td:first").empty().append('<input name="check" type="checkbox">');
			 $(this).unbind().on("click",function(){
				var check_attr= $(this).find('td input[name="check"]').is(":checked");
				if(check_attr==false){
					$(this).find('td input[name="check"]').attr("checked","true");
				}
				else{
					$(this).find('td input[name="check"]').removeAttr("checked");
				}
			 });
		});
		$('.end-button').unbind().on("click",function(){
			$('#info_table tbody tr').each(function(){
				if(($(this).find(' input[name="check"]').is(':checked'))==true){
				data.export_id+=$(this).find('input[type="hidden"]').val()+',';
				}
			})
			$('#export_works .group-list li input[name="checkbox"]').each(function(){
				if(($(this).is(':checked'))==true){
					data.export_name+=$(this).val()+',';
				}
			})
			if (data.export_id != "" && data.export_name != "") {
				location.href = "/teacherms/Teacher/teacher_userExportExcelCollectionn?tableName=TeacherWorks&export_id=" + (data.export_id).substring(0,data.export_id.length-1) + "&export_name=" + (data.export_name).substring(0,data.export_name.length-1);
			} else {
				alert("请选择数据");
			}
			data.export_id="";
			$('.end-button').unbind().remove();
		});
	});
	$('.viewButton').unbind().click(function(){
		$('#works_modal').modal({
			keyboard : true
		});
		$('#works_modal .btn-danger').remove();
		
		$.post("/teacherms/Teacher/teacher_userGetTableInfoByTableId",
				{tableId:$(this).siblings().val(),tableName:"TeacherWorks"},function(xhr){
					var inf = $('.table_infomation');
				  $("#works_modal input,select").each(function(){
					 var na= $(this).attr("name").split(".")[1];
				 if(na=="userId"){
						 $(this).val(xhr.user.userId);
					 }
				 else if(na=="userName"){
						 $(this).val(xhr.user.userName);
					 }
				 else $(this).val(xhr.object[na]);
				  })
				},"json");
		$(".review-info").remove();
	})
	function getIdByName(){
	$('input[name="teacherWorks.editorUserNames"]').keyup(function(){
		$.post('/teacherms/Teacher/teacher_getUserIdOrderingByUserName',{"user.userName":$(this).val()},function(xhr){
			$('input[name="teacherWorks.editorUserIds"]').val(xhr.result);
						},'json')
			
		});
		$('input[name="teacherWorks.subEditorUserNames"]').keyup(function(){
			$.post('/teacherms/Teacher/teacher_getUserIdOrderingByUserName',{"user.userName":$(this).val()},function(xhr){
				$('input[name="teacherWorks.subEditorUserIds"]').val(xhr.result);
							},'json')
			
		});
		
	}
	
	$('.add-btn').unbind().click(function(){
		$('#works_modal').modal({
			keyboard : true
		});
		$('.btn-danger').remove();
		imgUpload();
		getIdByName();
		$(' #works_modal input').val("");
		$(' #works_modal .modal-footer .close-btn').before('<button type="button" class="btn btn-danger add-end-btn">添加</button>')
	formValidate();
		/*添加信息*/
		$('.add-end-btn').unbind().click(function(){
			$('.tab tbody tr td input').each(function(){
				if($(this).hasClass("has-error")||$(this).val()==""){
					toastr.error("信息不能为空!");
					return;
				}
				else{
					var review_data = $("#info_form").serialize() + "&tableName=" + data.tableName;
					$.post("/teacherms/Teacher/teacher_userSetTableInfo", review_data, function(sxh_data) {
						if (sxh_data.result == "success") {
							toastr.success("添加成功!");
						}
					}, "json")
				}
			})
			
		})
	})
	/*提交审核*/
	$('.commmit-btn').unbind().click(function(){
		$('#works_modal').modal({
			keyboard : true
		});
		$('.btn-danger').remove();
		$.post("/teacherms/Teacher/teacher_userGetTableInfoByTableId",
				{tableId:$(this).siblings().val(),tableName:"TeacheWorks"},function(xhr){
					var inf = $('.table_infomation');
				  $("#works_modal input,select").each(function(){
					 var na= $(this).attr("name").split(".")[1];
				 if(na=="userId"){
						 $(this).val(xhr.user.userId);
					 }
				 else if(na=="userName"){
						 $(this).val(xhr.user.userName);
					 }
				 else $(this).val(xhr.object[na]);
				  })
				},"json");
		$(' #works_modal  .close-btn').before('<button type="button" class="btn btn-danger commit-end-btn">提交审核</button>')
	})
}
