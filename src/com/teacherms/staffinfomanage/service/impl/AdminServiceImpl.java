package com.teacherms.staffinfomanage.service.impl;

import java.util.*;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.Method;
import java.lang.reflect.Field;
import com.teacherms.all.domain.*;
import com.teacherms.satffinfomanage.dao.AdminDao;
import com.teacherms.satffinfomanage.vo.AdminVo;
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
	// 全部信息表
	private final String[] Infotable = { "TeacherInfo", "TeacherAward", "TeacherWorks", "TeacherPaper", "TeacherPatent",
			"TeacherProject" };

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
			String dataState, String collegeName, Object obj, String fuzzy_query) {
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
		StringBuffer Multi_condition = new StringBuffer();// 指定查询中的字符串
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
		// 最后判断如果fuzzy_query为空或是null，则不做模糊查询
		if (null == fuzzy_query || "".equals(fuzzy_query)) {
			haveMulti_condition = true;
		}
		System.out.println(haveMulti_condition);
		// 获取所有信息表中未审核的信息
		if (!"".equals(tableName) && tableName != null) {
			// 指定条件tableName查询
			// haveMulti_condition?"":fuzzy.toString().replaceFirst(" or","")
			// 三目运算，如果已经含有了指定查询内容，则不查询模糊查询内容，反则如果模糊查询有值，进行模糊查询
			// 在之前循环过程中，首位添加or，所以第一位or为多余，应当去掉
			list = adminDao.getAllStatusInfo(tableName, time_interval, dataState, collegeName,
					Multi_condition.toString(), haveMulti_condition ? "" : fuzzy.toString().replaceFirst(" or", ""));
		}
		System.out.println(list.size());
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
		TableInfoAndUserVo list = adminDao.getInfoById(tableName, getTableInfoIdName(tableName), tableId);
		/*
		 * // 将最后的对象转化为数组 Class cla = list.get(0)[2].getClass(); try { //
		 * 创建与对象属性值等长的数组 Object[] oo = new
		 * Object[cla.getDeclaredFields().length]; // 遍历每一个属性，并且获得属性值，存入数组中 for
		 * (int i = 0; i < oo.length; i++) { Field f =
		 * cla.getDeclaredFields()[i]; f.setAccessible(true); oo[i] =
		 * f.get(list.get(0)[2]); } // list中对象的位置转存为数组 list.get(0)[2] = oo; }
		 * catch (IllegalArgumentException e) { e.printStackTrace(); } catch
		 * (IllegalAccessException e) { e.printStackTrace(); }
		 */
		// 返回List<Object[]>---list内部的元素为Object(字符串)+Object(字符串)+Object[]数组)
		return list;
	}

	@Override
	public XSSFWorkbook getExcel(String query_num, String tableName, String query_id) {
		String queryInfo = " where " + getTableInfoIdName(tableName) + " in (";
		System.out.println(!"".equals(query_id) || null != query_id);
		System.out.println(null != query_id);
		System.out.println(!"".equals(query_id));
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
				String value_obj = null;
				String value_obj0 = null;
				for (Field f0 : cla.getDeclaredFields()) {
					f0.setAccessible(true);
					value_obj = (String) f0.get(obj);
					value_obj0 = (String) f0.get(obj0);
					if (value_obj != null && !"".equals(value_obj) && !value_obj.equals(value_obj0)) {
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

	// ----------------------------------------------------------------------封装
	/**
	 * ---封装list中的对象信息到AdminVo
	 * 
	 * @param list
	 *            信息表信息
	 * @return AdminVo的list集合
	 */
	private List<AdminVo> EncapsulationAdminVo(List<Object[]> list) {
		List<AdminVo> Volist = new ArrayList<AdminVo>();
		// 对所查询的第一项信息表中对象进行封装
		for (int j = 0; j < list.size(); j++) {
			// 通过用户ID查询用户信息
			User user = adminDao.getUserById(getTableInfoByGetMothed("getUserId", list.get(j)));
			// new AdminVo( 信息表中所属的用户ID, 用户名称, 信息类别（奖励或是著作或是其他）, 信息提交时间,信息ID )
			Volist.add(
					new AdminVo(user.getUserId(), user.getUserName(), getTableInfoByGetMothed("getType", list.get(j)),
							getTableInfoByGetMothed("getCreateTime", list.get(j)), getTableInfoId(list.get(j))));
		}
		return Volist;
	}

	/**
	 * ---反射获取信息对象中属性的id值
	 * 
	 * @param obj
	 *            对象，为不确定值，对应持久层中信息表
	 * @return 获得的持久层中信息表中第一个属性值，即为信息表ID
	 */
	private String getTableInfoId(Object obj) {
		Field f = obj.getClass().getDeclaredFields()[0];
		f.setAccessible(true);
		String val = null;
		try {
			val = (String) f.get(obj);
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return val;
	}

	/**
	 * ---反射获取查询的表中信息
	 * 
	 * @param mothed
	 *            持久层类的get方法，用于获取get方法指定的属性
	 * @param obj
	 *            持久化对象
	 * @return 指定的GetMothed获得的属性值
	 */
	private String getTableInfoByGetMothed(String mothed, Object obj) {
		String val = null;
		try {
			Method M = obj.getClass().getMethod(mothed, null);
			val = (String) M.invoke(obj, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return val;
	}

	/**
	 * ---反射改变对象中的值
	 * 
	 * @param mothed
	 *            持久层类的set方法，用于获取set方法改变属性值
	 * @param obj
	 *            持久化对象
	 * @return 获得的属性值
	 */
	private Object changeTableInfoBySetMothed(String mothed, Object obj, String value) {
		try {
			Method M = obj.getClass().getMethod(mothed, obj.getClass());
			M.setAccessible(true);
			M.invoke(obj, value);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}

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

	/**
	 * ---通过查询信息表名字，封装sql查询不同表的信息
	 * 
	 * @param tableName
	 *            持久层类名称
	 * @return 部分sql语句
	 */
	private String getSqlToQueryByTableName(String tableName) {
		String str = null;
		if (("TeacherAward").equals(tableName)) {
			//
			str = "t.achievementName,t.awardName,t.awardUserNames,t.awardType,t.awardClass,t.awardDate,t.awardId";
		}
		if (("TeacherInfo").equals(tableName)) {

			str = "t.userId,u.userName,t.employeeType,t.jobStatue,t.workDate,t.teacherInfoId";
		}
		if (("TeacherPaper").equals(tableName)) {
			//
			str = "t.paperName,t.authorUserNames,t.paperType,t.includedSituation,t.publishTime,t.paperId";
		}
		if (("TeacherPatent").equals(tableName)) {
			//
			str = "t.patentName,t.authorUserNames,t.patentType,t.authorizationNo,t.approvedDate,t.patentId";
		}
		if (("TeacherProject").equals(tableName)) {
			//
			str = "t.projectName,t.projectSource,t.projectUserNames,t.level,t.endUpDatet,t.projectId";
		}
		if (("TeacherWorks").equals(tableName)) {
			//
			str = "t.worksName,t.worksType,t.selectedSituation,t.publishTime,t.worksId";
		}
		return str;
	}

	private Object objReplace(Object obj) {
		Object obj_result = null;
		if (obj.getClass() == TeacherAward.class) {
			TeacherAward teacherAward = (TeacherAward) obj;
			// AwardType
			switch (teacherAward.getAwardType()) {
			case "10":
				teacherAward.setAwardType("教学成果");
				break;
			case "20":
				teacherAward.setAwardType("科研成果");
				break;
			case "30":
				teacherAward.setAwardType("指导学生获奖");
				break;
			case "40":
				teacherAward.setAwardType("个人业绩获奖");
				break;
			default:
				break;
			}

			// awardClass
			switch (teacherAward.getAwardClass()) {
			case "10":
				teacherAward.setAwardClass("国家自然科学奖");
				break;
			case "20":
				teacherAward.setAwardClass("国家技术发明奖");
				break;
			case "30":
				teacherAward.setAwardClass("国家科技进步奖");
				break;
			case "40":
				teacherAward.setAwardClass("教育部高校科研成果奖(科学技术,人文社科)");
				break;
			case "50":
				teacherAward.setAwardClass("省(市、自治区)政府自然科学奖");
				break;
			case "60":
				teacherAward.setAwardClass("省(市、自治区)政府技术发明奖");
				break;
			case "70":
				teacherAward.setAwardClass("省(市、自治区)政府科技进步奖");
				break;
			case "80":
				teacherAward.setAwardClass("省(市、自治区)政府哲学社科奖");
				break;
			default:
				break;
			}
		}
		return obj_result;
	}

}
