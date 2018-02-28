package com.teacherms.studentinfomanage.dao;

import java.util.List;

import com.teacherms.studentinfomanage.vo.StudentInfoAndOtherInfo;

public interface StudentDao {

	public void test();

	public boolean setInfo(Object InfoObject);

	public boolean updateInfo(Object InfoObject);

	public Object getInfoById(String tableName, String idName, String idValue);

	public boolean deleteInfo(Object infoById);

	public StudentInfoAndOtherInfo getStudentOneInfo(String tableName, String iDName, String iDValue,
			String studentIdValue);

	public List<StudentInfoAndOtherInfo> getStudentAllInfo(String tableName);

}
