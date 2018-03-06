package com.teacherms.studentinfomanage.service;

import java.util.List;
import java.util.ResourceBundle;

import com.teacherms.studentinfomanage.vo.StudentInfoAndOtherInfo;

import util.PageVO;

public interface StudentService {
	static final String propertiesPath = ResourceBundle.getBundle("_path").getString("filePath");

	public void test();

	public String setStudentAllInfo(Object InfoObject) throws Exception;

	public String updateStudentAllInfo(Object InfoObject) throws Exception;

	public String deleteStudentInfo(Object InfoObject) throws Exception;

	public StudentInfoAndOtherInfo getStudentOneInfo(Object InfoObject) throws Exception;

	public PageVO<StudentInfoAndOtherInfo> getStudentAllInfo(String InfoName,String page) throws Exception;
}
