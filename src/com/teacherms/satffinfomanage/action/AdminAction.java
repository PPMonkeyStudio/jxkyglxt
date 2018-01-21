package com.teacherms.satffinfomanage.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.teacherms.all.domain.TeacherAward;
import com.teacherms.all.domain.TeacherInfo;
import com.teacherms.all.domain.TeacherPaper;
import com.teacherms.all.domain.TeacherPatent;
import com.teacherms.all.domain.TeacherProject;
import com.teacherms.all.domain.TeacherWorks;
import com.teacherms.all.domain.User;
import com.teacherms.satffinfomanage.vo.TableInfoAndUserVo;
import com.teacherms.staffinfomanage.service.AdminService;

import util.ExcelHead;
import util.ExcelToBean2;
import util.ExportExcelCollection;
import util.MapUtil;
import util.PageVO;

public class AdminAction extends ActionSupport {
	private AdminService adminService;

	// 导出
	private String export_name;// 导出execl表的属性条件,逗号隔开
	private String export_id;// 导出execl表的ID字段条件,逗号隔开

	// 附件
	private File file; // execl文件
	private String fileFileName; // file+FileName为固定写法,否则取不到
	private String fileContentType; // file+ContentType为固定写法

	// 信息筛选查询
	private String time_interval;// 时间区间,逗号隔开
	private String page;// 分页
	private String tableName;// 查询的表名
	private String tableId; // 查询表的ID
	private String dataState; // 数据状态
	private String fuzzy_query;// 模糊查询字段

	// 信息表
	private TeacherAward teacherAward;
	private TeacherInfo teacherInfo;
	private TeacherPaper teacherPaper;
	private TeacherPatent teacherPatent;
	private TeacherProject teacherProject;
	private TeacherWorks teacherWorks;
	private User user;
	private Object obj;

	public String test() {
		System.out.println("yes");
		return "test";
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	// 分页查询获取指定---未审核or固化---信息（给指定参数）并进行时间排序（属于自己学院的信息）
	public void getSpecifiedInformationByPaging() {
		try {
			// 给Object对象赋值
			getObjectByTableName(tableName);
			System.out.println("" + obj.toString());
			PageVO<Object> list = adminService.getSpecifiedInformationByPaging(tableName, page == null ? "1" : page,
					time_interval, dataState, getSecondaryCollegeInfo("name"), obj, fuzzy_query);
			System.out.println(new Gson().toJson(list));
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().write(new Gson().toJson(list));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 通过ID获取单条信息
	public void getTeacherTableInfoById() {
		try {
			TableInfoAndUserVo list = adminService.getTeacherTableInfoById(tableName, tableId);
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().write(new Gson().toJson(list));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 添加教职工信息
	public void addTeacherInfo() {
		try {
			System.out.println(teacherInfo.toString());
			String result = adminService.addTeacherInfo(teacherInfo, getSecondaryCollegeInfo("id"));
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().write("{\"result\":\"" + result + "\"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 管理员修改信息状态+修改信息内容
	public void modifiedInfomation() {
		try {
			// 给Object对象赋值
			getObjectByTableName(tableName);

			String result = adminService.curingInfomation(obj);
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().write("{\"result\":\"" + result + "\"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 管理员解除固化
	public void LiftCuring() {
		try {
			String result = adminService.adminLiftCuring(tableName, tableId, dataState);
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().write("{\"result\":\"" + result + "\"}");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 管理员获取输入用户名字，获取用户的id排名
	public void getUserIdOrderingByUserName() {
		try {
			String result = adminService.getUserIdOrderingByUserName(user.getUserName());
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().write("{\"result\":\"" + result + "\"}");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 导出信息excel表 用MAP集合
	public void ExportExcelCollection() {
		System.out.println(export_name + tableName + export_id);
		XSSFWorkbook workbook = adminService.getExcel(export_name, tableName, export_id);
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

	// execl信息表导入到数据库
	@SuppressWarnings("unchecked")
	public void importDatabase() {
		try {
			FileInputStream is = new FileInputStream(file);
			String propertiesName = null;
			System.out.println(fileFileName);
			System.out.println(fileContentType);
			Class cla = null;
			if (fileFileName.contains("奖励")) {
				propertiesName = "z_teacher_award";
				cla = TeacherAward.class;
			} else if (fileFileName.contains("信息")) {
				propertiesName = "z_teacher_info";
				cla = TeacherInfo.class;
			} else if (fileFileName.contains("论文")) {
				propertiesName = "z_teacher_paper";
				cla = TeacherPaper.class;
			} else if (fileFileName.contains("专利")) {
				propertiesName = "z_teacher_patent";
				cla = TeacherPatent.class;
			} else if (fileFileName.contains("项目")) {
				propertiesName = "z_teacher_project";
				cla = TeacherProject.class;
			} else if (fileFileName.contains("著作")) {
				propertiesName = "z_teacher_works";
				cla = TeacherWorks.class;
			} else {
			}
			XSSFWorkbook workbook = new XSSFWorkbook(is);

			List<Object> list = ExcelToBean2.toObjectPerproList(
					ExcelToBean2.parseUpdateExcel(workbook, "com.teacherms.all.domain." + propertiesName), cla);
			adminService.addinfo(list);
		} catch (Error e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getSecondaryCollegeInfo(String what) {
		User user = (User) ActionContext.getContext().getSession().get("user");
		return adminService.getDepartmentNameByDepartmentId(user.getDepartmentId(), what);

	}

	// 通过tablename来判断给信息对象赋值
	private void getObjectByTableName(String tableName) {
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
	}

	/*
	 * public void gethtml() { try { String path =
	 * ServletActionContext.getServletContext().getRealPath("/"); File html =
	 * new File(path + "WEB-INF/views/myhtml.jsp"); InputStream in = new
	 * FileInputStream(html); byte[] fileimg = new byte[1024 * 1024];
	 * in.read(fileimg); HttpServletResponse response =
	 * ServletActionContext.getResponse(); OutputStream out =
	 * response.getOutputStream();
	 * response.setContentType("html;charset=UTF-8"); out.write(fileimg);
	 * out.flush(); out.close(); } catch (FileNotFoundException e) {
	 * e.printStackTrace(); } catch (IOException e) { e.printStackTrace(); } }
	 */

	public void setPage(String page) {
		this.page = page;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public void setTableId(String tableId) {
		this.tableId = tableId;
	}

	public void setTeacherInfo(TeacherInfo teacherInfo) {
		this.teacherInfo = teacherInfo;
	}

	public void setDataState(String dataState) {
		this.dataState = dataState;
	}

	public void setTime_interval(String time_interval) {
		this.time_interval = time_interval;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public void setTeacherAward(TeacherAward teacherAward) {
		this.teacherAward = teacherAward;
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

	public void setUser(User user) {
		this.user = user;
	}

	public AdminService getAdminService() {
		return adminService;
	}

	public String getTime_interval() {
		return time_interval;
	}

	public File getFile() {
		return file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public String getPage() {
		return page;
	}

	public String getTableName() {
		return tableName;
	}

	public String getTableId() {
		return tableId;
	}

	public String getDataState() {
		return dataState;
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

	public User getUser() {
		return user;
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

	public void setFuzzy_query(String fuzzy_query) {
		this.fuzzy_query = fuzzy_query;
	}

}
