package edu.neu.nxist.continuingedu.courseware.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Random;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;


import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.neu.nxist.continuingedu.courseware.model.Courseware;
import edu.neu.nxist.continuingedu.courseware.service.CoursewareService;
import edu.neu.nxist.continuingedu.register.dto.PageBean;
import edu.neu.nxist.continuingedu.register.model.UserInfo;

public class CoursewareAction extends ActionSupport implements
		ModelDriven<Courseware>,SessionAware,
		RequestAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7990765658027314488L;
	private CoursewareService coursewareService;
	private PageBean pageBean;
	private String searchCoursewareID;
	private String searchjxjyTitle;
	private String searchhsjyTitle;
	private String searchaqscpxTitle;
	private String searchzyjnpxTitle;
	private File upload;
	private String uploadFileName;
	private int page;
	private int pageSize = 15;
	private String path;
	private String downloadFileName;
	private File download;
	private int type;
	private Map<String, Object> request;

	private Map<String, Object> session;
	
	
	
	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getSearchjxjyTitle() {
		return searchjxjyTitle;
	}

	public void setSearchjxjyTitle(String searchjxjyTitle) {
		this.searchjxjyTitle = searchjxjyTitle;
	}

	public String getSearchhsjyTitle() {
		return searchhsjyTitle;
	}

	public void setSearchhsjyTitle(String searchhsjyTitle) {
		this.searchhsjyTitle = searchhsjyTitle;
	}

	public String getSearchaqscpxTitle() {
		return searchaqscpxTitle;
	}

	public void setSearchaqscpxTitle(String searchaqscpxTitle) {
		this.searchaqscpxTitle = searchaqscpxTitle;
	}

	public String getSearchzyjnpxTitle() {
		return searchzyjnpxTitle;
	}

	public void setSearchzyjnpxTitle(String searchzyjnpxTitle) {
		this.searchzyjnpxTitle = searchzyjnpxTitle;
	}
	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}
	
	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	
	
	

	private Courseware courseware = new Courseware();

	//上传课件之前的初始化
	public String beforeUpload(){
		return "beforeUpload";
	}
	public String saveCourseware() throws Exception{
		try{
		UserInfo userInfo = (UserInfo) session.get("userInfo");
		String savePath = ServletActionContext.getServletContext()
		.getRealPath("/") + "coursewares/";

             SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
             String ymd = sdf.format(new Date());
             savePath += ymd + "/";
             byte[] buffer = new byte[1024];
             FileInputStream fis = null;
             fis = new FileInputStream(upload);

             File dirFile = new File(savePath);
             if (!dirFile.exists()) {
	          dirFile.mkdirs();
              }

              String fileExt = uploadFileName.substring(
		      uploadFileName.lastIndexOf(".") + 1).toLowerCase();

              SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
              String newCoursewareName = df.format(new Date()) + "_"
		      + new Random().nextInt(1000) + "." + fileExt;

              FileOutputStream fos = new FileOutputStream(savePath + "/"
		       + newCoursewareName);

               int len = 0;
              while ((len = fis.read(buffer)) > 0) {
	            fos.write(buffer, 0, len);
                 }
              courseware.setPath(savePath + newCoursewareName);
              courseware.setAuthor(userInfo.getRealName());
              courseware.setAuthortype(userInfo.getRole());
              
		
		
		this.coursewareService.saveCourseware(courseware);
		}catch(Exception e){System.out.println("保存异常");}
		return "saveCourseware";
	}
	
	public InputStream getDownloadFile() throws Exception{
		
		    File file = new File("/"+courseware.getPath().trim());
		    InputStream is = new FileInputStream(file);
		    return is;
	}
	
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getDownloadFileName() {
		return downloadFileName;
	}

	public void setDownloadFileName(String downloadFileName) {
		this.downloadFileName = downloadFileName;
	}

	public File getDownload() {
		return download;
	}

	public void setDownload(File download) {
		this.download = download;
	}

	public String downloadCourseware() {
		try{
		courseware = this.coursewareService
		.findCoursewareById(searchCoursewareID);
		 String fileExt1 = courseware.getPath().substring(
				 courseware.getPath().lastIndexOf(".") + 1).toLowerCase();
		downloadFileName=courseware.getTitle()+"."+fileExt1;
		path=courseware.getPath();
		}catch(Exception e){System.out.println("下载异常");}
		return "downloadCourseware";
	
	}
	
	

	public String showOneCourseware1() {
		try{
		courseware = this.coursewareService
				.findCoursewareById(searchCoursewareID);
		this.setCourseware(courseware);
		ActionContext.getContext().put(
				"currentObject",
				this.coursewareService
						.findCoursewareById(searchCoursewareID));
		}catch(Exception e){System.out.println("展示异常");}
		return "showOneCourseware1";
	}

	public String updateCourseware() {
		try{
		this.coursewareService.updateCourseware(courseware);
		}catch(Exception e){System.out.println("修改异常");}
		if(type==0)return "updateCourseware0";
		else if(type==1)return "updateCourseware1";
		else if(type==2)return "updateCourseware2";
		else return "updateCourseware3";
	}

	public String deleteCourseware() {
		try{courseware = this.coursewareService
		.findCoursewareById(searchCoursewareID);
		String str=new String(courseware.getPath());
		this.coursewareService.deleteCourseware(courseware);
		File file =new File(str);
		file.delete();
		}catch(Exception e){System.out.println("删除异常");}
		if(type==0)return "deleteCourseware0";
		else if(type==1)return "deleteCourseware1";
		else if(type==2)return "deleteCourseware2";
		else return "deleteCourseware3";
	}

	/*
	 * public String listNewsAndNoticeByCategory(searchNewsAndNoticeCategory) {
	 * this.pageBean = this.newsAndNoticeService.queryNewsAndNoticeForPage(
	 * pageSize, page); return "listNewsAndNoticeForPage"; }
	 */

	public String listjxjyForPage() {
		try{
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		this.pageBean = this.coursewareService.queryjxjyForPage(
				searchjxjyTitle, pageSize, page);
		
		}catch(Exception e){System.out.println("异常");}
		return "listjxjyForPage";
	}
	
	public String listjxjyForPage1() {
		try{
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		this.pageBean = this.coursewareService.queryjxjyForPage(
				searchjxjyTitle, pageSize, page);
		System.out.println("/n####################!!!!!!!!!!!!!!!/n");
		}catch(Exception e){System.out.println("异常");}
		return "listjxjyForPage1"; 
	}

	public String listhsjyForPage() {
		try{
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		this.pageBean = this.coursewareService.queryhsjyForPage(
				searchjxjyTitle, pageSize, page);
		}catch(Exception e){System.out.println("异常");}
		return "listhsjyForPage";
	}
	
	
	
	public String listhsjyForPage1() {
		try{
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		this.pageBean = this.coursewareService.queryhsjyForPage(
				searchhsjyTitle, pageSize, page);
		}catch(Exception e){System.out.println("异常");}
		return "listhsjyForPage1";
	}
	
	
	
	public String listaqscpxForPage() {
		
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		try{this.pageBean = this.coursewareService.queryaqscpxForPage(
				searchjxjyTitle, pageSize, page);
		}catch(Exception e){System.out.println("coursewareAction异常");}
		return "listaqscpxForPage";
	}
	

	public String listaqscpxForPage1() {
		try{
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		this.pageBean = this.coursewareService.queryaqscpxForPage(
				searchaqscpxTitle, pageSize, page);
		}catch(Exception e){System.out.println("异常");}
		return "listaqscpxForPage1";
	}
	
	
	public String listzyjnpxForPage() {
		try{
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		this.pageBean = this.coursewareService.queryzyjnpxForPage(
				searchjxjyTitle, pageSize, page);
		}catch(Exception e){System.out.println("异常");}
		return "listzyjnpxForPage";
	}

	public String listzyjnpxForPage1() {
		try{
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		this.pageBean = this.coursewareService.queryzyjnpxForPage(
				searchzyjnpxTitle, pageSize, page);
		}catch(Exception e){System.out.println("异常");}
		return "listzyjnpxForPage1";
	}
	
	
	
	
	public String searchjxjyForPage() {
	try{
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		this.pageBean = this.coursewareService.queryjxjyForPage(
				searchjxjyTitle, pageSize, page);
	}catch(Exception e){System.out.println("异常");}
		return "searchjxjyForPage";
	}

	public String searchhsjyForPage() {
		try{
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		this.pageBean = this.coursewareService.queryhsjyForPage(
				searchhsjyTitle, pageSize, page);
		}catch(Exception e){System.out.println("异常");}
		return "searchhsjyForPage";
	}

	public String searchaqscpxForPage() {
		try{
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		this.pageBean = this.coursewareService.queryaqscpxForPage(
				searchaqscpxTitle, pageSize, page);
		}catch(Exception e){System.out.println("异常");}
		return "searchaqscpxForPage";
	}
	
	public String searchzyjnpxForPage() {
		try{
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		this.pageBean = this.coursewareService.queryzyjnpxForPage(
				searchzyjnpxTitle, pageSize, page);
		}catch(Exception e){System.out.println("异常");}
		return "searchzyjnpxForPage";
		
	}
	
	
	public CoursewareService getCoursewareService() {
		return coursewareService;
	}

	public void setCoursewareService(CoursewareService coursewareService) {
		this.coursewareService = coursewareService;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	



	public String getSearchCoursewareID() {
		return searchCoursewareID;
	}

	public void setSearchCoursewareID(String searchCoursewareID) {
		this.searchCoursewareID = searchCoursewareID;
	}

	public Courseware getCourseware() {
		return courseware;
	}

	public void setCourseware(Courseware courseware) {
		this.courseware = courseware;
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

	public Courseware getModel() {
		return courseware;
	}
}
