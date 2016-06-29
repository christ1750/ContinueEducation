package edu.neu.nxist.continuingedu.register.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.neu.nxist.continuingedu.register.dto.PageBean;
import edu.neu.nxist.continuingedu.register.model.UserInfo;
import edu.neu.nxist.continuingedu.register.service.UserInfoService;

public class UserManageAction extends ActionSupport implements
		ModelDriven<UserInfo>,SessionAware,
		RequestAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserInfoService userInfoService;
	private String num;
	private String bh;
	private String username;
	private String realname;
	private String certificateID;
	private String role;
	private String searchUserID;
	private String searchUserName="";
	private String searchRealName="";
	private String searchCertificateID="";
	private PageBean pageBean;
	private int page;
	private int pageSize = 15;
	private UserInfo userInfo = new UserInfo();
	private int deletetype;
	
	private Map<String, Object> request;

	private Map<String, Object> session;
	
	//添加用户之前的初始化
	public String beforeAdduser(){
		return "beforeAdduser";
	}
	public String saveUserInfo() {
        try{
        	
		this.userInfoService.addUserInfo(userInfo);
        }catch(Exception e){System.out.println("异常");}
		return "saveUserInfo";
	}

	public String updateUserInfo() {
		
	    if(userInfo==null){System.out.println("userInfo为空");}
	    else{System.out.println(userInfo.getUserId()+"!!!!!!!!!!!!!!");
	    
	    }
	    
		this.userInfoService.updateUserInfo(userInfo);
		
		return "updateUserInfo";
	}

	public void findUserInfoByID() {
		List<UserInfo> list = new ArrayList<UserInfo>();
		list = (List<UserInfo>) userInfoService.findUserInfoById(num);

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
	
	public String liststuForPage() {
		try{
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		if(pageBean!=null&&pageBean.getList().size()==0){page=1;System.out.print("List为空");}
		if(searchUserName==null)searchUserName="";
		if(searchRealName==null)searchRealName="";
		if(searchCertificateID==null)searchCertificateID="";
		this.pageBean = this.userInfoService.querystuForPage(
				searchUserName,searchRealName,searchCertificateID, pageSize, page);
		}catch(Exception e){System.out.println("异常");}
		return "liststuForPage";
	}
	
	
	
	
	public String listmanagerForPage() {
		try{
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		if(pageBean!=null&&pageBean.getList().size()==0){page=1;System.out.print("List为空");}
		if(searchUserName==null)searchUserName="";
		if(searchRealName==null)searchRealName="";
		if(searchCertificateID==null)searchCertificateID="";
		this.pageBean = this.userInfoService.querymanagerForPage(
				searchUserName,searchRealName,searchCertificateID, pageSize, page);
		}catch(Exception e){System.out.println("异常");}
		return "listmanagerForPage";
	}
	
	
	public String listteacherForPage() {
		try{
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		if(pageBean!=null&&pageBean.getList().size()==0){page=1;System.out.print("List为空");}
		if(searchUserName==null)searchUserName="";
		if(searchRealName==null)searchRealName="";
		if(searchCertificateID==null)searchCertificateID="";
		this.pageBean = this.userInfoService.queryteacherForPage(
				searchUserName,searchRealName,searchCertificateID, pageSize, page);
		}catch(Exception e){System.out.println("异常");}
		return "listteacherForPage";
	}
	
	

	public String listteacherTempForPage() {
		try{
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		if(pageBean!=null&&pageBean.getList().size()==0){page=1;System.out.print("List为空");}
		if(searchUserName==null)searchUserName="";
		if(searchRealName==null)searchRealName="";
		if(searchCertificateID==null)searchCertificateID="";
		this.pageBean = this.userInfoService.queryteacherTempForPage(
				searchUserName,searchRealName,searchCertificateID, pageSize, page);
		}catch(Exception e){System.out.println("异常");}
		return "listteacherTempForPage";
	}
	
	public String listdeletedForPage() {
		try{
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		if(pageBean!=null&&pageBean.getList().size()==0){page=1;System.out.print("List为空");}
		if(searchUserName==null)searchUserName="";
		if(searchRealName==null)searchRealName="";
		if(searchCertificateID==null)searchCertificateID="";
		this.pageBean = this.userInfoService.querydeletedForPage(
				searchUserName,searchRealName,searchCertificateID, pageSize, page);
		}catch(Exception e){System.out.println("异常");}
		return "listdeletedForPage";
	}
	
	public String showoneuser() {
		try{
		userInfo = this.userInfoService.getUserInfoBybh(bh);
		System.out.println("找到！");
		ActionContext.getContext().put(
				"currentObject",
				userInfo);
		}catch(Exception e){System.out.println("异常");}
		return "showoneuser";
	}
	
	
	
	public String deleteUserInfo()
	{
		try{
		userInfo = (UserInfo) session.get("userInfo");
		if(!userInfo.getUserId().equals(this.userInfoService
				.getUserInfoBybh(searchUserID).getUserId()))
		{
			System.out.println(userInfo.getUserId());
			System.out.println(this.userInfoService
					.getUserInfoBybh(searchUserID).getUserId());
		userInfo = this.userInfoService
		.getUserInfoBybh(searchUserID);
		userInfo.setHide("1");
		System.out.println("here!!!!!!!!!!!!!!");
		Date d = new Date();
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		userInfo.setHidetime(sdf.format(d));
	this.userInfoService.updateUserInfo(userInfo);
		}
		}catch(Exception e){System.out.println("异常");}
		if(deletetype==1)return "deletestu";
		else if(deletetype==2)return "deletemanager";
		else if(deletetype==3)return "deleteteacher";
		else return"deleteteacherTemp";
	}
	
	public String recoverUserInfo()
	{ 
		try{
		userInfo = this.userInfoService
		.getUserInfoBybh(searchUserID);
		if(userInfo.getRole()!="4")
		{
			userInfo.setHide("0");
		}
		else System.out.print("");
		this.userInfoService.updateUserInfo(userInfo);
		}catch(Exception e){System.out.println("异常");}
		return "recover";
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

	

	public String getBh() {
		return bh;
	}

	public void setBh(String bh) {
		this.bh = bh;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getCertificateID() {
		return certificateID;
	}

	public void setCertificateID(String certificateID) {
		this.certificateID = certificateID;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getSearchUserID() {
		return searchUserID;
	}

	public void setSearchUserID(String searchUserID) {
		this.searchUserID = searchUserID;
	}

	public String getSearchUserName() {
		return searchUserName;
	}

	public void setSearchUserName(String searchUserName) {
		this.searchUserName = searchUserName;
	}

	public String getSearchRealName() {
		return searchRealName;
	}

	public void setSearchRealName(String searchRealName) {
		this.searchRealName = searchRealName;
	}

	public String getSearchCertificateID() {
		return searchCertificateID;
	}

	public void setSearchCertificateID(String searchCertificateID) {
		this.searchCertificateID = searchCertificateID;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getDeletetype() {
		return deletetype;
	}

	public void setDeletetype(int deletetype) {
		this.deletetype = deletetype;
	}

	public Map<String, Object> getRequest() {
		return request;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	

	public UserInfo getModel() {
		return userInfo;
	}

}
