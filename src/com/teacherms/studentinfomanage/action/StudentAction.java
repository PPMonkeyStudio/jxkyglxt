package com.teacherms.studentinfomanage.action;

import java.util.List;

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

/**
 * @author Administrator
 *
 */
/**
 * @author Administrator
 *
 */
/**
 * @author Administrator
 *
 */
public class StudentAction extends ActionSupport {

	private StudentService studentService;

	private String tableName;
	private StudentInfo studentInfo;
	private StudentAward studentAward;
	private StudentPatent studentPatent;
	private StudentProject studentProject;
	private StudentClass studentClass;
	private StudentPaper studentPaper;

	private User sessionuser;

	public StudentAction() {
		sessionuser = (User) ActionContext.getContext().getSession().get("user");
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
			List<StudentInfoAndOtherInfo> list = studentService.getStudentAllInfo(tableName);
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().write(new Gson().toJson(list));
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

	public void setTableName(String tableName) {
		this.tableName = tableName;
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

}
