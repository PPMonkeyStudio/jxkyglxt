package com.teacherms.system.service.impl;

import com.teacherms.all.domain.Role;
import com.teacherms.all.domain.User;
import com.teacherms.system.dao.SystemDao;
import com.teacherms.system.service.SystemService;
import util.md5;

public class SystemServiceImpl implements SystemService {
	private SystemDao systemDao;

	public void setSystemDao(SystemDao systemDao) {
		this.systemDao = systemDao;
	}

	@Override
	public Object login(String user_id, String password) {
		User user = systemDao.getUserByUser_id(user_id);
		if (user == null) {
			return "nouser";
		}
		System.out.println(user.getPassword().equals(md5.GetMD5Code(password)));
		if (!user.getPassword().equals(md5.GetMD5Code(password))) {
			return "passworderror";
		}
		return user;
	}

	@Override
	public String getUserRoleNameByRoleId(String roleId) {
		Role role = systemDao.getUserRoleByRoleId(roleId);
		return role.getRoleName();
	}

}
