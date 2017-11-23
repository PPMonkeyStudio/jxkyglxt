package com.teacherms.all.domain;

/**
 * TeacherInfo entity. @author MyEclipse Persistence Tools
 */

public class TeacherInfo implements java.io.Serializable {

	// Fields

	private String teacherInfoId;
	private String userId;
	private String certificateType;
	private String certificateNo;
	private String nation;
	private String nationality;
	private String GAT;
	private String huaQiao;
	private String politicalStatus;
	private String sex;
	private String birthday;
	private String highestEducation;
	private String highestDegree;
	private String learnEdgeStructure;
	private String professionalTitle;
	private String professionalGrade;
	private String subjectCategory;
	private String workDate;
	private String inductionDate;
	private String teacherCertificateNo;
	private String teachingType;
	private String teachingStatus;
	private String teachingProfessionName;
	private String teachingProfessionNo;
	private String professionTeachingDate;
	private String experimentalTechnicalPersonnel;
	private String doubleTeacherType;
	private String engineeringBackground;
	private String industryBackground;
	private String administrativeRank;
	private String graduateTutorType;
	private Integer numberOfDoctor;
	private Integer numberOfMaster;
	private String employeeType;
	private String employmentType;
	private String jobStatue;
	private String transactionType;
	private String universityTransfer;
	private String schoolGraduation;
	private String schoolAdjustment;
	private String offCampusTeacherType;
	private String dataStatus;
	private String createTime;

	// Constructors

	/** default constructor */
	public TeacherInfo() {
	}

	/** minimal constructor */
	public TeacherInfo(String teacherInfoId) {
		this.teacherInfoId = teacherInfoId;
	}

	/** full constructor */
	public TeacherInfo(String teacherInfoId, String userId, String certificateType, String certificateNo, String nation,
			String nationality, String GAT, String huaQiao, String politicalStatus, String sex, String birthday,
			String highestEducation, String highestDegree, String learnEdgeStructure, String professionalTitle,
			String professionalGrade, String subjectCategory, String workDate, String inductionDate,
			String teacherCertificateNo, String teachingType, String teachingStatus, String teachingProfessionName,
			String teachingProfessionNo, String professionTeachingDate, String experimentalTechnicalPersonnel,
			String doubleTeacherType, String engineeringBackground, String industryBackground,
			String administrativeRank, String graduateTutorType, Integer numberOfDoctor, Integer numberOfMaster,
			String employeeType, String employmentType, String jobStatue, String transactionType,
			String universityTransfer, String schoolGraduation, String schoolAdjustment, String offCampusTeacherType,
			String dataStatus, String createTime) {
		this.teacherInfoId = teacherInfoId;
		this.userId = userId;
		this.certificateType = certificateType;
		this.certificateNo = certificateNo;
		this.nation = nation;
		this.nationality = nationality;
		this.GAT = GAT;
		this.huaQiao = huaQiao;
		this.politicalStatus = politicalStatus;
		this.sex = sex;
		this.birthday = birthday;
		this.highestEducation = highestEducation;
		this.highestDegree = highestDegree;
		this.learnEdgeStructure = learnEdgeStructure;
		this.professionalTitle = professionalTitle;
		this.professionalGrade = professionalGrade;
		this.subjectCategory = subjectCategory;
		this.workDate = workDate;
		this.inductionDate = inductionDate;
		this.teacherCertificateNo = teacherCertificateNo;
		this.teachingType = teachingType;
		this.teachingStatus = teachingStatus;
		this.teachingProfessionName = teachingProfessionName;
		this.teachingProfessionNo = teachingProfessionNo;
		this.professionTeachingDate = professionTeachingDate;
		this.experimentalTechnicalPersonnel = experimentalTechnicalPersonnel;
		this.doubleTeacherType = doubleTeacherType;
		this.engineeringBackground = engineeringBackground;
		this.industryBackground = industryBackground;
		this.administrativeRank = administrativeRank;
		this.graduateTutorType = graduateTutorType;
		this.numberOfDoctor = numberOfDoctor;
		this.numberOfMaster = numberOfMaster;
		this.employeeType = employeeType;
		this.employmentType = employmentType;
		this.jobStatue = jobStatue;
		this.transactionType = transactionType;
		this.universityTransfer = universityTransfer;
		this.schoolGraduation = schoolGraduation;
		this.schoolAdjustment = schoolAdjustment;
		this.offCampusTeacherType = offCampusTeacherType;
		this.dataStatus = dataStatus;
		this.createTime = createTime;
	}

	// Property accessors

	public String getTeacherInfoId() {
		return this.teacherInfoId;
	}

	public void setTeacherInfoId(String teacherInfoId) {
		this.teacherInfoId = teacherInfoId;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCertificateType() {
		return this.certificateType;
	}

	public void setCertificateType(String certificateType) {
		this.certificateType = certificateType;
	}

	public String getCertificateNo() {
		return this.certificateNo;
	}

	public void setCertificateNo(String certificateNo) {
		this.certificateNo = certificateNo;
	}

	public String getNation() {
		return this.nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getNationality() {
		return this.nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getGAT() {
		return this.GAT;
	}

	public void setGAT(String GAT) {
		this.GAT = GAT;
	}

	public String getHuaQiao() {
		return this.huaQiao;
	}

	public void setHuaQiao(String huaQiao) {
		this.huaQiao = huaQiao;
	}

	public String getPoliticalStatus() {
		return this.politicalStatus;
	}

	public void setPoliticalStatus(String politicalStatus) {
		this.politicalStatus = politicalStatus;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirthday() {
		return this.birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getHighestEducation() {
		return this.highestEducation;
	}

	public void setHighestEducation(String highestEducation) {
		this.highestEducation = highestEducation;
	}

	public String getHighestDegree() {
		return this.highestDegree;
	}

	public void setHighestDegree(String highestDegree) {
		this.highestDegree = highestDegree;
	}

	public String getLearnEdgeStructure() {
		return this.learnEdgeStructure;
	}

	public void setLearnEdgeStructure(String learnEdgeStructure) {
		this.learnEdgeStructure = learnEdgeStructure;
	}

	public String getProfessionalTitle() {
		return this.professionalTitle;
	}

	public void setProfessionalTitle(String professionalTitle) {
		this.professionalTitle = professionalTitle;
	}

	public String getProfessionalGrade() {
		return this.professionalGrade;
	}

	public void setProfessionalGrade(String professionalGrade) {
		this.professionalGrade = professionalGrade;
	}

	public String getSubjectCategory() {
		return this.subjectCategory;
	}

	public void setSubjectCategory(String subjectCategory) {
		this.subjectCategory = subjectCategory;
	}

	public String getWorkDate() {
		return this.workDate;
	}

	public void setWorkDate(String workDate) {
		this.workDate = workDate;
	}

	public String getInductionDate() {
		return this.inductionDate;
	}

	public void setInductionDate(String inductionDate) {
		this.inductionDate = inductionDate;
	}

	public String getTeacherCertificateNo() {
		return this.teacherCertificateNo;
	}

	public void setTeacherCertificateNo(String teacherCertificateNo) {
		this.teacherCertificateNo = teacherCertificateNo;
	}

	public String getTeachingType() {
		return this.teachingType;
	}

	public void setTeachingType(String teachingType) {
		this.teachingType = teachingType;
	}

	public String getTeachingStatus() {
		return this.teachingStatus;
	}

	public void setTeachingStatus(String teachingStatus) {
		this.teachingStatus = teachingStatus;
	}

	public String getTeachingProfessionName() {
		return this.teachingProfessionName;
	}

	public void setTeachingProfessionName(String teachingProfessionName) {
		this.teachingProfessionName = teachingProfessionName;
	}

	public String getTeachingProfessionNo() {
		return this.teachingProfessionNo;
	}

	public void setTeachingProfessionNo(String teachingProfessionNo) {
		this.teachingProfessionNo = teachingProfessionNo;
	}

	public String getProfessionTeachingDate() {
		return this.professionTeachingDate;
	}

	public void setProfessionTeachingDate(String professionTeachingDate) {
		this.professionTeachingDate = professionTeachingDate;
	}

	public String getExperimentalTechnicalPersonnel() {
		return this.experimentalTechnicalPersonnel;
	}

	public void setExperimentalTechnicalPersonnel(String experimentalTechnicalPersonnel) {
		this.experimentalTechnicalPersonnel = experimentalTechnicalPersonnel;
	}

	public String getDoubleTeacherType() {
		return this.doubleTeacherType;
	}

	public void setDoubleTeacherType(String doubleTeacherType) {
		this.doubleTeacherType = doubleTeacherType;
	}

	public String getEngineeringBackground() {
		return this.engineeringBackground;
	}

	public void setEngineeringBackground(String engineeringBackground) {
		this.engineeringBackground = engineeringBackground;
	}

	public String getIndustryBackground() {
		return this.industryBackground;
	}

	public void setIndustryBackground(String industryBackground) {
		this.industryBackground = industryBackground;
	}

	public String getAdministrativeRank() {
		return this.administrativeRank;
	}

	public void setAdministrativeRank(String administrativeRank) {
		this.administrativeRank = administrativeRank;
	}

	public String getGraduateTutorType() {
		return this.graduateTutorType;
	}

	public void setGraduateTutorType(String graduateTutorType) {
		this.graduateTutorType = graduateTutorType;
	}

	public Integer getNumberOfDoctor() {
		return this.numberOfDoctor;
	}

	public void setNumberOfDoctor(Integer numberOfDoctor) {
		this.numberOfDoctor = numberOfDoctor;
	}

	public Integer getNumberOfMaster() {
		return this.numberOfMaster;
	}

	public void setNumberOfMaster(Integer numberOfMaster) {
		this.numberOfMaster = numberOfMaster;
	}

	public String getEmployeeType() {
		return this.employeeType;
	}

	public void setEmployeeType(String employeeType) {
		this.employeeType = employeeType;
	}

	public String getEmploymentType() {
		return this.employmentType;
	}

	public void setEmploymentType(String employmentType) {
		this.employmentType = employmentType;
	}

	public String getJobStatue() {
		return this.jobStatue;
	}

	public void setJobStatue(String jobStatue) {
		this.jobStatue = jobStatue;
	}

	public String getTransactionType() {
		return this.transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}

	public String getUniversityTransfer() {
		return this.universityTransfer;
	}

	public void setUniversityTransfer(String universityTransfer) {
		this.universityTransfer = universityTransfer;
	}

	public String getSchoolGraduation() {
		return this.schoolGraduation;
	}

	public void setSchoolGraduation(String schoolGraduation) {
		this.schoolGraduation = schoolGraduation;
	}

	public String getSchoolAdjustment() {
		return this.schoolAdjustment;
	}

	public void setSchoolAdjustment(String schoolAdjustment) {
		this.schoolAdjustment = schoolAdjustment;
	}

	public String getOffCampusTeacherType() {
		return this.offCampusTeacherType;
	}

	public void setOffCampusTeacherType(String offCampusTeacherType) {
		this.offCampusTeacherType = offCampusTeacherType;
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
		return "TeacherInfo [teacherInfoId=" + teacherInfoId + ", userId=" + userId + ", certificateType="
				+ certificateType + ", certificateNo=" + certificateNo + ", nation=" + nation + ", nationality="
				+ nationality + ", GAT=" + GAT + ", huaQiao=" + huaQiao + ", politicalStatus=" + politicalStatus
				+ ", sex=" + sex + ", birthday=" + birthday + ", highestEducation=" + highestEducation
				+ ", highestDegree=" + highestDegree + ", learnEdgeStructure=" + learnEdgeStructure
				+ ", professionalTitle=" + professionalTitle + ", professionalGrade=" + professionalGrade
				+ ", subjectCategory=" + subjectCategory + ", workDate=" + workDate + ", inductionDate=" + inductionDate
				+ ", teacherCertificateNo=" + teacherCertificateNo + ", teachingType=" + teachingType
				+ ", teachingStatus=" + teachingStatus + ", teachingProfessionName=" + teachingProfessionName
				+ ", teachingProfessionNo=" + teachingProfessionNo + ", professionTeachingDate="
				+ professionTeachingDate + ", experimentalTechnicalPersonnel=" + experimentalTechnicalPersonnel
				+ ", doubleTeacherType=" + doubleTeacherType + ", engineeringBackground=" + engineeringBackground
				+ ", industryBackground=" + industryBackground + ", administrativeRank=" + administrativeRank
				+ ", graduateTutorType=" + graduateTutorType + ", numberOfDoctor=" + numberOfDoctor
				+ ", numberOfMaster=" + numberOfMaster + ", employeeType=" + employeeType + ", employmentType="
				+ employmentType + ", jobStatue=" + jobStatue + ", transactionType=" + transactionType
				+ ", universityTransfer=" + universityTransfer + ", schoolGraduation=" + schoolGraduation
				+ ", schoolAdjustment=" + schoolAdjustment + ", offCampusTeacherType=" + offCampusTeacherType
				+ ", dataStatus=" + dataStatus + ", createTime=" + createTime + "]";
	}

}