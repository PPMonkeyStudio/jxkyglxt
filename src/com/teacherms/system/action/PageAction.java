package com.teacherms.system.action;

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

}