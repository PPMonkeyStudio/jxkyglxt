
function getinfo() {
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
				for (var j = 0; j < xhr_data.ObjDatas[i].length; j++) {
					if (j == xhr_data.ObjDatas[i].length - 1) {
						str += '<td><input type="hidden" value="' + xhr_data.ObjDatas[i][j] + '" ><img class="checkimg" src="/teacherms/img/review6.png" /></td>'
						continue;
					}
					str += "<td>" + xhr_data.ObjDatas[i][j] + "</td>";
				}
				str += '</tr>';
				$('.table').children('tbody').append(str);
			}
			img_click();
		},
		error : function() {}
	});
}

function page(num) {
	data.page = num;
	$('.table').children('tbody').empty();
	getinfo();
}
function prepage() {
	data.page -= 1;
	$('.table').children('tbody').empty();
	getinfo();
}
function nextpage() {
	data.page += 1;
	$('.table').children('tbody').empty();
	getinfo();
}

function getInfoByTableId() {
	$.ajax({
		url : "/teacherms/Admin/admin_getTeacherTableInfoById",
		type : "post",
		timeout : 3000,
		data : data,
		dataType : "json",
		success : function(xsh_data) {
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
		},
		error : function() {}
	});
}