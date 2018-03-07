package com.teacherms.system.service;

import java.util.List;

import com.teacherms.all.domain.Introduction;
import com.teacherms.all.domain.User;

public interface SystemService {

	/**
	 * ---用户登录
	 * 
	 * @param user_id
	 *            用户的ID
	 * @param password
	 *            用户登录密码
	 * @return
	 */
	Object login(String user_id, String password);

	/**
	 * ---通过角色ID获取角色名称
	 * 
	 * @param roleId
	 *            角色ID
	 * @return 角色名称
	 */
	String getUserRoleNameByRoleId(String roleId);

	/**
	 * 用户修改帐号信息
	 * 
	 * @param modify_userInfo
	 *            对象内包含用户修改的内容
	 * @param loging_user
	 *            用户已经登录的帐号
	 * @return
	 */
	User modifyPassword(User midify_userInfo, User loging_user);

	/**
	 * 获取介绍
	 * 
	 * @param departmentId
	 *            部门ID
	 * @return
	 */
	List<Introduction> getIntroduction(String departmentId);

}
