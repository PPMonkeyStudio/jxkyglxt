
$(document).ready(function() {
	$('.checkimg').hover(function() {
		$(this).attr("src", "http://localhost:8080/teacherms/img/review7.png");
	}, function() {
		$(this).attr("src", "http://localhost:8080/teacherms/img/review6.png");
	});
});