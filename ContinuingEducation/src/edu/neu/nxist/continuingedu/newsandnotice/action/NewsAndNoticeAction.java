package edu.neu.nxist.continuingedu.newsandnotice.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import edu.neu.nxist.continuingedu.newsandnotice.model.NewsAndNotice;
import edu.neu.nxist.continuingedu.newsandnotice.service.NewsAndNoticeService;
import edu.neu.nxist.continuingedu.register.dto.PageBean;

public class NewsAndNoticeAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7990765658027314488L;
	private NewsAndNoticeService newsAndNoticeService;
	private PageBean pageBean;
	private String searchNewsAndNoticeID;// 前台用
	private String searchNewsTitle;
	private String searchNoticeTitle;
	private NewsAndNotice newsAndNotice;
	private int categoryId;
	private int page;
	private int pageSize = 20;

	// 前台查看新闻、通知详细内容
	public String showOneNewsAndNotice() {
		newsAndNotice = this.newsAndNoticeService
				.findNewsAndNoticeById(searchNewsAndNoticeID);
		return "showOneNewsAndNotice";
	}
	
	//查看学院概况
	public String showAcademyIntroduction() {
		List<NewsAndNotice> artical = this.newsAndNoticeService.findAcademyIntroduction(categoryId);
		if (artical.size()!=0)
			newsAndNotice = artical.get(0);
		else
			newsAndNotice=null;
		return "showAcademyIntroduction";
	}
	
	// index.jsp显示新闻、通知栏
	public void listForPage() {
		this.pageBean = this.newsAndNoticeService.queryForPage(categoryId,null, null,
				null, null, pageSize, page);
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

//	public void listNoticeForPage() {
//		this.pageBean = this.newsAndNoticeService.queryNoticeForPage(
//				searchNoticeTitle, pageSize, page);
//		try {
//			JSONArray jsonArray = JSONArray.fromObject(this.pageBean.getList());
//			HttpServletResponse response = ServletActionContext.getResponse();
//			try {
//				response.setContentType("application/json;charset=UTF-8");
//				response.getWriter().print(jsonArray.toString());
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}

	public String queryForPage() {
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		this.pageBean = this.newsAndNoticeService.queryForPage(categoryId,
				null, null, null, null, pageSize, page);
		return "searchNewsForPage";
	}

//	public String searchNoticeForPage() {
//		if (pageBean != null) {
//			if (page < 1)
//				page = 1;
//			if (page > pageBean.getTotalPage())
//				page = pageBean.getTotalPage();
//		}
//		this.pageBean = this.newsAndNoticeService.queryNoticeForPage(
//				searchNoticeTitle, pageSize, page);
//		return "searchNoticeForPage";
//	}

	public NewsAndNoticeService getNewsAndNoticeService() {
		return newsAndNoticeService;
	}

	public void setNewsAndNoticeService(
			NewsAndNoticeService newsAndNoticeService) {
		this.newsAndNoticeService = newsAndNoticeService;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public String getSearchNewsAndNoticeID() {
		return searchNewsAndNoticeID;
	}

	public void setSearchNewsAndNoticeID(String searchNewsAndNoticeID) {
		this.searchNewsAndNoticeID = searchNewsAndNoticeID;
	}

	public void setNewsAndNotice(NewsAndNotice newsAndNotice) {
		this.newsAndNotice = newsAndNotice;
	}

	public NewsAndNotice getNewsAndNotice() {
		return newsAndNotice;
	}

	public String getSearchNewsTitle() {
		return searchNewsTitle;
	}

	public void setSearchNewsTitle(String searchNewsTitle) {
		this.searchNewsTitle = searchNewsTitle;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getSearchNoticeTitle() {
		return searchNoticeTitle;
	}

	public void setSearchNoticeTitle(String searchNoticeTitle) {
		this.searchNoticeTitle = searchNoticeTitle;
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

}
