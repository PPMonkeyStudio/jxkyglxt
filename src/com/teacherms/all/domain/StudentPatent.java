package com.teacherms.all.domain;

/**
 * StudentPatent entity. @author MyEclipse Persistence Tools
 */

public class StudentPatent implements java.io.Serializable {

	// Fields

	private String patentId;
	private String studentId;
	private String awardName;
	private String awardClass;
	private String authorizationNo;
	private String time;
	private String firstPatent;
	private String alterTime;

	// Constructors

	/** default constructor */
	public StudentPatent() {
	}

	/** full constructor */
	public StudentPatent(String patentId, String studentId, String awardName, String awardClass, String authorizationNo,
			String time, String firstPatent, String alterTime) {
		this.patentId = patentId;
		this.studentId = studentId;
		this.awardName = awardName;
		this.awardClass = awardClass;
		this.authorizationNo = authorizationNo;
		this.time = time;
		this.firstPatent = firstPatent;
		this.alterTime = alterTime;
	}

	// Property accessors

	public String getPatentId() {
		return this.patentId;
	}

	public void setPatentId(String patentId) {
		this.patentId = patentId;
	}

	public String getStudentId() {
		return this.studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getAwardName() {
		return this.awardName;
	}

	public void setAwardName(String awardName) {
		this.awardName = awardName;
	}

	public String getAwardClass() {
		return this.awardClass;
	}

	public void setAwardClass(String awardClass) {
		this.awardClass = awardClass;
	}

	public String getAuthorizationNo() {
		return this.authorizationNo;
	}

	public void setAuthorizationNo(String authorizationNo) {
		this.authorizationNo = authorizationNo;
	}

	public String getTime() {
		return this.time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getFirstPatent() {
		return this.firstPatent;
	}

	public void setFirstPatent(String firstPatent) {
		this.firstPatent = firstPatent;
	}

	public String getAlterTime() {
		return this.alterTime;
	}

	public void setAlterTime(String alterTime) {
		this.alterTime = alterTime;
	}

}