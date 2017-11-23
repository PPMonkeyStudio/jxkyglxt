
function getinfo() {

	//清楚原来的数据
	$('.user_award_table tbody').empty();
	$.ajax({
		url : "/teacherms/Teacher/teacher_userGetTableInfoInPaging",
		type : "post",
		async : false,
		timeout : 3000,
		data : data,
		dataType : "json",
		success : function(xhr_data) {
			for (var i = 0; i < xhr_data.ObjDatas.length; i++) {
				var str = "<tr>";
				for (var j = 0; j < xhr_data.ObjDatas[i].length; j++) {
					if (j == xhr_data.ObjDatas[i].length - 2) {
						if (xhr_data.ObjDatas[i][j] == "10") {
							str += '<td><img class="modfiimg" src="/teacherms/img/modfi.png" /><img class="submitimg" src="/teacherms/img/submit.png" />';
						}
						if (xhr_data.ObjDatas[i][j] == "40") {
							str += '<td><img class="checkimg" src="/teacherms/img/check.png" />';
						}

						continue;
					}
					if (j == xhr_data.ObjDatas[i].length - 1) {
						str += '<input type="hidden" value="' + xhr_data.ObjDatas[i][j] + '" ></td>'
						continue;
					}
					str += "<td>" + xhr_data.ObjDatas[i][j] + "</td>";
				}
				str += '</tr>';
				$('.table').children('tbody').append(str);
			}
			//图片设置hover事件
			user_checkImgChange();
			//图片设置点击事件
			img_click();
			//导出按钮绑定点击事件
			export_to_execl();
			//重新设置为导出
			$('.export_button button').val("导出");

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
		url : "/teacherms/Teacher/teacher_userGetTableInfoByTableId",
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