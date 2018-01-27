//js默认执行
$(function() {
	//全局属性
	var parent_div = null;
	var a_href = null;
	//方法声明------------------------------start
	//方法加载，让方法开始加载，以便调用
	//信息选择导出按钮事件绑定
	var export_info = function() {
		//显示确认导出按钮
		parent_div.find('.sure_export').show();
		parent_div.find('.all_sure_export').show();
		//给每行的tr给与点击事件，通过点击tr来让checkbox选中
		var tr = parent_div.find('#info_table tbody tr');
		tr.each(function() {
			$(this).find("td:first").empty().append('<input name="check" type="checkbox">');
		});
		tr.on("click", function() {
			var check_attr = $(this).find('td input[name="check"]').is(":checked");
			if (check_attr == false) {
				$(this).find('td input[name="check"]').attr("checked", "true");
			} else {
				$(this).find('td input[name="check"]').removeAttr("checked");
			}
		});
	}

	//(用户信息)修改信息
	var modiUserInfo = function() {
		//获取id、
		var id = $(this).siblings('input').val();
		//查询单条用户的信息
		$.post("/teacherms/Admin/admin_getTeacherTableInfoById",
			{
				tableId : id,
				tableName : data.tableName
			}, function(xhr) {
				$("#info_modal .modal-body").find("input,select").each(function() {
					var na = $(this).attr('name').split(".")[1];
					if (na == "userId") {
						$(this).val(xhr.user.userId);
					} else if ($(this).attr('name') == "userName") {
						$(this).val(xhr.user.userName);
					}
					else $(this).val(xhr.object[na]);
				})
				//等全部信息加载完毕，再将模态框显示出来，避免模态框出现但是对应的值还未加载情况
				//如果为用户信息，则只显示基础部分（当前为用户管理页面）
				$('#info_modal .basic').show();
				$('#info_modal .other').hide();
				$('.sure_mod').show();
				//显示出模态框
				$('#info_modal').modal({
					keyboard : true
				});
				$('#info_modal').find('.sure_mod').unbind().click(function() {
					var review_data = $("#info_modal form").serialize() + "&tableName=" + data.tableName;
					$.post("/teacherms/Teacher/teacher_userSetTableInfo", review_data, function(sxh_data) {
						if (sxh_data.result == "success") {
							toastr.success("修改成功!");
							$('#info_modal').modal('hide');
							doQuery();
						}
					}, "json")
				}).show();
			}, "json");
	}

	//查看信息(不包含用户信息)
	var viewInfo = function() {
		//获取id
		var id = $(this).siblings('input').val();
		//查询单条信息
		$.post("/teacherms/Admin/admin_getTeacherTableInfoById",
			{
				tableId : id,
				tableName : data.tableName
			}, function(xhr) {
				//data.tableName中获取当前的表名称，进行判断对具体哪一个模态框进行操作
				//modal_id_1，除去Teacher前部分，方便后部分操作
				var modal_id_1 = data.tableName.replace("Teacher", "");
				//modal_id，最终获取到的模态框id
				var modal_id = modal_id_1.substring(0, 1).toLowerCase() + modal_id_1.substring(1) + "_modal";
				$("#" + modal_id + " .modal-body").find("input,select").each(function() {
					var na = $(this).attr("name").split(".")[1];
					if (na == "userId") {
						$(this).val(xhr.user.userId);
					} else if (na == "userName") {
						$(this).val(xhr.user.userName);
					}
					else $(this).val(xhr.object[na]);
				})
				$("#" + modal_id + " .review-info").hide();
				//显示出模态框
				$("#" + modal_id).modal({
					keyboard : true
				})
			}, "json");
	}

	//解除固化
	var relieveInfo = function() {
		var infoid = $(this).siblings('input').val();
		$(this).parent().empty().append('<img title="已解除固化"  src="img/ok1.png" />');
		$.post('/teacherms/Admin/admin_LiftCuring', {
			tableId : infoid,
			tableName : data.tableName,
			dataState : "10"
		}, function(xhr) {
			if (xhr.result == "success") {
				toastr.success("信息解除固化成功!");
			} else {
				toastr.error("信息解除固化失败");
			}
		}, 'json')
	}

	//确定导出
	var sure_export = function() {
		parent_div.find('#info_table tbody tr').each(function() {
			if (($(this).find(' input[name="check"]').is(':checked')) == true) {
				data.export_id += $(this).find('input[type="hidden"]').val() + ',';
			}
		})
		//通过a标签的链接属性，判断是哪一个导出模态框内的值
		$('#export_' + a_href + ' .group-list button').each(function() {
			if (($(this).children('i').hasClass('fa-check')) && $(this).attr('value') != undefined) {
				data.export_name += $(this).val() + ',';
			}
		})
		if (data.export_id != "" && data.export_name != "") {
			//console.log("export_id=" + (data.export_id).substring(0, data.export_id.length - 1) + "&export_name=" + (data.export_name).substring(0, data.export_name.length - 1));
			window.open("/teacherms/Admin/admin_ExportExcelCollection?tableName=" + data.tableName + "&export_id=" + (data.export_id).substring(0, data.export_id.length - 1) + "&export_name=" + (data.export_name).substring(0, data.export_name.length - 1));
		//location.href = "/teacherms/Admin/admin_ExportExcelCollection?tableName=" + data.tableName + "&export_id=" + (data.export_id).substring(0, data.export_id.length - 1) + "&export_name=" + (data.export_name).substring(0, data.export_name.length - 1);
		} else {
			toastr.error("未选择数据");
			return;
		}
		data.export_id = "";
		data.export_name = "";
		//移除点击事件
		parent_div.find('#info_table tbody tr').unbind();
		//确认导出按钮隐藏,this为当前被点击的元素
		parent_div.find('.sure_export').hide();
		parent_div.find('.all_sure_export').hide();
		//将tr的第一个td返回显示为数字
		parent_div.find('#info_table tbody tr').each(function(i, v) {
			$(this).children('td:first-child').empty().html(i + 1);
		})
	}

	//导出全部
	var all_sure_export = function() {
		//通过a标签的链接属性，判断是哪一个导出模态框内的值
		$('#export_' + a_href + ' .group-list button').each(function() {
			if (($(this).children('i').hasClass('fa-check')) && $(this).attr('value') != undefined) {
				data.export_name += $(this).val() + ',';
			}
		})
		if (data.export_name != "") {
			window.open("/teacherms/Admin/admin_ExportExcelCollection?tableName=" + data.tableName + "&export_name=" + (data.export_name).substring(0, data.export_name.length - 1));
		//location.href = "/teacherms/Admin/admin_ExportExcelCollection?tableName=" + data.tableName + "&export_id=" + (data.export_id).substring(0, data.export_id.length - 1) + "&export_name=" + (data.export_name).substring(0, data.export_name.length - 1);
		} else {
			toastr.error("未选择数据");
			return;
		}
		data.export_id = "";
		data.export_name = "";
		//移除点击事件
		parent_div.find('#info_table tbody tr').unbind();
		//确认导出按钮隐藏,this为当前被点击的元素
		parent_div.find('.sure_export').hide();
		parent_div.find('.all_sure_export').hide();
		//将tr的第一个td返回显示为数字
		parent_div.find('#info_table tbody tr').each(function(i, v) {
			$(this).children('td:first-child').empty().html(i + 1);
		})
	}

	var user_setting = function() {
		var str = '<form id="user_setting" action="">' +
			'<table style="width:100%;">' +
			'<tbody>' +
			'<tr>' +
			'<td>工号</td>' +
			'<td><input type="text"class="form-control" name="user.userId"/></td>' +
			'</tr>' +
			'<tr>' +
			'<td>名字</td>' +
			'<td><input type="text"class="form-control"name="user.userName"/></td>' +
			'</tr>' +
			'<tr>' +
			'<td>密码</td>' +
			'<td><input type="text"class="form-control"name="user.password"/></td>' +
			'</tr>' +
			'</tbody>' +
			'</table>' +
			'</form>'
		$.confirm({
			title : '帐号信息设置',
			smoothContent : false,
			content : str,
			onContentReady : function() {
				$.post('/teacherms/System/system_getAccountInformation', {}, function(xhr_data) {
					$('#user_setting table input').each(function() {
						//字符串截取
						var name = $(this).attr('name').substr(5);
						if (name != "password") {
							$('input[name="user.' + name + '"]').val(xhr_data[name]);
						}
					});
				}, 'json');
			},
			buttons : {
				deleteUser : {
					btnClass : 'btn-blue',
					text : '修改',
					action : function() {
						$.post('/teacherms/System/system_modifyUserInfo', $('#user_setting').serialize(), function(xhr_data) {
							if (xhr_data.result.length > 1) {
								$('.userName_info').text(xhr_data.result);
								toastr.success("修改成功");
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

	//页面加载开始，给与元素加载事件-----------------------end

	//页面中只需要绑定一次事件的元素绑定事件区----start
	$('.nav-tabs li a').click(function() {
		//如果已经是点击状态，则点击不作为
		if ($(this).parent('li').attr('class') == 'active') return;
		//重置页码
		data.page = 1;
		//将所有的确认导出按钮隐藏
		$('.sure_export').hide();
		//将所有的导出全部按钮隐藏
		$('.all_sure_export').hide();
		//清空模糊查询内容
		data.fuzzy_query = '';
		//除去链接属性中的#号
		a_href = $(this).attr("href").substr(1);
		//获取panel-body内和所点击的类别相对应的div父元素
		parent_div = $('#' + a_href);
		//条件筛选清空
		parent_div.find("#search_input").empty();
		//通过点击的a标签的链接属性，来给全局对象data.tableName赋值
		data.tableName = "Teacher" + a_href.substring(0, 1).toUpperCase() + a_href.substring(1);
		//执行查询操作
		doQuery();
		//导出模态框初始化
		m_check.init({
			id : '#export_' + a_href + ' #check'
		});
	})
	//分页信息
	$('.panel-footer a').click(function() {
		var style = $(this).text();
		switch (style) {
		case '首页':
			if (pageDataInformation.pageIndex == 1) {
				toastr.error("已经是第一页了!");
				return;
			}
			data.page = 1;
			doQuery();
			break;
		case '上一页':
			if (!pageDataInformation.HavePrePage) {
				toastr.error("已经在首页了!");
				return;
			}
			data.page = pageDataInformation.pageIndex - 1;
			doQuery();
			break;
		case '下一页':
			if (!pageDataInformation.HaveNextPage) {
				toastr.error("已经是最后一页了!");
				return;
			}
			data.page = pageDataInformation.pageIndex + 1;
			doQuery();
			break;
		case '尾页':
			if (pageDataInformation.pageIndex == pageDataInformation.totalPages) {
				toastr.error("已经在尾页!");
				return;
			}
			data.page = pageDataInformation.totalPages;
			doQuery();
			break;
		default:
			toastr.error('服务器错误');
			break;
		}
	});

	//导出按钮点击事件
	$('.export_button').click(export_info);
	//确认导出按钮点击事件
	$('.sure_export').click(sure_export);
	//确认导出全部按钮点击事件
	$('.all_sure_export').click(all_sure_export);
	//指定查询()
	$('.search_info').click(function() {
		var this_object = $(this);
		if (this_object.text().trim() == "确认搜索") {
			var name = '';
			var value = '';
			this_object.siblings('#search_input').find('div').each(function() {
				name = data.tableName.replace("Teacher", "teacher") + '.' + $(this).attr('id').replace("Inputu", "");
				var val_arr = [];
				$(this).find('input').each(function() {
					val_arr.push($(this).val());
				});
				//value = $(this).find('input').val();
				//将搜索的内容放入js的数据中
				data[name] = val_arr.join(",");
			});
			doQuery();
		} else if (this_object.text().trim() == "清空搜索") {
			$.confirm({
				title : '确定清空?',
				smoothContent : false,
				content : false,
				autoClose : 'cancelAction|10000',
				buttons : {
					deleteUser : {
						btnClass : 'btn-danger',
						text : '确定',
						action : function() {
							this_object.siblings('#search_input').empty();
							$.each(data, function(k, v) {
								if (k.indexOf('teacher') > -1) {
									data[k] = "";
								}
							})
						}
					},
					cancelAction : {
						btnClass : 'btn-blue',
						text : '取消',
					}
				}
			});
		}
	});
	//模糊查询
	$('.fuzzy_query').click(function() {
		data.fuzzy_query = $(this).parent().prev().val();
		doQuery();
	});
	//用户信息添加(用户添加模态框是唯一的)
	$('.sure_add_info').click(function() {
		var review_data = $("#add_info_modal form").serialize() + "&tableName=" + data.tableName;
		$.post("/teacherms/Admin/admin_addTeacherInfo", review_data, function(sxh_data) {
			if (sxh_data.result == "success") {
				toastr.success('添加成功!')
			} else {
				toastr.error('添加失败!');
			}
		}, "json")
	});
	//一次事件的元素绑定事件区----end


	//方法声明----start
	//查询方法
	function doQuery() {
		$.ajax({
			url : "/teacherms/Admin/admin_getSpecifiedInformationByPaging",
			type : "post",
			async : false,
			timeout : 3000,
			data : data,
			dataType : "json",
			success : function(xhr_data) {
				$('#' + a_href).find('table tbody').html(getStr(xhr_data.ObjDatas));
				//每次做查询之后，按钮需要重新绑定事件
				$('.relieveButton').click(relieveInfo);
				$('.modiButton').click(modiUserInfo);
				$('.viewButton').click(viewInfo);
				//----end
				//记录分页信息
				setPageInfo(xhr_data);
			},
			error : function() {
				toastr.error('服务器错误!');
			}
		});
	}

	//通过a标签的href属性，获取查询到的组合成的字符串结果
	function getStr(xhr) {
		var str = "";
		switch (a_href) {
		case 'info':
			for (i = 0; i < xhr.length; i++) {
				str += "<tr>";
				str += "<td>" + (i + 1) + "</td>";
				str += "<td>" + xhr[i][0].userId + "</td>";
				str += "<td>" + xhr[i][1].userName + "</td>";
				str += "<td>" + xhr[i][0].professionalGrade + "</td>";
				str += "<td>" + xhr[i][0].employeeType + "</td>";
				str += "<td>" + xhr[i][0].teachingType + "</td>";
				str += "<td>" + xhr[i][0].teachingStatus + "</td>";
				str += '<td><input type="hidden" value="' + xhr[i][0].teacherInfoId + '" >'
					+ '<button class="btn btn-default btn-xs  relieveButton" title="解除固化"><i class="fa fa-chain-broken fa-lg"></i></button>'
					+ '<button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg" ></i></button>'
					+ '</td></tr>';
			}
			break;
		case 'award':
			for (i = 0; i < xhr.length; i++) {
				str += "<tr>";
				str += "<td>" + (i + 1) + "</td>";
				str += "<td>" + xhr[i][0].awardName + "</td>";
				str += "<td>" + xhr[i][0].awardUserNames + "</td>";
				str += "<td>" + xhr[i][0].awardLevel + "</td>";
				str += "<td>" + xhr[i][0].awardDate + "</td>";
				str += "<td>" + xhr[i][0].grantUnit + "</td>";
				str += '<td><input type="hidden" value="' + xhr[i][0].awardId + '" >'
					+ '<button class="btn btn-default btn-xs relieveButton" title="解除固化"><i class="fa fa-chain-broken fa-lg"></i></button>'
					+ '<button class="btn btn-default btn-xs viewButton" title="查看"><i class="fa fa-search-plus fa-lg"  aria-hidden="true"></i></button>'
					+ '</td></tr>';
			}
			break;
		case 'works':
			for (i = 0; i < xhr.length; i++) {
				str += "<tr>";
				str += "<td>" + (i + 1) + "</td>";
				str += "<td>" + xhr[i][0].worksName + "</td>";
				str += "<td>" + xhr[i][0].editorUserNames + "</td>";
				str += "<td>" + xhr[i][0].isbn + "</td>";
				str += "<td>" + xhr[i][0].publishTime + "</td>";
				str += "<td>" + xhr[i][0].press + "</td>";
				str += '<td><input type="hidden" value="' + xhr[i][0].worksId + '" >'
					+ '<button class="btn btn-default btn-xs relieveButton" title="解除固化"><i class="fa fa-chain-broken fa-lg"></i></button>'
					+ '<button class="btn btn-default btn-xs viewButton" title="查看"><i class="fa fa-search-plus fa-lg"  aria-hidden="true"></i></button>'
					+ '</td></tr>';
			}
			break;
		case 'paper':
			for (i = 0; i < xhr.length; i++) {
				str += "<tr>";
				str += "<td>" + (i + 1) + "</td>";
				str += "<td>" + xhr[i][0].paperName + "</td>";
				str += "<td>" + xhr[i][0].authorUserNames + "</td>";
				str += "<td>" + xhr[i][0].periodical + "</td>";
				str += "<td>" + xhr[i][0].periodicalNo + "</td>";
				str += "<td>" + xhr[i][0].publishTime + "</td>";
				str += '<td><input type="hidden" value="' + xhr[i][0].paperId + '" >'
					+ '<button class="btn btn-default btn-xs relieveButton" title="解除固化"><i class="fa fa-chain-broken fa-lg"></i></button>'
					+ '<button class="btn btn-default btn-xs viewButton" title="查看"><i class="fa fa-search-plus fa-lg"  aria-hidden="true"></i></button>'
					+ '</td></tr>';
			}
			break;
		case 'patent':
			for (i = 0; i < xhr.length; i++) {
				str += "<tr>";
				str += "<td>" + (i + 1) + "</td>";
				str += "<td>" + xhr[i][0].patentName + "</td>";
				str += "<td>" + xhr[i][0].authorUserNames + "</td>";
				str += "<td>" + xhr[i][0].patentType + "</td>";
				str += "<td>" + xhr[i][0].authorizationNo + "</td>";
				str += "<td>" + xhr[i][0].approvedDate + "</td>";
				str += '<td><input type="hidden" value="' + xhr[i][0].patentId + '" >'
					+ '<button class="btn btn-default btn-xs relieveButton" title="解除固化"><i class="fa fa-chain-broken fa-lg"></i></button>'
					+ '<button class="btn btn-default btn-xs viewButton" title="查看"><i class="fa fa-search-plus fa-lg"  aria-hidden="true"></i></button>'
					+ '</td></tr>';
			}
			break;
		case 'project':
			for (i = 0; i < xhr.length; i++) {
				str += "<tr>";
				str += "<td>" + (i + 1) + "</td>";
				str += "<td>" + xhr[i][0].projectName + "</td>";
				str += "<td>" + xhr[i][0].projectUserNames + "</td>";
				str += "<td>" + xhr[i][0].projectSource + "</td>";
				str += "<td>" + xhr[i][0].projectType + "</td>";
				str += "<td>" + xhr[i][0].projectNo + "</td>";
				str += '<td><input type="hidden" value="' + xhr[i][0].projectId + '" >'
					+ '<button class="btn btn-default btn-xs relieveButton" title="解除固化"><i class="fa fa-chain-broken fa-lg"></i></button>'
					+ '<button class="btn btn-default btn-xs viewButton" title="查看"><i class="fa fa-search-plus fa-lg"  aria-hidden="true"></i></button>'
					+ '</td></tr>';
			}
			break;
		default:
			toastr.warning('服务器错误!');
			break;
		}
		return str;
	}
//方法声明----end
})