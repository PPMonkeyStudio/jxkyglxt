$(function() {
	var parent_div = null;
	var a_href = null;
	var infoType = null;
	var modal_id = null;

	//信息添加
	var add_info = function() {
		$("#" + modal_id).find('.sure_add').show();
		$("#" + modal_id).find('.addInfo').show();
		$("#" + modal_id).modal({
			keyboard : true
		})
	}
	var getinfoByCardIdb = function() {
		var reg = /^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
		var card_num = $(this).val();
		if (reg.test(card_num) === false) {
			$(this).val("");
			toastr.error("身份证号错误！");
			return;
		} else {
			if (parseInt(card_num.substr(16, 1)) % 2 == 1) {
				$('select[name="teacherInfo.sex"]').find("option[value='男']").attr("selected", "selected");
			//是男则执行代码 ...
			} else {
				$('select[name="teacherInfo.sex"]').find("option[value='女']").attr("selected", "selected");
			//是女则执行代码 ...
			}
			$('input[name="teacherInfo.birthday"]').val(card_num.substring(6, 10) + "-" + card_num.substring(10, 12) + "-" + card_num.substring(12, 14));
		}

	}


	var getinfoByCardIdk = function(event) {
		if (event.keyCode == 13) {
			var reg = /^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
			var card_num = $(this).val();
			if (reg.test(card_num) === false) {
				$(this).val("");
			} else {
				if (parseInt(card_num.substr(16, 1)) % 2 == 1) {
					$('select[name="teacherInfo.sex"]').find("option[value='男']").attr("selected", "selected");
				//是男则执行代码 ...
				} else {
					$('select[name="teacherInfo.sex"]').find("option[value='女']").attr("selected", "selected");
				//是女则执行代码 ...
				}
				$('input[name="teacherInfo.birthday"]').val(card_num.substring(6, 10) + "-" + card_num.substring(10, 12) + "-" + card_num.substring(12, 14));
			}
		}

	}
	//提交审核
	var commit_info = function(e) {
		//数据
		var dat = {
			tableId : "",
			tableName : data.tableName
		};
		//异步链接
		var url = "";
		//用户信息补全
		if ($(e.target).hasClass('commit-info')) {
			dat.tableId = $('input[name="teacherInfo.teacherInfoId"]').val();
			$('#info #info-form #baseinfo').find('input,select').each(function(i, o) {
				dat[$(o).attr('name')] = $(o).val();
			});
			url = '/jxkyglxt/Teacher/teacher_userCompleteBasicInformation';
		} else { //其他信息提交审核
			dat.tableId = $(this).siblings('input').val();
			url = '/jxkyglxt/Teacher/teacher_userPuchInfoToadmin';
		}
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
						$.post(url, dat, function(xhr_data) {
							if (xhr_data.result == "success") {
								toastr.success("提交成功");
								doQuery();
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
		//如果为用户导出则不执行给tr点击事件
		if (a_href == "info") return;
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
			break;
		case '上一页':
			if (!pageDataInformation.HavePrePage) {
				toastr.error("已经在首页了!");
				return;
			}
			data.page = pageDataInformation.pageIndex - 1;
			break;
		case '下一页':
			if (!pageDataInformation.HaveNextPage) {
				toastr.error("已经是最后一页了!");
				return;
			}
			data.page = pageDataInformation.pageIndex + 1;
			break;
		case '尾页':
			if (pageDataInformation.pageIndex == pageDataInformation.totalPages) {
				toastr.error("已经在尾页!");
				return;
			}
			data.page = pageDataInformation.totalPages;
			break;
		default:
			toastr.error('服务器错误');
			break;
		}
		doQuery();
	});

	//确定导出
	var sure_export = function() {
		/**
		 * 用户界面的用户信息导出为单条信息导出（只需一条记录的id），和管理员的批量导出有所不同
		 */
		if (a_href == "info") {
			data.export_id = $('input[name="teacherInfo.teacherInfoId"]').val() + ",";
		} else {
			parent_div.find('#info_table tbody tr').each(function() {
				if (($(this).find(' input[name="check"]').is(':checked')) == true) {
					data.export_id += $(this).find('input[type="hidden"]').val() + ',';
				}
			})
		}
		//通过a标签的链接属性，判断是哪一个导出模态框内的值
		$('#export_' + a_href + ' .group-list button').each(function() {
			if (($(this).children('i').hasClass('fa-check')) && $(this).attr('value') != undefined) {
				data.export_name += $(this).val() + ',';
			}
		})

		if (data.export_id != "" && data.export_name != "") {
			console.log("export_id=" + (data.export_id).substring(0, data.export_id.length - 1) + "&export_name=" + (data.export_name).substring(0, data.export_name.length - 1));
			location.href = "/jxkyglxt/Teacher/teacher_userExportExcelCollection?tableName=" + data.tableName + "&export_id=" + (data.export_id).substring(0, data.export_id.length - 1) + "&export_name=" + (data.export_name).substring(0, data.export_name.length - 1);
		} else {
			toastr.error("未选择数据");
		}
		data.export_id = "";
		data.export_name = "";
		//移除点击事件
		parent_div.find('#info_table tbody tr').unbind();
		//确认导出按钮隐藏,this为当前被点击的元素
		$(this).hide();
		//如果为用户导出，则不需要回显为数字
		if (a_href == "info") return;
		//将tr的第一个td返回显示为数字
		parent_div.find('#info_table tbody tr').each(function(i, v) {
			$(this).children('td:first-child').empty().html(i + 1);
		})

	}

	//用户信息修改
	var modiInfo = function() {
		//获取id
		var id = $(this).siblings('input').val();
		//获取当前操作模态框
		var active_modal = $("#" + modal_id);
		//查询单条信息
		$.post("/jxkyglxt/Teacher/teacher_userGetTableInfoByTableId",
			{
				tableId : id,
				tableName : data.tableName
			}, function(xhr) {
				//data.tableName中获取当前的表名称，进行判断对具体哪一个模态框进行操作
				$("#" + modal_id + " form").find("input,select").each(function() {
					var na = $(this).attr("name").split(".")[1];
					if (na == "userId") {
						$(this).val(xhr.user.userId);
					} else if (na == "userName") {
						$(this).val(xhr.user.userName);
					}
					else $(this).val(xhr.object[na]);
				})
				$.each(xhr.attachmentName, function(i, v) {
					$("#" + modal_id + " .addInfo").before(ImgManiFunc.setImgDiv(v));
				})
				//确定修改按钮显示并添加绑定事件
				active_modal.find('.sure_mod').unbind().click(function() {
					var review_data = $("#" + modal_id + " form").serialize() + "&tableName=" + data.tableName;
					$.post("/jxkyglxt/Teacher/teacher_userSetTableInfo", review_data, function(sxh_data) {
						if (sxh_data.result == "success") {
							toastr.success("修改成功!");
							$("#" + modal_id).modal('hide');
							doQuery();
						}
					}, "json")
				}).show();
				active_modal.find('.addInfo').hide();
				active_modal.modal({
					keyboard : true
				})
			}, "json");

	}
	//查看信息(不包含用户信息)  
	var viewInfo = function() {
		//获取id
		var id = $(this).siblings('input').val();
		//查询单条信息
		$.post("/jxkyglxt/Teacher/teacher_userGetTableInfoByTableId",
			{
				tableId : id,
				tableName : data.tableName
			}, function(xhr) {
				//data.tableName中获取当前的表名称，进行判断对具体哪一个模态框进行操作
				$("#" + modal_id + " .modal-body").find("input,select").each(function() {
					var na = $(this).attr("name").split(".")[1];
					if (na == "userId") {
						$(this).val(xhr.user.userId);
					} else if (na == "userName") {
						$(this).val(xhr.user.userName);
					}
					else $(this).val(xhr.object[na]);
				})
				$("#" + modal_id).find('.addInfo').hide();
				//显示出模态框
				$("#" + modal_id).modal({
					keyboard : true
				})
			}, "json");
	}



	$('.nav-tabs li a').click(function() {
		//如果已经是点击状态，则点击不作为
		if ($(this).parent('li').attr('class') == 'active') return;
		//重置页码
		data.page = 1;
		//将所有的确认导出按钮隐藏
		$('.sure_export').hide();
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
		//infoType，除去Teacher前部分
		infoType = data.tableName.replace("Teacher", "");
		//modal_id，最终获取到的模态框id
		modal_id = infoType.substring(0, 1).toLowerCase() + infoType.substring(1) + "_modal";
		//执行查询操作
		doQuery();
		//导出模态框初始化
		m_check.init({
			id : '#export_' + a_href + ' .tab_content'
		});
	});
	//添加按钮点击事件
	$('.add-btn').click(add_info);
	//确认添加按钮点击事件
	$('.sure_add').click(function() {
		var review_data = $("#" + modal_id + " form").serialize() + "&tableName=" + data.tableName;
		$.post("/jxkyglxt/Teacher/teacher_userSetTableInfo", review_data, function(sxh_data) {
			if (sxh_data.result == "success") {
				//如果包含附件
				if ($("#" + modal_id + " .img-default").length > 0) {
					var formData = new FormData()
					$("#" + modal_id + " .img-default").each(function(i, o) {
						formData.append("_file", convertBase64UrlToBlob($(this).find('.img-show').attr('src')));
					})
					formData.append("tableName", data.tableName);
					formData.append("tableId", sxh_data.id);
					//附件上传
					if (AttachmentUpload("/jxkyglxt/Teacher/teacher_userAttachmentUpload", formData)) {
						toastr.success("上传成功!");
						$("#" + modal_id).modal('hide');
						doQuery();
					}
				}
				toastr.success("添加成功！");
			}
		}, "json")
	});
	$('.card_num').blur(getinfoByCardIdb);
	$('.card_num').keyup(getinfoByCardIdk);
	//导出按钮点击事件
	$('.export_button').click(export_info);
	//确认导出按钮点击事件
	$('.sure_export').click(sure_export);
	//所有通过名字来获取ID的input绑定事件
	$('input[name$="UserNames"]').keyup(function() {
		if ($(this).val() == "") {
			return;
		}
		var Waiting = $(this).attr('name').replace("UserNames", "UserIds");
		$.post('/jxkyglxt/Teacher/teacher_getUserIdOrderingByUserName', {
			"user.userName" : $(this).val()
		}, function(xhr) {
			$('input[name="' + Waiting + '"]').val(xhr.result);
		}, 'json')

	})
	//指定查询
	$('.search_info').click(function() {
		var this_object = $(this);
		if (this_object.text().trim() == "确认搜索") {
			var name = '';
			this_object.siblings('#search_input').find('div').each(function() {
				name = data.tableName.replace("Teacher", "teacher") + '.' + $(this).attr('id');
				var val_arr = [];
				$(this).find('input').each(function() {
					val_arr.push($(this).val());
				});
				//将搜索的内容放入js的数据中
				info_data[data.tableName][name] = val_arr.join(",");
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
							$.each(info_data[data.tableName], function(k, v) {
								info_data[data.tableName][k] = "";
							})
							//选择框初始化
							parent_div.find('.all_options').val('').children().each(function() {
								if ($(this).hasClass('true')) {
									$(this).removeClass('true');
									return;
								}
							});
							//做查询
							doQuery();
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

	//查询方法
	function doQuery() {
		$.ajax({
			url : "/jxkyglxt/Teacher/teacher_userGetTableInfoInPaging",
			type : "post",
			async : false,
			timeout : 3000,
			data : info_data.getQueryInfo(),
			dataType : "json",
			success : function(xhr_data) {
				console.log(parent_div);
				console.log(parent_div.find('#info_table tbody'));
				parent_div.find('#info_table tbody').html(getStr(xhr_data.ObjDatas));

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
		switch (a_href) {
		case 'info':
			var dataStatus = xhr[0].dataStatus;
			parent_div.find('#info_table select,input').each(function() {
				var na = $(this).attr("name").split(".")[1];
				$(this).val(xhr[0][na]);
				if (dataStatus == "40" || dataStatus == "20" || dataStatus == "30") {
					$(this).attr("disabled", "disabled");
				}
			});
			if (dataStatus == "10") {
				parent_div.find('.commmit-btn').unbind().show();
			} else if (dataStatus == "20" || dataStatus == "30") {
				parent_div.find('.commmit-btn').html("信息审核中...").attr("disabled", "true").show();
			} else if (dataStatus == "40") {
				$(this).attr("disabled", "disabled")
			}
			//设置用户名
			$('input[name="username"]').val($('.userName_info').text());
			return; //结束执行
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
				str += "<td>" + xhr[i].approvedDate + "</td>";
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
				str += "<td>" + xhr[i].projectType + "</td>";
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

	/**
	 * 将以base64的图片url数据转换为Blob
	 * @param urlData 用url方式表示的base64图片数据
	 */
	function convertBase64UrlToBlob(urlData) {
		var bytes = window.atob(urlData.split(',')[1]); //去掉url的头，并转换为byte
		//处理异常,将ascii码小于0的转换为大于0
		var ab = new ArrayBuffer(bytes.length);
		var ia = new Uint8Array(ab);
		for (var i = 0; i < bytes.length; i++) {
			ia[i] = bytes.charCodeAt(i);
		}
		return new Blob([ ab ], {
			type : 'image/png'
		});
	}

	//加载后默认点击用户
	$('a[href="#info"]').click();
})