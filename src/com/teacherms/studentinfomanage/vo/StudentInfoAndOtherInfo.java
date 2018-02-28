package com.teacherms.studentinfomanage.vo;

import com.teacherms.all.domain.StudentInfo;

public class StudentInfoAndOtherInfo {
	private Object object;
	private StudentInfo studentInfo;

	public StudentInfoAndOtherInfo() {
	}

	public StudentInfoAndOtherInfo(Object object, StudentInfo studentInfo) {
		this.object = object;
		this.studentInfo = studentInfo;
	}

	public Object getObject() {
		return object;
	}

	public void setObject(Object object) {
		this.object = object;
	}

	public StudentInfo getStudentInfo() {
		return studentInfo;
	}

	public void setStudentInfo(StudentInfo studentInfo) {
		this.studentInfo = studentInfo;
	}

	@Override
	public String toString() {
		return "StudentInfoAndOtherInfo [object=" + object + ", studentInfo=" + studentInfo + "]";
	}

}
