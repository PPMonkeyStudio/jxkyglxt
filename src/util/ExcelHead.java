package util;

public class ExcelHead {
	private final static String[] TeacherAward = { "奖励ID", "用户工号", "获奖作品名称", "奖励名称", "获奖者姓名", "获奖者工号", "奖励类型", "获奖类别",
			"获奖等级", "获奖级别", "获奖时间", "获奖证书编号", "授予单位", "附件地址", "数据状态", "创建时间" };

	private final static String[] TeacherInfo = { "教职工信息ID", "用户工号", "证件类型", "证件号码", "名族", "国籍", "港澳台", "华侨", "政治面貌",
			"性别", "出生年月", "最高学历", "最高学位", "学缘", "专业技术职称", "职称级别", "学科类别", "参加工作时间", "入校时间", "教师资格证号", "授课类型", "授课状态",
			"任教专业名称", "任教专业代码", "专业任教时间", "是否实验技术人员", "是否双师型", "是否工程背景", "是否行业背景", "行政职务级别", "研究生导师类型", "校内指导博士生人数",
			"校内指导研究生人数", "职工类型", "录用类型", "任职状态", "异动类型", "高校调入", "本校毕业", "本校调整", "校外教师类型", "数据状态", "创建时间" };

	private final static String[] TeacherPaper = { "论文ID", "用户工号", "论文名称", "作者", "作者工号_排名", "论文类别", "发表期刊", "期号",
			"发表日期", "收录情况", "他引次数", "是否与行业联合发表", "是否与地方联合发表", "是否与国际联合发表", "是否是跨学科论文", "成果字数（千字）", "附件地址", "数据状态",
			"创建时间" };

	private final static String[] TeacherPatent = { "专利ID", "用户ID", "作者", "作者工号_排名", "专利类型", "授权号", "获批日期", "是否应用",
			"是否行业联合专利（著作权）", "数据状态", "获奖时间", "创建时间" };

	private final static String[] TeacherProject = { "项目ID", "用户ID", "项目名称", "项目来源", "成员姓名", "成员工号_排名", "立项编号或批准文号",
			"项目类别", "立项日期", "结题验收或鉴定日期", "经费(万元)", "参与教师数", "级别", "是否重点", "附件地址", "数据状态", "创建时间" };

	private final static String[] TeacherWorks = { "著作ID", "用户ID", "著作（专著）名称", "著作类别", "出版社", "ISBN", "出版时间", "入选情况",
			"入选时间", "主编（作者）", "主编工号（多个以逗号隔开）_排名", "副主编", "副主编工号（多个以逗号隔开）_排名", "参编", "参编工号（多个以逗号隔开）_排名", "数据状态",
			"创建时间" };

	public static String[] getExcelHeadArray(String str) {
		String[] st = null;
		if ("TeacherAward".equals(str)) {
			st = TeacherAward;
		} else if ("TeacherInfo".equals(str)) {
			st = TeacherInfo;
		} else if ("TeacherPaper".equals(str)) {
			st = TeacherPaper;
		} else if ("TeacherPatent".equals(str)) {
			st = TeacherPatent;
		} else if ("TeacherProject".equals(str)) {
			st = TeacherProject;
		} else if ("TeacherWorks".equals(str)) {
			st = TeacherWorks;
		}
		return st;
	}
}
