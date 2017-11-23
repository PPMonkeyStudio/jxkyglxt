package com.teacherms.system.service;

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
	 * ---修改密码
	 * 
	 * @param password
	 *            新密码
	 * @param string
	 *            用户的id
	 * @return
	 */
	String resetPassword(String password, String string);

}
