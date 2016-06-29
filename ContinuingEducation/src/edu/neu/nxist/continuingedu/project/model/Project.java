package edu.neu.nxist.continuingedu.project.model;

import java.util.Set;

public class Project {

	private String projectID;
	private ProjectCategory projectCategory;
	private ProjectSponsor projectSponsor;
	private ProjectStatus projectStatus;
	private ProjectScope projectScope;
	private String projectOrder;
	private String projectName;
	private String site;
	private String beginTime;
	private String endTime;
	private String createTime;
	private byte[] introduction;
	private String contact;
	private float cost;
	private int volume;
	private String visible;
	private String introStr;// 在读取数据库中introduction时可以转成string方便jsp显示
	private Set pjRegister;

	public String getProjectID() {
		return projectID;
	}

	public void setProjectID(String projectID) {
		this.projectID = projectID;
	}

	public ProjectCategory getProjectCategory() {
		return projectCategory;
	}

	public void setProjectCategory(ProjectCategory projectCategory) {
		this.projectCategory = projectCategory;
	}

	public ProjectSponsor getProjectSponsor() {
		return projectSponsor;
	}

	public void setProjectSponsor(ProjectSponsor projectSponsor) {
		this.projectSponsor = projectSponsor;
	}

	public ProjectStatus getProjectStatus() {
		return projectStatus;
	}

	public void setProjectStatus(ProjectStatus projectStatus) {
		this.projectStatus = projectStatus;
	}

	public ProjectScope getProjectScope() {
		return projectScope;
	}

	public void setProjectScope(ProjectScope projectScope) {
		this.projectScope = projectScope;
	}

	public String getProjectOrder() {
		return projectOrder;
	}

	public void setProjectOrder(String projectOrder) {
		this.projectOrder = projectOrder;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public String getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getCreateTime() {
		return createTime;
	}

	public byte[] getIntroduction() {
		return introduction;
	}

	public void setIntroduction(byte[] introduction) {
		this.introduction = introduction;
	}

	public String getIntroStr() {
		if (getIntroduction() == null)
			return null;
		else
			return new String(getIntroduction());
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public float getCost() {
		return cost;
	}

	public void setCost(float cost) {
		this.cost = cost;
	}

	public int getVolume() {
		return volume;
	}

	public void setVolume(int volume) {
		this.volume = volume;
	}

	public void setVisible(String visible) {
		this.visible = visible;
	}

	public String getVisible() {
		return visible;
	}

	public Set getPjRegister() {
		return pjRegister;
	}

	public void setPjRegister(Set pjRegister) {
		this.pjRegister = pjRegister;
	}

	public void setIntroStr(String introStr) {
		this.introStr = introStr;
	}

}
