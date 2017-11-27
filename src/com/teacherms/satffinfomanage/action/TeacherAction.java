package com.teacherms.satffinfomanage.action;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.junit.Test;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.annotations.Before;
import com.teacherms.all.domain.TeacherAward;
import com.teacherms.all.domain.TeacherInfo;
import com.teacherms.all.domain.TeacherPaper;
import com.teacherms.all.domain.TeacherPatent;
import com.teacherms.all.domain.TeacherProject;
import com.teacherms.all.domain.TeacherWorks;
import com.teacherms.all.domain.User;
import com.teacherms.staffinfomanage.service.TeacherService;

import util.*;

public class TeacherAction extends ActionSupport {
	private TeacherService teacherService;
	private static User sessionuser;



	private String query_name;// 导出execl表的属性条件,逗号隔开
	private String query_id;// 导出execl表的ID字段条件,逗号隔开
	private String time_interval;// 时间区间

	private String page; // 分页
	private String tableName;// 查询的表名
	private String tableId; // 查询表的ID
	private String dataState; // 数据状态

	private String username;

	// 信息表
	private TeacherAward teacherAward;
	private TeacherInfo teacherInfo;
	private TeacherPaper teacherPaper;
	private TeacherPatent teacherPatent;
	private TeacherProject teacherProject;
	private TeacherWorks teacherWorks;
	private User user;

	
	
	
	public TeacherAction() {
		sessionuser = (User) ActionContext.getContext().getSession().get("user");
	}

	// 教职工分页获取指定的信息
	public void userGetTableInfoInPaging() {
		try {
			PageVO<Object[]> listAdmin = teacherService.getTableInfoInPaging(sessionuser.getUserId(), tableName,
					page == null ? "1" : page, time_interval);
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().write(new Gson().toJson(listAdmin));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 用户通过信息表ID获取单条信息
	public void userGetTableInfoByTableId() {
		try {
			List<Object[]> list = teacherService.userGetTableInfoByTableId(tableName, tableId);
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().write(new Gson().toJson(list));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// ---用户获取自己的全部教职工信息
	public void userGetTeacherInfo() {
		try {
			List<Object[]> teacherInfo = teacherService.userGetTeacherInfo(sessionuser.getUserId());
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().write(new Gson().toJson(teacherInfo));
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 用户修改添加信息
	public void userSetTableInfo() {
		try {
			Object obj = null;
			if (("TeacherAward").equals(tableName)) {
				obj = teacherAward;
			} else if (("TeacherInfo").equals(tableName)) {
				obj = teacherInfo;
			} else if (("TeacherPaper").equals(tableName)) {
				obj = teacherPaper;
			} else if (("TeacherPatent").equals(tableName)) {
				obj = teacherPatent;
			} else if (("TeacherProject").equals(tableName)) {
				obj = teacherProject;
			} else if (("TeacherWorks").equals(tableName)) {
				obj = teacherWorks;
			} else {
				return;
			}
			String result = teacherService.addTableInfo(sessionuser.getUserId(), obj, tableName);
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().write("{\"result\":\"" + result + "\"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 用户提交信息至管理员审核(除基本信息外)
	public void userPuchInfoToadmin() {
		try {
			String result = teacherService.PuchInfoToadmin(tableName, tableId);
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().write("{\"result\":\"" + result + "\"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 用户提交基本信息补全并将信息状态修改至管理员审核状态
	public void userCompleteBasicInformation() {
		try {
			String result = teacherService.completeBasicInformation(teacherInfo, sessionuser.getUserId(), username);
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().write("{\"result\":\"" + result + "\"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void userGetUserName() {
		try {
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().write("{\"result\":\"" + sessionuser.getUserName() + "\"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 导出信息excel表 用MAP集合
	public void userExportExcelCollection() {
		XSSFWorkbook workbook = teacherService.getExcel(query_name, tableName, query_id);
		OutputStream out = null;
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			out = response.getOutputStream();
			response.setHeader("Content-disposition", "attachment; filename=" + tableName + ".xls");// filename是下载的xls的名，建议最好用英文
			response.setContentType("application/msexcel;charset=UTF-8");// 设置类型
			response.setHeader("Pragma", "No-cache");// 设置头
			response.setHeader("Cache-Control", "no-cache");// 设置头
			response.setDateHeader("Expires", 0);// 设置日期头
			workbook.write(out);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}

	public void setTeacherAward(TeacherAward teacherAward) {
		this.teacherAward = teacherAward;
	}

	public void setTeacherInfo(TeacherInfo teacherInfo) {
		this.teacherInfo = teacherInfo;
	}

	public void setTeacherPaper(TeacherPaper teacherPaper) {
		this.teacherPaper = teacherPaper;
	}

	public void setTeacherPatent(TeacherPatent teacherPatent) {
		this.teacherPatent = teacherPatent;
	}

	public void setTeacherProject(TeacherProject teacherProject) {
		this.teacherProject = teacherProject;
	}

	public void setTeacherWorks(TeacherWorks teacherWorks) {
		this.teacherWorks = teacherWorks;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public void setTableId(String tableId) {
		this.tableId = tableId;
	}

	public void setQuery_name(String query_name) {
		this.query_name = query_name;
	}

	public void setQuery_id(String query_id) {
		this.query_id = query_id;
	}

	public User getUser() {
		return user;
	}

	public void setTime_interval(String time_interval) {
		this.time_interval = time_interval;
	}

	public void setDataState(String dataState) {
		this.dataState = dataState;
	}

	public TeacherAward getTeacherAward() {
		return teacherAward;
	}

	public TeacherInfo getTeacherInfo() {
		return teacherInfo;
	}

	public TeacherPaper getTeacherPaper() {
		return teacherPaper;
	}

	public TeacherPatent getTeacherPatent() {
		return teacherPatent;
	}

	public TeacherProject getTeacherProject() {
		return teacherProject;
	}

	public TeacherWorks getTeacherWorks() {
		return teacherWorks;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}
