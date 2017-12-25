package com.teacherms.satffinfomanage.dao;

import java.util.List;

import com.teacherms.all.domain.TeacherInfo;
import com.teacherms.all.domain.User;
import com.teacherms.satffinfomanage.vo.TableInfoAndUserVo;

public interface TeacherDao {

	List<Object> getTableInfo(String time_interval, String tableName, String tableUserIds, String userid, int i,
			int toindex);

	Long getCountInOnetable(String userid, String tableUserIds, String tableName);

	TableInfoAndUserVo getTableInfoByTableId(String tableName, String tableInfoIdName, String tableId);

	String addTableInfo(Object obj);

	List<Object> getAllStatusInfo(String table, String time, String status);

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
	 * @return 用户信息对象
	 */
	TableInfoAndUserVo getTeacherInfoByUserId(String userId);

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

	/**
	 * ---导出专用
	 * 
	 * @param tableName
	 * @param tableInfoIdName
	 * @param replaceAll
	 * @return
	 */
	List<Object> export_getAInfomationByTableId(String tableName, String tableInfoIdName, String replaceAll);

	/**
	 * ---信息名称
	 * 
	 * @param tableName
	 *            信息表名字
	 * @param tableInfoName
	 *            所需要得到的信息名称
	 * @param tableInfoIdName
	 *            信息的ID属性名称
	 * @param infoId
	 *            信息ID
	 * @return 信息名称
	 */
	String getTableInfoName(String tableName, String tableInfoName, String tableInfoIdName, String infoId);

	/**
	 * 通过用户名称获取用户ID
	 * 
	 * @param name
	 *            用户名称
	 */
	List<String> getUserIdByUserName(String name);

}
