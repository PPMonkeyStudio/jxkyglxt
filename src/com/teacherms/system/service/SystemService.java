package com.teacherms.system.service;

import java.util.List;
import java.util.Map;

import com.teacherms.all.domain.Department;
import com.teacherms.all.domain.Introduction;
import com.teacherms.all.domain.User;
import com.teacherms.system.vo.DepartmentAndUserList;

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

	/**
	 * 获取全部管理员用户的帐号信息
	 * 
	 * @return
	 */
	List<User> getAllAdminUser();

	User getOneOfUser(User user);

	List<Map<String, String>> getAllDepartment();

	/**
	 * 系统管理修改用户信息
	 * 
	 * @param user
	 *            用户信息
	 * @return
	 */
	String modifyUser(User user) throws IllegalArgumentException, IllegalAccessException;

	/**
	 * 系统管重置密码
	 * 
	 * @param user
	 *            用户信息
	 * @return
	 */
	String resetPassword(User user);

	/**
	 * 添加管理用户
	 * 
	 * @param user
	 *            添加的对象
	 * @return
	 */
	String setAdminUser(User user);

	/**
	 * 删除用户
	 * 
	 * @param user
	 * @return
	 */
	String deleteUser(User user);

	/**
	 * 获取带'学院'字的部门
	 * 
	 * @return
	 */
	List<DepartmentAndUserList> GetTheDepartmentWithTheCollege();

}
