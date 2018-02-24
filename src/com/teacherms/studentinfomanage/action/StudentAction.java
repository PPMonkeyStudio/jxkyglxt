package com.teacherms.studentinfomanage.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.teacherms.all.domain.User;
import com.teacherms.studentinfomanage.service.StudentService;

public class StudentAction extends ActionSupport {

	private StudentService studentService;

	private User sessionuser;

	public StudentAction() {
		sessionuser = (User) ActionContext.getContext().getSession().get("user");
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

}
