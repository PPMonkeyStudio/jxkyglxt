package com.teacherms.system.vo;

import java.util.List;
import com.teacherms.all.domain.Department;
import com.teacherms.all.domain.User;

public class DepartmentAndUserList {
	private Department department;
	private List<User> list;

	public DepartmentAndUserList() {
	}

	public DepartmentAndUserList(Department department) {
		this.department = department;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}

}
