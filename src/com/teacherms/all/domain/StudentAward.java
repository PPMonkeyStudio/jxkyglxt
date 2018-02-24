package com.teacherms.all.domain;

/**
 * StudentAward entity. @author MyEclipse Persistence Tools
 */

public class StudentAward implements java.io.Serializable {

	// Fields

	private String awardId;
	private String studentId;
	private String awardName;
	private String awardClass;
	private String authorizationNo;
	private String time;
	private String firstAward;
	private String alterTime;

	// Constructors

	/** default constructor */
	public StudentAward() {
	}

	/** full constructor */
	public StudentAward(String awardId, String studentId, String awardName, String awardClass, String authorizationNo,
			String time, String firstAward, String alterTime) {
		this.awardId = awardId;
		this.studentId = studentId;
		this.awardName = awardName;
		this.awardClass = awardClass;
		this.authorizationNo = authorizationNo;
		this.time = time;
		this.firstAward = firstAward;
		this.alterTime = alterTime;
	}

	// Property accessors

	public String getAwardId() {
		return this.awardId;
	}

	public void setAwardId(String awardId) {
		this.awardId = awardId;
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

	public String getFirstAward() {
		return this.firstAward;
	}

	public void setFirstAward(String firstAward) {
		this.firstAward = firstAward;
	}

	public String getAlterTime() {
		return this.alterTime;
	}

	public void setAlterTime(String alterTime) {
		this.alterTime = alterTime;
	}

}