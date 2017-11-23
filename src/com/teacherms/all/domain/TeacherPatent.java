package com.teacherms.all.domain;

/**
 * TeacherPatent entity. @author MyEclipse Persistence Tools
 */

public class TeacherPatent implements java.io.Serializable {

	// Fields

	private String patentId;
	private String userId;
	private String patentName;
	private String authorUserNames;
	private String authorUserIds;
	private String patentType;
	private String authorizationNo;
	private String approvedDate;
	private String isApplication;
	private String sfhylh;
	private String dataStatus;
	private String createTime;

	// Constructors

	/** default constructor */
	public TeacherPatent() {
	}

	/** minimal constructor */
	public TeacherPatent(String patentId) {
		this.patentId = patentId;
	}

	/** full constructor */
	public TeacherPatent(String patentId, String userId, String patentName, String authorUserNames,
			String authorUserIds, String patentType, String authorizationNo, String approvedDate, String isApplication,
			String sfhylh, String dataStatus, String createTime) {
		this.patentId = patentId;
		this.userId = userId;
		this.patentName = patentName;
		this.authorUserNames = authorUserNames;
		this.authorUserIds = authorUserIds;
		this.patentType = patentType;
		this.authorizationNo = authorizationNo;
		this.approvedDate = approvedDate;
		this.isApplication = isApplication;
		this.sfhylh = sfhylh;
		this.dataStatus = dataStatus;
		this.createTime = createTime;
	}

	// Property accessors

	public String getPatentId() {
		return this.patentId;
	}

	public void setPatentId(String patentId) {
		this.patentId = patentId;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPatentName() {
		return this.patentName;
	}

	public void setPatentName(String patentName) {
		this.patentName = patentName;
	}

	public String getAuthorUserNames() {
		return this.authorUserNames;
	}

	public void setAuthorUserNames(String authorUserNames) {
		this.authorUserNames = authorUserNames;
	}

	public String getAuthorUserIds() {
		return this.authorUserIds;
	}

	public void setAuthorUserIds(String authorUserIds) {
		this.authorUserIds = authorUserIds;
	}

	public String getPatentType() {
		return this.patentType;
	}

	public void setPatentType(String patentType) {
		this.patentType = patentType;
	}

	public String getAuthorizationNo() {
		return this.authorizationNo;
	}

	public void setAuthorizationNo(String authorizationNo) {
		this.authorizationNo = authorizationNo;
	}

	public String getApprovedDate() {
		return this.approvedDate;
	}

	public void setApprovedDate(String approvedDate) {
		this.approvedDate = approvedDate;
	}

	public String getIsApplication() {
		return this.isApplication;
	}

	public void setIsApplication(String isApplication) {
		this.isApplication = isApplication;
	}

	public String getSfhylh() {
		return this.sfhylh;
	}

	public void setSfhylh(String sfhylh) {
		this.sfhylh = sfhylh;
	}

	public String getDataStatus() {
		return this.dataStatus;
	}

	public void setDataStatus(String dataStatus) {
		this.dataStatus = dataStatus;
	}

	public String getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}