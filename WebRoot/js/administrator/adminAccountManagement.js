/**
 * 
 */
$(function() {
	$('#accordion').on('click', function(e) {
		if (e.target.tagName == 'A') {
			var a = $(e.target);
			var id = a.attr('introduction-id');
			$.post('/jxkyglxt/System/system_getOneOfUser', {
				"user.userId" : id
			}, function(xhr) {
				$.post('/jxkyglxt/System/system_getAllDepartment', '', function(xhr2) {
					var TABLE_STYLE = '<form id="user_update"><table class="table">'
						+ '<caption>信息</caption><tbody>'
						+ '<tr>'
						+ '<th>ID</th>'
						+ '<th>'
						+ '<input name="user.userId" class="form-control" value="' + xhr.userId + '" type="text"></th>'
						+ '</tr>'
						+ '<tr>'
						+ '<th>名字</th>'
						+ '<th>'
						+ '<input name="user.userName" class="form-control" value="' + xhr.userName + '" type="text"></th>'
						+ '</tr>'
						+ '<tr>'
						+ '<td>部门</td>'
						+ '<td>'
						+ '<select name="user.departmentId" class="form-control" value="' + xhr.departmentId + '">';
					$.each(xhr2, function(i, v) {
						if (v[0] === xhr.departmentId) {
							TABLE_STYLE += '<option selected value="' + v[0] + '">' + v[1] + '</option>'
						} else
							TABLE_STYLE += '<option value="' + v[0] + '">' + v[1] + '</option>'
					})
					TABLE_STYLE + '</select></td></tr></tbody></table></form>';
					setIntroduction(TABLE_STYLE);
				}, 'json');
			}, 'json');
		}
	})

	function setIntroduction(content_str) {
		var that = $.confirm({
			title : '更新信息',
			smoothContent : false,
			closeIcon : true,
			backgroundDismiss : true,
			content : content_str,
			buttons : {
				updateUser : {
					btnClass : 'btn-blue',
					text : '修改',
					action : function() {
						$.post('/jxkyglxt/System/system_modifyUser', $('#user_update').serialize(), function(xhr_data) {
							if (xhr_data.length > 0) {
								toastr.success("修改成功");
								//重新刷新该页面
								$('.right-side').load('page/administrator/adminAccountManagement.jsp #content', function() {
									$.getScript("js/administrator/adminAccountManagement.js");
								});
							} else {
								toastr.error("修改失败,ID已使用");
							}
						}, 'json');
					}
				},
				resetUser : {
					btnClass : 'btn-danger',
					text : '重置密码',
					action : function() {
						$.post('/jxkyglxt/System/system_resetPassword', $('#user_update').serialize(), function(xhr_data) {
							if (xhr_data.length > 0) {
								toastr.success("重置成功，已重置为000000");
							} else {
								toastr.error("修改失败");
							}
						}, 'json');
					}
				},
				deleteUser : {
					btnClass : 'btn-danger',
					text : '删除',
					action : function() {
						$.alert({
							smoothContent : false,
							title : '确认删除？',
							content : false,
							autoClose : 'cancel|10000',
							buttons : {
								Delete : {
									btnClass : 'btn-danger',
									text : '确认',
									action : function() {
										$.post('/jxkyglxt/System/system_deleteUser', $('#user_update').serialize(), function(xhr_data) {
											if (xhr_data == "success") {
												toastr.success("删除成功");
												that.close();
												//重新刷新该页面
												$('.right-side').load('page/administrator/adminAccountManagement.jsp #content', function() {
													$.getScript("js/administrator/adminAccountManagement.js");
												});
											} else {
												toastr.error("删除失败");
											}
										}, 'json');
									},
								},
								cancel : {
									btnClass : 'btn-default',
									text : '取消',
									action : function() {}
								}
							},
						});
						return false;
					}
				},
				cancelAction : {
					btnClass : 'btn-default',
					text : '取消',
				}
			}
		});
	}

	$('.user_add').click(function() {
		$.post('/jxkyglxt/System/system_getAllDepartment', '', function(xhr2) {
			var TABLE_STYLE = '<form id="user_add"><table class="table">'
				+ '<caption>信息添加</caption><tbody>'
				+ '<tr>'
				+ '<th>ID</th>'
				+ '<th>'
				+ '<input name="user.userId" class="form-control" value="" type="text"></th>'
				+ '</tr>'
				+ '<tr>'
				+ '<th>名字</th>'
				+ '<th>'
				+ '<input name="user.userName" class="form-control" value="" type="text"></th>'
				+ '</tr>'
				+ '<tr>'
				+ '<td>部门</td>'
				+ '<td>'
				+ '<select name="user.departmentId" class="form-control">';
			$.each(xhr2, function(i, v) {
				TABLE_STYLE += '<option value="' + v[0] + '">' + v[1] + '</option>'
			})
			TABLE_STYLE + '</select></td></tr></tbody></table></form>';

			$.confirm({
				title : '管理信息',
				smoothContent : false,
				closeIcon : true,
				backgroundDismiss : true,
				content : TABLE_STYLE,
				buttons : {
					deleteUser : {
						btnClass : 'btn-blue',
						text : '添加',
						action : function() {
							$.post('/jxkyglxt/System/system_setAdminUser', this.$content.find('#user_add').serialize(), function(xhr_data) {
								if (xhr_data.length > 0) {
									toastr.success("添加成功");
									//重新刷新该页面
									$('.right-side').load('page/administrator/adminAccountManagement.jsp #content', function() {
										$.getScript("js/administrator/adminAccountManagement.js");
									});
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
		}, 'json');
	});
})