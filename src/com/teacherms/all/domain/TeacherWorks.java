package com.teacherms.all.domain;

import java.util.Date;

/**
 * TeacherWorks entity. @author MyEclipse Persistence Tools
 */

public class TeacherWorks implements java.io.Serializable {

	// Fields

	private String worksId;
	private String userId;
	private String worksName;
	private String worksType;
	private String press;
	private String isbn;
	private String publishTime;
	private String selectedSituation;
	private String selectedDate;
	private String editorUserNames;
	private String editorUserIds;
	private String subEditorUserNames;
	private String subEditorUserIds;
	private String associateEditorUserNames;
	private String associateEditorUserIds;
	private String dataStatus;
	private String createTime;

	// Constructors

	/** default constructor */
	public TeacherWorks() {
	}

	/** minimal constructor */
	public TeacherWorks(String worksId) {
		this.worksId = worksId;
	}

	/** full constructor */
	public TeacherWorks(String worksId, String userId, String worksName, String worksType, String press, String isbn,
			String publishTime, String selectedSituation, String selectedDate, String editorUserNames,
			String editorUserIds, String subEditorUserNames, String subEditorUserIds, String associateEditorUserNames,
			String associateEditorUserIds, String dataStatus, String createTime) {
		this.worksId = worksId;
		this.userId = userId;
		this.worksName = worksName;
		this.worksType = worksType;
		this.press = press;
		this.isbn = isbn;
		this.publishTime = publishTime;
		this.selectedSituation = selectedSituation;
		this.selectedDate = selectedDate;
		this.editorUserNames = editorUserNames;
		this.editorUserIds = editorUserIds;
		this.subEditorUserNames = subEditorUserNames;
		this.subEditorUserIds = subEditorUserIds;
		this.associateEditorUserNames = associateEditorUserNames;
		this.associateEditorUserIds = associateEditorUserIds;
		this.dataStatus = dataStatus;
		this.createTime = createTime;
	}

	// Property accessors

	public String getWorksId() {
		return this.worksId;
	}

	public void setWorksId(String worksId) {
		this.worksId = worksId;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getWorksName() {
		return this.worksName;
	}

	public void setWorksName(String worksName) {
		this.worksName = worksName;
	}

	public String getWorksType() {
		return this.worksType;
	}

	public void setWorksType(String worksType) {
		this.worksType = worksType;
	}

	public String getPress() {
		return this.press;
	}

	public void setPress(String press) {
		this.press = press;
	}

	public String getIsbn() {
		return this.isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getPublishTime() {
		return this.publishTime;
	}

	public void setPublishTime(String publishTime) {
		this.publishTime = publishTime;
	}

	public String getSelectedSituation() {
		return this.selectedSituation;
	}

	public void setSelectedSituation(String selectedSituation) {
		this.selectedSituation = selectedSituation;
	}

	public String getSelectedDate() {
		return this.selectedDate;
	}

	public void setSelectedDate(String selectedDate) {
		this.selectedDate = selectedDate;
	}

	public String getEditorUserNames() {
		return this.editorUserNames;
	}

	public void setEditorUserNames(String editorUserNames) {
		this.editorUserNames = editorUserNames;
	}

	public String getEditorUserIds() {
		return this.editorUserIds;
	}

	public void setEditorUserIds(String editorUserIds) {
		this.editorUserIds = editorUserIds;
	}

	public String getSubEditorUserNames() {
		return this.subEditorUserNames;
	}

	public void setSubEditorUserNames(String subEditorUserNames) {
		this.subEditorUserNames = subEditorUserNames;
	}

	public String getSubEditorUserIds() {
		return this.subEditorUserIds;
	}

	public void setSubEditorUserIds(String subEditorUserIds) {
		this.subEditorUserIds = subEditorUserIds;
	}

	public String getAssociateEditorUserNames() {
		return this.associateEditorUserNames;
	}

	public void setAssociateEditorUserNames(String associateEditorUserNames) {
		this.associateEditorUserNames = associateEditorUserNames;
	}

	public String getAssociateEditorUserIds() {
		return this.associateEditorUserIds;
	}

	public void setAssociateEditorUserIds(String associateEditorUserIds) {
		this.associateEditorUserIds = associateEditorUserIds;
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