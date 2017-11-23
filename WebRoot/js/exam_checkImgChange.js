
$(document).ready(function() {
	$('.checkimg1').hover(function() {
		$(this).attr("src", "http://localhost:8080/teacherms/img/check1.png");
	}, function() {
		$(this).attr("src", "http://localhost:8080/teacherms/img/check.png");
	});
	$('.checkimg2').hover(function() {
		$(this).attr("src", "http://localhost:8080/teacherms/img/unlock1.png");
	}, function() {
		$(this).attr("src", "http://localhost:8080/teacherms/img/unlock.png");
	});
});