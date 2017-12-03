
function selectSeacher(){
	
	$(document).on("change","#all_options",function(){
		var pla = '';
		switch ($(this).val()){
			case 'userName':pla='请输入姓名';
				break;
			case 'userId':pla='请输入工号';
			break;
			case 'teacherStatus':pla='请输入任职状态';
			break;
			case 'unitName':pla='请输入单位名称';
			break;
			case 'Education':pla='请输入学历';
			break;
			case 'heigestGegree':pla='请输入最高学位';
			break;
			case 'highestEducation':pla='请输入最高学历';
			break;
			case 'learnEdgeStructure':pla='请输入学缘';
			break;
			case 'professionalTitle':pla='请输入专业技术职称';
			break;
			case 'subjectCategory':pla='请输入学科类别';
			break;
			case 'teachingProfessionName':pla='请输入任教专业名称';
			break;
			case 'teachingDate':pla='请输入任教时间';
			break;
			case 'workDate':pla='请输入参加工作时间';
			break;
			case 'awardType':pla='请输入获奖类型';
			break;
			case 'awardName':pla='请输入获奖名称';
			break;
			case 'awardPeoname':pla='请输入获奖人姓名';
			break;
			case 'awardGrade':pla='请输入获奖等级';
			break;
			case 'awardLevel':pla='请输入获奖级别';
			break;
			case 'awardTime':pla='请输入获奖时间';
			break;
			case 'worksName':pla='请输入著作（专著）名称';
			break;
			case 'worksType':pla='请输入著作类别';
			break;
			case 'worksPress':pla='请输入出版社';
			break;
			case 'worksISBN':pla='请输入ISBN';
			break;
			case 'workspressTime':pla='请输入出版时间';
			break;
			case 'worksResult':pla='请输入入选情况';
			break;
			case 'worksDate':pla='请输入入选时间';
			break;
			case 'worksAuthority':pla='请输入主编（作者）';
			break;
			case 'paperName':pla='请输入论文名称';
			break;
			case 'paperType':pla='请输入论文类别';
			break;
			case 'paperJoural':pla='请输入发表期刊';
			break;
			case 'paperIssue':pla='请输入期号';
			break;
			case 'papaerIncludedSituation':pla='请输入收录情况';
			break;
			case 'paperRefenceNum':pla='请输入他引次数';
			break;
			case 'paperWordsNum':pla='请输入成果字数';
			break;
			case 'paperTime':pla='请输入发表时间';
			break;
			case 'patentName':pla='请输入专利名称';
			break;
			case 'patentType':pla='请输入专利类型';
			break;
			case 'paperlisenceNum':pla='请输入授权号';
			break;
			case 'patentTime':pla='请输入获奖时间';
			break;
			case 'projectName':pla='请输入项目名称';
			break;
			case 'projectType':pla='请输入项目类型';
			break;
			case 'projectOrigin':pla='请输入项目来源';
			break;
			case 'projectMenbers':pla='请输入成员';
			break;
			case 'projectTime':pla='请输入立项时间';
			break;
			case 'projectcheckTime':pla='请输入结题验收时间';
			break;
			default:
				break;
		}
		if($("#Inputu"+$(this).val()).length>0){
			return;
		}else{
			$("#search").append('<div id="Inputu'+$(this).val()+'" class="input_div  form-group">'+
					'<input type="text"  placeholder="'+pla+'" class="form-control"/>'+
					'<button class="btn btn-primary">取消</button></div>')
			
		
		}
	/*$("#Input"+content).show().addClass("After_div")*/
	$('.input_div button').click(function(){
		$(this).parent().remove();
	});
	 /*$(document).on("click",".input_div button",function(){
		 $(this).parent().remove();
	 })*/
	})
}

$(function(){
		 /*  输入身份证号自动填入性别，出生日期     */
		$(document).on("blur",".card_num",function(){
			var reg=/^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/; 
						var card_num = $(".card_num").val();
							
						if(reg.test(card_num) === false){
							$(this).addClass('error_form ').val("");
						}else{
						if(parseInt(card_num.substr(16, 1)) % 2 == 1) {
							$(".sele").find("option[value='男']").attr("selected", "selected");
							//是男则执行代码 ...
						} else {
							$(".sele").find("option[value='女']").attr("selected", "selected");
							//是女则执行代码 ...
						}
						$(".bir").val(card_num.substring(6, 10) + "-" + card_num.substring(10, 12) + "-" + card_num.substring(12, 14));
						}
		});
		
		
		$(document).on("keyup",".card_num",function(event){
				if(event.keyCode == 13) {
							var reg=/^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
							var card_num = $(".card_num").val();
							if(reg.test(card_num) === false){
								$(this).val("");
							}else{
								
							
							if(parseInt(card_num.substr(16, 1)) % 2 == 1) {
								$(".sele").find("option[value='男']").attr("selected", "selected");
								//是男则执行代码 ...
							} else {
								$(".sele").find("option[value='女']").attr("selected", "selected");
								//是女则执行代码 ...
							}
							$(".bir").val(card_num.substring(6, 10) + "-" + card_num.substring(10, 12) + "-" + card_num.substring(12, 14));
							}
							}
					})	
					
		})
	 
function time(){
	!function() {
			laydate.skin('danlan'); //切换皮肤，请查看skins下面皮肤库
			laydate({
				elem : '#panel-body .laydate-icon'//如何在ajax内获取
			}); //绑定元素
		
		}();
		//日期范围限制
		var start = {
			elem : '#start',
			format : 'YYYY-MM-DD',
			min : laydate.now(), //设定最小日期为当前日期
			max : '2099-06-16', //最大日期
			istime : true,
			istoday : false,
			choose : function(datas) {
				end.min = datas; //开始日选好后，重置结束日的最小日期
				end.start = datas //将结束日的初始值设定为开始日
			}
		};
	
		var end = {
			elem : '#end',
			format : 'YYYY-MM-DD',
			min : laydate.now(),
			max : '2099-06-16',
			istime : true,
			istoday : false,
			choose : function(datas) {
				start.max = datas; //结束日选好后，充值开始日的最大日期
			}
		};
		laydate(start);
		laydate(end);
}

