$(function() {
	var parent_div = null;
	var a_href = null;
	$('.nav-tabs li a').click(function(){
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
	//指定查询(search_info---指定查询。为全局方法)
	$('.search_info').click(search_info);
	//模糊查询
	$('.fuzzy_query').click(function() {
		data.fuzzy_query = $(this).parent().prev().val();
		doQuery();
	});
	//用户信息添加(用户添加模态框是唯一的)//(用户信息)修改信息
	var modiInfo = function() {
		//获取id、
		var id = $(this).siblings('input').val();
		//只显示基本信息
		$('#info_modal .basic').show();
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
				//显示出模态框
				$('#info_modal').modal({
					keyboard : true
				});
			}, "json");
	}
	//固化
	var solidInfo = function() {
		var infoid = $(this).siblings('input').val();
		$(this).parent().empty().append('<img title="已固化"  src="img/ok1.png" />');
		$.post('/teacherms/Admin/admin_LiftCuring', {
			tableId : infoid,
			tableName : data.tableName,
			dataState : "10"
		}, function(xhr) {
			if (xhr.result == "success") {
				toastr.success("信息固化成功!");
			} else {
				toastr.error("信息固化失败");
			}
		}, 'json')
	}
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
				$('.solidButton').click(solidInfo);
				$('.modiButton').click(modiInfo);
			},
			error : function() {
				toastr.error('服务器错误!');
			}
		});
	}
	
	//通过a标签的href属性，获取查询到的组合成的字符串结果
	function getStr(xhr){
		var str = "";
		switch (a_href){
		case 'info':
			for (i = 0; i < xhr.length; i++) {
				str+="<tr>";
			    str+="<td>"+(i+1)+"</td>";
			    str+="<td>"+xhr[i][0].userId+"</td>";
			    str+="<td>"+xhr[i][1].userName+"</td>";
			    str+="<td>"+xhr[i][0].professionalGrade+"</td>";
			    str+="<td>"+xhr[i][0].employeeType+"</td>";
			    str+="<td>"+xhr[i][0].teachingType+"</td>"; 
			    str+="<td>"+xhr[i][0].teachingStatus+"</td>";
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
				str+="<tr>";
			    str+="<td>"+(i+1)+"</td>";
			    str+="<td>"+xhr[i][0].worksName+"</td>";
			    str+="<td>"+xhr[i][0].editorUserNames+"</td>";
			    str+="<td>"+xhr[i][0].isbn+"</td>";
			    str+="<td>"+xhr[i][0].publishTime+"</td>";
			    str+="<td>"+xhr[i][0].press+"</td>"; 
				str += '<td><input type="hidden" value="' + xhr[i][0].worksId + '" >'
				+ '<button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button>'
				+ '<button class="btn btn-default btn-xs solidButton" title="固化"><i class="fa fa-chain fa-lg" ></i></button>'
				+ '</td></tr>';
				str += "</tr>";
			}
			break;
		case 'paper':
			for (i = 0; i < xhr.length; i++) {
				str+="<tr>";
			    str+="<td>"+(i+1)+"</td>";
			    str+="<td>"+xhr[i][0].paperName+"</td>";
			    str+="<td>"+xhr[i][0].authorUserNames+"</td>";
			    str+="<td>"+xhr[i][0].periodical+"</td>";
			    str+="<td>"+xhr[i][0].periodicalNo+"</td>";
			    str+="<td>"+xhr[i][0].publishTime+"</td>"; 
				str += '<td><input type="hidden" value="' + xhr[i][0].paperId + '" >'
				+ '<button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button>'
				+ '<button class="btn btn-default btn-xs solidButton" title="固化"><i class="fa fa-chain fa-lg" ></i></button>'
				+ '</td></tr>';
				str += "</tr>";
			}
			break;
		case 'patent':
			for (i = 0; i < xhr.length; i++) {
				str+="<tr>";
			    str+="<td>"+(i+1)+"</td>";
			    str+="<td>"+xhr[i][0].patentName+"</td>";
			    str+="<td>"+xhr[i][0].authorUserNames+"</td>";
			    str+="<td>"+xhr[i][0].patentType+"</td>";
			    str+="<td>"+xhr[i][0].authorizationNo+"</td>";
				str += '<td><input type="hidden" value="' + xhr[i][0].patentId + '" >'
				+ '<button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button>'
				+ '<button class="btn btn-default btn-xs solidButton" title="固化"><i class="fa fa-chain fa-lg" ></i></button>'
				+ '</td></tr>';
				str += "</tr>";
			}
			break;
		case 'project':
			for (i = 0; i < xhr.length; i++) {
				str+="<tr>";
			    str+="<td>"+(i+1)+"</td>";
			    str+="<td>"+xhr[i][0].projectName+"</td>";
			    str+="<td>"+xhr[i][0].projectUserNames+"</td>";
			    str+="<td>"+xhr[i][0].projectSource+"</td>";
			    str+="<td>"+xhr[i][0].projectNo+"</td>";
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
})