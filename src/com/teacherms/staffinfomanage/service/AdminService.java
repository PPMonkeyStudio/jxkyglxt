package com.teacherms.staffinfomanage.service;

import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.teacherms.all.domain.TeacherAward;
import com.teacherms.all.domain.TeacherInfo;
import com.teacherms.satffinfomanage.vo.TableInfoAndUserVo;

import util.PageVO;

public interface AdminService {

	/**
	 * ---通过分页获取表中指定未审核信息（若未指定则查询全部），并且进行时间 的排序
	 * 
	 * @param page
	 *            页码
	 * @return 对象
	 */
	PageVO<Object> getSpecifiedInformationByPaging(String tableName, String page, String time_interval,
			String dataState, String collegeName, Object obj);

	/**
	 * ---通过ID获取单条信息
	 * 
	 * @param tableName
	 *            所要查询的表名
	 * @param tableId
	 *            数据的ID
	 * @return 信息记录对象
	 */
	TableInfoAndUserVo getTeacherTableInfoById(String tableName, String tableId);

	/**
	 * ---管理员修改信息状态+修改信息内容
	 * 
	 * @param obj
	 *            所要修改的对象
	 * @return
	 */
	String curingInfomation(Object obj);

	/**
	 * ---添加教职工信息
	 * 
	 * @param teacherInfo
	 *            教职工对象
	 * @return 添加成功与否
	 */
	String addTeacherInfo(TeacherInfo teacherInfo, String departmentid);

	/**
	 * ---查询到的数据存入execl表格中
	 * 
	 * @param query_num
	 *            所要包含的字段
	 * @param tableName
	 *            查询的表
	 * @param list
	 *            查询到的结果List<Map<String, String>>集合
	 * @param tableId
	 *            所要查询的信息id,多个以逗号隔开
	 * @return execl表格
	 */
	XSSFWorkbook getExcel(String query_name, String tableName, String query_id);

	/**
	 * --通过导入表格添加信息到数据库的添加操作
	 * 
	 * @param list
	 *            对象集合
	 */
	void addinfo(List<Object> list);

	/**
	 * ---管理员解除固化操作
	 * 
	 * @param tableName
	 *            信息表名
	 * @param tableId
	 *            信息ID
	 * @return 返回空为失败，字符串为成功
	 */
	String adminLiftCuring(String tableName, String tableId, String dataState);

	/**
	 * 通过用户的部门ID获取部门名字
	 * 
	 * @param departmentId
	 *            部门ID
	 * @param what
	 *            所要获取的属性
	 * @return 部门名字
	 */
	String getDepartmentNameByDepartmentId(String departmentId, String what);

	/**
	 * 管理员获取输入用户名字，获取用户的id排名
	 * 
	 * @param userName
	 *            名字(用逗号隔开)
	 * @return
	 */
	String getUserIdOrderingByUserName(String userName);

}
