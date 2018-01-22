
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
		if ($("#Inputu" + $(this).val()).length > 0 || pla == "") {
			return;
		} else {
			var con = $(this).val();
			if ((con.indexOf("Date")) >= 0||(con.indexOf("Time")) >= 0) {
				$(".all_options").siblings('#search_input').append('<div id="main_body">' + '<div id="Inputu' + $(this).val() + '" class="dateinput_div form-group">' +
					'<input type="text"  placeholder="' + pla + '搜索起始时间" class="form-control  laydate-icon"  onfocus="time()"/>' +
					'<input type="text"  placeholder="' + pla + '搜索结束时间" class="form-control  laydate-icon" onfocus="time()"/>' +
					'<button class="btn btn-primary"><i class="fa fa-times" aria-hidden="true"></i></button></div></div>')
				$('.dateinput_div button').click(function() {
					//移除时候清空js中已存的数据
					data[data.tableName.replace("T", "t") + "." + $(this).parent().val()] = "";
					$(this).parent().remove();
				});
			} 
			else {
				$(".all_options").siblings('#search_input').append('<div id="Inputu' + $(this).val() + '" class="input_div form-group">' +
					'<input type="text"  placeholder="' + pla + '" class="form-control"/>' +
					'<button class="btn btn-primary"><i class="fa fa-times" aria-hidden="true"></i></button></div>')
				$('.input_div button').click(function() {
					//移除时候清空js中已存的数据
					data[data.tableName.replace("T", "t") + "." + $(this).parent().val()] = "";
					$(this).parent().remove();
				});
			}
		}
	})
}
/*模态框清空*/
$(function() {
	$('.modal').on('hide.bs.modal', function() {
		var this_modal = $(this);
		setTimeout(function() {
			this_modal.find('table input,select').val('');
			this_modal.find('table .img-default').remove();
		}, 200)
	})
})
/*导出js*/
$(function() {

	$("#export").click(function() {
		$("input[name='checkbox']:checkbox:checked").each(function() {
			data.query_num += $(this).val() + ",";
		});
	});
	$("#btn1").click(function() {
		$("input[name='checkbox']").attr("checked", "true");
	});
	$("#btn2").click(function() {
		$("input[name='checkbox']").removeAttr("checked");
	});
	$("#btn3").click(function() {
		$("input[name='checkbox']").each(function() {
			if ($(this).attr("checked")) {
				$(this).removeAttr("checked");
			} else {
				$(this).attr("checked", "true");
			}
		});
	});
});

/*  输入身份证号自动填入性别，出生日期     */
$(function() {
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
})

function time() {
	!function() {
		laydate.skin('danlan'); //切换皮肤，请查看skins下面皮肤库
		laydate({
			elem : '#main_body .laydate-icon'
		}); //绑定元素
	}();
	//日期范围限制
	var start = {
		elem : '#start',
		format : 'YYYY-MM-DD',
		min : laydate.now(), //设定最小日期为当前日期
		max : '2099-06-16', //最大日期
		istime : true,
		istoday : false,
		choose : function(datas) {
			end.min = datas; //开始日选好后，重置结束日的最小日期
			end.start = datas //将结束日的初始值设定为开始日
		}
	};

	var end = {
		elem : '#end',
		format : 'YYYY-MM-DD',
		min : laydate.now(),
		max : '2099-06-16',
		istime : true,
		istoday : false,
		choose : function(datas) {
			start.max = datas; //结束日选好后，充值开始日的最大日期
		}
	};
	laydate(start);
	laydate(end);
}

/*附件图片上传js*/
function imgUpload() {
	$('.addInfo').unbind().click(function() {
		$('.addInfo').siblings('input').click();
	})
}
/*图片预览*/
function previewFile(input_obj) {
	//console.log($(input_obj).prop('files'));
	var files = $(input_obj).prop('files');
	for (var i in files) {
		var reader = new FileReader();
		reader.onloadend = function() {
			//(this.result); 
			$('.addInfo').before('<div class="img-default">' + '<div class="img">'
				+ '<img src="' + this.result + '" alt="img" class="img-show">'
				+ '</div>'
				+ '<div class="info">'
				+ '<div class="img-control-btn modify-btn" title="编辑">'
				+ '<img src="img/modi(5).png" />'
				+ '</div>'
				+ '<div class="img-control-btn delete-btn" title="删除">'
				+ '<img src="img/delete(2).png" />'
				+ '</div>'
				+ '</div>'
				+ '<input type="file" value="' + files[i] + '" onchange="modiFiles(this)" accept="image/gif, image/pdf, image/png, image/jpeg" style="display:none" >'
				+ '</div>')
			$('.delete-btn').unbind().click(function() {
				$(this).parent().parent().remove();
			});
			$('.modify-btn').unbind().click(function() {
				$(this).parent().siblings('input').click();
			});
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
					//var formData = new FormData($("#importdata")[0]);
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