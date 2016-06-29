package edu.neu.nxist.continuingedu.register.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.neu.nxist.continuingedu.register.model.UserInfo;
import edu.neu.nxist.continuingedu.register.service.UserInfoService;

public class UserInfoAction extends ActionSupport implements
		ModelDriven<UserInfo> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserInfoService userInfoService;
	private String num;
	private String bh;
	private String name;
	private UserInfo userInfo = new UserInfo();

	public String saveUserInfo() {

		this.userInfoService.addUserInfo(userInfo);
		return "saveUserInfo";
	}

	public String updateUserInfo() {
		this.userInfoService.updateUserInfo(userInfo);
		return "updateUserInfo";
	}

	public void findUserInfoByID() {
		List list = new ArrayList<UserInfo>();
		list = userInfoService.findUserInfoById(num);

		try {
			JSONArray jsonArray = JSONArray.fromObject(list);
			HttpServletResponse response = ServletActionContext.getResponse();
			try {
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().print(jsonArray.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void findUserInfoByName() {
		List list = new ArrayList<UserInfo>();
		list = userInfoService.findUserInfoByName(name);

		try {
			JSONArray jsonArray = JSONArray.fromObject(list);
			HttpServletResponse response = ServletActionContext.getResponse();
			try {
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().print(jsonArray.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void getUserInfoBybh() {
		UserInfo userInfo = userInfoService.getUserInfoBybh(bh);
		try {
			JSONArray jsonArray = JSONArray.fromObject(userInfo);
			HttpServletResponse response = ServletActionContext.getResponse();
			try {
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().print(jsonArray.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo UserInfo) {
		this.userInfo = UserInfo;
	}

	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getNum() {
		return num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBh() {
		return bh;
	}

	public void setBh(String bh) {
		this.bh = bh;
	}

	public UserInfo getModel() {
		return userInfo;
	}

}
