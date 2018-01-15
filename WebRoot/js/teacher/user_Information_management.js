$(function() {
	var parent_div = null;
	var a_href = null;

	//信息添加
	var add_info = function() {
		//modal_id_1，除去Teacher前部分，方便后部分操作
		var modal_id_1 = data.tableName.replace("Teacher", "");
		//modal_id，最终获取到的模态框id
		var modal_id = modal_id_1.substring(0, 1).toLowerCase() + modal_id_1.substring(1) + "_modal";
		$("#" + modal_id).modal({
			keyboard : true
		})
		//附件上传
		/*imgUpload();
		 * 由Id写入姓名
		getIdByName();*/
		$("#" + modal_id).find('.sure_add').click(function() {
			var review_data = $("#" + modal_id + " form").serialize() + "&tableName=" + data.tableName;
			$.post("/teacherms/Teacher/teacher_userSetTableInfo", review_data, function(sxh_data) {
				if (sxh_data.result == "success") {
					toastr.success("添加成功!");
					$("#" + modal_id).modal('hide');
					doQuery();
				}
			}, "json")
		}).show();
	}
	//提交审核
	var commit_info = function() {
		var id = $(this).siblings('input').val();
		$.confirm({
			title : '确认提交？',
			smoothContent : false,
			content : false,
			autoClose : 'cancelAction|10000',
			buttons : {
				deleteUser : {
					btnClass : 'btn-danger',
					text : '确认',
					action : function() {
						$.post('/teacherms/Teacher/teacher_userPuchInfoToadmin', {
							tableId : id,
							tableName : data.tableName
						}, function(xhr_data) {
							if (xhr_data.result == "success") {
								toastr.success("提交成功");
								user_selectAllAward();
							} else {
								toastr.error("提交失败");
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
	var export_info = function() {
		//显示确认导出按钮
		parent_div.find('.sure_export').show();
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
			location.href = "/teacherms/Teacher/teacher_userExportExcelCollection?tableName=TeacherInfo&export_id=" + (data.export_id).substring(0, data.export_id.length - 1) + "&export_name=" + (data.export_name).substring(0, data.export_name.length - 1);
		} else {
			toastr.error("未选择数据");
		}
		data.export_id = "";
		data.export_name = "";
		//移除点击事件
		parent_div.find('#info_table tbody tr').unbind();
		//确认导出按钮隐藏,this为当前被点击的元素
		$(this).hide();
		//将tr的第一个td返回显示为数字
		parent_div.find('#info_table tbody tr').each(function(i, v) {
			$(this).children('td:first-child').empty().html(i + 1);
		})

	}

	//用户信息修改
	var modiInfo = function() {
		//获取id
		var id = $(this).siblings('input').val();
		//查询单条信息
		$.post("/teacherms/Teacher/teacher_userSetTableInfo",
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
					/*
											var na = $(this).attr("name").split(".")[1];
											if (na == "userId") {
												$(this).val(xhr.user.userId);
											} else if (na == "userName") {
												$(this).val(xhr.user.userName);
											}
											else $(this).val(xhr.object[na]);
										*/
				})


				$("#" + modal_id).modal({
					keyboard : true
				})
			}, "json");

	}
	//查看信息(不包含用户信息)  
	var viewInfo = function() {
		//获取id
		var id = $(this).siblings('input').val();
		//查询单条信息
		$.post("/teacherms/Teacher/teacher_userGetTableInfoByTableId",
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


	$('.nav-tabs li a').click(function() {
		//如果已经是点击状态，则点击不作为
		if ($(this).parent('li').attr('class') == 'active') return;
		//除去链接属性中的#号
		a_href = $(this).attr("href").substr(1);
		//获取panel-body内和所点击的类别相对应的div父元素
		parent_div = $('#' + a_href);
		//通过点击的a标签的链接属性，来给全局对象data.tableName赋值
		data.tableName = "Teacher" + a_href.substring(0, 1).toUpperCase() + a_href.substring(1);
		//执行查询操作
		doQuery();
		//导出模态框初始化
		m_check.init({
			id : '#export_' + a_href + ' #check'
		});
	});
	//添加按钮点击事件
	$('.add-btn').click(add_info);
	//确认添加按钮点击事件
	$('.sure_add').click(sure_add);
	//导出按钮点击事件
	$('.export_button').click(export_info);
	//确认导出按钮点击事件
	$('.sure_export').click(sure_export);
	//指定查询(search_info---指定查询。为全局方法)
	$('.search_info').click(search_info);
	//模糊查询
	$('.fuzzy_query').click(function() {
		data.fuzzy_query = $(this).parent().prev().val();
		doQuery();
	});

	//查询方法
	function doQuery() {
		$.ajax({
			url : "/teacherms/Teacher/teacher_userGetTableInfoInPaging",
			type : "post",
			async : false,
			timeout : 3000,
			data : data,
			dataType : "json",
			success : function(xhr_data) {
				$('#' + a_href).find('table tbody').html(getStr(xhr_data.ObjDatas));
				$('.viewButton').click(viewInfo);
				$('.modiButton').click(modiInfo);
				//提交审核点击事件
				$('.commmit-btn').click(commit_info);
			},
			error : function() {
				toastr.error('服务器错误!');
			}
		});
	}

	//通过a标签的href属性，获取查询到的组合成的字符串结果
	function getStr(xhr) {
		var str = "";
		console.log(a_href)
		switch (a_href) {
		case 'info':
			parent_div.find('#info_table select,input').each(function() {
				var na = $(this).attr("name").split(".")[1];
				$(this).val(xhr[0][na]);
			});
			$('input[name="teacherInfo.userName"]').val();
			return;
			break;
		case 'award':
			for (i = 0; i < xhr.length; i++) {
				var dataStatus = xhr[i].dataStatus;
				str += "<tr>";
				str += "<td>" + (i + 1) + "</td>";
				str += "<td>" + xhr[i].awardName + "</td>";
				str += "<td>" + xhr[i].awardUserNames + "</td>";
				str += "<td>" + xhr[i].awardLevel + "</td>";
				str += "<td>" + xhr[i].awardDate + "</td>";
				str += "<td>" + xhr[i].grantUnit + "</td>";
				if (dataStatus == "10") {
					str += '<td><input type="hidden" value="' + xhr[i].awardId + '" ><button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button><button class="btn btn-default btn-xs commmit-btn" title="提交审核"><i class="fa fa-sign-out fa-lg"  aria-hidden="true"></i></button></td>';
				}
				if (dataStatus == "20" || dataStatus == "30" || dataStatus == "40") {
					str += '<td><input type="hidden" value="' + xhr[i].awardId + '" ><button class="btn btn-default btn-xs viewButton" title="查看"><i class="fa fa-eye fa-lg"  aria-hidden="true"></i></button></td>';
				}
				str += "</tr>";
			}
			break;
		case 'works':
			for (i = 0; i < xhr.length; i++) {
				var dataStatus = xhr[i].dataStatus;
				str += "<tr>";
				str += "<td>" + (i + 1) + "</td>";
				str += "<td>" + xhr[i].worksName + "</td>";
				str += "<td>" + xhr[i].editorUserNames + "</td>";
				str += "<td>" + xhr[i].isbn + "</td>";
				str += "<td>" + xhr[i].publishTime + "</td>";
				str += "<td>" + xhr[i].press + "</td>";
				if (dataStatus == "10") {
					str += '<td><input type="hidden" value="' + xhr[i].worksId + '" ><button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button><button class="btn btn-default btn-xs commmit-btn" title="提交审核"><i class="fa fa-sign-out fa-lg"  aria-hidden="true"></i></button></td>';
				}
				if (dataStatus == "20" || dataStatus == "30" || dataStatus == "40") {
					str += '<td><input type="hidden" value="' + xhr[i].worksId + '" ><button class="btn btn-default btn-xs viewButton" title="查看"><i class="fa fa-eye fa-lg"  aria-hidden="true"></i></button></td>';
				}
				str += "</tr>";
			}
			break;
		case 'paper':
			for (i = 0; i < xhr.length; i++) {
				var dataStatus = xhr[i].dataStatus;
				str += "<tr>";
				str += "<td>" + (i + 1) + "</td>";
				str += "<td>" + xhr[i].paperName + "</td>";
				str += "<td>" + xhr[i].authorUserNames + "</td>";
				str += "<td>" + xhr[i].periodical + "</td>";
				str += "<td>" + xhr[i].periodicalNo + "</td>";
				str += "<td>" + xhr[i].publishTime + "</td>";
				if (dataStatus == "10") {
					str += '<td><input type="hidden" value="' + xhr[i].paperId + '" ><button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button><button class="btn btn-default btn-xs commmit-btn" title="提交审核"><i class="fa fa-sign-out fa-lg"  aria-hidden="true"></i></button></td>';
				}
				if (dataStatus == "20" || dataStatus == "30" || dataStatus == "40") {
					str += '<td><input type="hidden" value="' + xhr[i].paperId + '" ><button class="btn btn-default btn-xs viewButton" title="查看"><i class="fa fa-eye fa-lg"  aria-hidden="true"></i></button></td>';
				}
				str += "</tr>";
			}
			break;
		case 'patent':
			for (i = 0; i < xhr.length; i++) {
				var dataStatus = xhr[i].dataStatus;
				str += "<tr>";
				str += "<td>" + (i + 1) + "</td>";
				str += "<td>" + xhr[i].patentName + "</td>";
				str += "<td>" + xhr[i].authorUserNames + "</td>";
				str += "<td>" + xhr[i].patentType + "</td>";
				str += "<td>" + xhr[i].authorizationNo + "</td>";
				if (dataStatus == "10") {
					str += '<td><input type="hidden" value="' + xhr[i].patentId + '" ><button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button><button class="btn btn-default btn-xs commmit-btn" title="提交审核"><i class="fa fa-sign-out fa-lg"  aria-hidden="true"></i></button></td>';
				}
				if (dataStatus == "20" || dataStatus == "30" || dataStatus == "40") {
					str += '<td><input type="hidden" value="' + xhr[i].patentId + '" ><button class="btn btn-default btn-xs viewButton" title="查看"><i class="fa fa-eye fa-lg"  aria-hidden="true"></i></button></td>';
				}

				str += "</tr>";
			}
			break;
		case 'project':
			for (i = 0; i < xhr.length; i++) {
				var dataStatus = xhr[i].dataStatus;
				str += "<tr>";
				str += "<td>" + (i + 1) + "</td>";
				str += "<td>" + xhr[i].projectName + "</td>";
				str += "<td>" + xhr[i].projectUserNames + "</td>";
				str += "<td>" + xhr[i].projectSource + "</td>";
				str += "<td>" + xhr[i].projectNo + "</td>";
				if (dataStatus == "10") {
					str += '<td><input type="hidden" value="' + xhr[i].projectId + '" ><button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button><button class="btn btn-default btn-xs commmit-btn" title="提交审核"><i class="fa fa-sign-out fa-lg"  aria-hidden="true"></i></button></td>';
				}
				if (dataStatus == "20" || dataStatus == "30" || dataStatus == "40") {
					str += '<td><input type="hidden" value="' + xhr[i].projectId + '" ><button class="btn btn-default btn-xs viewButton" title="查看"><i class="fa fa-eye fa-lg"  aria-hidden="true"></i></button></td>';
				}

				str += "</tr>";
			}
			break;
		default:
			toastr.warning('服务器错误!');
			break;
		}
		return str;
	}
})
/*$('.nav-tabs li a').unbind().click(function() {
		if ($(this).parent('li').attr('class') == 'active') return;
		var a_href = $(this).attr("href");
		switch (a_href) {
		case '#user':
			$('#user').load('user_pageinfo.jsp  #user_info_table_audit', function() {
				data.tableName = "TeacherInfo";
				userInfo();
			});

			break;
		case '#award':
			$('#award').load('user_pageinfo.jsp #user_award_table_audit', function() {
				data.tableName = "TeacherAward";
				userAward();
			});
			break;
		case '#works':
			$('#works').load('user_pageinfo.jsp #user_works_table_audit', function() {
				data.tableName = "TeacherWorks";
				userWorks();
			});
			break;
		case '#paper':
			$('#paper').load('user_pageinfo.jsp #user_paper_table_audit', function() {
				data.tableName = "TeacherPaper";
				userPaper();
			});
			break;
		case '#patent':
			$('#patent').load('user_pageinfo.jsp #user_patent_table_audit', function() {
				data.tableName = "TeacherPatent";
				userPatent();
			});
			break;
		case '#project':
			$('#project').load('user_pageinfo.jsp #user_project_table_audit', function() {
				data.tableName = "TeacherProject";
				userProject();
			});
			break;
		default:
			break;
		}
	})*/