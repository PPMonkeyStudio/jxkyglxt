package com.teacherms.satffinfomanage.dao;

import java.util.Collection;
import java.util.List;
import com.teacherms.all.domain.*;

public interface AdminDao {

	/**
	 * ---获取指定状态的全部教职工信息
	 * 
	 * @param status
	 *            指定的状态
	 * @return 对象list集合
	 */
	List<Object[]> getAllStatusInfo(String sql, String table, String time, String status, String collegeName);

	/**
	 * ---通过ID获取用户信息
	 * 
	 * @param tableUserID
	 *            用户ID
	 * @return User对象
	 */
	User getUserById(String tableUserID);

	/**
	 * ---通过用户部分+表全信息
	 * 
	 * @param tableName
	 *            所要查询的表名
	 * @param tableId
	 *            数据的ID
	 * @return 信息记录对象
	 */
	List<Object[]> getInfoById(String tableName, String IdName, String tableId);

	/**
	 * 更新对象
	 * 
	 * @param obj
	 *            对像
	 */
	boolean updateInfo(Object obj);

	/**
	 * 添加对象
	 * 
	 * @param obj
	 * @return 1成功：0失败
	 */
	String addInfo(Object obj);

	/**
	 * --获取信息表中未审核信息数量
	 * 
	 * @param tableName
	 *            信息表名
	 * @return 总记录数
	 */
	Long getInformationCount(String tableName, String status);

	/**
	 * ---通过ID获取单条信息
	 * 
	 * @param tableName
	 *            所要查询的表名
	 * @param tableId
	 *            数据的ID
	 * @return 信息记录对象
	 */
	Object getAInfomationByTableId(String tableName, String tableInfoIdName, String string);

	/**
	 * 通过部门ID获取部门对象
	 * 
	 * @param departmentId
	 *            部门id
	 * @return 部门对象
	 */
	Department getDepartmentById(String departmentId);

}
