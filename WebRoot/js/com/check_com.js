function export_to_excel() {
}

/**  
* ajax post提交  
* @param url  
* @param param  
* @param datat 为html,json,text  
* @param callback 回调函数 function callBack(data)  
* @return  
*/
jQuery.mJqAjax = function(url, param, datat, callback) {
	$.ajax({
		type : "post",
		url : url,
		data : param,
		dataType : datat,
		success : callback,
		error : function() {}
	});
};