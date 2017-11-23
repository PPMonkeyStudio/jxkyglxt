
var data = {
	tableName : "TeacherPatent",
	dataState : "20",
	page : 1,
	time_interval : "",
	tableId : "",
}

$(function() {
	//查询所有奖励信息
	getinfo(data);

	$('#dataStatus').change(function() {
		var Status = $(this).val();
		if (Status == "40") {
			$('.review-info').removeClass("btn-danger").addClass("btn-primary").html("信息固化");
		} else if (Status == "10") {
			$('.review-info').addClass("btn-danger").removeClass("btn-primary").html("信息重填");
		} else if (Status == "20" || Status == "30") {
			$('.review-info').addClass("btn-danger").removeClass("btn-primary").html("再次审核");
		}
	})
})

function img_click() {
	$('.checkimg').hover(function() {
		$(this).attr("src", "http://localhost:8080/teacherms/img/review7.png");
	}, function() {
		$(this).attr("src", "http://localhost:8080/teacherms/img/review6.png");
	});

	$('.checkimg').click(function() {
		//初始化按钮颜色
		$('.review-info').addClass("btn-danger").removeClass("btn-primary").html("再次审核");
		//jquery获取点击的img元素
		var img_element = $(this);
		//显示出模态框
		$('#patent').modal({
			keyboard : true
		})
		//获取在img标签的上一个兄弟元素存入的id值
		var id = $(this).prev().val();
		//id值存入到模态框中按钮的上一个兄弟元素中
		$("#tableid").val(id);
		//全局对象中data的tableId赋值为id的值
		data.tableId = id;
		//查询指定id的信息
		getInfoByTableId(data);
		//模态框出现后给按钮一次性的点击事件
		$('.review-info').one("click", function() {
			var str = $(this).text();
			var review_data = $("#info_form").serialize() + "&tableName=" + data.tableName;
			switch (str) {
			case "信息重填":
				review_data.dataState = "10";
				break;
			case "再次审核":
				review_data.dataState = "20";
				break;
			case "信息固化":
				review_data.dataState = "40";
				break;
			default:
				return;
				break;
			}
			$.post("/teacherms/Admin/admin_modifiedInfomation", review_data, function(sxh_data) {
				alert(sxh_data.result);
				if (sxh_data.result == "40") {
					img_element.attr({
						src : "test.jpg"
					}).unbind();
				}
			}, "json")
		});
	});
}