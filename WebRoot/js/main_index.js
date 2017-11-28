$(function(){
	$('.sidebar-menu .nav li a').click(function(){
	/*	var a_content=$('.sidebar-menu .nav li a').text();*/
		if(($(this).text())=="信息审核"){
			
			$('.content').load('exam_pageinfo.jsp .content',function(){
				$('.nav-tabs li a').click(function(){
					if($(this).parent('li').attr('class') == 'active') return;
					var a_href = $(this).attr("href");
					switch(a_href) {
						case '#user':
							$('#user').load('check_pageinfo.jsp #user_table_view');
							break;
						case '#award':
							$('#award').load('check_pageinfo.jsp #award_table_view');
							break;
						case '#works':
							$('#works').load('check_pageinfo.jsp #works_table_view');
							break;
						case '#paper':
							$('#paper').load('check_pageinfo.jsp #paper_table_view');
							break;
						case '#patent':
							$('#patent').load('check_pageinfo.jsp #patent_table_view');
							break;
						case '#project':
							$('#project').load('check_pageinfo.jsp #project_table_view');
							break;
						default:
							break;
					}
					$('a[href="#user"]').click();
				})
			});
		}
		else if(($(this).text())=="信息管理"){
			$('.content').load('check_pageinfo.jsp .content',function(){
				
			});
		}
		/*$('.breadcrumb').append("<li>"+"<a>"+$(this).text()+"</li>"+"</a>");*/
	});
});