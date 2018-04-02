package com.teacherms.studentinfomanage.action;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.teacherms.all.domain.StudentAward;
import com.teacherms.all.domain.StudentClass;
import com.teacherms.all.domain.StudentInfo;
import com.teacherms.all.domain.StudentPaper;
import com.teacherms.all.domain.StudentPatent;
import com.teacherms.all.domain.StudentProject;
import com.teacherms.all.domain.User;
import com.teacherms.studentinfomanage.service.StudentService;
import com.teacherms.studentinfomanage.vo.StudentInfoAndOtherInfo;

import util.PageVO;

public class StudentAction extends ActionSupport {

	// 导出
	private String export_name;// 导出execl表的属性条件,逗号隔开
	private String export_id;// 导出execl表的ID字段条件,逗号隔开

	// 信息筛选查询
	private String time_interval;// 时间区间,逗号隔开
	private String page;// 分页
	private String tableName;// 查询的表名
	private String tableId; // 查询表的ID
	private String dataState; // 数据状态
	private String fuzzy_query;// 模糊查询字段

	// 注入
	private StudentService studentService;

	private StudentInfo studentInfo;
	private StudentAward studentAward;
	private StudentPatent studentPatent;
	private StudentProject studentProject;
	private StudentClass studentClass;
	private StudentPaper studentPaper;

	private User sessionuser;

	public StudentAction() {
		sessionuser = (User) ActionContext.getContext().getSession().get("loginuser");
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	// getInfoClassBytableName()执行返回后参数为对象，通过tableName获取，以下称返回的对象为object0
	/**
	 * 保存学生信息 object0内该包含日期，主键除外外的其他信息
	 */
	public void setStudentAllInfo() {
		try {
			String msg = studentService.setStudentAllInfo(getInfoObjectBytableName());
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().write("{\"result\":\"" + msg + "\"}");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 删除学生信息 object0内至少id应当含有
	 */
	public void deleteStudentAllInfo() {
		try {
			String msg = studentService.deleteStudentInfo(getInfoObjectBytableName());
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().write("{\"result\":\"" + msg + "\"}");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 更新学生信息 object0内至少id应当含有全部信息
	 */
	public void updateStudentAllInfo() {
		try {
			String msg = studentService.updateStudentAllInfo(getInfoObjectBytableName());
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().write("{\"result\":\"" + msg + "\"}");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取学生信息（所有） 通过tableName辨别需要获取什么信息
	 */
	public void getStudentAllInfo() {
		try {
			PageVO<StudentInfoAndOtherInfo> pageVo = studentService.getStudentAllInfo(tableName, page);
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().write(new Gson().toJson(pageVo));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取学生信息（单个） object0内至少表id和studentId应当含有
	 */
	public void getStudentOneInfo() {
		try {
			StudentInfoAndOtherInfo obj = studentService.getStudentOneInfo(getInfoObjectBytableName());
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().write(new Gson().toJson(obj));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private Object getInfoObjectBytableName() {
		switch (this.tableName) {
		case "StudentInfo":
			return studentInfo;
		case "StudentPaper":
			return studentPaper;
		case "StudentPatent":
			return studentPatent;
		case "StudentProject":
			return studentProject;
		case "StudentAward":
			return studentAward;
		case "StudentClass":
			return studentClass;
		default:
			return null;
		}
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public StudentInfo getStudentInfo() {
		return studentInfo;
	}

	public void setStudentInfo(StudentInfo studentInfo) {
		this.studentInfo = studentInfo;
	}

	public StudentAward getStudentAward() {
		return studentAward;
	}

	public void setStudentAward(StudentAward studentAward) {
		this.studentAward = studentAward;
	}

	public StudentPatent getStudentPatent() {
		return studentPatent;
	}

	public void setStudentPatent(StudentPatent studentPatent) {
		this.studentPatent = studentPatent;
	}

	public StudentProject getStudentProject() {
		return studentProject;
	}

	public void setStudentProject(StudentProject studentProject) {
		this.studentProject = studentProject;
	}

	public StudentClass getStudentClass() {
		return studentClass;
	}

	public void setStudentClass(StudentClass studentClass) {
		this.studentClass = studentClass;
	}

	public StudentPaper getStudentPaper() {
		return studentPaper;
	}

	public void setStudentPaper(StudentPaper studentPaper) {
		this.studentPaper = studentPaper;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getExport_name() {
		return export_name;
	}

	public void setExport_name(String export_name) {
		this.export_name = export_name;
	}

	public String getExport_id() {
		return export_id;
	}

	public void setExport_id(String export_id) {
		this.export_id = export_id;
	}

	public String getTime_interval() {
		return time_interval;
	}

	public void setTime_interval(String time_interval) {
		this.time_interval = time_interval;
	}

	public String getTableId() {
		return tableId;
	}

	public void setTableId(String tableId) {
		this.tableId = tableId;
	}

	public String getDataState() {
		return dataState;
	}

	public void setDataState(String dataState) {
		this.dataState = dataState;
	}

	public String getFuzzy_query() {
		return fuzzy_query;
	}

	public void setFuzzy_query(String fuzzy_query) {
		this.fuzzy_query = fuzzy_query;
	}

	public User getSessionuser() {
		return sessionuser;
	}

	public void setSessionuser(User sessionuser) {
		this.sessionuser = sessionuser;
	}

	public String getPage() {
		return page;
	}

	public String getTableName() {
		return tableName;
	}

	public StudentService getStudentService() {
		return studentService;
	}

}
