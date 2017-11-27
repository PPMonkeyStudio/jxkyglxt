package com.teacherms.system.action;

import java.io.IOException;
import org.apache.struts2.ServletActionContext;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.teacherms.all.domain.User;
import com.teacherms.system.TAB.Admin_NavigationTAB;
import com.teacherms.system.TAB.Teacher_NavigationTAB;
import com.teacherms.system.service.SystemService;

public class SystemAction extends ActionSupport {
	private SystemService systemService;
	private String user_id; // 登陆帐号
	private String password; // 登录密码

	// 进行登录的判断
	public void login() {
		try {
			Object result = systemService.login(user_id, password);
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			if (result instanceof String) {
				ServletActionContext.getResponse().getWriter().write("{\"result\":\"" + result.toString() + "\"}");
			} else {
				// 通过角色ID获取角色名称
				String rolename = systemService.getUserRoleNameByRoleId(((User) result).getRoleId());
				ActionContext.getContext().getSession().put("role", rolename);
				ActionContext.getContext().getSession().put("user", (User) result);
				ServletActionContext.getResponse().getWriter().write("{\"result\":\"success\"}");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	// 获得顶部导航标签
	public void getTheTopNavigationTAB() {
		try {
			User user = (User) ActionContext.getContext().getSession().get("user");
			// 通过角色ID获取角色名称
			String rolename = systemService.getUserRoleNameByRoleId(user.getRoleId());
			System.out.println(rolename);
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			if ("教职工".equals(rolename)) {
				ServletActionContext.getResponse().getWriter().write(new Gson().toJson(new Teacher_NavigationTAB()));
			} else if ("院系管理员".equals(rolename)) {
				ServletActionContext.getResponse().getWriter().write(new Gson().toJson(new Admin_NavigationTAB()));
			} else {
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void getNowUserRoleName() {
		// 通过角色ID获取角色名称
		try {
			User user = (User) ActionContext.getContext().getSession().get("user");
			String rolename = systemService.getUserRoleNameByRoleId(user.getRoleId());
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().write("{\"result\":\"" + rolename + "\"}");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 退出登录
	public String exit() {
		ActionContext.getContext().getSession().remove("user");
		return "exit";
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public SystemService getSystemService() {
		return systemService;
	}

	public void setSystemService(SystemService systemService) {
		this.systemService = systemService;
	}

}
