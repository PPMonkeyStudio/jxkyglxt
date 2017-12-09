function getExamInfo(data){
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
				str += '<td>'+i+'</td>'
				for (var j = 0; j <xhr_data.ObjDatas[i].length; j++) {
						if (j == xhr_data.ObjDatas[i].length-1 ) {
						str += '<td><input type="hidden" value="' + xhr_data.ObjDatas[i][j] + '" ><button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button><button class="btn btn-default btn-xs solidButton" title="固化"><i class="fa fa-chain fa-lg" ></i></button></td>'
						continue;
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
