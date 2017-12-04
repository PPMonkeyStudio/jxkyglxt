function getCheckInfo(data){
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
			for (var i = 0; i < xhr_data.ObjDatas.length; i++) {
				var str = "<tr>";
				str+="<td>"+i+"</td>";
				for (var j = 0; j < xhr_data.ObjDatas[i].length; j++) {
 					if (j == xhr_data.ObjDatas[i].length - 1) {
 						if(data.tableName=="TeacherInfo"){
 							str += '<td><input type="hidden" value="' + xhr_data.ObjDatas[i][j] + '" ><button class="btn btn-default btn-xs  relieveButton" title="解除固化"><i class="fa fa-chain-broken fa-lg"></i></button><button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg" ></i></button><button class="btn btn-default btn-xs setButton" title="设置"><i class="fa fa-cog fa-lg" ></i></button></td>'
 							continue;
 						}else{
 							str += '<td><input type="hidden" value="' + xhr_data.ObjDatas[i][j] + '" ><button class="btn btn-default btn-xs relieveButton" title="解除固化"><i class="fa fa-chain-broken fa-lg"></i></button><button class="btn btn-default btn-xs viewButton" title="查看"><i class="fa fa-search-plus fa-lg"  aria-hidden="true"></i></button></td>'
 							continue;
 						}
					}
					str += "<td>" + xhr_data.ObjDatas[i][j] + "</td>";
				}
				str += '</tr>';
				$('.table').children('tbody').append(str);
			}
		},
		error : function() {}
	});
	
}