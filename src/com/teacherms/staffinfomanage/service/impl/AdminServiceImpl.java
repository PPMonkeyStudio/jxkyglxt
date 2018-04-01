package com.teacherms.staffinfomanage.service.impl;

import java.util.*;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.lang.reflect.Field;
import com.teacherms.all.domain.*;
import com.teacherms.satffinfomanage.dao.AdminDao;
import com.teacherms.satffinfomanage.vo.TableInfoAndUserVo;
import com.teacherms.staffinfomanage.service.AdminService;

import util.ExcelHead;
import util.ExportExcelCollection;
import util.MapUtil;
import util.PageVO;
import util.TimeUtil;
import util.md5;
import util.uuid;

public class AdminServiceImpl implements AdminService {
	private AdminDao adminDao;

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	@Override
	public void addinfo(List<Object> list) {
		try {
			for (Object obj : list) {
				Field f = obj.getClass().getDeclaredFields()[0];
				f.setAccessible(true);
				f.set(obj, uuid.getUuid());
				adminDao.addInfo(obj);
			}
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
	}

	@Override
	public PageVO<Object> getSpecifiedInformationByPaging(String tableName, String page, String time_interval,
			String dataState, String collegeName, Object obj, User user, String fuzzy_query) {
		// 每页记录数
		int pageSize = 10;
		// 页数
		int pageIndex = Integer.parseInt(page);
		// 查询长度
		int toindex = pageSize;
		// 创建list
		List<Object> list = new ArrayList<Object>();
		// 设置查询时间区间，如果time_interval为空则不执行
		if (!"".equals(time_interval) && time_interval != null) {
			time_interval = "and t.createTime between '" + time_interval.split(",")[0] + "' and '"
					+ time_interval.split(",")[1] + "'";
		}
		// 条件查询块----------------
		boolean haveMulti_condition = false;// 是否包含指定查询的内容,用来判断是否执行模糊查询
		StringBuilder Multi_condition = new StringBuilder();// 指定查询中的字符串
		StringBuffer fuzzy = new StringBuffer();// 模糊查询字符串
		fuzzy.append(" and (");// （模糊查询中or与and混合使用）or使用前先添加and
		String field_value = "";// 属性中的值
		String field_name = "";// 属性名字
		// 多条件查询
		try {
			Field[] fields = obj.getClass().getDeclaredFields();
			for (Field field : fields) {
				field.setAccessible(true);
				field_name = field.getName();
				field_value = (String) field.get(obj);
				// 模糊查询
				fuzzy.append(" or t." + field_name + " like '%" + fuzzy_query + "%'");
				// 属性值为空则跳过本次循环
				if ("".equals(field_value) || null == field_value) {
					continue;
				}
				// 判断是否为时间区间
				if (field_name.contains("Date")) {
					Multi_condition.append(" and t." + field_name + " between " + field_value.split(",")[0] + " and "
							+ field_value.split(",")[1]);
				} else {
					Multi_condition.append(" and t." + field_name + "='" + field_value + "'");
				}
				if (!haveMulti_condition) {
					haveMulti_condition = true;
				}
			}
			// 模糊查询用户名称
			fuzzy.append("or u.userName like '%" + fuzzy_query + "%')");
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 用户名字作为单独的一个对象判断
		if (user != null && !"".equals(user.getUserName()) && user.getUserName() != null) {
			Multi_condition.append(" and u.userName='" + user.getUserName() + "' ");
		}
		// 若用户为系统管理员，则查看所有教师的信息
		if ("萍乡学院".equals(collegeName)) {
			collegeName = "%";
		}
		// 最后判断如果fuzzy_query为空或是null，则不做模糊查询
		if (null == fuzzy_query || "".equals(fuzzy_query)) {
			haveMulti_condition = true;
		}
		// 获取所有信息表中未审核的信息
		if (!"".equals(tableName) && tableName != null) {
			// 指定条件tableName查询
			// haveMulti_condition?"":fuzzy.toString().replaceFirst(" or","")
			// 三目运算，如果已经含有了指定查询内容，则不查询模糊查询内容，反则如果模糊查询有值，进行模糊查询
			// 在之前循环过程中，首位添加or，所以第一位or为多余，应当去掉
			list = adminDao.getAllStatusInfo(tableName, time_interval, dataState, collegeName,
					Multi_condition.toString(), haveMulti_condition ? "" : fuzzy.toString().replaceFirst(" or", ""));
		}
		// 总记录数
		int totalSize = list.size();
		// 当所要显示的最大值大于记录数最大值时，每页记录设置为不超过记录数值
		if (pageIndex * pageSize > totalSize) {
			toindex = totalSize - (pageIndex - 1) * pageSize;
		}
		// 设置VO内参数页码，每页记录数，总记录数
		PageVO<Object> pageVO = new PageVO<Object>(pageIndex, pageSize, totalSize);
		pageVO.setObjDatas(list.subList((pageIndex - 1) * pageSize, (pageIndex - 1) * pageSize + toindex));
		return pageVO;
	}

	@Override
	public TableInfoAndUserVo getTeacherTableInfoById(String tableName, String tableId) {
		// list内部的元素为Object(字符串)+Object(字符串)+Object(对象)
		TableInfoAndUserVo vo = adminDao.getInfoById(tableName, getTableInfoIdName(tableName), tableId);
		try {
			Field field = vo.getObject().getClass().getDeclaredFields()[0];
			field.setAccessible(true);
			String infoId = (String) field.get(vo.getObject());
			File[] file = new File(propertiesPath + vo.getUser().getUserId() + "/" + tableName).listFiles();
			List<String> attachmentName = new ArrayList<String>();
			if (file != null) {
				for (File f0 : file) {
					if (f0.getName().indexOf(infoId) > -1) {
						attachmentName.add(f0.getName());
					}
				}
				vo.setAttachmentName(attachmentName);
			}
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			System.out.println("转换错误");
		} catch (IllegalAccessException e) {
			System.out.println("转换错误");
		}
		return vo;
	}

	@Override
	public XSSFWorkbook getExcel(String query_num, String tableName, String query_id) {
		String queryInfo = " where " + getTableInfoIdName(tableName) + " in (";
		if ("".equals(query_id) || null != query_id) {
			int index = 0;
			// 分割所要查询的信息表ID
			String[] exportid_arr = query_id.split(",");
			for (String str : exportid_arr) {
				exportid_arr[index] = "'" + str + "'";
				index++;
			}
			queryInfo += Arrays.toString(exportid_arr).replaceAll("[\\[\\]]", "") + ")";
		} else {
			queryInfo = "";
		}

		List<Object> list_all = adminDao.export_getAInfomationByTableId(tableName, null, queryInfo);

		/**
		 * 1.query_num：传入所需要查询的字段
		 * 2.ExcelHead.getExcelHeadArray(tableName)：依据tablename传入表格头信息
		 * 3.MapUtil.java2Map(list_all):将list_all中的对象全部用MapUtil封装到List<Map<String,String>>中
		 * 返回一个execl表
		 */
		XSSFWorkbook workbook = ExportExcelCollection.exportExcel(query_num, ExcelHead.getExcelHeadArray(tableName),
				MapUtil.java2Map(list_all, query_num));
		return workbook;
	}

	@Override
	public String curingInfomation(Object obj) {
		String res = null;
		Object obj0 = null;
		Class<? extends Object> cla = obj.getClass();
		try {
			// 获取第一个id属性值
			Field f = obj.getClass().getDeclaredFields()[0];
			// 设置可用
			f.setAccessible(true);
			// 获得id值
			String id = (String) f.get(obj);
			if ("".equals(id) || id == null) {
				f.set(obj, uuid.getUuid());
				Field createTime = cla.getDeclaredField("createTime");
				createTime.setAccessible(true);
				createTime.set(obj, TimeUtil.getStringDay());
				obj0 = obj;
			} else {
				obj0 = adminDao.getInfoById(cla.getName(), f.getName(), id).getObject();
				Object value_obj = null;
				Object value_obj0 = null;
				for (Field f0 : cla.getDeclaredFields()) {
					f0.setAccessible(true);
					value_obj = f0.get(obj);
					value_obj0 = f0.get(obj0);
					if (!"".equals(value_obj) && value_obj != null && !value_obj.equals(value_obj0)) {
						// 不用value_obj，存在类型转换错误
						f0.set(obj0, f0.get(obj));
					}
				}
			}
			res = adminDao.updateInfo(obj0) ? "success" : "error";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public String adminLiftCuring(String tableName, String tableId, String dataState) {
		Object obj = adminDao.getAInfomationByTableId(tableName, getTableInfoIdName(tableName), tableId);
		try {
			Field f = obj.getClass().getDeclaredField("dataStatus");
			f.setAccessible(true);
			f.set(obj, dataState);
		} catch (Exception e) {
			e.printStackTrace();
		}
		boolean flag = adminDao.updateInfo(obj);
		return flag ? "success" : "error";
	}

	@Override
	public String addTeacherInfo(TeacherInfo teacherInfo, String departmentId) {
		teacherInfo.setTeacherInfoId(uuid.getUuid());
		teacherInfo.setDataStatus("10");
		teacherInfo.setCreateTime(TimeUtil.getStringDay());
		adminDao.addInfo(teacherInfo);

		User user = new User();
		user.setUserId(teacherInfo.getUserId());// 用户id
		user.setPassword(md5.GetMD5Code("000000"));// 设置初试密码000000
		user.setRoleId("10");// 用户角色
		System.out.println(departmentId);
		user.setDepartmentId(departmentId);
		String result = adminDao.addInfo(user);
		return result.length() > 0 ? "success" : "error";
	}

	@Override
	public String getUserIdOrderingByUserName(String userName) {
		String[] names = userName.split(",|，");
		String[] UserIdOrdering = new String[names.length];
		List<String> userId = new ArrayList<String>();
		for (int i = 0; i < names.length; i++) {
			// 初始化第I的值，若不先初始化则初始值为null
			UserIdOrdering[i] = "";
			userId = adminDao.getUserIdByUserName(names[i]);
			// 当一个用户名字对应多个ID时候，添加首位括号以表示区别
			if (userId.size() > 1) {
				UserIdOrdering[i] += "(";
			}
			for (String id : userId) {
				UserIdOrdering[i] += "," + id + "_" + (i + 1);
			}
			// 除去第一位的逗号
			UserIdOrdering[i] = UserIdOrdering[i].replaceFirst(",", "");
			// 当一个用户名字对应多个ID时候，添加末尾括号以表示区别
			if (userId.size() > 1) {
				UserIdOrdering[i] += ")";
			}
		}
		return StringUtils.join(UserIdOrdering, ",");
	}

	@Override
	public String getDepartmentNameByDepartmentId(String departmentId, String what) {
		Department department = adminDao.getDepartmentById(departmentId);
		if ("name".equals(what)) {
			return department.getDepartmentName();
		} else if ("id".equals(what)) {
			return department.getDepartmentId();
		} else
			return department.getDepartmentId();
	}

	@Override
	public Introduction getOneOfIntroduction(String tableId) {
		return adminDao.getOneOfIntroduction(tableId);
	}

	@Override
	public String modifyIntroduction(Introduction introduction)
			throws IllegalArgumentException, IllegalAccessException {
		Class<? extends Object> cla = introduction.getClass();
		Field[] fields = cla.getDeclaredFields();

		Introduction in = adminDao.getOneOfIntroduction(introduction.getIntroductionId() + "");

		for (Field f : fields) {
			f.setAccessible(true);
			if (!"".equals(f.get(introduction)) && f.get(introduction) != null
					&& !f.get(in).equals(f.get(introduction))) {
				f.set(in, f.get(introduction));
			}
		}
		return adminDao.updateInfo(in) ? "success" : "error";
	}

	@Override
	public String setIntroduction(Introduction introduction, String id) {
		introduction.setIntroductionDepartment(id);
		return adminDao.addInfo(introduction);
	}

	@Override
	public String deleteIntroduction(Introduction introduction) {
		return adminDao.deleteInfo(introduction) ? "success" : "error";
	}

	// ----------------------------------------------------------------------私有

	/**
	 * ---通过查询信息表名字，获取信息表中第一个参数(****Id)的Name
	 * 
	 * @param tableName
	 *            持久层类名称
	 * @return 第一个参数的Name
	 */
	private String getTableInfoIdName(String tableName) {
		String idname = null;
		if (("TeacherAward").equals(tableName)) {
			idname = "awardId";
		}
		if (("TeacherInfo").equals(tableName)) {
			idname = "teacherInfoId";
		}
		if (("TeacherPaper").equals(tableName)) {
			idname = "paperId";
		}
		if (("TeacherPatent").equals(tableName)) {
			idname = "patentId";
		}
		if (("TeacherProject").equals(tableName)) {
			idname = "projectId";
		}
		if (("TeacherWorks").equals(tableName)) {
			idname = "worksId";
		}
		return idname;
	}

}
