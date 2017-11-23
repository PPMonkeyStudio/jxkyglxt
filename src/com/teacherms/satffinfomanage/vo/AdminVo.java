package com.teacherms.satffinfomanage.vo;

public class AdminVo {
	private String userId; // User表中用户ID
	private String userName;// User表中用户名称
	private String dataType;// 信息表中，信息类型（信息表为教职工信息表，奖励表，专利表等）
	private String time;// 信息表中，信息时间
	private String dataId;// 信息表中，信息ID

	public AdminVo() {
	}

	public AdminVo(String userId, String userName, String dataType, String time, String dataId) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.dataType = dataType;
		this.time = time;
		this.dataId = dataId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getDataId() {
		return dataId;
	}

	public void setDataId(String dataId) {
		this.dataId = dataId;
	}

}
