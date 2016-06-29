package edu.neu.nxist.continuingedu.guestbook.action;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import edu.neu.nxist.continuingedu.courseware.model.Courseware;
import edu.neu.nxist.continuingedu.guestbook.model.*;
import edu.neu.nxist.continuingedu.register.dto.PageBean;
import edu.neu.nxist.continuingedu.register.model.*;
import edu.neu.nxist.continuingedu.guestbook.service.*;
import edu.neu.nxist.continuingedu.register.service.*;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class GuestbookAction extends ActionSupport implements SessionAware,
		RequestAware ,ModelDriven<Guestbook>{

	
	private GuestbookService guestbookservice;
	private UserInfoService userInfoservice;
	private String searchGuestbookID;

	
	private Guestbook guestbook=new Guestbook();

	private Map<String, Object> request;

	private Map<String, Object> session;
	
	private PageBean pageBean;
	
	private int page;
	
	private int pageSize = 15;
	
	private int deletetype=2;
	
	


	
	

	

	public String addGuestbook() {
		try{
		UserInfo userInfo = (UserInfo) session.get("userInfo");
		System.out.println("here!!!");
		Date d = new Date();
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		guestbook.setCTime(sdf.format(d));
		guestbook.setUserByUwId(userInfo);
		guestbook.setUwUsername(userInfo.getRealName());
		guestbook.setUsername(userInfo.getUserName());
		guestbook.setRoletype(userInfo.getRole());
		guestbook.setRespre(userInfo.getRealName()+"的留言【"+guestbook.getCComment()+"】");
		guestbook.setStatus(false);
		guestbookservice.saveGuestbook(guestbook);
		}catch(Exception e){System.out.println("异常");}
		return "addguestbook";
	}
   public String addGuestbookadmin() {
        try{
		
		UserInfo userInfo = (UserInfo) session.get("userInfo");
		
		Date d = new Date();
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		guestbook.setCTime(sdf.format(d));
		guestbook.setUserByUwId(userInfo);
		guestbook.setUwUsername(userInfo.getRealName());
		guestbook.setUsername(userInfo.getUserName());
		guestbook.setRoletype(userInfo.getRole());
		guestbook.setRespre(userInfo.getRealName()+"的留言【"+guestbook.getCComment()+"】");
		guestbook.setStatus(true);
		guestbookservice.saveGuestbook(guestbook);
        }catch(Exception e){System.out.println("异常");}
		return "addguestbookadmin";
	}
   
   public String addGuestbooktea() {
		try{
		UserInfo userInfo = (UserInfo) session.get("userInfo");
		System.out.println("here!!!");
		Date d = new Date();
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		guestbook.setCTime(sdf.format(d));
		guestbook.setUserByUwId(userInfo);
		guestbook.setUwUsername(userInfo.getRealName());
		guestbook.setUsername(userInfo.getUserName());
		guestbook.setRoletype(userInfo.getRole());
		guestbook.setRespre(userInfo.getRealName()+"的留言【"+guestbook.getCComment()+"】");
		guestbook.setStatus(false);
		guestbookservice.saveGuestbook(guestbook);
		}catch(Exception e){System.out.println("异常");}
		return "addguestbooktea";
	}
	
	public String listForPage() {
		try{
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		this.pageBean = this.guestbookservice.queryGuestbookForPage(
				 pageSize, page);
		System.out.print("可查找");
		request.put("guestbooks", pageBean);
		}catch(Exception e){System.out.println("异常");}
		return "listForPage";
	}
	
	public String checkForPage() {
		try{
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		this.pageBean = this.guestbookservice.checkGuestbookForPage(
				 pageSize, page);
		request.put("guestbooks", pageBean);
		}catch(Exception e){System.out.println("异常");}
		return "checkForPage";
	}
	
	public String showForPage() {
		try{
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		this.pageBean = this.guestbookservice.queryGuestbookForPage(
				 pageSize, page);
		request.put("guestbooks", pageBean);
		}catch(Exception e){System.out.println("异常");}
		return "showForPage";
	}
	
	public String passStatus()
	{
		try{
        guestbook = this.guestbookservice.findGuestbookById(searchGuestbookID);
       
		guestbook.setStatus(true);
        this.guestbookservice.updateGuestbook(guestbook);
		}catch(Exception e){System.out.println("异常");}
		return "pass";
	}
	
	public String forbidStatus()
	{
		try{
        guestbook = this.guestbookservice.findGuestbookById(searchGuestbookID);
        guestbook.setStatus(false);
		this.guestbookservice.updateGuestbook(guestbook);
		}catch(Exception e){System.out.println("异常");}
		return "forbid";
	}
	

	public String showGuestbook() {
		try{
		List<Guestbook> list = guestbookservice.listAllGuestbook();
		request.put("guestbooks", list);
		}catch(Exception e){System.out.println("异常");}
		return "showguestbook";

	}

	public String deleteGuestbook() {
		try{
		System.out.println("删除记录的ID为："+this.getSearchGuestbookID());
		guestbook = this.guestbookservice.findGuestbookById(searchGuestbookID);
		
		this.guestbookservice.deleteGuestbook(guestbook);
		}catch(Exception e){System.out.println("异常");}
		if(deletetype==1)
		return "deleteguestbookcheck";
		else
		return "deleteguestbookshow";
	}
	
	
	public void setRequest(Map<String, Object> request) {
		// TODO Auto-generated method stub
		this.request = request;
	}

	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session = session;
	}

	public GuestbookService getGuestbookservice() {
		return guestbookservice;
	}

	public void setGuestbookservice(GuestbookService guestbookservice) {
		this.guestbookservice = guestbookservice;
	}

	public UserInfoService getUserInfoservice() {
		return userInfoservice;
	}

	public void setUserInfoservice(UserInfoService userInfoservice) {
		this.userInfoservice = userInfoservice;
	}

	
	public Guestbook getGuestbook() {
		return guestbook;
	}

	public void setGuestbook(Guestbook guestbook) {
		this.guestbook = guestbook;
	}
	public String getSearchGuestbookID() {
		return searchGuestbookID;
	}

	public void setSearchGuestbookID(String searchGuestbookID) {
		this.searchGuestbookID = searchGuestbookID;
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
	public Map<String, Object> getSession() {
		return session;
	}
	public Guestbook getModel() {
		return guestbook;
	}
}
