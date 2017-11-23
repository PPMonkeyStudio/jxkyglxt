$(document).ready(function() {
	//获得当前页面中右边导航的页面提示内容
	var type = $('#type_content').text();
	//将所有的li设置为可以点击状态
	$('.left_nav_ul li').removeClass('after_li');
	//遍历所有A标签，获得文字内容，与TYPE比对，相同的设置赋予after_li的CLASS，并改变背景色
	$('li a').each(function() {
		if ($(this).text() == type) {
			$(this).parent().addClass('after_li').css({
				"color" : "#616161"
			});
		}
	});
});