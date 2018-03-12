//js默认执行
$(function() {
	//全局变量
	var parent_div = null;
	var a_href = null;
	//方法声明------------------------------start
	//方法加载，让方法开始加载，以便调用
	//修改信息
	var modiInfo = function() {
		//获取id、
		var id = $(this).siblings('input').val();
		//查询单条用户的信息
		$.post("/jxkyglxt/Admin/admin_getTeacherTableInfoById",
			{
				tableId : id,
				tableName : data.tableName
			}, function(xhr) {
				//modal_id_1，除去Teacher前部分，方便后部分操作
				var modal_id_1 = data.tableName.replace("Teacher", "");
				//modal_id，最终获取到的模态框id
				var modal_id = modal_id_1.substring(0, 1).toLowerCase() + modal_id_1.substring(1) + "_modal";
				$('#' + modal_id + ' form').find("input,select").each(function() {
					var na = $(this).attr('name').split(".")[1];
					if (na == "userId") {
						$(this).val(xhr.user.userId);
					} else if ($(this).attr('name') == "userName") {
						$(this).val(xhr.user.userName);
					}
					else $(this).val(xhr.object[na]);
				})
				//等全部信息加载完毕，再将模态框显示出来，避免模态框出现但是对应的值还未加载情况
				//如果为用户信息，则只显示基础部分（当前为用户审核页面）
				if (a_href == "info") {
					$("#" + modal_id).find('.other').show();
					$("#" + modal_id).find('.basic').hide();
				}
				//显示出模态框
				$("#" + modal_id).modal({
					keyboard : true
				});
				$("#" + modal_id).find('.sure_mod').unbind().click(function() {
					var review_data = $("#" + modal_id + " form").serialize() + "&tableName=" + data.tableName;
					$.post("/jxkyglxt/Admin/admin_modifiedInfomation", review_data, function(sxh_data) {
						if (sxh_data.result == "success") {
							toastr.success("修改成功!");
							$("#" + modal_id).modal('hide');
							doQuery();
						}
					}, "json")
				}).show();
			}, "json");
	}
	//固化信息
	var solidInfo = function() {
		var infoid = $(this).siblings('input').val();
		$(this).parent().empty().append('<img title="已固化"  src="img/ok1.png" />');
		$.post('/jxkyglxt/Admin/admin_LiftCuring', {
			tableId : infoid,
			tableName : data.tableName,
			dataState : "40"
		}, function(xhr) {
			if (xhr.result == "success") {
				toastr.success("信息固化成功!");
			} else {
				toastr.error("信息固化失败");
			}
		}, 'json')
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
		//清空模糊查询内容
		data.fuzzy_query = '';
		//除去链接属性中的#号
		a_href = $(this).attr("href").substr(1);
		//获取panel-body内和所点击的类别相对应的div父元素
		parent_div = $('#' + a_href);
		//通过点击的a标签的链接属性，来给全局对象data.tableName赋值
		data.tableName = "Teacher" + a_href.substring(0, 1).toUpperCase() + a_href.substring(1);
		//条件筛选清空
		parent_div.find("#search_input").empty();
		//执行查询操作
		doQuery();
		/*//导出模态框初始化
		m_check.init({
			id : '#export_' + a_href + '  .tab_content'
		});*/
	});

	//指定查询
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
	//一次事件的元素绑定事件区----end

	//方法声明----start
	//查询方法
	function doQuery() {
		$.ajax({
			url : "/jxkyglxt/Admin/admin_getSpecifiedInformationByPaging",
			type : "post",
			async : false,
			timeout : 3000,
			data : data,
			dataType : "json",
			success : function(xhr_data) {
				$('#' + a_href).find('table tbody').html(getStr(xhr_data.ObjDatas));
				//每次做查询之后，按钮需要重新绑定事件
				$('.solidButton').click(solidInfo);
				$('.modiButton').click(modiInfo);

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
					+ '<button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button>'
					+ '<button class="btn btn-default btn-xs solidButton" title="固化"><i class="fa fa-chain fa-lg" ></i></button>'
					+ '</td></tr>';
				str += "</tr>";
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
					+ '<button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button>'
					+ '<button class="btn btn-default btn-xs solidButton" title="固化"><i class="fa fa-chain fa-lg" ></i></button>'
					+ '</td></tr>';
				str += "</tr>";
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
					+ '<button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button>'
					+ '<button class="btn btn-default btn-xs solidButton" title="固化"><i class="fa fa-chain fa-lg" ></i></button>'
					+ '</td></tr>';
				str += "</tr>";
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
					+ '<button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button>'
					+ '<button class="btn btn-default btn-xs solidButton" title="固化"><i class="fa fa-chain fa-lg" ></i></button>'
					+ '</td></tr>';
				str += "</tr>";
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
					+ '<button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button>'
					+ '<button class="btn btn-default btn-xs solidButton" title="固化"><i class="fa fa-chain fa-lg" ></i></button>'
					+ '</td></tr>';
				str += "</tr>";
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
					+ '<button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button>'
					+ '<button class="btn btn-default btn-xs solidButton" title="固化"><i class="fa fa-chain fa-lg" ></i></button>'
					+ '</td></tr>';
				str += "</tr>";
			}
			break;
		default:
			toastr.warning('服务器错误!');
			break;
		}
		return str;
	}
	//方法声明----end
	//加载后默认点击用户
	$('a[href="#info"]').click();
})