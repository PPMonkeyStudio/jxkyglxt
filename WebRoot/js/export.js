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