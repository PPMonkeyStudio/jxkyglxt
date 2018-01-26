var data = {
	tableName : "",
	dataState : "",
	page : 1,
	time_interval : "",
	tableId : "",
	export_name : "",
	export_id : "",
	fuzzy_query : "",
	//奖励
	"teacherAward.awardType" : "",
	"teacherAward.awardName" : "",
	"teacherAward.awardUserNames" : "",
	"teacherAward.awardGrade" : "",
	"teacherAward.awardLevel" : "",
	//用户
	"teacherInfo.userId" : "",
	"teacherInfo.jobStatue" : "",
	"teacherInfo.highestDegree" : "",
	"teacherInfo.highestEducation" : "",
	"teacherInfo.learnEdgeStructure" : "",
	"teacherInfo.professionalTitle" : "",
	"teacherInfo.subjectCategory" : "",
	"teacherInfo.teachingProfessionName" : "",
	"teacherInfo.professionTeachingDate" : "",
	"teacherInfo.workDate" : "",
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

//保存分页信息
var pageDataInformation = {
	pageIndex : "",
	totalRecords : '',
	pageSize : '',
	totalPages : '',
	HavePrePage : '',
	HaveNextPage : '',
}
//记录分页信息方法
function setPageInfo(xhr_data) {
	pageDataInformation.HaveNextPage = xhr_data.HaveNextPage;
	pageDataInformation.HavePrePage = xhr_data.HavePrePage;
	pageDataInformation.pageIndex = xhr_data.pageIndex;
	pageDataInformation.pageSize = xhr_data.pageSize;
	pageDataInformation.totalPages = xhr_data.totalPages;
	pageDataInformation.totalRecords = xhr_data.totalRecords;
}

$(function() {
	$('.right-side').load('index_info.jsp #content');
	$('.sidebar-menu .nav li a').click(function() {
		//重置页码
		data.page = 1;
		$(this).addClass("Atfer_li");
		$(this).parent().siblings().children().removeClass("Atfer_li");
		//管理员
		if (($(this).text()) == "信息审核") {
			$('.right-side').load('page/teacher/teacher_information_audit.jsp #content', selectSeacher(), function() {
				data.dataState = "20";
				$.getScript("js/teacher/teacher_information_audit.js");
			});
		}
		//管理员
		if (($(this).text()) == "信息管理") {
			$('.right-side').load('page/teacher/teacher_Information_management.jsp #content', selectSeacher(), function() {
				data.dataState = "40";
				$.getScript("js/teacher/teacher_Information_management.js");
			});
		}
		//用户
		if (($(this).text()) == "信息查看") {
			$('.right-side').load('page/teacher/user_Information_management.jsp #content', selectSeacher(), function() {
				$.getScript("js/teacher/user_Information_management.js");
			})
		}
	});
	//用户信息模态框
	$('#info_modal').on('hidden.bs.modal', function() {
		$(this).find('.basic').hide();
		$(this).find('.other').show();
	})
	//清除内容
	$("div[id$='_modal']").on('hidden.bs.modal', function() {
		$(this).find('.sure_add').unbind().hide();
		$(this).find('.sure_mod').unbind().hide();
		$(this).find('input').each(function() {
			$(this).val('');
		});
		$(this).find('select').each(function() {
			$(this).find('option:first-child').attr("selected", "selected");
		});
	})

});

var m_check = {
	div : null,
	button : null,
	init : function(config) {
		this.div = $(config.id);
		this.input = $(config.id).find('button');
		this.before();
		//这边范围对应的对象，可以实现链式调用
		return this;
	},
	bind : function() {
		this.render();
	},
	//渲染元素
	render : function() {
		var self = this;
		var o = null;
		$.each(this.input, function() {
			o = $(this);
			if (o.attr('id') == 'all') {
				o.click(function() {
					self.input.children('i').attr('class', 'fa fa-check');
				});
			} else if (o.attr('id') == 'inverse') {
				o.click(function() {
					$.each(self.input, function() {
						$(this).children('i').attr('class', self.getInverse(this));
					})
				});
			} else {
				o.click(function() {
					$(this).children('i').attr('class', self.getInverse(this));
				});
			}
		});
		self.after();
	},
	getInverse : function(button) {
		return $(button).children('i').hasClass('fa-check') ? 'fa fa-times' : 'fa fa-check';
	},
	before : function() {
		if (this.div.hasClass('m_check')) {
			return;
		}
		this.bind();
	},
	after : function() {
		this.div.addClass('m_check');
	},
}

//用户重置自己密码
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

/*图片预览*/
function previewFile(input_obj) {
	var files = $(input_obj).prop('files');
	for (var i in files) {
		var reader = new FileReader();
		reader.onloadend = function() {
			//(this.result); 
			$('.addInfo').before('<div class="img-default">' + '<div class="img">'
				+ '<img src="' + this.result + '" alt="" class="img-show">'
				+ '</div>'
				+ '<div class="info" onclick="javascript:$(this).prev().find(\'img\').click()">'
				+ '<div class="img-control-btn modify-btn" title="编辑">'
				+ '<img src="img/modi(5).png" />'
				+ '</div>'
				+ '<div class="img-control-btn delete-btn" title="删除">'
				+ '<img src="img/delete(2).png" />'
				+ '</div>'
				+ '</div>'
				+ '<input type="file" name="" onchange="modiFiles(this)" accept="image/gif, image/pdf, image/png, image/jpeg" style="display:none" >'
				+ '</div>')
			$('.delete-btn').unbind().click(function() {
				$(this).parent().parent().remove();
			});
			$('.modify-btn').unbind().click(function() {
				$(this).parent().siblings('input').click();
			});
			$('.img-show').zoomify();
		}
		reader.readAsDataURL(files[i]);
	}
}

/*修改上传的图片*/
function modiFiles(this_obj) {
	var files = $(this_obj).prop('files')[0];
	var reader = new FileReader();
	reader.onloadend = function() {
		$(this_obj).siblings().children('img').attr("src", this.result);
	}
	reader.readAsDataURL(files);
}

/* 表单判空验证*/
function formValidate() {
	$('.tab input').blur(function() {
		if ($(this).val() == "") {
			/* $(this).addClass('has-error');
			 $(this).parent().prev('td').css({
	        			  "color":"red"
			 })*/

			$(this).after('<span>' + '<img src="img/cuo.png"/>' + 不能为空 + '</span>');
		} else {
			$(this).removeClass('has-error ');
			$(this).parent().prev('td').css({
				"color" : "#444444"
			})
		}
	})
}


//附件上传
function AttachmentUpload(url, formData) {
	var result = false;
	$.ajax({
		url : url,
		type : "POST",
		async : false,
		dataType : "json",
		data : formData,
		processData : false,
		contentType : false,
		success : function(sxh_data) {
			result = sxh_data.result == "success" ? true : false;
		},
		error : function(data) {
			console.log("error");
		//console.log(data.status + " : " + data.statusText + " : " + data.responseText);
		}
	});
	return result;
}

/*导入信息*/
function import_to_database() {
	$.confirm({
		title : '确定导入?',
		smoothContent : false,
		content : '选择导入的数据文件（仅限execl）：<button onclick="javascript:$(\'#importdata\').click()" class="btn btn-sm btn-primary">选择</button><input style="display:none;" type="file" id="importdata">',
		buttons : {
			deleteUser : {
				btnClass : 'btn-danger',
				text : '确定',
				action : function() {
					var formData = new FormData();
					formData.append("file", $("#importdata").get(0).files[0]);
					if (formData != null) {
						$.ajax({
							url : "Admin/admin_importDatabase",
							type : "post",
							timeout : 3000,
							data : formData,
							contentType : false,
							processData : false,
							success : function(data) {
								$.alert('导入成功!')
							},
							error : function() {}
						});
					} else {
						$.alert('选择文件!')
					}
				}
			},
			cancelAction : {
				btnClass : 'btn-blue',
				text : '取消',
			}
		}
	});
}

/*  输入身份证号自动填入性别，出生日期     */
function getinfoByCardId() {
	$(document).on("blur", ".card_num", function() {
		var reg = /^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
		var card_num = $(".card_num").val();
		if (reg.test(card_num) === false) {
			$(this).addClass('error_form ').val("");
		} else {
			if (parseInt(card_num.substr(16, 1)) % 2 == 1) {
				$(".sele").find("option[value='男']").attr("selected", "selected");
			//是男则执行代码 ...
			} else {
				$(".sele").find("option[value='女']").attr("selected", "selected");
			//是女则执行代码 ...
			}
			$(".bir").val(card_num.substring(6, 10) + "-" + card_num.substring(10, 12) + "-" + card_num.substring(12, 14));
		}
	});
	$(document).on("keyup", ".card_num", function(event) {
		if (event.keyCode == 13) {
			var reg = /^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
			var card_num = $(".card_num").val();
			if (reg.test(card_num) === false) {
				$(this).val("");
			} else {
				if (parseInt(card_num.substr(16, 1)) % 2 == 1) {
					$(".sele").find("option[value='男']").attr("selected", "selected");
				//是男则执行代码 ...
				} else {
					$(".sele").find("option[value='女']").attr("selected", "selected");
				//是女则执行代码 ...
				}
				$(".bir").val(card_num.substring(6, 10) + "-" + card_num.substring(10, 12) + "-" + card_num.substring(12, 14));
			}
		}
	})
}

function selectSeacher() {
	$(document).on("change", "#all_options", function() {
		var pla = '';
		switch ($(this).val()) {
		case 'userName':
			pla = '请输入姓名';
			break;
		case 'userId':
			pla = '请输入工号';
			break;
		case 'jobStatue':
			pla = '请输入任职状态';
			break;
		case 'highestDegree':
			pla = '请输入最高学位';
			break;
		case 'highestEducation':
			pla = '请输入最高学历';
			break;
		case 'learnEdgeStructure':
			pla = '请输入学缘';
			break;
		case 'professionalTitle':
			pla = '请输入专业技术职称';
			break;
		case 'subjectCategory':
			pla = '请输入学科类别';
			break;
		case 'teachingProfessionName':
			pla = '请输入任教专业名称';
			break;
		case 'professionTeachingDate':
			pla = '任教';
			break;
		case 'workDate':
			pla = '参加';
			break;
		case 'awardType':
			pla = '请输入获奖类型';
			break;
		case 'awardName':
			pla = '请输入获奖名称';
			break;
		case 'awardUserNames':
			pla = '请输入获奖人姓名';
			break;
		case 'awardGrade':
			pla = '请输入获奖等级';
			break;
		case 'awardLevel':
			pla = '请输入获奖级别';
			break;
		case 'awardTime':
			pla = '请输入获奖时间';
			break;
		case 'worksName':
			pla = '请输入著作（专著）名称';
			break;
		case 'worksType':
			pla = '请输入著作类别';
			break;
		case 'press':
			pla = '请输入出版社';
			break;
		case 'isbn':
			pla = '请输入ISBN';
			break;
		case 'publishTime':
			pla = '请输入出版时间';
			break;
		case 'selectedSituation':
			pla = '请输入入选情况';
			break;
		case 'selectedDate':
			pla = '请输入入选时间';
			break;
		case 'editorUserNames':
			pla = '请输入主编（作者）';
			break;
		case 'paperName':
			pla = '请输入论文名称';
			break;
		case 'paperType':
			pla = '请输入论文类别';
			break;
		case 'periodical':
			pla = '请输入发表期刊';
			break;
		case 'periodicalNo':
			pla = '请输入期号';
			break;
		case 'includedSituation':
			pla = '请输入收录情况';
			break;
		case 'totalCitations':
			pla = '请输入他引次数';
			break;
		case 'wordsNum':
			pla = '请输入成果字数';
			break;
		case 'patentName':
			pla = '请输入专利名称';
			break;
		case 'patentType':
			pla = '请输入专利类型';
			break;
		case 'authorizationNo':
			pla = '请输入授权号';
			break;
		case 'approvedDate':
			pla = '请输入获批时间';
			break;
		case 'projectName':
			pla = '请输入项目名称';
			break;
		case 'projectType':
			pla = '请输入项目类型';
			break;
		case 'projectSource':
			pla = '请输入项目来源';
			break;
		case 'projectUserNames':
			pla = '请输入成员姓名';
			break;
		case 'approvalDate':
			pla = '请输入立项时间';
			break;
		case 'endUpDate':
			pla = '请输入结题验收时间';
			break;
		default:
			break;
		}
		if ($("#Inputu" + $(this).val()).length >= 1 || pla == "") {
			console.log($("#Inputu" + $(this).val()))
			return;
		} else {
			var con = $(this).val();
			if ((con.indexOf("Date")) >= 0 || (con.indexOf("Time")) >= 0) {
				$(".all_options").siblings('#search_input').append('<div id="main_body">' + '<div id="Inputu' + $(this).val() + '" class="dateinput_div form-group">' +
					'<input type="text"  placeholder="' + pla + '搜索起始时间" class="form-control  riliDate"  />' +
					'<input type="text"  placeholder="' + pla + '搜索结束时间" class="form-control  riliDate" />' +
					'<button class="btn btn-primary"><i class="fa fa-times" aria-hidden="true"></i></button></div></div>')
				
				$('.dateinput_div button').click(function() {
					//移除时候清空js中已存的数据
					data[data.tableName.replace("T", "t") + "." + $(this).parent().val()] = "";
					$(this).parent().remove();
				});
			} else {

				$(".all_options").siblings('#search_input').append('<div id="Inputu' + $(this).val() + '" class="input_div form-group">' +
					'<input type="text"  placeholder="' + pla + '" class="form-control"/>' +
					'<button class="btn btn-primary"><i class="fa fa-times" aria-hidden="true"></i></button></div>')

				$('.input_div button').click(function() {
					//移除时候清空js中已存的数据
					data[data.tableName.replace("T", "t") + "." + $(this).parent().val()] = "";
					$(this).parent().remove();
					$(this).parent().empty();
				});

			}
		}


	})
}