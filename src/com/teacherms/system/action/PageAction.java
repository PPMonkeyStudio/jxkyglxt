package com.teacherms.system.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PageAction extends ActionSupport {
	// 页面跳转到index.jsp
	public String page_index() {
		return "page_index";
	}

	// 导入导航栏
	public String page_nav() {
		return "page_nav";
	}

	// 页面跳转到teacher_award.jsp
	public String page_teacher_award() {
		ActionContext.getContext().getValueStack().set("page", "teacher");
		return "page_teacher_award";
	}

	// 页面跳转到teacher_works.jsp
	public String page_teacher_works() {
		ActionContext.getContext().getValueStack().set("page", "teacher");
		return "page_teacher_works";
	}

	// 页面跳转到teacher_patent.jsp
	public String page_teacher_patent() {
		ActionContext.getContext().getValueStack().set("page", "teacher");
		return "page_teacher_patent";
	}

	// 页面跳转到teacher_info.jsp
	public String page_teacher_info() {
		ActionContext.getContext().getValueStack().set("page", "teacher");
		return "page_teacher_info";
	}

	// 页面跳转到teacher_project.jsp
	public String page_teacher_project() {
		ActionContext.getContext().getValueStack().set("page", "teacher");
		return "page_teacher_project";
	}

	// 页面跳转到teacher_project.jsp
	public String page_teacher_paper() {
		ActionContext.getContext().getValueStack().set("page", "teacher");
		return "page_teacher_paper";
	}

	// 页面跳转到exam_award.jsp
	public String page_exam_award() {
		ActionContext.getContext().getValueStack().set("page", "exam");
		return "page_exam_award";
	}

	// 页面跳转到page_exam_works.jsp
	public String page_exam_works() {
		ActionContext.getContext().getValueStack().set("page", "exam");
		return "page_exam_works";
	}

	// 页面跳转到page_exam_patent.jsp
	public String page_exam_patent() {
		ActionContext.getContext().getValueStack().set("page", "exam");
		return "page_exam_patent";
	}

	// 页面跳转到page_exam_user.jsp
	public String page_exam_user() {
		ActionContext.getContext().getValueStack().set("page", "exam");
		return "page_exam_user";
	}

	// 页面跳转到page_exam_project.jsp
	public String page_exam_project() {
		ActionContext.getContext().getValueStack().set("page", "exam");
		return "page_exam_project";
	}

	// 页面跳转到page_exam_paper.jsp
	public String page_exam_paper() {
		ActionContext.getContext().getValueStack().set("page", "exam");
		return "page_exam_paper";
	}

	// 页面跳转到page_user_award.jsp
	public String page_user_award() {
		ActionContext.getContext().getValueStack().set("page", "user");
		return "page_user_award";
	}

	// 页面跳转到page_user_works.jsp
	public String page_user_works() {
		ActionContext.getContext().getValueStack().set("page", "user");
		return "page_user_works";
	}

	// 页面跳转到page_user_patent.jsp
	public String page_user_patent() {
		ActionContext.getContext().getValueStack().set("page", "user");
		return "page_user_patent";
	}

	// 页面跳转到page_user_info.jsp
	public String page_user_info() {
		ActionContext.getContext().getValueStack().set("page", "user");
		return "page_user_info";
	}

	// 页面跳转到page_user_project.jsp
	public String page_user_project() {
		ActionContext.getContext().getValueStack().set("page", "user");
		return "page_user_project";
	}

	// 页面跳转到page_user_paper.jsp
	public String page_user_paper() {
		ActionContext.getContext().getValueStack().set("page", "user");
		return "page_user_paper";
	}
}
