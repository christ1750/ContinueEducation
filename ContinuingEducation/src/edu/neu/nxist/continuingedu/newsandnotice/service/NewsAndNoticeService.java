package edu.neu.nxist.continuingedu.newsandnotice.service;

import java.util.List;

import edu.neu.nxist.continuingedu.newsandnotice.model.NewsAndNotice;
import edu.neu.nxist.continuingedu.register.dto.PageBean;

public interface NewsAndNoticeService {
	public void saveNewsAndNotice(NewsAndNotice news);

	public NewsAndNotice findNewsAndNoticeById(String id); // 显示新闻内容

	public void updateNewsAndNotice(NewsAndNotice news);// 更新新闻

	public void deleteNewsAndNotice(NewsAndNotice news);// 删除新闻

//	public PageBean queryNewsForPage(String queryNewsTitle,
//			String queryNewsAuthor, String queryTime1, String queryTime2,
//			int pageSize, int page); // 分页查找显示

//	public PageBean queryNoticeForPage(String searchName, int pageSize, int page); // 分页查找显示

	public PageBean queryForPage(int categoryId, String queryNewsTitle,
			String queryNewsAuthor, String queryTime1, String queryTime2,
			int pageSize, int page);

	public List findAcademyIntroduction(int categoryId);
	
	public List getCategoryTab();

	public List getCategory();

	public List getSource();

}
