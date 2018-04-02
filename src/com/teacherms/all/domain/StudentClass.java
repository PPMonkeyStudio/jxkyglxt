package com.teacherms.all.domain;

/**
 * StudentClass entity. @author MyEclipse Persistence Tools
 */

public class StudentClass implements java.io.Serializable {

	// Fields

	private String classId;
	private String className;
	private String userId;
	private String createTime;

	// Constructors

	/** default constructor */
	public StudentClass() {
	}

	/** full constructor */
	public StudentClass(String classId, String className, String userId, String createTime) {
		this.classId = classId;
		this.className = className;
		this.userId = userId;
		this.createTime = createTime;
	}

	// Property accessors

	public String getClassId() {
		return this.classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public String getClassName() {
		return this.className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getcreateTime() {
		return this.createTime;
	}

	public void setcreateTime(String createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "StudentClass [classId=" + classId + ", className=" + className + ", userId=" + userId + ", createTime="
				+ createTime + "]";
	}

}