package edu.neu.nxist.continuingedu.newsandnotice.ajax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import edu.neu.nxist.continuingedu.newsandnotice.model.NewsAndNoticeCategory;
import edu.neu.nxist.continuingedu.newsandnotice.service.NewsAndNoticeService;

public class LoadCategory {

	private NewsAndNoticeService newsAndNoticeService;

	@SuppressWarnings("unchecked")
	public String execute() {
		List<NewsAndNoticeCategory> categoryList = new ArrayList<NewsAndNoticeCategory>();
		categoryList = (List<NewsAndNoticeCategory>) newsAndNoticeService
				.getCategory();

		try {
			JSONArray jsonArray = JSONArray.fromObject(categoryList);

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
		return null;
	}

	public NewsAndNoticeService getNewsAndNoticeService() {
		return newsAndNoticeService;
	}

	public void setNewsAndNoticeService(
			NewsAndNoticeService newsAndNoticeService) {
		this.newsAndNoticeService = newsAndNoticeService;
	}

}
