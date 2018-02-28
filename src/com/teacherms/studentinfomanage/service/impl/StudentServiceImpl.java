package com.teacherms.studentinfomanage.service.impl;

import java.lang.reflect.Field;
import java.util.List;

import com.teacherms.all.domain.StudentAward;
import com.teacherms.studentinfomanage.dao.StudentDao;
import com.teacherms.studentinfomanage.service.StudentService;
import com.teacherms.studentinfomanage.vo.StudentInfoAndOtherInfo;

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
	public List<StudentInfoAndOtherInfo> getStudentAllInfo(String InfoName) throws Exception {
		return studentDao.getStudentAllInfo(InfoName);
	}

	@Override
	public void test() {
		System.out.println("service");
		System.out.println(StudentAward.class);
		studentDao.test();
	}

}
