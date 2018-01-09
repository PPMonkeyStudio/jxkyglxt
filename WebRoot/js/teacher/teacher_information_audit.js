$(function() {
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
})