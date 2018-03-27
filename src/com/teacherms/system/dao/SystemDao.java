package com.teacherms.system.dao;

import java.util.List;
import java.util.Map;

import com.teacherms.all.domain.Department;
import com.teacherms.all.domain.Introduction;
import com.teacherms.all.domain.Role;
import com.teacherms.all.domain.User;
import com.teacherms.system.vo.DepartmentAndUserList;

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
	 * 添加用户信息
	 * 
	 * @param user
	 *            更新后的用户对象
	 * @return
	 */
	User saveUser(User user);

	/**
	 * 获取介绍
	 * 
	 * @param departmentId
	 *            部门ID
	 * @return
	 */
	List<Introduction> getIntroduction(String departmentId);

	/**
	 * 获取全部管理员用户的帐号信息
	 * 
	 * @return
	 */
	List<User> getAllAdminUser();

	/**
	 * 获取全部部门
	 * 
	 * @return
	 */
	List<Map<String, String>> getDepartment();

	String deleteUser(User user);

	/**
	 * 获取带学院字的部门
	 * 
	 * @return
	 */
	List<DepartmentAndUserList> getTheDepartmentWithTheCollege();

	/**
	 * 通过部门ID获取在该部门的所有用户
	 * 
	 * @param departmentId
	 * @return
	 */
	List<User> getUserByDeparmentId(String departmentId);

}
