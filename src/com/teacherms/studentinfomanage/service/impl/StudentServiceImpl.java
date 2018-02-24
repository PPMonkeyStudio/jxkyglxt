package com.teacherms.studentinfomanage.service.impl;

import com.teacherms.all.domain.StudentAward;
import com.teacherms.studentinfomanage.dao.StudentDao;
import com.teacherms.studentinfomanage.service.StudentService;

public class StudentServiceImpl implements StudentService {
	private StudentDao studentDao;

	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}

	@Override
	public void test() {
		System.out.println("service");
		System.out.println(StudentAward.class);
		studentDao.test();
	}

}
