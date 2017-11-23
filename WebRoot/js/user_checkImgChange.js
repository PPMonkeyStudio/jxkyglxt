
function user_checkImgChange() {
	$('.checkimg').unbind("hover").hover(function() {
		$(this).attr("src", "/teacherms/img/check1.png");
	}, function() {
		$(this).attr("src", "/teacherms/img/check.png");
	});
	$('.modfiimg').unbind("hover").hover(function() {
		$(this).attr("src", "/teacherms/img/modfi1.png");
	}, function() {
		$(this).attr("src", "/teacherms/img/modfi.png");
	});
	$('.submitimg').unbind("hover").hover(function() {
		$(this).attr("src", "/teacherms/img/submit1.png");
	}, function() {
		$(this).attr("src", "/teacherms/img/submit.png");
	});
}