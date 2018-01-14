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


//记录分页信息
function setPageInfo(xhr_data) {
	pageDataInformation.HaveNextPage = xhr_data.HaveNextPage;
	pageDataInformation.HavePrePage = xhr_data.HavePrePage;
	pageDataInformation.pageIndex = xhr_data.pageIndex;
	pageDataInformation.pageSize = xhr_data.pageSize;
	pageDataInformation.totalPages = xhr_data.totalPages;
	pageDataInformation.totalRecords = xhr_data.totalRecords;
}

/*$(function() {
	textCount.init({
		id : '#div'
	});
})*/