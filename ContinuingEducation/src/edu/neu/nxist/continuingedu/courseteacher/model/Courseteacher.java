package edu.neu.nxist.continuingedu.courseteacher.model;
import edu.neu.nxist.continuingedu.project.model.*;
import edu.neu.nxist.continuingedu.register.model.*;

public class Courseteacher {
	private String id;
	private String time;
	private Project project;
	private UserInfo userInfo;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	public UserInfo getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}
	

}
