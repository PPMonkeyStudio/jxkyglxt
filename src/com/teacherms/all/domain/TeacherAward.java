package com.teacherms.all.domain;

import java.util.Date;

/**
 * TeacherAward entity. @author MyEclipse Persistence Tools
 */
public class TeacherAward implements java.io.Serializable {

	// Fields

	private String awardId;
	private String userId;
	private String achievementName;
	private String awardName;
	private String awardUserNames;
	private String awardUserIds;
	private String awardType;
	private String awardClass;
	private String awardGrade;
	private String awardLevel;
	private String awardDate;
	private String awardCertificationNo;
	private String grantUnit;
	private String attachmentPath;
	private String dataStatus;
	private String createTime;

	// Constructors

	/** default constructor */
	public TeacherAward() {
	}

	/** minimal constructor */
	public TeacherAward(String awardId) {
		this.awardId = awardId;
	}

	/** full constructor */
	public TeacherAward(String awardId, String userId, String achievementName, String awardName, String awardUserNames,
			String awardUserIds, String awardType, String awardClass, String awardGrade, String awardLevel,
			String awardDate, String awardCertificationNo, String grantUnit, String attachmentPath, String dataStatus,
			String createTime) {
		this.awardId = awardId;
		this.userId = userId;
		this.achievementName = achievementName;
		this.awardName = awardName;
		this.awardUserNames = awardUserNames;
		this.awardUserIds = awardUserIds;
		this.awardType = awardType;
		this.awardClass = awardClass;
		this.awardGrade = awardGrade;
		this.awardLevel = awardLevel;
		this.awardDate = awardDate;
		this.awardCertificationNo = awardCertificationNo;
		this.grantUnit = grantUnit;
		this.attachmentPath = attachmentPath;
		this.dataStatus = dataStatus;
		this.createTime = createTime;
	}

	// Property accessors

	public String getAwardId() {
		return this.awardId;
	}

	public void setAwardId(String awardId) {
		this.awardId = awardId;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAchievementName() {
		return this.achievementName;
	}

	public void setAchievementName(String achievementName) {
		this.achievementName = achievementName;
	}

	public String getAwardName() {
		return this.awardName;
	}

	public void setAwardName(String awardName) {
		this.awardName = awardName;
	}

	public String getAwardUserNames() {
		return this.awardUserNames;
	}

	public void setAwardUserNames(String awardUserNames) {
		this.awardUserNames = awardUserNames;
	}

	public String getAwardUserIds() {
		return this.awardUserIds;
	}

	public void setAwardUserIds(String awardUserIds) {
		this.awardUserIds = awardUserIds;
	}

	public String getAwardType() {
		return this.awardType;
	}

	public void setAwardType(String awardType) {
		this.awardType = awardType;
	}

	public String getAwardClass() {
		return this.awardClass;
	}

	public void setAwardClass(String awardClass) {
		this.awardClass = awardClass;
	}

	public String getAwardGrade() {
		return this.awardGrade;
	}

	public void setAwardGrade(String awardGrade) {
		this.awardGrade = awardGrade;
	}

	public String getAwardLevel() {
		return this.awardLevel;
	}

	public void setAwardLevel(String awardLevel) {
		this.awardLevel = awardLevel;
	}

	public String getAwardDate() {
		return this.awardDate;
	}

	public void setAwardDate(String awardDate) {
		this.awardDate = awardDate;
	}

	public String getAwardCertificationNo() {
		return this.awardCertificationNo;
	}

	public void setAwardCertificationNo(String awardCertificationNo) {
		this.awardCertificationNo = awardCertificationNo;
	}

	public String getGrantUnit() {
		return this.grantUnit;
	}

	public void setGrantUnit(String grantUnit) {
		this.grantUnit = grantUnit;
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

	@Override
	public String toString() {
		return "TeacherAward [awardId=" + awardId + ", userId=" + userId + ", achievementName=" + achievementName
				+ ", awardName=" + awardName + ", awardUserNames=" + awardUserNames + ", awardUserIds=" + awardUserIds
				+ ", awardType=" + awardType + ", awardClass=" + awardClass + ", awardGrade=" + awardGrade
				+ ", awardLevel=" + awardLevel + ", awardDate=" + awardDate + ", awardCertificationNo="
				+ awardCertificationNo + ", grantUnit=" + grantUnit + ", attachmentPath=" + attachmentPath
				+ ", dataStatus=" + dataStatus + ", createTime=" + createTime + "]";
	}
}