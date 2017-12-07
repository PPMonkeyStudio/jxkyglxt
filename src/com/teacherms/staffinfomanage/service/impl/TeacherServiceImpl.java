package com.teacherms.staffinfomanage.service.impl;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.teacherms.all.domain.TeacherAward;
import com.teacherms.all.domain.TeacherInfo;
import com.teacherms.all.domain.TeacherPaper;
import com.teacherms.all.domain.TeacherPatent;
import com.teacherms.all.domain.TeacherProject;
import com.teacherms.all.domain.TeacherWorks;
import com.teacherms.all.domain.User;
import com.teacherms.satffinfomanage.dao.TeacherDao;
import com.teacherms.staffinfomanage.service.TeacherService;

import util.ExcelHead;
import util.ExportExcelCollection;
import util.MapUtil;
import util.PageVO;
import util.uuid;

public class TeacherServiceImpl implements TeacherService {
	private TeacherDao teacherDao;

	public void setTeacherDao(TeacherDao teacherDao) {
		this.teacherDao = teacherDao;
	}

	@Override
	public PageVO<Object> getTableInfoInPaging(String userid, String tableName, String page, String time_interval) {
		// 依据不同的tableName获取实体化类不同的UserId进行模糊查询
		String tableUserIds = null;
		switch (tableName) {
		case "TeacherAward":
			tableUserIds = "awardUserIds";
			break;
		case "TeacherInfo":
			tableUserIds = "userId";
			break;
		case "TeacherPaper":
			tableUserIds = "authorUserIds";
			break;
		case "TeacherPatent":
			tableUserIds = "authorUserIds";
			break;
		case "TeacherProject":
			tableUserIds = "projectUserIds";
			break;
		case "TeacherWorks":
			tableUserIds = "editorUserIds";
			break;
		default:
			break;
		}
		// 每页记录数
		int pageSize = 10;
		// 页数
		int pageIndex = Integer.parseInt(page);
		// 查询长度
		int toindex = pageSize;
		// 总记录数
		int totalSize = teacherDao.getCountInOnetable(userid, tableUserIds, tableName).intValue();
		// 设置查询时间区间，如果time_interval为空则不执行
		if (!"".equals(time_interval) && time_interval != null) {
			time_interval = "and t.createTime between '" + time_interval.split(",")[0] + "' and '"
					+ time_interval.split(",")[1] + "'";
		}
		// 限制page页数，避免过大或者过小
		if (pageIndex > totalSize / pageSize) {
			if (totalSize % pageSize > 0) {
				pageIndex = (totalSize / pageSize) + 1;
			} else {
				pageIndex = totalSize / pageSize;
			}
		} else if (pageIndex < 1) {
			pageIndex = 1;
		}
		// 截取字符串获取分页所要的效果 、、(pageIndex - 1) * pageSize, pageSize
		if (pageIndex * pageSize > totalSize) {
			toindex = totalSize - (pageIndex - 1) * pageSize;
		}
		// 创建list
		List<Object> list = new ArrayList<Object>();
		// 获取信息表中的信息
		list.addAll(teacherDao.getTableInfo(time_interval, tableName, tableUserIds, userid, (pageIndex - 1) * pageSize,
				toindex));
		// 设置VO内参数页码，每页记录数，总记录数
		PageVO<Object> pageVO = new PageVO<Object>(pageIndex, pageSize, totalSize);
		pageVO.setObjDatas(list);
		return pageVO;
	}

	@Override
	public XSSFWorkbook getExcel(String query_name, String tableName, String query_id) {
		// 创建List<Object>
		List<Object> list_all = new ArrayList<Object>();
		// 分割所要查询的信息表ID
		String[] id = query_id.substring(0, query_id.length() - 1).split(",");
		// 循环查询每一个所要查询的信息表，并记录到list_all中
		for (int i = 0; i < id.length; i++) {
			list_all.add(teacherDao.getTableInfoByTableId(tableName, getTableInfoIdName(tableName), id[i]));
		}
		/**
		 * 1.query_num：传入所需要查询的字段
		 * 2.ExcelHead.getExcelHeadArray(tableName)：依据tablename传入表格头信息
		 * 3.MapUtil.java2Map(list_all):将list_all中的对象全部用MapUtil封装到List<Map<String,String>>中
		 * 返回一个execl表
		 */
		XSSFWorkbook workbook = ExportExcelCollection.exportExcel(query_name, ExcelHead.getExcelHeadArray(tableName),
				MapUtil.java2Map(list_all));
		return workbook;
	}

	@Override
	public List<Object[]> userGetTableInfoByTableId(String tableName, String tableId) {
		// list内部的元素为Object(字符串)+Object(字符串)+Object(对象)
		List<Object[]> list = teacherDao.getTableInfoByTableId(tableName, getTableInfoIdName(tableName), tableId);
		// 将最后的对象转化为数组
		Class cla = list.get(0)[2].getClass();
		try {
			// 创建与对象属性值等长的数组
			Object[] oo = new Object[cla.getDeclaredFields().length];
			// 遍历每一个属性，并且获得属性值，存入数组中
			for (int i = 0; i < oo.length; i++) {
				Field f = cla.getDeclaredFields()[i];
				f.setAccessible(true);
				oo[i] = f.get(list.get(0)[2]);
			}
			// list中对象的位置转存为数组
			list.get(0)[2] = oo;
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		// 返回List<Object[]>---list内部的元素为Object(字符串)+Object(字符串)+Object[]数组)
		return list;
	}

	@Override
	public String completeBasicInformation(TeacherInfo teacherInfo, String userId, String username) {
		/**
		 * 两个对象的数据转换：list中对象数据转到teacherInfo中，
		 * 
		 */
		String rusult = "error";
		try {
			List<Object[]> list = teacherDao.getTeacherInfoByUserId(userId);
			// 获取TeacherInfo类中全部的属性
			Class cla = TeacherInfo.class;
			Field[] f = cla.getDeclaredFields();
			for (int i = 0; i < f.length; i++) {
				// 设置可以使用
				f[i].setAccessible(true);
				String str = (String) f[i].get(teacherInfo);
				if (str != null && str != "") {
					continue;
				} else {
					f[i].set(teacherInfo, f[i].get(list.get(0)));
				}
			}
			// 修改数据状态为管理员审核状态
			teacherInfo.setDataStatus("20");
			// 修改用户名字
			User user = teacherDao.getUserByUserId(userId);
			user.setUserName(username);
			teacherDao.addTableInfo(user);

			rusult = teacherDao.updateInfo(teacherInfo);
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return rusult;
	}

	@Override
	public String addTableInfo(String userid, Object obj, String tableName) {
		String re = null;
		try {
			Class cla = obj.getClass();
			// 获取对象中第一个属性
			Field f = cla.getDeclaredField(getTableInfoIdName(tableName));
			// 属性设置可以访问
			f.setAccessible(true);
			// 获得属性值
			String id = (String) f.get(obj);
			// ID为空就设置UUID
			if ("".equals(id) || id == null) {
				f.set(obj, uuid.getUuid());
			}
			// 修改数据属性为10，
			Field dataStatus = cla.getDeclaredField("dataStatus");
			dataStatus.setAccessible(true);
			dataStatus.set(obj, "10");

			re = teacherDao.addTableInfo(obj);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}

	@Override
	public String PuchInfoToadmin(String tableName, String tableId) {
		String str = null;
		try {
			Object obj = teacherDao.getTableObjectByTableId(tableName, getTableInfoIdName(tableName), tableId);
			Field dataStatus = obj.getClass().getDeclaredField("dataStatus");
			dataStatus.setAccessible(true);
			dataStatus.set(obj, "20");
			str = teacherDao.addTableInfo(obj);
		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return str;
	}

	@Override
	public List<Object[]> userGetTeacherInfo(String userId) {
		return teacherDao.getTeacherInfoByUserId(userId);
	}

	/**
	 * ---通过查询信息表名字，获取信息表中第一个参数(****Id)的Name
	 * 
	 * @param tableName
	 *            持久层类名称
	 * @return 第一个参数的Name
	 */
	private String getTableInfoIdName(String tableName) {
		Class cla = null;
		if (("TeacherAward").equals(tableName)) {
			cla = TeacherAward.class;
		}
		if (("TeacherInfo").equals(tableName)) {
			cla = TeacherInfo.class;
		}
		if (("TeacherPaper").equals(tableName)) {
			cla = TeacherPaper.class;
		}
		if (("TeacherPatent").equals(tableName)) {
			cla = TeacherPatent.class;
		}
		if (("TeacherProject").equals(tableName)) {
			cla = TeacherProject.class;
		}
		if (("TeacherWorks").equals(tableName)) {
			cla = TeacherWorks.class;
		}
		return cla.getDeclaredFields()[0].getName();
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
			Method M = obj.getClass().getMethod(mothed, null);
			M.invoke(obj, value);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}

	/**
	 * ---通过查询信息表名字，封装sql查询不同表的信息(教职工)
	 * 
	 * @param tableName
	 *            持久层类名称
	 * @return 部分sql语句
	 */
	private String getSqlToQueryByTableName(String tableName) {
		String str = null;
		if (("TeacherAward").equals(tableName)) {
			str = "t.awardName,t.awardType,t.awardLevel,t.awardCertificationNo,t.createTime,t.dataStatus,t.awardId";
		}
		if (("TeacherInfo").equals(tableName)) {
			str = "t.professionalTitle,t.teacherCertificateNo,t.teachingType,t.createTime,t.dataStatus,t.teacherInfoId";
		}
		if (("TeacherPaper").equals(tableName)) {
			str = "t.paperName,t.paperType,t.createTime,t.dataStatus,t.paperId";
		}
		if (("TeacherPatent").equals(tableName)) {
			str = "t.patentName,t.patentType,t.authorizationNo,t.createTime,t.dataStatus,t.patentId";
		}
		if (("TeacherProject").equals(tableName)) {
			str = "t.projectName,t.projectSource,t.projectNo,t.createTime,t.dataStatus,t.projectId";
		}
		if (("TeacherWorks").equals(tableName)) {
			str = "t.worksName,t.worksType,t.selectedSituation,t.createTime,t.dataStatus,t.worksId";
		}
		return str;
	}
}
