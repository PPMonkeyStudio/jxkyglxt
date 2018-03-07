package com.teacherms.system.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.teacherms.all.domain.User;
import com.teacherms.system.TAB.Admin_NavigationTAB;
import com.teacherms.system.TAB.Teacher_NavigationTAB;
import com.teacherms.system.service.SystemService;

import com.teacherms.all.domain.*;

public class SystemAction extends ActionSupport {
	private SystemService systemService;
	private String user_id; // 登陆帐号
	private String password; // 登录密码
	private User user;// 用户信息
	private String attachmentName;
	private final String propertiesPath = ResourceBundle.getBundle("_path").getString("filePath");

	// 进行登录的判断
	public void login() {
		try {
			Object result = systemService.login(user_id, password);
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			if (result instanceof String) {
				ServletActionContext.getResponse().getWriter().write("{\"result\":\"" + result.toString() + "\"}");
			} else {
				if (null != ActionContext.getContext().getSession().get("user")) {
					exit();
				}
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

	// 获得登录用户的帐号信息
	public void getAccountInformation() {
		try {
			User user = (User) ActionContext.getContext().getSession().get("user");
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().write(new Gson().toJson(user));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 获得首页教师信息
	public void getIntroduction() {
		try {
			User user = (User) ActionContext.getContext().getSession().get("user");
			// 通过角色ID获取角色名称
			String rolename = systemService.getUserRoleNameByRoleId(user.getRoleId());
			List<Introduction> list = systemService.getIntroduction(user.getDepartmentId());
			ServletActionContext.getRequest().setAttribute("Introductions", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 通过角色ID获取角色名称
	public void getNowUserRoleName() {
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

	// 用户修改信息
	public void modifyUserInfo() {
		try {
			User u = systemService.modifyPassword(user, (User) ActionContext.getContext().getSession().get("user"));
			ActionContext.getContext().getSession().remove("user");
			ActionContext.getContext().getSession().put("user", u);
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().write("{\"result\":\"" + u.getUserName() + "\"}");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 查看图片
	public void Attachment() {
		System.out.println("获取图片");
		HttpServletResponse response = ServletActionContext.getResponse();
		String[] img_name = attachmentName.split("!");
		System.out.println(img_name.length);
		System.out.println(img_name[0]);
		System.out.println(img_name[1]);
		try {
			User u = (User) ActionContext.getContext().getSession().get("user");
			File file = new File(propertiesPath + u.getUserId() + "/" + img_name[1] + "/" + img_name[0]);
			InputStream fis = new BufferedInputStream(new FileInputStream(file));
			byte[] buffer = new byte[fis.available()];
			fis.read(buffer);
			fis.close();
			response.setContentType("image/png");
			OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
			toClient.write(buffer);
			toClient.flush();
			toClient.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setAttachmentName(String attachmentName) {
		this.attachmentName = attachmentName;
	}

}
