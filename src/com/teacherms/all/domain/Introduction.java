package com.teacherms.all.domain;

/**
 * Introduction entity. @author MyEclipse Persistence Tools
 */

public class Introduction implements java.io.Serializable {

	// Fields

	private Integer introductionId;
	private String introductionName;
	private String introductionContent;
	private String introductionDepartment;
	private String introductionImage;
	private Integer introductionRanking;

	// Constructors

	/** default constructor */
	public Introduction() {
	}

	/** full constructor */
	public Introduction(Integer introductionId, String introductionName, String introductionContent,
			String introductionDepartment, String introductionImage, Integer introductionRanking) {
		this.introductionId = introductionId;
		this.introductionName = introductionName;
		this.introductionContent = introductionContent;
		this.introductionDepartment = introductionDepartment;
		this.introductionImage = introductionImage;
		this.introductionRanking = introductionRanking;
	}

	// Property accessors

	public Integer getIntroductionId() {
		return this.introductionId;
	}

	public void setIntroductionId(Integer introductionId) {
		this.introductionId = introductionId;
	}

	public String getIntroductionName() {
		return this.introductionName;
	}

	public void setIntroductionName(String introductionName) {
		this.introductionName = introductionName;
	}

	public String getIntroductionContent() {
		return this.introductionContent;
	}

	public void setIntroductionContent(String introductionContent) {
		this.introductionContent = introductionContent;
	}

	public String getIntroductionDepartment() {
		return this.introductionDepartment;
	}

	public void setIntroductionDepartment(String introductionDepartment) {
		this.introductionDepartment = introductionDepartment;
	}

	public String getIntroductionImage() {
		return this.introductionImage;
	}

	public void setIntroductionImage(String introductionImage) {
		this.introductionImage = introductionImage;
	}

	public Integer getIntroductionRanking() {
		return this.introductionRanking;
	}

	public void setIntroductionRanking(Integer introductionRanking) {
		this.introductionRanking = introductionRanking;
	}

	@Override
	public String toString() {
		return "Introduction [introductionId=" + introductionId + ", introductionName=" + introductionName
				+ ", introductionContent=" + introductionContent + ", introductionDepartment=" + introductionDepartment
				+ ", introductionImage=" + introductionImage + ", introductionRanking=" + introductionRanking + "]";
	}

}