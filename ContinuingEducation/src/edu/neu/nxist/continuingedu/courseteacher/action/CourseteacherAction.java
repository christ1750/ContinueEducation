package edu.neu.nxist.continuingedu.courseteacher.action;

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

import edu.neu.nxist.continuingedu.courseteacher.model.Courseteacher;
import edu.neu.nxist.continuingedu.courseteacher.service.CourseteacherService;
import edu.neu.nxist.continuingedu.courseware.model.Courseware;
import edu.neu.nxist.continuingedu.project.model.Project;
import edu.neu.nxist.continuingedu.project.service.ProjectService;
import edu.neu.nxist.continuingedu.register.dto.PageBean;
import edu.neu.nxist.continuingedu.register.model.UserInfo;
import edu.neu.nxist.continuingedu.register.service.UserInfoService;
import edu.neu.nxist.continuingedu.signup.model.ProjectRegister;
import edu.neu.nxist.continuingedu.signup.service.ProjectRegisterService;

public class CourseteacherAction  implements
		ModelDriven<Courseteacher> ,SessionAware,
		RequestAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CourseteacherService courseteacherService;
	private ProjectService myProjectService;
	private UserInfoService userInfoService;
	private ProjectRegisterService projectregisterService;
	private String courseteacherID;
	private String searchUserID;
	private String searchProjectID;
	private String queryProjectID;
	private String searchProjectRegisterID;
	private String coursename="";
	private String teachername="";
	private String queryTime1="";
	private String queryTime2="";
	private String searchStudentID;
	private PageBean pageBean;
	private Project myProject ;
	private UserInfo userInfo ;
	private int page;
	private int pageSize = 15;
	private Courseteacher courseteacher;
	private ProjectRegister projectregister;
	private int deletetype;
	private Map<String, Object> request;

	private Map<String, Object> session;
	private String grade;

	public String addcourseteacher() {
		if(courseteacher==null)courseteacher=new Courseteacher();
		myProject = this.myProjectService.findProjectById(searchProjectID);
		courseteacher.setProject(null);
		courseteacher.setProject(myProject);
        userInfo=this.userInfoService.getUserInfoBybh(searchUserID);
        courseteacher.setUserInfo(null);
        courseteacher.setUserInfo(userInfo);
        Date d = new Date();
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		courseteacher.setTime(sdf.format(d));
		System.out.println("准备新增！！！！！！");
		if(!courseteacherService.isExist(courseteacher))
        {this.courseteacherService.addCourseteacher(courseteacher);}
        
		return "addCourseteacher";
	}

	public String updatecourseteacher() {
		try{
		this.courseteacherService.updateCourseteacher(courseteacher);
		}catch(Exception e){System.out.println("异常");}
		return "updateCourseteacher";
	}
	
	public String deletecourseteacher()
	{
	    System.out.println("haha"+courseteacherID);
		courseteacher = this.courseteacherService.findCourseteacherById(courseteacherID);
		if(courseteacher==null)System.out.println("courseteacher为空");
		if(courseteacher!=null){this.courseteacherService.deleteCourseteacher(courseteacher);}
		if(deletetype==1)
		 return"deletecourseteacher1";
		else return "deletecourseteacher2";
	}
	
	public String listselectedForPage()
	{
		try{
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		if(pageBean!=null&&pageBean.getList().size()==0){page=1;System.out.print("List为空");}
		
		
		this.pageBean = this.courseteacherService.queryteacherForPageByPID(searchProjectID,pageSize,page );
		}catch(Exception e){System.out.println("异常");}
		
		return"listselectedForPage"; 
	}
	
	public String listteacherForPage()
	{
		try{
		if (pageBean != null) {
			if (page < 1)
				page = 1; 
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		if(pageBean!=null&&pageBean.getList().size()==0){page=1;System.out.print("List为空");}
		
		
		this.pageBean = this.courseteacherService.queryteacherForPage(pageSize,page);
		}catch(Exception e){System.out.println("异常");}
		
		return"listteacherForPage"; 
	}
	

	
	public String listcourseteacherForPage() {
		try{
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		if(pageBean!=null&&pageBean.getList().size()==0){page=1;System.out.print("List为空");}
		if(coursename==null)coursename="";
		if(teachername==null)teachername="";
		if(queryTime1==null)queryTime1="";
		if(queryTime2==null)queryTime2="";
		
		this.pageBean = this.courseteacherService.queryCourseteacherForPage(coursename.trim(), teachername.trim(), queryTime1.trim(), queryTime2.trim(), pageSize, page);
		}catch(Exception e){System.out.println("异常");}
		return "listcourseteacherForPage";
	}
	
	public String listteachproject()
	{
		try{
			if (pageBean != null) {
				if (page < 1)
					page = 1;
				if (page > pageBean.getTotalPage())
					page = pageBean.getTotalPage();
			}
			if(pageBean!=null&&pageBean.getList().size()==0){page=1;System.out.print("List为空");}
			UserInfo userInfo = (UserInfo) session.get("userInfo");
			String uid=userInfo.getUserId();
			this.pageBean = this.courseteacherService.listteachprojectForPage(uid, pageSize, page);
			}catch(Exception e){System.out.println("异常");}
		
		return "listteachproject";
	}
	
	public String listgrade()
	{
		try{
			if (pageBean != null) {
				if (page < 1)
					page = 1;
				if (page > pageBean.getTotalPage())
					page = pageBean.getTotalPage();
			}
			if(pageBean!=null&&pageBean.getList().size()==0){page=1;System.out.print("List为空");}
			
			this.pageBean = this.courseteacherService.listgradeForPage(queryProjectID, pageSize, page);
			}catch(Exception e){System.out.println("异常");}
		
		return "listgrade";
	}
	
	
	public String searchgrade()
	{
		UserInfo studentInfo = (UserInfo) session.get("userInfo");
		searchStudentID=studentInfo.getUserId();
		try{
			if (pageBean != null) {
				if (page < 1)
					page = 1;
				if (page > pageBean.getTotalPage())
					page = pageBean.getTotalPage();
			}
			if(pageBean!=null&&pageBean.getList().size()==0){page=1;System.out.print("List为空");}
			
			this.pageBean = this.courseteacherService.searchgradeForPage(searchStudentID, pageSize, page);
			}catch(Exception e){System.out.println("异常");}
		
		return "searchgrade";
	}
	
	
	
	public String showOneProRe() {
		try{
			
				projectregister = this.projectregisterService
				.findByApplyId(searchProjectRegisterID);
		this.setProjectregister(projectregister);
		ActionContext.getContext().put(
				"ProjectRegister",
				this.projectregisterService
				.findByApplyId(searchProjectRegisterID));
		}catch(Exception e){System.out.println("展示异常");}
		return "showOneProRe";
	}
	
	public String  updateGrade() {
		
		/*		projectRegister=this.projectRegisterService.findByApplyId(id);
				System.out.println("projectRegister"+id);
				System.out.println("修改的成绩是！！！！！1："+this.getGrade());
				projectRegister.setIssue(issue);
				projectRegister.setGrade(111);
				System.out.println("修改的成绩是："+grade);
		*/   //  ProjectRegister projectRegister= (ProjectRegister)ActionContext.getContext().get("ProjectRegister");
		projectregister.setIssue(1);projectregister.setGrade(Integer.parseInt(grade));
				this.projectregisterService.updateProjectRegister(projectregister);
				return "updateGrade";
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


	public void setMyProject(Project myProject) {
		this.myProject = myProject;
	}

	public Project getMyProject() {
		return myProject;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	public CourseteacherService getCourseteacherService() {
		return courseteacherService;
	}

	public void setCourseteacherService(CourseteacherService courseteacherService) {
		this.courseteacherService = courseteacherService;
	}

	public ProjectService getMyProjectService() {
		return myProjectService;
	}

	public void setMyProjectService(ProjectService myProjectService) {
		this.myProjectService = myProjectService;
	}

	public ProjectRegisterService getProjectregisterService() {
		return projectregisterService;
	}

	public void setProjectregisterService(
			ProjectRegisterService projectregisterService) {
		this.projectregisterService = projectregisterService;
	}

	public String getSearchUserID() {
		return searchUserID;
	}

	public void setSearchUserID(String searchUserID) {
		this.searchUserID = searchUserID;
	}

	public String getSearchProjectID() {
		return searchProjectID;
	}

	public void setSearchProjectID(String searchProjectID) {
		this.searchProjectID = searchProjectID;
	}

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public String getTeachername() {
		return teachername;
	}

	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}

	public String getQueryTime1() {
		return queryTime1;
	}

	public void setQueryTime1(String queryTime1) {
		this.queryTime1 = queryTime1;
	}

	public String getQueryTime2() {
		return queryTime2;
	}

	public void setQueryTime2(String queryTime2) {
		this.queryTime2 = queryTime2;
	}

	public Courseteacher getCourseteacher() {
		return courseteacher;
	}

	public void setCourseteacher(Courseteacher courseteacher) {
		this.courseteacher = courseteacher;
	}

	public ProjectRegister getProjectregister() {
		return projectregister;
	}

	public void setProjectregister(ProjectRegister projectregister) {
		this.projectregister = projectregister;
	}

	public void setCourseteacherID(String courseteacherID) {
		this.courseteacherID = courseteacherID;
	}

	public String getCourseteacherID() {
		return courseteacherID;
	}

	public void setDeletetype(int deletetype) {
		this.deletetype = deletetype;
	}

	public int getDeletetype() {
		return deletetype;
	}

	public void setQueryProjectID(String queryProjectID) {
		this.queryProjectID = queryProjectID;
	}

	public String getQueryProjectID() {
		return queryProjectID;
	}

	public void setSearchProjectRegisterID(String searchProjectRegisterID) {
		this.searchProjectRegisterID = searchProjectRegisterID;
	}

	public String getSearchProjectRegisterID() {
		return searchProjectRegisterID;
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

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getGrade() {
		return grade;
	}

	public String getSearchStudentID() {
		return searchStudentID;
	}

	public void setSearchStudentID(String searchStudentID) {
		this.searchStudentID = searchStudentID;
	}

	public Courseteacher getModel() {
		return courseteacher;
	}

}
