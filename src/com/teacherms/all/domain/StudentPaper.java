package com.teacherms.all.domain;

import java.util.Date;

/**
 * StudentPaper entity. @author MyEclipse Persistence Tools
 */

public class StudentPaper implements java.io.Serializable {

	// Fields

	private String paperId;
	private String studentId;
	private String periodical;
	private Date publishTime;
	private String includedSituation;
	private String createTime;

	// Constructors

	/** default constructor */
	public StudentPaper() {
	}

	/** full constructor */
	public StudentPaper(String paperId, String studentId, String periodical, Date publishTime, String includedSituation,
			String createTime) {
		this.paperId = paperId;
		this.studentId = studentId;
		this.periodical = periodical;
		this.publishTime = publishTime;
		this.includedSituation = includedSituation;
		this.createTime = createTime;
	}

	// Property accessors

	public String getPaperId() {
		return this.paperId;
	}

	public void setPaperId(String paperId) {
		this.paperId = paperId;
	}

	public String getStudentId() {
		return this.studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getPeriodical() {
		return this.periodical;
	}

	public void setPeriodical(String periodical) {
		this.periodical = periodical;
	}

	public Date getPublishTime() {
		return this.publishTime;
	}

	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}

	public String getIncludedSituation() {
		return this.includedSituation;
	}

	public void setIncludedSituation(String includedSituation) {
		this.includedSituation = includedSituation;
	}

	public String getcreateTime() {
		return this.createTime;
	}

	public void setcreateTime(String createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "StudentPaper [paperId=" + paperId + ", studentId=" + studentId + ", periodical=" + periodical
				+ ", publishTime=" + publishTime + ", includedSituation=" + includedSituation + ", createTime="
				+ createTime + "]";
	}

}