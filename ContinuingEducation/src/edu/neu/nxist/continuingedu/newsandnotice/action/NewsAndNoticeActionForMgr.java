package edu.neu.nxist.continuingedu.newsandnotice.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.neu.nxist.continuingedu.newsandnotice.model.NewsAndNotice;
import edu.neu.nxist.continuingedu.newsandnotice.service.NewsAndNoticeService;
import edu.neu.nxist.continuingedu.register.dto.ConfigUtil;
import edu.neu.nxist.continuingedu.register.dto.Notification;
import edu.neu.nxist.continuingedu.register.dto.PageBean;

public class NewsAndNoticeActionForMgr extends ActionSupport implements
		ModelDriven<NewsAndNotice> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7990765658027314488L;
	private NewsAndNoticeService newsAndNoticeService;
	private PageBean pageBean;
	private String searchNewsAndNoticeID;
	private int categoryId;
	private String queryNewsTitle;
	private String queryNewsAuthor;
	private String queryTime1;
	private String queryTime2;
	private String queryNoticeTitle;
	private NewsAndNotice newsAndNotice = new NewsAndNotice();
	private int page;
	private int pageSize = 20;

	//图文信息发布之前的初始化
	 public String beforeAddInfo(){
		 return "beforeAddInfo";
	 }
	public String saveNewsAndNotice() {
		this.newsAndNoticeService.saveNewsAndNotice(newsAndNotice);
		Notification notification = new Notification();
		notification.setClassType(ConfigUtil.getConfig().getString(
				"css.class.success"));
		notification
				.setTitle(ConfigUtil.getConfig().getString("msg.title.add"));
		notification.setMessage(ConfigUtil.getConfig().getString(
				"msg.message.add"));
		ActionContext.getContext().getSession().put("Notification",
				notification);
		return "saveNewsAndNotice";
	}

	public String updateNewsAndNotice() {
		this.newsAndNoticeService.updateNewsAndNotice(newsAndNotice);
		Notification notification = new Notification();
		notification.setClassType(ConfigUtil.getConfig().getString(
				"css.class.success"));
		notification.setTitle(ConfigUtil.getConfig().getString(
				"msg.title.update"));
		notification.setMessage(ConfigUtil.getConfig().getString(
				"msg.message.update"));
		ActionContext.getContext().getSession().put("Notification",
				notification);
		return "updateNewsAndNotice";
	}

	public String deleteNewsAndNotice() {
		newsAndNotice = this.newsAndNoticeService
				.findNewsAndNoticeById(searchNewsAndNoticeID);
		this.newsAndNoticeService.deleteNewsAndNotice(newsAndNotice);
		Notification notification = new Notification();
		notification.setClassType(ConfigUtil.getConfig().getString(
				"css.class.success"));
		notification.setTitle(ConfigUtil.getConfig().getString(
				"msg.title.delete"));
		notification.setMessage(ConfigUtil.getConfig().getString(
				"msg.message.delete"));
		ActionContext.getContext().getSession().put("Notification",
				notification);
		return "deleteNewsAndNotice";
	}

	// 后台修改时回填新闻、通知信息
	public void getNewsAndNoticeByID() {
		newsAndNotice = newsAndNoticeService
				.findNewsAndNoticeById(searchNewsAndNoticeID);
		try {
			JSONArray jsonArray = JSONArray.fromObject(newsAndNotice);
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

	// 后台显示新闻、通知列表
	public String queryForPage() {
		List tabList = this.newsAndNoticeService.getCategoryTab();
		this.pageBean = this.newsAndNoticeService.queryForPage(categoryId,
				queryNewsTitle, queryNewsAuthor, queryTime1, queryTime2,
				pageSize, page);
		ActionContext.getContext().getSession().put("tabList", tabList);
		return "queryForPage";
	}

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

	public void setQueryNewsTitle(String queryNewsTitle) {
		this.queryNewsTitle = queryNewsTitle;
	}

	public String getQueryNewsTitle() {
		return queryNewsTitle;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getQueryNewsAuthor() {
		return queryNewsAuthor;
	}

	public void setQueryNewsAuthor(String queryNewsAuthor) {
		this.queryNewsAuthor = queryNewsAuthor;
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

	public void setQueryNoticeTitle(String queryNoticeTitle) {
		this.queryNoticeTitle = queryNoticeTitle;
	}

	public String getQueryNoticeTitle() {
		return queryNoticeTitle;
	}

	public void setNewsAndNotice(NewsAndNotice newsAndNotice) {
		this.newsAndNotice = newsAndNotice;
	}

	public NewsAndNotice getNewsAndNotice() {
		return newsAndNotice;
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

	public NewsAndNotice getModel() {
		return newsAndNotice;
	}
}
