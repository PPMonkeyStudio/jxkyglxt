package com.teacherms.all.domain;

/**
 * StudentProject entity. @author MyEclipse Persistence Tools
 */

public class StudentProject implements java.io.Serializable {

	// Fields

	private String projectId;
	private String projectName;
	private String studentId;
	private String projectLeading;
	private String userId;
	private String alterTime;

	// Constructors

	/** default constructor */
	public StudentProject() {
	}

	/** full constructor */
	public StudentProject(String projectId, String projectName, String studentId, String projectLeading, String userId,
			String alterTime) {
		this.projectId = projectId;
		this.projectName = projectName;
		this.studentId = studentId;
		this.projectLeading = projectLeading;
		this.userId = userId;
		this.alterTime = alterTime;
	}

	// Property accessors

	public String getProjectId() {
		return this.projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getProjectName() {
		return this.projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getStudentId() {
		return this.studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getProjectLeading() {
		return this.projectLeading;
	}

	public void setProjectLeading(String projectLeading) {
		this.projectLeading = projectLeading;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAlterTime() {
		return this.alterTime;
	}

	public void setAlterTime(String alterTime) {
		this.alterTime = alterTime;
	}

	@Override
	public String toString() {
		return "StudentProject [projectId=" + projectId + ", projectName=" + projectName + ", studentId=" + studentId
				+ ", projectLeading=" + projectLeading + ", userId=" + userId + ", alterTime=" + alterTime + "]";
	}

}