package com.teacherms.all.domain;

/**
 * Department entity. @author MyEclipse Persistence Tools
 */

public class Department implements java.io.Serializable {

	// Fields

	private String departmentId;
	private String departmentName;
	private String description;

	// Constructors

	/** default constructor */
	public Department() {
	}

	/** minimal constructor */
	public Department(String departmentId) {
		this.departmentId = departmentId;
	}

	/** full constructor */
	public Department(String departmentId, String departmentName, String description) {
		this.departmentId = departmentId;
		this.departmentName = departmentName;
		this.description = description;
	}

	// Property accessors

	public String getDepartmentId() {
		return this.departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public String getDepartmentName() {
		return this.departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}