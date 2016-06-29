package edu.neu.nxist.continuingedu.diagram.model;

import edu.neu.nxist.continuingedu.newsandnotice.model.NewsAndNotice;
import edu.neu.nxist.continuingedu.register.model.UserInfo;

public class Diagram {
	
	private String id;
	private String title;
	private NewsAndNotice news;
	private String time;
	private UserInfo userInfo;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public NewsAndNotice getNews() {
		return news;
	}
	public void setNews(NewsAndNotice news) {
		this.news = news;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public UserInfo getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}
	
	
}
