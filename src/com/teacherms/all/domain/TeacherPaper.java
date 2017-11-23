package com.teacherms.all.domain;

/**
 * TeacherPaper entity. @author MyEclipse Persistence Tools
 */

public class TeacherPaper implements java.io.Serializable {

	// Fields

	private String paperId;
	private String userId;
	private String paperName;
	private String authorUserNames;
	private String authorUserIds;
	private String paperType;
	private String periodical;
	private String periodicalNo;
	private String publishTime;
	private String includedSituation;
	private Integer totalCitations;
	private String sfyhylhfb;
	private String sfydflhfb;
	private String sfygjlhfb;
	private String sfskxklw;
	private Integer wordsNum;
	private String attachmentPath;
	private String dataStatus;
	private String createTime;

	// Constructors

	/** default constructor */
	public TeacherPaper() {
	}

	/** minimal constructor */
	public TeacherPaper(String paperId) {
		this.paperId = paperId;
	}

	/** full constructor */
	public TeacherPaper(String paperId, String userId, String paperName, String authorUserNames, String authorUserIds,
			String paperType, String periodical, String periodicalNo, String publishTime, String includedSituation,
			Integer totalCitations, String sfyhylhfb, String sfydflhfb, String sfygjlhfb, String sfskxklw,
			Integer wordsNum, String attachmentPath, String dataStatus, String createTime) {
		this.paperId = paperId;
		this.userId = userId;
		this.paperName = paperName;
		this.authorUserNames = authorUserNames;
		this.authorUserIds = authorUserIds;
		this.paperType = paperType;
		this.periodical = periodical;
		this.periodicalNo = periodicalNo;
		this.publishTime = publishTime;
		this.includedSituation = includedSituation;
		this.totalCitations = totalCitations;
		this.sfyhylhfb = sfyhylhfb;
		this.sfydflhfb = sfydflhfb;
		this.sfygjlhfb = sfygjlhfb;
		this.sfskxklw = sfskxklw;
		this.wordsNum = wordsNum;
		this.attachmentPath = attachmentPath;
		this.dataStatus = dataStatus;
		this.createTime = createTime;
	}

	// Property accessors

	public String getPaperId() {
		return this.paperId;
	}

	public void setPaperId(String paperId) {
		this.paperId = paperId;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPaperName() {
		return this.paperName;
	}

	public void setPaperName(String paperName) {
		this.paperName = paperName;
	}

	public String getAuthorUserNames() {
		return this.authorUserNames;
	}

	public void setAuthorUserNames(String authorUserNames) {
		this.authorUserNames = authorUserNames;
	}

	public String getAuthorUserIds() {
		return this.authorUserIds;
	}

	public void setAuthorUserIds(String authorUserIds) {
		this.authorUserIds = authorUserIds;
	}

	public String getPaperType() {
		return this.paperType;
	}

	public void setPaperType(String paperType) {
		this.paperType = paperType;
	}

	public String getPeriodical() {
		return this.periodical;
	}

	public void setPeriodical(String periodical) {
		this.periodical = periodical;
	}

	public String getPeriodicalNo() {
		return this.periodicalNo;
	}

	public void setPeriodicalNo(String periodicalNo) {
		this.periodicalNo = periodicalNo;
	}

	public String getPublishTime() {
		return this.publishTime;
	}

	public void setPublishTime(String publishTime) {
		this.publishTime = publishTime;
	}

	public String getIncludedSituation() {
		return this.includedSituation;
	}

	public void setIncludedSituation(String includedSituation) {
		this.includedSituation = includedSituation;
	}

	public Integer getTotalCitations() {
		return this.totalCitations;
	}

	public void setTotalCitations(Integer totalCitations) {
		this.totalCitations = totalCitations;
	}

	public String getSfyhylhfb() {
		return this.sfyhylhfb;
	}

	public void setSfyhylhfb(String sfyhylhfb) {
		this.sfyhylhfb = sfyhylhfb;
	}

	public String getSfydflhfb() {
		return this.sfydflhfb;
	}

	public void setSfydflhfb(String sfydflhfb) {
		this.sfydflhfb = sfydflhfb;
	}

	public String getSfygjlhfb() {
		return this.sfygjlhfb;
	}

	public void setSfygjlhfb(String sfygjlhfb) {
		this.sfygjlhfb = sfygjlhfb;
	}

	public String getSfskxklw() {
		return this.sfskxklw;
	}

	public void setSfskxklw(String sfskxklw) {
		this.sfskxklw = sfskxklw;
	}

	public Integer getWordsNum() {
		return this.wordsNum;
	}

	public void setWordsNum(Integer wordsNum) {
		this.wordsNum = wordsNum;
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