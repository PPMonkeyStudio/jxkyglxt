var data = {
	tableName : "",
	dataState : "",
	page : 1,
	time_interval : "",
	tableId : "",
	export_name : "",
	export_id : "",

	//奖励
	"teacherAward.awardType" : "",
	"teacherAward.awardName" : "",
	"teacherAward.awardUserNames" : "",
	"teacherAward.awardGrade" : "",
	"teacherAward.awardLevel" : "",

	//用户
	"teacherInfo.userId" : "",
	"teacherInfo.userId" : "",

	//论文
	"teacherPaper.userId" : "",
	"teacherPaper.paperName" : "",
	"teacherPaper.authorUserNames" : "",
	"teacherPaper.paperType" : "",
	"teacherPaper.periodical" : "",
	"teacherPaper.periodicalNo" : "",

	//专利
	"teacherPatent.patentName" : "",
	"teacherPatent.patentType" : "",
	"teacherPatent.authorizationNo" : "",


	//项目
	"teacherProject.projectName" : "",
	"teacherProject.projectSource" : "",
	"teacherProject.projectUserNames" : "",
	"teacherProject.projectType" : "",

	//著作
	"teacherWorks.worksName" : "",
	"teacherWorks.worksType" : "",
	"teacherWorks.press" : "",
	"teacherWorks.isbn" : "",
	"teacherWorks.editorUserNames" : "",
	"teacherWorks.selectedSituation" : "",
	"teacherWorks.selectedDate" : "",
}
var pageDataInformation = {
	pageIndex : "",
	totalRecords : '',
	pageSize : '',
	totalPages : '',
	HavePrePage : '',
	HaveNextPage : '',
}
$(function() {
	$('.right-side').load('index_info.jsp #content');
	$('.sidebar-menu .nav li a').click(function() {
		$(this).addClass("Atfer_li");
		$(this).parent().siblings().children().removeClass("Atfer_li");
		if (($(this).text()) == "信息审核") {
			$('.right-side').load('exam_pageinfo.jsp #content', selectSeacher(), function() {
				$('.nav-tabs li a').unbind().click(function() {
					if ($(this).parent('li').attr('class') == 'active') return;
					var a_href = $(this).attr("href");
					switch (a_href) {
					case '#user':
						$('#user').load('exam_pageinfo.jsp  #user_table_audit', function() {
							data.tableName = "TeacherInfo";
							data.dataState = "20";
							examInfo();
						});
						break;
					case '#award':
						$('#award').load('exam_pageinfo.jsp #award_table_audit', function() {
							data.tableName = "TeacherAward";
							data.dataState = "20";
							examAward();
						});
						break;
					case '#works':
						$('#works').load('exam_pageinfo.jsp #works_table_audit', function() {
							data.tableName = "TeacherWorks";
							data.dataState = "20";
							examWorks();
						});
						break;
					case '#paper':

						$('#paper').load('exam_pageinfo.jsp #paper_table_audit', function() {
							data.tableName = "TeacherPaper";
							data.dataState = "20";
							examPaper();
						});
						break;
					case '#patent':
						$('#patent').load('exam_pageinfo.jsp #patent_table_audit', function() {
							data.tableName = "TeacherPatent";
							data.dataState = "20";
							examPatent();
						});
						break;
					case '#project':

						$('#project').load('exam_pageinfo.jsp #project_table_audit', function() {
							data.tableName = "TeacherProject";
							data.dataState = "20";
							examProject();
						});
						break;
					default:
						break;
					}
				})
			});
		}
		if (($(this).text()) == "信息管理") {
			$('.right-side').load('check_pageinfo.jsp #content', selectSeacher(), function() {
				$('.nav-tabs li a').unbind().click(function() {
					if ($(this).parent('li').attr('class') == 'active') return;
					var a_href = $(this).attr("href");
					switch (a_href) {
					case '#user':
						$('#user').load('check_pageinfo.jsp  #user_table_view', function() {
							data.tableName = "TeacherInfo";
							data.dataState = "40";
							checkInfo();
						});
						break;
					case '#award':
						$('#award').load('check_pageinfo.jsp #award_table_view', function() {
							data.tableName = "TeacherAward";
							data.dataState = "20";
							checkAward();
						});
						break;
					case '#works':
						$('#works').load('check_pageinfo.jsp #works_table_view', function() {
							data.tableName = "TeacherWorks";
							data.dataState = "20";
							checkWorks();
						});
						break;
					case '#paper':
						$('#paper').load('check_pageinfo.jsp #paper_table_view', function() {
							data.tableName = "TeacherPaper";
							data.dataState = "20";
							checkPaper();
						});
						break;
					case '#patent':
						$('#patent').load('check_pageinfo.jsp #patent_table_view', function() {
							data.tableName = "TeacherPatent";
							data.dataState = "20";
							checkPatent();
						});
						break;
					case '#project':
						$('#project').load('check_pageinfo.jsp #project_table_view', function() {
							data.tableName = "TeacherProject";
							data.dataState = "20";
							checkProject();
						});
						break;
					default:
						break;
					}
				})
			})
		}
		if (($(this).text()) == "信息查看") {

			$('.right-side').load('user_pageinfo.jsp #content', selectSeacher(), function() {
				$('.nav-tabs li a').unbind().click(function() {
					if ($(this).parent('li').attr('class') == 'active') return;
					var a_href = $(this).attr("href");
					switch (a_href) {
					case '#user':
						$('#user').load('user_pageinfo.jsp  #user_info_table_audit', function(response, status, xhr) {
							if (xhr.readyState == 4) {
								if (xhr.status == 200) {
									data.tableName = "TeacherInfo";
									userInfo();
								}
							}

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
				})
			})

		}
	});
});

function user_setting() {
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