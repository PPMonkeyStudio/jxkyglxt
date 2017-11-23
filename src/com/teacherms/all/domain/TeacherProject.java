package com.teacherms.all.domain;

/**
 * TeacherProject entity. @author MyEclipse Persistence Tools
 */

public class TeacherProject implements java.io.Serializable {

	// Fields

	private String projectId;
	private String userId;
	private String projectName;
	private String projectSource;
	private String projectUserNames;
	private String projectUserIds;
	private String projectNo;
	private String projectType;
	private String approvalDate;
	private String endUpDate;
	private Integer funds;
	private Integer memberNum;
	private String level;
	private String isImportant;
	private String attachmentPath;
	private String dataStatus;
	private String createTime;

	// Constructors

	/** default constructor */
	public TeacherProject() {
	}

	/** minimal constructor */
	public TeacherProject(String projectId) {
		this.projectId = projectId;
	}

	/** full constructor */
	public TeacherProject(String projectId, String userId, String projectName, String projectSource,
			String projectUserNames, String projectUserIds, String projectNo, String projectType, String approvalDate,
			String endUpDate, Integer funds, Integer memberNum, String level, String isImportant, String attachmentPath,
			String dataStatus, String createTime) {
		super();
		this.projectId = projectId;
		this.userId = userId;
		this.projectName = projectName;
		this.projectSource = projectSource;
		this.projectUserNames = projectUserNames;
		this.projectUserIds = projectUserIds;
		this.projectNo = projectNo;
		this.projectType = projectType;
		this.approvalDate = approvalDate;
		this.endUpDate = endUpDate;
		this.funds = funds;
		this.memberNum = memberNum;
		this.level = level;
		this.isImportant = isImportant;
		this.attachmentPath = attachmentPath;
		this.dataStatus = dataStatus;
		this.createTime = createTime;
	}

	// Property accessors

	public String getProjectId() {
		return this.projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getProjectName() {
		return this.projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectSource() {
		return this.projectSource;
	}

	public void setProjectSource(String projectSource) {
		this.projectSource = projectSource;
	}

	public String getProjectUserNames() {
		return projectUserNames;
	}

	public void setProjectUserNames(String projectUserNames) {
		this.projectUserNames = projectUserNames;
	}

	public String getProjectUserIds() {
		return projectUserIds;
	}

	public void setProjectUserIds(String projectUserIds) {
		this.projectUserIds = projectUserIds;
	}

	public String getProjectNo() {
		return this.projectNo;
	}

	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}

	public String getProjectType() {
		return this.projectType;
	}

	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}

	public String getApprovalDate() {
		return this.approvalDate;
	}

	public void setApprovalDate(String approvalDate) {
		this.approvalDate = approvalDate;
	}

	public String getEndUpDate() {
		return this.endUpDate;
	}

	public void setEndUpDate(String endUpDate) {
		this.endUpDate = endUpDate;
	}

	public Integer getFunds() {
		return this.funds;
	}

	public void setFunds(Integer funds) {
		this.funds = funds;
	}

	public Integer getMemberNum() {
		return this.memberNum;
	}

	public void setMemberNum(Integer memberNum) {
		this.memberNum = memberNum;
	}

	public String getLevel() {
		return this.level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getIsImportant() {
		return this.isImportant;
	}

	public void setIsImportant(String isImportant) {
		this.isImportant = isImportant;
	}

	public String getAttachmentPath() {
		return this.attachmentPath;
	}

	public void setAttachmentPath(String attachmentPath) {
		this.attachmentPath = attachmentPath;
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