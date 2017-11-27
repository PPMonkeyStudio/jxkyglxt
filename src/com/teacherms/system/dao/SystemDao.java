package com.teacherms.system.dao;

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

}
