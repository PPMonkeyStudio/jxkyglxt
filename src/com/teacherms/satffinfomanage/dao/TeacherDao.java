package com.teacherms.satffinfomanage.dao;

import java.util.List;

import com.teacherms.all.domain.TeacherInfo;
import com.teacherms.all.domain.User;

public interface TeacherDao {

	List<Object[]> getTableInfo(String query, String tableName, String tableUserIds, String userid, String time, int i,
			int toindex);

	Long getCountInOnetable(String userid, String tableUserIds, String tableName);

	List<Object[]> getTableInfoByTableId(String tableName, String tableInfoIdName, String tableId);

	String addTableInfo(Object obj);

	List<Object[]> getAllStatusInfo(String selectinfo, String table, String time, String status);

	/**
	 * 返回信息查询对象
	 * 
	 * @param tableName
	 *            信息表名
	 * @param tableInfoIdName
	 *            信息表的id名
	 * @param tableId
	 *            id
	 * @return 信息对象
	 */
	Object getTableObjectByTableId(String tableName, String tableInfoIdName, String tableId);

	/**
	 * 通过用户ID获取用户的信息
	 * 
	 * @param userId
	 *            用户id
	 * @return 数组
	 */
	List<Object[]> getTeacherInfoByUserId(String userId);

	/**
	 * 更新对象
	 * 
	 * @param teacherInfo
	 *            对象
	 * @return
	 */
	String updateInfo(TeacherInfo teacherInfo);

	/**
	 * 过去用户表对象
	 * 
	 * @param userId
	 *            用户id
	 * @return 用户对像
	 */
	User getUserByUserId(String userId);

}
