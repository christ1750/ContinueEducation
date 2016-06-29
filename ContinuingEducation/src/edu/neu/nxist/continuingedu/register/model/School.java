package edu.neu.nxist.continuingedu.register.model;

public class School {
	private int schoolID;
	private String schoolName;
	private String schoolHistory;

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public void setSchoolHistory(String schoolHistory) {
		this.schoolHistory = schoolHistory;
	}

	public String getSchoolHistory() {
		return schoolHistory;
	}

	public void setSchoolID(int schoolID) {
		this.schoolID = schoolID;
	}

	public int getSchoolID() {
		return schoolID;
	}

}
