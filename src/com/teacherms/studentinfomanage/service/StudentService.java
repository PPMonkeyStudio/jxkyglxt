package com.teacherms.studentinfomanage.service;

import java.util.ResourceBundle;

public interface StudentService {
	static final String propertiesPath = ResourceBundle.getBundle("_path").getString("filePath");

	public void test();
}
