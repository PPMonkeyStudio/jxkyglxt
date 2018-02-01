package com.teacherms.studentinfomanage.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.teacherms.all.domain.User;

public class StudentAction extends ActionSupport {

	private User sessionuser;
	
	public StudentAction(){
		sessionuser = (User) ActionContext.getContext().getSession().get("user");
	}
}
