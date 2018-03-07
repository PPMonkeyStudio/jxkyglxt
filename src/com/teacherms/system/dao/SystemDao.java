package com.teacherms.system.dao;

import java.util.List;

import com.teacherms.all.domain.Introduction;
import com.teacherms.all.domain.Role;
import com.teacherms.all.domain.User;

public interface SystemDao {

	/**
	 * 通过用户ID获得用户对象
	 * 
	 * @param user_id
	 *            用户ID
	 * @return
	 */
	User getUserByUser_id(String user_id);

	/**
	 * 通过角色ID获取角色对象
	 * 
	 * @param roleId
	 *            角色ID
	 * @return Role对象
	 */
	Role getUserRoleByRoleId(String roleId);

	/**
	 * 更新用户信息
	 * 
	 * @param loging_user
	 *            更新后的用户对象
	 * @return
	 */
	User updateUser(User loging_user);

	/**
	 * 获取介绍
	 * 
	 * @param departmentId
	 *            部门ID
	 * @return
	 */
	List<Introduction> getIntroduction(String departmentId);

}
