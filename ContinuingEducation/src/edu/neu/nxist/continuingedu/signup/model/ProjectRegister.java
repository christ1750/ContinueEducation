package edu.neu.nxist.continuingedu.signup.model;

import edu.neu.nxist.continuingedu.project.model.Project;
import edu.neu.nxist.continuingedu.register.model.UserInfo;

public class ProjectRegister {
	private String applyId;
	private UserInfo userInfo;
	private Project project;
	private CheckStatus checkStatus;
	private String reportNum;
	private ReportStatus reportStatus;
	private String signupTime;
	private String remarks;
	private String reason;
	private int grade;
	private int issue;

	public ProjectRegister() {
		grade = 0;
		issue = 0;
	}

	public String getApplyId() {
		return applyId;
	}

	public void setApplyId(String applyId) {
		this.applyId = applyId;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public void setCheckStatus(CheckStatus checkStatus) {
		this.checkStatus = checkStatus;
	}

	public CheckStatus getCheckStatus() {
		return checkStatus;
	}

	public String getReportNum() {
		return reportNum;
	}

	public void setReportNum(String reportNum) {
		this.reportNum = reportNum;
	}

	public ReportStatus getReportStatus() {
		return reportStatus;
	}

	public void setReportStatus(ReportStatus reportStatus) {
		this.reportStatus = reportStatus;
	}

	public void setSignupTime(String signupTime) {
		this.signupTime = signupTime;
	}

	public String getSignupTime() {
		return signupTime;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getIssue() {
		return issue;
	}

	public void setIssue(int issue) {
		this.issue = issue;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	// public int getConfirm() {
	// return confirm;
	// }
	//
	// public void setConfirm(int confirm) {
	// this.confirm = confirm;
	// }

}
