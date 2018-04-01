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
		$.post("/jxkyglxt/Student/student_getStudentAllInfo",
			{
				tableName : data.tableName
			}, function(xhr) {
				//modal_id_1，除去学生前部分，方便后部分操作
				var modal_id_1 = data.tableName.replace("Student", "");
				//modal_id，最终获取到的模态框id
				var modal_id = modal_id_1.substring(0, 1).toLowerCase() + modal_id_1.substring(1) + "_modal";
				$('#' + modal_id + ' form').find("input,select").each(function() {
					var na = $(this).attr('name').split(".")[1];
					if (na == "studentId") {
						$(this).val(xhr.ObjDatas[i].object.studentId);
					} else if ($(this).attr('name') == "studentName") {
						$(this).val(xhr.ObjDatas[i].object.studentName);
					}
					else $(this).val(xhr.ObjDatas[i].object[na]);
				})
				//等全部信息加载完毕，再将模态框显示出来，避免模态框出现但是对应的值还未加载情况
				//如果为用户信息，则只显示基础部分（当前是学生管理页面）
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
					$.post("/jxkyglxt/Student/student_updateStudentAllInfo", review_data, function(sxh_data) {
						if (sxh_data.result == "success") {
							toastr.success("修改成功!");
							$("#" + modal_id).modal('hide');
							doQuery();
						}
					}, "json")
				}).show();
			}, "json");
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
		
		console.log("tabs click输出区");
	console.log("1:"+a_href);
	console.log("2:"+a_href.substring(0,1));
	console.log("3:"+a_href.substring(0,1).toUpperCase());
	console.log("4:"+ a_href.substring(0, 1).toUpperCase() + a_href.substring(1));
		data.tableName = "Student" + a_href.substring(0, 1).toUpperCase() + a_href.substring(1);
		console.log("5:"+ data.tableName);
		console.log("6:"+ data);
		//条件筛选清空
		parent_div.find("#search_input").empty();
		//执行查询操作
		doQuery();
		//导出模态框初始化
		m_check.init({
			id : '#export_' + a_href + ' #check'
		});
	});

	//指定查询
	$('.search_info').click(function() {
		var this_object = $(this);
		if (this_object.text().trim() == "确认搜索") {
			var name = '';
			var value = '';
			this_object.siblings('#search_input').find('div').each(function() {
				name = data.tableName.replace("Student", "student") + '.' + $(this).attr('id').replace("Inputu", "");
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
								if (k.indexOf('student') > -1) {
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
	//学生添加
	$('.sure_add_info').click(function() {
		var review_data = $("#add_info_modal form").serialize() + "&tableName=" + data.tableName;
		$.post("/jxkyglxt/Student/student_setStudentAllInfo", review_data, function(sxh_data) {
			if (sxh_data.result == "success") {
				toastr.success('添加成功!')
			} else {
				toastr.error('添加失败!');
			}
		}, "json")
	});
	//模糊查询
	$('.fuzzy_query').click(function() {
		data.fuzzy_query = $(this).parent().prev().val();
		doQuery();
	});
	//一次事件的元素绑定事件区----end

	//方法声明----start
	//查询方法
	function doQuery() {
		$.ajax({
			url : "/jxkyglxt/Student/student_getStudentAllInfo",
			type : "post",
			async : false,
			timeout : 3000,
			data : data,
			dataType : "json",
			success : function(xhr_data) {
				$('#' + a_href).find('table tbody').html(getStr(xhr_data));
				$('ul.pager').html(
						
						function pageAction(){
						console.log("xhr1="+xhr_data);
					var page="";
					var total="1";
					console.log("total:"+total);
					if(xhr_data['totalPages']!=0){
						total=xhr_data['totalPages'];
						console.log("查询结果页码："+xhr_data['totalPages']+"/总页码："+total);
					}else{
					console.log("查询结果为空");}
					if(xhr_data['HavePrePage']==false){
						page += "<li><a style='opacity: 0.3;cursor:default'>首页</a></li><li><a style='opacity: 0.3;cursor:default'>上一页</a></li>";
						
					}else{
						page += "<li><a>首页</a></li><li><a>上一页</a>";
					}
					if(xhr_data['HaveNextPage']){
					total=xhr_data['totalPages'];
					}
					page += "<li><a style='opacity: 0.8;cursor:default'>当前页码："+xhr_data['pageIndex']+" / 总页码："+total+"</a></li>";
					if(xhr_data['HaveNextPage']==false){
						console.log("输出下一页按钮：最后一页！")
						page += "<li><a style='opacity: 0.3;cursor:default'>下一页</a></li><li><a style='opacity: 0.3;cursor:default'>尾页</a></li>";
					}else{
						console.log("下一页！")
						page += "<li><a>下一页</a></li><li><a>尾页</a></li>";	
					}
				return page;
						}
				
				
				);
				//每次做查询之后，按钮需要重新绑定事件
				/*				$('.solidButton').click(solidInfo);
								$('.modiButton').click(modiInfo);*/

			//记录分页信息
			/*				setPageInfo(xhr_data);*/

				$('.panel-footer a').click(function() {
					var style = $(this).text();
					switch (style) {
					case '首页':
						if (!pageDataInformation.pageIndex <= 1) {
							toastr.success("您已经在首页!");
							console.log("第3个通知点");
							return;
						}
						console.log("pageDataInformation.pageIndex："+pageDataInformation.pageIndex);
						data.page = 1;
						doQuery();
						break;
					case '上一页':
						if (!pageDataInformation.HavePrePage) {
							toastr.success("您已经在第一页!");
							console.log("第3个通知点");
							return;
						}
						data.page = pageDataInformation.pageIndex - 1;
						doQuery();
						break;
					case '下一页':
						if (!pageDataInformation.HaveNextPage) {
							toastr.success("您已经在最后一页！")
							console.log("第3个通知点");
							return;
						}
						data.page = pageDataInformation.pageIndex + 1;
						doQuery();
						break;
					case '尾页':
						if (pageDataInformation.pageIndex == pageDataInformation.totalPages) {
							toastr.success("您已经在尾页!");
							console.log("第3个通知点");
							return;
						}
						data.page = pageDataInformation.totalPages;
						doQuery();
						break;
					}
				});
			},
			error : function() {
				toastr.error('服务器错误!');
			}
		});
	}

	//通过a标签的href属性，获取查询到的组合成的字符串结果

/*xhr挑总记录数	*/
	function getStr(xhr) {
		var str = "";
		switch (a_href) {
		case 'info':

			console.log("xhr:"+xhr);
			console.log("xhr['pageIndex']:"+xhr['pageIndex']);
			console.log("1.xhr.ObjDatas[0]:"+xhr.ObjDatas[0]);
			console.log("2.xhr.ObjDatas.length:"+xhr.ObjDatas.length);
			console.log("3.xhr.ObjDatas[0].object:"+xhr.ObjDatas[0].object);
			console.log("4.xhr.ObjDatas[0].object.length:"+xhr.ObjDatas[0].object.length);
			console.log("5.xhr.ObjDatas[0]['object'].length:"+xhr.ObjDatas[0]['object'].length);
			console.log("6.xhr.ObjDatas[0].object.studentId:"+xhr.ObjDatas[0].object.studentId);
			console.log("7.xhr.ObjDatas[1].object.studentId:"+xhr.ObjDatas[1].object.studentId);
			console.log("8.xhr.ObjDatas[1].object.studentId.length:"+xhr.ObjDatas[1].object.studentId.length);
			
	/*	0.xhr['pageIndex']:1	
	 * 1.xhr.ObjDatas[0]:[object Object]
			main_index.jsp:210:4
			2.xhr.ObjDatas.length:2
			main_index.jsp:211:4
			3.xhr.ObjDatas[0].object:[object Object]
			main_index.jsp:212:4
			4.xhr.ObjDatas[0].object.length:undefined
			main_index.jsp:213:4
			5.xhr.ObjDatas[0]['object'].length:undefined
			main_index.jsp:214:4
			6.xhr.ObjDatas[0].object.studentId:1
			main_index.jsp:215:4
			7.xhr.ObjDatas[1].object.studentId:info2
			main_index.jsp:216:4
			8.xhr.ObjDatas[1].object.studentId.length:5
			*/
			
/*			var json = "{'x':1,'y':2}";
			var a=eval('('+json+')');
			alert(a);//[Object Object]
			alert(a.x);//1
			alert(a.y);//2
			
			alert(a['x'])//1
			alert(a['y'])//2
*/

			for (i = 0; i < xhr.ObjDatas.length; i++) {
				str += "<tr>";
				str += "<td>" + (i + 1) + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.studentId + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.studentName + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.sex + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.enrolmentYear + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.certificateNo + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.departmentId + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.alterTime + "</td>";
				str += '<td><input type="hidden" value="' + xhr.ObjDatas[i].studentId + '" >'
					+ '<button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button>'
					+ '<button class="btn btn-default btn-xs solidButton" title="固化"><i class="fa fa-chain fa-lg" ></i></button>'
					+ '</td></tr>';
				str += "</tr>";
			}
			
			console.log("xhr为：" + xhr);
			console.log("str为：" + str);
			break;

		case 'award':
			console.log("award的xhr："+xhr.ObjDatas.length);
			for (i = 0; i < xhr.ObjDatas.length; i++) {
				str += "<tr>";
				str += "<td>" + (i + 1) + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.studentId + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.awardId + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.awardName + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.awardClass + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.authorizationNo + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.time + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.firstAward + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.alterTime + "</td>";
				str += '<td><input type="hidden" value="' + xhr.ObjDatas[i].object.awardId + '" >'
					+ '<button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button>'
					+ '<button class="btn btn-default btn-xs solidButton" title="固化"><i class="fa fa-chain fa-lg" ></i></button>'
					+ '</td></tr>';
				str += "</tr>";
			}
			console.log("xhr为："+xhr);
			console.log("str为："+str);
			break;
		case 'patent':

			for (i = 0; i < xhr.ObjDatas.length; i++) {
				str += "<tr>";
				str += "<td>" + (i + 1) + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.patentId + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.studentId + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.awardName + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.awardClass + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.authorizationNo + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.time + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.firstPatent + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.alterTime + "</td>";
				str += '<td><input type="hidden" value="' + xhr.ObjDatas[i].object.patentId + '" >'
					+ '<button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button>'
					+ '<button class="btn btn-default btn-xs solidButton" title="固化"><i class="fa fa-chain fa-lg" ></i></button>'
					+ '</td></tr>';
				str += "</tr>";
			}
			console.log("xhr为："+xhr);
			console.log("str为："+str);
			break;
		case 'paper':
			for (i = 0; i < xhr.length; i++) {
				str += "<tr>";
				str += "<td>" + (i + 1) + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.paperId + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.studentId + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.periodical + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.publishTime + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.includedSituation + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.alterTime + "</td>";
				str += '<td><input type="hidden" value="' + xhr.ObjDatas[i].object.paperId + '" >'
					+ '<button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button>'
					+ '<button class="btn btn-default btn-xs solidButton" title="固化"><i class="fa fa-chain fa-lg" ></i></button>'
					+ '</td></tr>';
				str += "</tr>";
			}
			console.log("xhr为："+xhr);
			console.log("str为："+str);
			break;
		case 'project':
			for (i = 0; i < xhr.length; i++) {
				str += "<tr>";
				str += "<td>" + (i + 1) + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.projectId + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.projectName + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.studentId + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.projectLeading + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.userId + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.alterTime + "</td>";
				str += '<td><input type="hidden" value="' + xhr.ObjDatas[i].object.projectId + '" >'
					+ '<button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button>'
					+ '<button class="btn btn-default btn-xs solidButton" title="固化"><i class="fa fa-chain fa-lg" ></i></button>'
					+ '</td></tr>';
				str += "</tr>";
			}
			console.log("xhr为：" + xhr);
			console.log("str为：" + str);
			break;
		case 'class':
			for (i = 0; i < xhr.length; i++) {
				str += "<tr>";
				str += "<td>" + (i + 1) + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.classId + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.className + "</td>";
				str += "<td>" + xhr.ObjDatas[i].object.userId + "</td>";
				str += '<td><input type="hidden" value="' + xhr.ObjDatas[i].object.classId + '" >'
					+ '<button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button>'
					+ '<button class="btn btn-default btn-xs solidButton" title="固化"><i class="fa fa-chain fa-lg" ></i></button>'
					+ '</td></tr>';
				str += "</tr>";
			}
			console.log("xhr为：" + xhr);
			console.log("str为：" + str);
			break;
		default:
			toastr.warning('服务器错误!');
			break;
		}
		return str;
	}
	//方法声明----end
	//加载后默认点击学生信息管理
	$('a[href="#info"]').click();

})
