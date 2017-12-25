package com.teacherms.staffinfomanage.service;

import java.io.File;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.teacherms.all.domain.TeacherInfo;
import com.teacherms.satffinfomanage.vo.TableInfoAndUserVo;

import util.PageVO;

public interface TeacherService {

	/**
	 * ---用户分页获取信息表中信息
	 * 
	 * @param userid
	 *            现登录用户的id
	 * @param tableName
	 *            信息表名字
	 * @param page
	 *            页码
	 * @param time_interval
	 * @return 查询结果封装到PageVO<Object[]>中
	 */
	PageVO<Object> getTableInfoInPaging(String userid, String tableName, String page, String time_interval);

	/**
	 * ---用户通过信息ID获取单条信息
	 * 
	 * @param tableName
	 *            信息表名字
	 * @param tableId
	 *            信息表ID
	 * @param userid
	 * @return 信息对象
	 */
	TableInfoAndUserVo userGetTableInfoByTableId(String tableName, String tableId);

	/**
	 * ---用户添加用户的信息
	 * 
	 * @param userid
	 * @param obj
	 * @return
	 */
	String addTableInfo(String userid, Object obj, String tableName);

	/**
	 * ---查询数据导出到execl表中
	 * 
	 * @param query_name
	 *            所要获得的字段
	 * @param tableName
	 *            信息表名称
	 * @param query_id
	 *            信息id，逗号隔开
	 * @return 返回表格
	 */
	XSSFWorkbook getExcel(String query_name, String tableName, String query_id);

	/**
	 * ---用户提交信息至管理员审核
	 * 
	 * @param tableId
	 *            信息表
	 * @param tableId2
	 * @return 返回结果
	 */
	String PuchInfoToadmin(String tableName, String tableId);

	/**
	 * ---通过登录用户的id获取用户信息
	 * 
	 * @param userId
	 *            登录用户id
	 * @return 对象
	 */
	TableInfoAndUserVo userGetTeacherInfo(String userId);

	/**
	 * ---用户补全或重新填写基本信息
	 * 
	 * @param teacherInfo
	 *            用户信息对象
	 * @param userId
	 *            登录用户id
	 * @param username
	 *            用户输入的名字
	 * @return success为成功，其他为失败
	 */
	String completeBasicInformation(TeacherInfo teacherInfo, String userId, String username);

	/**
	 * /** ---用户附件上传
	 * 
	 * @param file1
	 *            附件
	 * @param file1FileName
	 *            附件名字
	 * @param file1ContentType
	 *            附件类型
	 * @param userName
	 *            用户名称
	 * @param tableName
	 *            信息名称
	 * @param tableId
	 *            信息ID
	 * @return success：成功，error：失败
	 */
	String userAttachmentUpload(List<File> file1, List<String> file1FileName, List<String> file1ContentType,
			String userName, String tableName, String tableId);

	/**
	 * ---用户下载附件
	 * 
	 * @param tableName
	 *            附件所属信息的名字
	 * @param downloadInfoId
	 *            附件的所属id
	 * @return ZIP文件
	 */
	File downloadAttachment(String username, String tableName, String downloadInfoId);

	/**
	 * ---获取图片附件的base64编码
	 * 
	 * @param name
	 *            用户名称
	 * @param tableName
	 *            信息表名
	 * @param downloadInfoId
	 *            信息表ID
	 */
	List<File> getBase64Image(String name, String tableName, String downloadInfoId);

}
