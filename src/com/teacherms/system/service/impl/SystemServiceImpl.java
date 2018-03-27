package com.teacherms.system.service.impl;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.teacherms.all.domain.Department;
import com.teacherms.all.domain.Introduction;
import com.teacherms.all.domain.Role;
import com.teacherms.all.domain.User;
import com.teacherms.system.dao.SystemDao;
import com.teacherms.system.service.SystemService;
import com.teacherms.system.vo.DepartmentAndUserList;

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
			return "无此用户。请检查帐号是否正确";
		}
		if (!user.getPassword().equals(md5.GetMD5Code(password))) {
			return "密码错误，请检查密码。";
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

	@Override
	public List<User> getAllAdminUser() {
		List<User> list = systemDao.getAllAdminUser();
		List<Map<String, String>> department = systemDao.getDepartment();
		Map<String, String> map = new HashMap<String, String>();
		for (Map<String, String> m : department) {
			map.put(m.get("0") + "", m.get("1") + "");
		}
		for (User user : list) {
			user.setDepartmentId((String) map.get(user.getDepartmentId()));
		}
		return list;
	}

	@Override
	public User getOneOfUser(User user) {
		return systemDao.getUserByUser_id(user.getUserId());
	}

	@Override
	public List<Map<String, String>> getAllDepartment() {
		return systemDao.getDepartment();
	}

	@Override
	public String modifyUser(User user) throws IllegalArgumentException, IllegalAccessException {
		Class<? extends Object> cla = user.getClass();
		Field[] fields = cla.getDeclaredFields();
		User u = systemDao.getUserByUser_id(user.getUserId());
		System.out.println(u);
		for (Field f : fields) {
			f.setAccessible(true);
			System.out.println(f.getName());
			if (!"".equals(f.get(user)) && null != f.get(user) && !f.get(u).equals(f.get(user))) {
				f.set(u, f.get(user));
			}
		}
		return systemDao.updateUser(u).getUserId();
	}

	@Override
	public String resetPassword(User user) {
		User u = systemDao.getUserByUser_id(user.getUserId());
		u.setPassword(md5.GetMD5Code("000000"));
		return systemDao.updateUser(u).getUserId();
	}

	@Override
	public String setAdminUser(User user) {
		user.setPassword(md5.GetMD5Code("000000"));
		user.setRoleId("20");
		return systemDao.saveUser(user).getUserId();
	}

	@Override
	public String deleteUser(User user) {
		return systemDao.deleteUser(user);
	}

	@Override
	public List<DepartmentAndUserList> GetTheDepartmentWithTheCollege() {
		List<DepartmentAndUserList> list = systemDao.getTheDepartmentWithTheCollege();
		for (DepartmentAndUserList de : list) {
			de.setList(systemDao.getUserByDeparmentId(de.getDepartment().getDepartmentId()));
		}
		return list;
	}

}
