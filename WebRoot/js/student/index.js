//保存分页信息
var pageDataInformation = {
	pageIndex : "",
	totalRecords : '',
	pageSize : '',
	totalPages : '',
	HavePrePage : '',
	HaveNextPage : '',
}
//记录分页信息方法
function setPageInfo(xhr_data) {
	pageDataInformation.HaveNextPage = xhr_data.HaveNextPage;
	pageDataInformation.HavePrePage = xhr_data.HavePrePage;
	pageDataInformation.pageIndex = xhr_data.pageIndex;
	pageDataInformation.pageSize = xhr_data.pageSize;
	pageDataInformation.totalPages = xhr_data.totalPages;
	pageDataInformation.totalRecords = xhr_data.totalRecords;
}



	$(document).on("change", "#all_options", function() {
		var option = $(this).find('option:selected');
		var pla = '';
		switch ($(this).val()) {
		//筛选框提示文字名
		case 'userName':
			pla = '请输入姓名';
			break;

			
			
			
			
			
		default:
			break;
		}
		if (option.hasClass('true') || pla == "") {
			console.log($("#Inputu" + $(this).val()))
			return;
		} else {
			var con = $(this).val();
			if ((con.indexOf("Date")) >= 0 || (con.indexOf("Time")) >= 0) {
				$(".all_options").siblings('#search_input').append('<div id="main_body">' + '<div id="Inputu' + $(this).val() + '" class="dateinput_div form-group">' +
					'<input type="text"  placeholder="' + pla + '搜索起始时间" class="form-control  riliDate"  />' + '--' +
					'<input type="text"  placeholder="' + pla + '搜索结束时间" class="form-control  riliDate" />' +
					'<button class="btn btn-primary"><i class="fa fa-times" aria-hidden="true"></i></button></div></div>')
				option.addClass('true');
				$('.dateinput_div button').click(function() {
					option.removeClass('true');
					//移除时候清空js中已存的数据
					data[data.tableName.replace("T", "t") + "." + $(this).parent().val()] = "";
					$(this).parent().remove();
				});
			} else {

				$(".all_options").siblings('#search_input').append('<div id="Inputu' + $(this).val() + '" class="input_div form-group">' +
					'<input type="text"  placeholder="' + pla + '" class="form-control"/>' +
					'<button class="btn btn-primary"><i class="fa fa-times" aria-hidden="true"></i></button></div>')
				option.addClass('true');
				$('.input_div button').click(function() {
					option.removeClass('true');
					//移除时候清空js中已存的数据
					data[data.tableName.replace("T", "t") + "." + $(this).parent().val()] = "";
					$(this).parent().remove();
					$(this).parent().empty();
				});

			}
		}


	})
