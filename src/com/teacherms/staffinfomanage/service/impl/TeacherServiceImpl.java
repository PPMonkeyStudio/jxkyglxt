package com.teacherms.staffinfomanage.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.teacherms.all.domain.TeacherAward;
import com.teacherms.all.domain.TeacherInfo;
import com.teacherms.all.domain.TeacherPaper;
import com.teacherms.all.domain.TeacherPatent;
import com.teacherms.all.domain.TeacherProject;
import com.teacherms.all.domain.TeacherWorks;
import com.teacherms.all.domain.User;
import com.teacherms.satffinfomanage.dao.TeacherDao;
import com.teacherms.satffinfomanage.vo.TableInfoAndUserVo;
import com.teacherms.staffinfomanage.service.TeacherService;

import util.ExcelHead;
import util.ExportExcelCollection;
import util.GudgmentImage;
import util.MapUtil;
import util.PageVO;
import util.uuid;

public class TeacherServiceImpl implements TeacherService {
	private TeacherDao teacherDao;

	public void setTeacherDao(TeacherDao teacherDao) {
		this.teacherDao = teacherDao;
	}

	@Override
	public PageVO<Object> getTableInfoInPaging(String userid, String tableName, String page, String time_interval,
			Object obj, String fuzzy_query) {
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
				toindex, Multi_condition.toString(),
				haveMulti_condition ? "" : fuzzy.toString().replaceFirst(" or", "")));
		// 设置VO内参数页码，每页记录数，总记录数
		PageVO<Object> pageVO = new PageVO<Object>(pageIndex, pageSize, totalSize);
		pageVO.setObjDatas(list);
		return pageVO;
	}

	@Override
	public XSSFWorkbook getExcel(String query_name, String tableName, String query_id) {
		int index = 0;
		String[] exportid_arr = query_id.split(",");
		for (String str : exportid_arr) {
			exportid_arr[index] = "'" + str + "'";
			index++;
		}
		List<Object> list_all = teacherDao.export_getAInfomationByTableId(tableName, getTableInfoIdName(tableName),
				Arrays.toString(exportid_arr).replaceAll("[\\[\\]]", ""));
		/**
		 * 1.query_num：传入所需要查询的字段
		 * 2.ExcelHead.getExcelHeadArray(tableName)：依据tablename传入表格头信息
		 * 3.MapUtil.java2Map(list_all):将list_all中的对象全部用MapUtil封装到List<Map<String,String>>中
		 * 返回一个execl表
		 */
		for (Object l : list_all) {
			System.out.println(l);
		}
		XSSFWorkbook workbook = ExportExcelCollection.exportExcel(query_name, ExcelHead.getExcelHeadArray(tableName),
				MapUtil.java2Map(list_all, query_name));
		return workbook;
	}

	@Override
	public TableInfoAndUserVo userGetTableInfoByTableId(String tableName, String tableId) {
		// vo内部的元素为Object(对象)+User(用户)+List<String>附件名字
		TableInfoAndUserVo vo = teacherDao.getTableInfoByTableId(tableName, getTableInfoIdName(tableName), tableId);
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
			// e.printStackTrace();
		} catch (IllegalAccessException e) {
			System.out.println("转换错误");
			// e.printStackTrace();
		}
		return vo;
	}

	@Override
	public String completeBasicInformation(TeacherInfo teacherInfo, String userId, String username) {
		/**
		 * 两个对象的数据转换：list中对象数据转到teacherInfo中，
		 */
		String rusult = "error";
		try {
			TeacherInfo teach = (TeacherInfo) teacherDao.getTeacherInfoByUserId(userId).getObject();
			// 获取TeacherInfo类中全部的属性
			Class<TeacherInfo> cla = TeacherInfo.class;
			Field[] f = cla.getDeclaredFields();
			for (int i = 0; i < f.length; i++) {
				// 设置可以使用
				f[i].setAccessible(true);
				String str = (String) f[i].get(teacherInfo);
				if (str != null && str != "") {
					continue;
				} else {
					f[i].set(teacherInfo, f[i].get(teach));
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
		String result = null;
		try {
			Class<? extends Object> cla = obj.getClass();
			// 获取对象中第一个属性
			Field ID = cla.getDeclaredFields()[0];
			// 属性设置可以访问
			ID.setAccessible(true);
			// 获得属性值
			String id = (String) ID.get(obj);
			// ID为空就设置UUID
			if ("".equals(id) || id == null) {
				ID.set(obj, uuid.getUuid());
			}

			// 修改数据属性为10，
			Field dataStatus = cla.getDeclaredField("dataStatus");
			dataStatus.setAccessible(true);
			dataStatus.set(obj, "10");

			// 设置用户ID，
			Field userId = cla.getDeclaredField("userId");
			userId.setAccessible(true);
			if ("".equals(userId.get(obj)) || null == userId.get(obj)) {
				userId.set(obj, userid);
			}

			result = teacherDao.addTableInfo(obj);

			if ("success".equals(result)) {
				result = "{\"result\":\"success\",\"id\":\"" + ID.get(obj) + "\"}";
			} else {
				result = "{\"result\":\"error\"}";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public String getUserIdOrderingByUserName(String userName) {
		String[] names = userName.split(",|，");
		String[] UserIdOrdering = new String[names.length];
		List<String> userId = new ArrayList<String>();
		for (int i = 0; i < names.length; i++) {
			// 初始化第I的值，若不先初始化则初始值为null
			UserIdOrdering[i] = "";
			userId = teacherDao.getUserIdByUserName(names[i]);
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
	public TableInfoAndUserVo userGetTeacherInfo(String userId) {
		return teacherDao.getTeacherInfoByUserId(userId);
	}

	@Override
	public String userAttachmentUpload(List<File> file1, List<String> file1FileName, List<String> file1ContentType,
			String userId, String tableName, String tableId) {
		String rusult = "success";
		String path = propertiesPath + userId + "/" + tableName;
		File file = new File(path);
		try {
			// 如果文件夹不存在则创建文件夹
			if (!file.exists()) {
				System.out.println("创建新文件夹");
				file.mkdirs();
			}
			for (int i = 0; i < file1.size(); i++) {
				FileOutputStream out = new FileOutputStream(
						path + "/" + tableId + "_" + (i + 1) + "." + file1ContentType.get(i).substring(6));
				InputStream in = new FileInputStream(file1.get(i));
				byte[] buf = new byte[1024];
				int length = 0;
				while (-1 != (length = in.read(buf))) {
					out.write(buf, 0, length);
				}
				in.close();
				out.close();
			}
		} catch (FileNotFoundException e) {
			rusult = "error";
			e.printStackTrace();
		} catch (IOException e) {
			rusult = "error";
			e.printStackTrace();
		}
		return rusult;
	}

	@Override
	public List<File> getBase64Image(String name, String tableName, String downloadInfoId) {
		// 附件路径
		String path = propertiesPath + name + "/" + tableName;
		// 获取文件夹下所有文件
		File[] fs = new File(path).listFiles();
		// base64集合
		List<File> info = new ArrayList<File>();
		// 分割所要查询的信息ID
		String[] downloadInfoId_arr = downloadInfoId.split(",");
		// InputStream inputStream =null;
		try {
			for (String infoId : downloadInfoId_arr) {
				for (File f1 : fs) {
					if (f1.getName().indexOf(infoId) > -1) {
						System.out.println(GudgmentImage.getPicType(new FileInputStream(f1)));
						info.add(f1);
						/*
						 * if (!"unknown".equals(GudgmentImage.getPicType(new
						 * FileInputStream(f1)))) { inputStream = new
						 * FileInputStream(f1); byte[] data = new
						 * byte[inputStream.available()];
						 * inputStream.read(data); BASE64Encoder encoder = new
						 * BASE64Encoder(); info.add(encoder.encode(data));
						 * inputStream.close(); } else { info.add("file"); }
						 */
					}
				}
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return info;
	}

	@Override
	public File downloadAttachment(String username, String tableName, String downloadInfoId) {
		// 附件路径
		String path = propertiesPath + username + "/" + tableName;
		// 选取的附件集合、
		List<File> List_attachment = new ArrayList<File>();
		Map<String, String> id_name_Map = new HashMap<String, String>();
		System.out.println(path);
		// 获取文件夹下所有文件
		File[] fs = new File(path).listFiles();
		// 分割所要查询的信息ID
		String[] downloadInfoId_arr = downloadInfoId.split(",");
		for (String infoId : downloadInfoId_arr) {
			// 获取信息名字.对应信息id
			id_name_Map.put(infoId, teacherDao.getTableInfoName(tableName, getTableInfoName(tableName),
					getTableInfoIdName(tableName), infoId));
			for (File f1 : fs) {
				if (f1.getName().indexOf(infoId) > -1) {
					List_attachment.add(f1);
				}
			}
		}
		/**
		 * 创建一个临时压缩文件,把文件流全部注入到这个文件中 这里的文件你可以自定义是.rar还是.zip
		 */
		File file = new File("E:/Attachment/zip/zi.zip");
		byte[] buf = new byte[1024];
		try {
			// 创建压缩包文件
			file.createNewFile();

			ZipOutputStream zipOut = new ZipOutputStream(new FileOutputStream(file));
			for (File f : List_attachment) {
				// new the BuuferedInputStream
				FileInputStream in = new FileInputStream(f);
				// the file entry ,set the file name in the zip
				// file
				String f_ID = f.getName().split("_")[0];
				String zipEntry_name = f.getName().replaceAll(f_ID, id_name_Map.get(f_ID));
				System.out.println(zipEntry_name);
				zipOut.putNextEntry(new ZipEntry(zipEntry_name));
				// 向压缩文件中输出数据
				int len;
				while ((len = in.read(buf)) > 0) {
					zipOut.write(buf, 0, len);
				}
				zipOut.closeEntry();
				in.close();
			}
			zipOut.close();
			// 压缩完毕,file中已存在有zip
		} catch (IOException e) {
			e.printStackTrace();
		}

		return file;
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
	 * 获取信息的名称
	 * 
	 * @return 名称
	 */
	private String getTableInfoName(String tableName) {
		String str = tableName.replaceAll("Teacher", "").toLowerCase() + "Name";
		/*
		 * switch (tableName) { case "TeacherAward": str = "awardName"; break;
		 * case "TeacherInfo": str = ""; break; case "TeacherPaper": str =
		 * "paperName"; break; case "TeacherPatent": str = "patentName"; break;
		 * case "TeacherProject": str = "projectName"; break; case
		 * "TeacherWorks": str = "worksName"; break; default: break; }
		 */
		return str;
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
