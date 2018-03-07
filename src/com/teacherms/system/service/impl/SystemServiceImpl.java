package com.teacherms.system.service.impl;

import java.util.List;

import com.teacherms.all.domain.Introduction;
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

	@Override
	public User modifyPassword(User modify_userInfo, User loging_user) {
		// 修改的工号
		loging_user.setUserId(modify_userInfo.getUserId());
		// 修改的名称
		loging_user.setUserName(modify_userInfo.getUserName());
		// 修改的密码
		loging_user.setPassword(md5.GetMD5Code(modify_userInfo.getPassword()));
		return systemDao.updateUser(loging_user);
	}

	@Override
	public List<Introduction> getIntroduction(String departmentId) {
		return systemDao.getIntroduction(departmentId);
	}

}
