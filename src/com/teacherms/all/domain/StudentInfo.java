package com.teacherms.all.domain;

/**
 * StudentInfo entity. @author MyEclipse Persistence Tools
 */

public class StudentInfo implements java.io.Serializable {

	// Fields

	private String studentId;
	private String studentName;
	private String calendarYear;
	private Integer enrolmentYear;
	private String certificateType;
	private String certificateNo;
	private String birthYear;
	private String sex;
	private String nation;
	private String politicalStatus;
	private String studentSource;
	private String studentType;
	private String enrolmentType;
	private String classType;
	private String classNumber;
	private String className;
	private String inClassName;
	private Integer departmentId;
	private String teacherTraining;
	private String deformed;
	private String changes;
	private String entranceRecord;
	private String enrolmentStyle;
	private String droppingReason;
	private String registeredType;
	private String degree;
	private String alterTime;

	// Constructors

	/** default constructor */
	public StudentInfo() {
	}

	/** full constructor */
	public StudentInfo(String studentId, String studentName, String calendarYear, Integer enrolmentYear,
			String certificateType, String certificateNo, String birthYear, String sex, String nation,
			String politicalStatus, String studentSource, String studentType, String enrolmentType, String classType,
			String classNumber, String className, String inClassName, Integer departmentId, String teacherTraining,
			String deformed, String changes, String entranceRecord, String enrolmentStyle, String droppingReason,
			String registeredType, String degree, String alterTime) {
		this.studentId = studentId;
		this.studentName = studentName;
		this.calendarYear = calendarYear;
		this.enrolmentYear = enrolmentYear;
		this.certificateType = certificateType;
		this.certificateNo = certificateNo;
		this.birthYear = birthYear;
		this.sex = sex;
		this.nation = nation;
		this.politicalStatus = politicalStatus;
		this.studentSource = studentSource;
		this.studentType = studentType;
		this.enrolmentType = enrolmentType;
		this.classType = classType;
		this.classNumber = classNumber;
		this.className = className;
		this.inClassName = inClassName;
		this.departmentId = departmentId;
		this.teacherTraining = teacherTraining;
		this.deformed = deformed;
		this.changes = changes;
		this.entranceRecord = entranceRecord;
		this.enrolmentStyle = enrolmentStyle;
		this.droppingReason = droppingReason;
		this.registeredType = registeredType;
		this.degree = degree;
		this.alterTime = alterTime;
	}

	// Property accessors

	public String getStudentId() {
		return this.studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getStudentName() {
		return this.studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getCalendarYear() {
		return this.calendarYear;
	}

	public void setCalendarYear(String calendarYear) {
		this.calendarYear = calendarYear;
	}

	public Integer getEnrolmentYear() {
		return this.enrolmentYear;
	}

	public void setEnrolmentYear(Integer enrolmentYear) {
		this.enrolmentYear = enrolmentYear;
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

	public String getBirthYear() {
		return this.birthYear;
	}

	public void setBirthYear(String birthYear) {
		this.birthYear = birthYear;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getNation() {
		return this.nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getPoliticalStatus() {
		return this.politicalStatus;
	}

	public void setPoliticalStatus(String politicalStatus) {
		this.politicalStatus = politicalStatus;
	}

	public String getStudentSource() {
		return this.studentSource;
	}

	public void setStudentSource(String studentSource) {
		this.studentSource = studentSource;
	}

	public String getStudentType() {
		return this.studentType;
	}

	public void setStudentType(String studentType) {
		this.studentType = studentType;
	}

	public String getEnrolmentType() {
		return this.enrolmentType;
	}

	public void setEnrolmentType(String enrolmentType) {
		this.enrolmentType = enrolmentType;
	}

	public String getClassType() {
		return this.classType;
	}

	public void setClassType(String classType) {
		this.classType = classType;
	}

	public String getClassNumber() {
		return this.classNumber;
	}

	public void setClassNumber(String classNumber) {
		this.classNumber = classNumber;
	}

	public String getClassName() {
		return this.className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getInClassName() {
		return this.inClassName;
	}

	public void setInClassName(String inClassName) {
		this.inClassName = inClassName;
	}

	public Integer getDepartmentId() {
		return this.departmentId;
	}

	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}

	public String getTeacherTraining() {
		return this.teacherTraining;
	}

	public void setTeacherTraining(String teacherTraining) {
		this.teacherTraining = teacherTraining;
	}

	public String getDeformed() {
		return this.deformed;
	}

	public void setDeformed(String deformed) {
		this.deformed = deformed;
	}

	public String getChanges() {
		return this.changes;
	}

	public void setChanges(String changes) {
		this.changes = changes;
	}

	public String getEntranceRecord() {
		return this.entranceRecord;
	}

	public void setEntranceRecord(String entranceRecord) {
		this.entranceRecord = entranceRecord;
	}

	public String getEnrolmentStyle() {
		return this.enrolmentStyle;
	}

	public void setEnrolmentStyle(String enrolmentStyle) {
		this.enrolmentStyle = enrolmentStyle;
	}

	public String getDroppingReason() {
		return this.droppingReason;
	}

	public void setDroppingReason(String droppingReason) {
		this.droppingReason = droppingReason;
	}

	public String getRegisteredType() {
		return this.registeredType;
	}

	public void setRegisteredType(String registeredType) {
		this.registeredType = registeredType;
	}

	public String getDegree() {
		return this.degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getAlterTime() {
		return this.alterTime;
	}

	public void setAlterTime(String alterTime) {
		this.alterTime = alterTime;
	}

}