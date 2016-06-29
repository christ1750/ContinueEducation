package edu.neu.nxist.continuingedu.diagram.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
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
import edu.neu.nxist.continuingedu.diagram.model.Diagram;
import edu.neu.nxist.continuingedu.diagram.service.DiagramService;
import edu.neu.nxist.continuingedu.newsandnotice.model.NewsAndNotice;
import edu.neu.nxist.continuingedu.newsandnotice.service.NewsAndNoticeService;
import edu.neu.nxist.continuingedu.register.dto.PageBean;
import edu.neu.nxist.continuingedu.register.model.UserInfo;

public class DiagramAction extends ActionSupport implements
		ModelDriven<Diagram>,SessionAware,
		RequestAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7990765658027314488L;
	private DiagramService diagramService;
	private NewsAndNoticeService newsAndNoticeService;
	private PageBean pageBean;
	private String searchDiagramID;
	private String searchNewsID;
	private File upload;
	private String uploadFileName;
	private int page;
	private int pageSize = 15;
	private String diagramtitle;
	private Map<String, Object> request;

	private Map<String, Object> session;
	private Diagram diagram = new Diagram();
	private NewsAndNotice news;
	private String linknewsNO;
	private String linknewsID;
	
	
	public String listDiagramForPage() {
		try{
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		this.pageBean = this.diagramService.queryDiagramForPage(
				 pageSize, page);
		
		}catch(Exception e){System.out.println("异常");}
		return "listDiagramForPage";
	}
	
	
	public String editdiagram() {
		try{
			news=this.newsAndNoticeService.findNewsAndNoticeById(searchNewsID);
			this.diagramtitle=news.getTitle();
			System.out.println(searchNewsID);
			System.out.println(diagramtitle);
			((HttpServletRequest) request).getSession().setAttribute("diagramtitle", diagramtitle);
		}catch(Exception e){System.out.println("异常");}
		return "editdiagram";
	}
	  
	public String linknews()
	{
		System.out.println(linknewsNO);
		diagram=diagramService.findDiagramById(linknewsNO);
		System.out.println(diagram.getNews().getId());
		linknewsID=diagram.getNews().getId();
		return "linknews";
	}
	
	
	public String updateDiagram() throws Exception
	{
		
			diagram = this.diagramService
			.findDiagramById(searchDiagramID);
			String savePath = ServletActionContext.getServletContext()
			.getRealPath("/") + "images/diagram/";

	            
	             byte[] buffer = new byte[1024];
	             FileInputStream fis = null;
	             fis = new FileInputStream(upload);

	             File dirFile = new File(savePath);
	             if (!dirFile.exists()) {
		          dirFile.mkdirs();
	              }
                  savePath=savePath+diagram.getId()+ "." + "jpg";
                  File file = new File(savePath);
	             if(file.exists())
	             {
	            	 file.delete();
	             }
	              String newCoursewareName = diagram.getId()+ "." + "jpg";

	              FileOutputStream fos = new FileOutputStream(savePath);

	               int len = 0;
	              while ((len = fis.read(buffer)) > 0) {
		            fos.write(buffer, 0, len);
	                 }
	            //各种set
	              Date d = new Date();
	    		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    		diagram.setTime(sdf.format(d));
	    		UserInfo userInfo = (UserInfo) session.get("userInfo");
	    		diagram.setUserInfo(userInfo);
			    news=this.newsAndNoticeService.findNewsAndNoticeById(searchNewsID);
			    diagram.setNews(news);
			    
			    
			    	diagram.setTitle(news.getTitle());
			    
			this.diagramService.updateDiagram(diagram);
			
			return "updateDiagram";
		
	}
	
	
	public void showForPage() {
		this.pageBean = this.diagramService.queryDiagramForPage(pageSize, page);
		try {
			JSONArray jsonArray = JSONArray.fromObject(this.pageBean.getList());
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
	


	public DiagramService getDiagramService() {
		return diagramService;
	}





	public void setDiagramService(DiagramService diagramService) {
		this.diagramService = diagramService;
	}





	public PageBean getPageBean() {
		return pageBean;
	}





	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}





	public String getSearchDiagramID() {
		return searchDiagramID;
	}





	public void setSearchDiagramID(String searchDiagramID) {
		this.searchDiagramID = searchDiagramID;
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





	public Diagram getDiagram() {
		return diagram;
	}





	public void setDiagram(Diagram diagram) {
		this.diagram = diagram;
	}





	public String getSearchNewsID() {
		return searchNewsID;
	}

	public void setSearchNewsID(String searchNewsID) {
		this.searchNewsID = searchNewsID;
	}



	public NewsAndNotice getNews() {
		return news;
	}

	public void setNews(NewsAndNotice news) {
		this.news = news;
	}



	public NewsAndNoticeService getNewsAndNoticeService() {
		return newsAndNoticeService;
	}

	public void setNewsAndNoticeService(NewsAndNoticeService newsAndNoticeService) {
		this.newsAndNoticeService = newsAndNoticeService;
	}

	public String getDiagramtitle() {
		return diagramtitle;
	}


	public void setDiagramtitle(String diagramtitle) {
		this.diagramtitle = diagramtitle;
	}


	public String getLinknewsID() {
		return linknewsID;
	}


	public void setLinknewsID(String linknewsID) {
		this.linknewsID = linknewsID;
	}


	public String getLinknewsNO() {
		return linknewsNO;
	}


	public void setLinknewsNO(String linknewsNO) {
		this.linknewsNO = linknewsNO;
	}


	public Diagram getModel() {
		return diagram;
	}
}
