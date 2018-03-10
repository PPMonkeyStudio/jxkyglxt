/**
 * 
 */
$(function() {
	$('.table-responsive').on('click', function(e) {
		if (e.target.tagName == 'A') {
			var a = $(e.target);
			var id = a.attr('introduction-id');
			$.post('/jxkyglxt/Admin/admin_getOneOfIntroduction', {
				tableId : id
			}, function(xhr) {
				var TABLE_STYLE = '<form id="Introduction_update"><table class="table">'
					+ '<caption>信息</caption>'
					+ '<tbody>'
					+ '<tr>'
					+ '<th>名字</th>'
					+ '<th>'
					+ '<input type="hidden" name="introduction.introductionId" value="' + xhr.introductionId + '">'
					+ '<input name="introduction.introductionName" class="form-control" value="' + xhr.introductionName + '" type="text"></th>'
					+ '</tr>'
					+ '<tr>'
					+ '<td>简介</td>'
					+ '<td><textarea name="introduction.introductionContent" class="form-control" rows="2">' + xhr.introductionContent + '</textarea></td>'
					+ '</tr>'
					+ '<tr>'
					+ '<td>位置</td>'
					+ '<th><input name="introduction.introductionRanking" class="form-control" value="' + xhr.introductionRanking + '" type="text"></th>'
					+ '</tr>'
					+ '</tbody>'
					+ '</table></form>';
				setIntroduction(TABLE_STYLE);
			}, 'json');
		}
	})

	function setIntroduction(content_str) {
		$.confirm({
			title : '简介信息',
			smoothContent : false,
			closeIcon : true,
			backgroundDismiss : true,
			content : content_str,
			buttons : {
				deleteUser : {
					btnClass : 'btn-blue',
					text : '修改',
					action : function() {
						$.post('/jxkyglxt/Admin/admin_modifyIntroduction', $('#Introduction_update').serialize(), function(xhr_data) {
							if (xhr_data.result == "success") {
								toastr.success("修改成功");
								toIntroductionModify();
							} else {
								toastr.error("修改失败");
							}
						}, 'json');
					}
				},
				cancelAction : {
					btnClass : 'btn-default',
					text : '取消',
				}
			}
		});
	}

	$('.introduction_add').click(function() {
		var TABLE_STYLE = '<form id="Introduction_add"><table class="table">'
			+ '<caption>信息</caption>'
			+ '<tbody>'
			+ '<tr>'
			+ '<th>名字</th>'
			+ '<th>'
			+ '<input name="introduction.introductionName" class="form-control" type="text"></th>'
			+ '</tr>'
			+ '<tr>'
			+ '<td>简介</td>'
			+ '<td><textarea name="introduction.introductionContent" class="form-control" rows="2"></textarea></td>'
			+ '</tr>'
			+ '<tr>'
			+ '<td>位置</td>'
			+ '<th><input name="introduction.introductionRanking" class="form-control" type="text"></th>'
			+ '</tr>'
			+ '</tbody>'
			+ '</table></form>';
		$.confirm({
			title : '简介信息',
			smoothContent : false,
			closeIcon : true,
			backgroundDismiss : true,
			content : TABLE_STYLE,
			buttons : {
				deleteUser : {
					btnClass : 'btn-blue',
					text : '修改',
					action : function() {
						$.post('/jxkyglxt/Admin/admin_setIntroduction', $('#Introduction_add').serialize(), function(xhr_data) {
							if (xhr_data.result > 0) {
								toastr.success("添加成功");
								toIntroductionModify();
							} else {
								toastr.error("添加失败");
							}
						}, 'json');
					}
				},
				cancelAction : {
					btnClass : 'btn-default',
					text : '取消',
				}
			}
		});
	});
})