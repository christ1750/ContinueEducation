package edu.neu.nxist.continuingedu.guestbook.model;

import edu.neu.nxist.continuingedu.register.model.*;

/**
 * Comment entity. @author MyEclipse Persistence Tools
 */

public class Guestbook implements java.io.Serializable {

	// Fields

	private String CId;
	private UserInfo userByUwId;
	private String CComment;
	private String CTime;
	private String uwUsername;
	private String Username;
	private String respre;
	private boolean status;
	private String roletype;

	// Constructors

	
	/** default constructor */
	public Guestbook() {
	}

	/** full constructor */
	public Guestbook(UserInfo userByUwId, String CComment,
			String CTime, String uwUsername,String Username,boolean status) {
		
		this.userByUwId = userByUwId;
		this.CComment = CComment;
		this.CTime = CTime;
	
		this.uwUsername = uwUsername;
		this.Username = Username;
		this.status =status;
	}

	// Property accessors

	public String getCId() {
		return this.CId;
	}

	public void setCId(String CId) {
		this.CId = CId;
	}

	public UserInfo getUserByUwId() {
		return this.userByUwId;
	}

	public void setUserByUwId(UserInfo userByUwId) {
		this.userByUwId = userByUwId;
	}

	public String getCComment() {
		return this.CComment;
	}

	public void setCComment(String CComment) {
		this.CComment = CComment;
	}

	public String getCTime() {
		return this.CTime;
	}

	public void setCTime(String CTime) {
		this.CTime = CTime;
	}



	public String getUwUsername() {
		return this.uwUsername;
	}

	public void setUwUsername(String uwUsername) {
		this.uwUsername = uwUsername;
	}
	
	

	public String getRespre() {
		return respre;
	}

	public void setRespre(String respre) {
		this.respre = respre;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		Username = username;
	}

	public String getRoletype() {
		return roletype;
	}

	public void setRoletype(String roletype) {
		this.roletype = roletype;
	}


}