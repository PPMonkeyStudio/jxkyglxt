$(function(){
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
				/*$('.solidButton').click(solidInfo);
				$('.modiButton').click(modiInfo);*/
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
			for (i = 0; i < xhr.length; i++) {/*
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
			*/}
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
					str += '<td><input type="hidden" value="' + xhr[i].awardId + '" ><button class="btn btn-default btn-xs viewButton" title="查看"><i class="fa fa-search"  aria-hidden="true"></i></button></td>';
				}
				str += "</tr>";
			}
			break;
		case 'works':
			for (i = 0; i < xhr.length; i++) {
				var dataStatus=xhr[i].dataStatus;
				str+="<tr>";
			    str+="<td>"+(i+1)+"</td>";
			    str+="<td>"+xhr[i].worksName+"</td>";
			    str+="<td>"+xhr[i].editorUserNames+"</td>";
			    str+="<td>"+xhr[i].isbn+"</td>";
			    str+="<td>"+xhr[i].publishTime+"</td>";
			    str+="<td>"+xhr[i].press+"</td>"; 
			    if(dataStatus=="10"){
				    str += '<td><input type="hidden" value="' + xhr[i].worksId  + '" ><button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button><button class="btn btn-default btn-xs commmit-btn" title="提交审核"><i class="fa fa-sign-out fa-lg"  aria-hidden="true"></i></button></td>';		
			    }
			    if(dataStatus=="20"||dataStatus=="30"||dataStatus=="40"){
				    str += '<td><input type="hidden" value="' + xhr[i].worksId  + '" ><button class="btn btn-default btn-xs viewButton" title="查看"><i class="fa fa-eye fa-lg"  aria-hidden="true"></i></button></td>';		
			    }
			    str+="</tr>";   
			}
			break;
		case 'paper':
			for (i = 0; i < xhr.length; i++) {
				var dataStatus=xhr[i].dataStatus;
				str+="<tr>";
			    str+="<td>"+(i+1)+"</td>";
			    str+="<td>"+xhr[i].paperName+"</td>";
			    str+="<td>"+xhr[i].authorUserNames+"</td>";
			    str+="<td>"+xhr[i].periodical+"</td>";
			    str+="<td>"+xhr[i].periodicalNo+"</td>";
			    str+="<td>"+xhr[i].publishTime+"</td>"; 
			    if(dataStatus=="10"){
				    str += '<td><input type="hidden" value="' + xhr[i].paperId  + '" ><button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button><button class="btn btn-default btn-xs commmit-btn" title="提交审核"><i class="fa fa-sign-out fa-lg"  aria-hidden="true"></i></button></td>';		
			    }
			    if(dataStatus=="20"||dataStatus=="30"||dataStatus=="40"){
				    str += '<td><input type="hidden" value="' + xhr[i].paperId  + '" ><button class="btn btn-default btn-xs viewButton" title="查看"><i class="fa fa-eye fa-lg"  aria-hidden="true"></i></button></td>';		
			    }
			    str+="</tr>";   
			}
			break;
		case 'patent':
			for (i = 0; i < xhr.length; i++) {
				var dataStatus=xhr[i].dataStatus;
				str+="<tr>";
			    str+="<td>"+(i+1)+"</td>";
			    str+="<td>"+xhr[i].patentName+"</td>";
			    str+="<td>"+xhr[i].authorUserNames+"</td>";
			    str+="<td>"+xhr[i].patentType+"</td>";
			    str+="<td>"+xhr[i].authorizationNo+"</td>";
			    if(dataStatus=="10"){
				    str += '<td><input type="hidden" value="' + xhr[i].patentId  + '" ><button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button><button class="btn btn-default btn-xs commmit-btn" title="提交审核"><i class="fa fa-sign-out fa-lg"  aria-hidden="true"></i></button></td>';		
			    }
			    if(dataStatus=="20"||dataStatus=="30"||dataStatus=="40"){
				    str += '<td><input type="hidden" value="' + xhr[i].patentId  + '" ><button class="btn btn-default btn-xs viewButton" title="查看"><i class="fa fa-eye fa-lg"  aria-hidden="true"></i></button></td>';		
			    }
			  
			    str+="</tr>";   
			}
			break;
		case 'project':
			for (i = 0; i < xhr.length; i++) {
				var dataStatus=xhr[i].dataStatus;
				str+="<tr>";
			    str+="<td>"+(i+1)+"</td>";
			    str+="<td>"+xhr[i].projectName+"</td>";
			    str+="<td>"+xhr[i].projectUserNames+"</td>";
			    str+="<td>"+xhr[i].projectSource+"</td>";
			    str+="<td>"+xhr[i].projectNo+"</td>";
			    if(dataStatus=="10"){
				    str += '<td><input type="hidden" value="' + xhr[i].projectId  + '" ><button class="btn btn-default btn-xs modiButton" title="修改"><i class="fa fa-pencil-square-o fa-lg"></i></button><button class="btn btn-default btn-xs commmit-btn" title="提交审核"><i class="fa fa-sign-out fa-lg"  aria-hidden="true"></i></button></td>';		
			    }
			    if(dataStatus=="20"||dataStatus=="30"||dataStatus=="40"){
				    str += '<td><input type="hidden" value="' + xhr[i].projectId  + '" ><button class="btn btn-default btn-xs viewButton" title="查看"><i class="fa fa-eye fa-lg"  aria-hidden="true"></i></button></td>';		
			    }
			   
			    str+="</tr>";   
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