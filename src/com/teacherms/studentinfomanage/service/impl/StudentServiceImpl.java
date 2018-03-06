package com.teacherms.studentinfomanage.service.impl;

import java.lang.reflect.Field;
import java.util.List;

import com.teacherms.all.domain.StudentAward;
import com.teacherms.studentinfomanage.dao.StudentDao;
import com.teacherms.studentinfomanage.service.StudentService;
import com.teacherms.studentinfomanage.vo.StudentInfoAndOtherInfo;

import util.PageVO;
import util.TimeUtil;
import util.uuid;

public class StudentServiceImpl implements StudentService {
	private StudentDao studentDao;

	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}

	@Override
	public String setStudentAllInfo(Object InfoObject) throws Exception {
		Class<? extends Object> infoClass = InfoObject.getClass();
		// 获取ID并赋值
		Field InfoId = infoClass.getDeclaredFields()[0];
		InfoId.setAccessible(true);
		InfoId.set(InfoObject, uuid.getUuid());

		// 获取日期并赋值
		Field time = infoClass.getDeclaredField("alterTime");
		time.setAccessible(true);
		time.set(InfoObject, TimeUtil.getStringDay());

		return studentDao.setInfo(InfoObject) ? "success" : "error";
	}

	@Override
	public String updateStudentAllInfo(Object InfoObject) throws Exception {
		/*
		 * Field[] fields = infoClass.getDeclaredFields(); Field id = fields[0];
		 * id.setAccessible(true); String infoId = (String) id.get(infoClass);
		 */
		return studentDao.updateInfo(InfoObject) ? "success" : "error";
	}

	@Override
	public String deleteStudentInfo(Object InfoObject) throws Exception {
		Class<? extends Object> infoClass = InfoObject.getClass();
		// 获取ID并赋值
		Field InfoId = infoClass.getDeclaredFields()[0];
		InfoId.setAccessible(true);
		String idName = InfoId.getName();
		String idValue = (String) InfoId.get(InfoObject);
		String tableName = infoClass.getName();
		return studentDao.deleteInfo(studentDao.getInfoById(tableName, idName, idValue)) ? "success" : "error";
	}

	@Override
	public StudentInfoAndOtherInfo getStudentOneInfo(Object InfoObject) throws Exception {
		Class<? extends Object> infoClass = InfoObject.getClass();

		// 学生id
		Field studentId = infoClass.getDeclaredField("studentId");
		studentId.setAccessible(true);
		String studentIdValue = (String) studentId.get(InfoObject);

		// 信息ID
		Field infoID = infoClass.getDeclaredFields()[0];
		infoID.setAccessible(true);

		// ID名，值
		String IDName = infoID.getName();
		String IDValue = (String) infoID.get(InfoObject);
		// 表名
		String tableName = infoClass.getName();
		return studentDao.getStudentOneInfo(tableName, IDName, IDValue, studentIdValue);
	}

	@Override
	public PageVO<StudentInfoAndOtherInfo> getStudentAllInfo(String InfoName, String page) throws Exception {
		// 每页记录数
		int pageSize = 10;
		// 页数
		int pageIndex = Integer.parseInt(page);
		// 查询长度
		int toindex = pageSize;
		List<StudentInfoAndOtherInfo> list = studentDao.getStudentAllInfo(InfoName);
		// 总记录数
		int totalSize = list.size();
		// 当所要显示的最大值大于记录数最大值时，每页记录设置为不超过记录数值
		if (pageIndex * pageSize > totalSize) {
			toindex = totalSize - (pageIndex - 1) * pageSize;
		}
		// 设置VO内参数页码，每页记录数，总记录数
		PageVO<StudentInfoAndOtherInfo> pageVO = new PageVO<StudentInfoAndOtherInfo>(pageIndex, pageSize, totalSize);
		pageVO.setObjDatas(list.subList((pageIndex - 1) * pageSize, (pageIndex - 1) * pageSize + toindex));
		return pageVO;
	}

	@Override
	public void test() {
		System.out.println("service");
		System.out.println(StudentAward.class);
		studentDao.test();
	}

}
