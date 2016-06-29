package edu.neu.nxist.continuingedu.newsandnotice.service;

import java.util.Iterator;
import java.util.List;

import edu.neu.nxist.continuingedu.newsandnotice.dao.NewsAndNoticeDAO;
import edu.neu.nxist.continuingedu.newsandnotice.model.NewsAndNotice;
import edu.neu.nxist.continuingedu.register.dto.PageBean;

public class NewsAndNoticeServiceImpl implements NewsAndNoticeService {

	private NewsAndNoticeDAO newsAndNoticeDao;

	// 保存数据
	public void saveNewsAndNotice(NewsAndNotice news) {

		newsAndNoticeDao.addNewsAndNotice(news);
	}        

	// 修改新闻
	public void updateNewsAndNotice(NewsAndNotice news) {
		// TODO Auto-generated method stub
		this.newsAndNoticeDao.updateNewsAndNotice(news);
	}

	// 按id查找新闻
	public NewsAndNotice findNewsAndNoticeById(String id) {
		// TODO Auto-generated method stub
		return this.newsAndNoticeDao.findNewsAndNoticeById(id);
	}

	// 删除新闻
	public void deleteNewsAndNotice(NewsAndNotice news) {
		// TODO Auto-generated method stub
		this.newsAndNoticeDao.deleteNewsAndNotice(news);
	}

	public PageBean queryForPage(int categoryId,String queryNewsTitle,
			String queryNewsAuthor, String queryTime1, String queryTime2,
			int pageSize, int page) {
		// TODO Auto-generated method stub
		String hql = "from NewsAndNotice where 1=1";// 查询语句
		if (!"".equals(queryNewsTitle) && queryNewsTitle != null) {
			hql += " and title like '%" + queryNewsTitle + "%'";
		}
		if (!"".equals(queryNewsAuthor) && queryNewsAuthor != null) {
			hql += " and author like '%" + queryNewsAuthor + "%'";
		}
		if (!"".equals(queryTime1) && queryTime1 != null) {
			hql += " and time >='" + queryTime1 + "'";
		}
		if (!"".equals(queryTime2) && queryTime2 != null) {
			hql += " and time <='" + queryTime2 + "'";
		}
		hql += "  and category.categoryId ="+categoryId+" order by time desc";
		int allRow = newsAndNoticeDao.getAllRowCount(hql);// 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数	
		final int length = pageSize;// 每页记录数
		final int currentPage = PageBean.countCurrentPage(page, totalPage);
		final int offset = PageBean.countOffset(pageSize, currentPage);// 当前页开始记录
		List list = newsAndNoticeDao.queryNewsForPage(hql, offset, length);// "一页"的记录

		// 把分页信息保存到Bean中
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);

		pageBean.init();
		return pageBean;
	}

	public List findAcademyIntroduction(int categoryId) {
		return this.newsAndNoticeDao
				.listAllNewsAndNotice("from NewsAndNotice where category.categoryId ="
						+ categoryId);
	}
//	
//	
//	public PageBean queryNoticeForPage(String searchName, int pageSize, int page) {
//		// TODO Auto-generated method stub
//		String hql = "from NewsAndNotice where 1=1";// 查询语句
//		if (!"".equals(searchName) && searchName != null) {
//			hql += " and title like '%" + searchName + "%'";
//		}
//		hql += " and category.categoryId =2 order by time desc";
//		int allRow = newsAndNoticeDao.getAllRowCount(hql);// 总记录数
//		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数
//		final int offset = PageBean.countOffset(pageSize, page);// 当前页开始记录
//		final int length = pageSize;// 每页记录数
//		final int currentPage = PageBean.countCurrentPage(page, totalPage);
//		List list = newsAndNoticeDao.queryNewsForPage(hql, offset, length);// "一页"的记录
//
//		// 把分页信息保存到Bean中
//		PageBean pageBean = new PageBean();
//		pageBean.setPageSize(pageSize);
//		pageBean.setCurrentPage(currentPage);
//		pageBean.setAllRow(allRow);
//		pageBean.setTotalPage(totalPage);
//		pageBean.setList(list);
//
//		pageBean.init();
//		return pageBean;
//	}
//
//	@SuppressWarnings("unchecked")
//	public PageBean queryNewsForPage(String queryNewsTitle,
//			String queryNewsAuthor, String queryTime1, String queryTime2,
//			int pageSize, int page) {
//		// TODO Auto-generated method stub
//		String hql = "from NewsAndNotice where 1=1";// 查询语句
//		if (!"".equals(queryNewsTitle) && queryNewsTitle != null) {
//			hql += " and title like '%" + queryNewsTitle + "%'";
//		}
//		if (!"".equals(queryNewsAuthor) && queryNewsAuthor != null) {
//			hql += " and author like '%" + queryNewsAuthor + "%'";
//		}
//		if (!"".equals(queryTime1) && queryTime1 != null) {
//			hql += " and time >='" + queryTime1 + "'";
//		}
//		if (!"".equals(queryTime2) && queryTime2 != null) {
//			hql += " and time <='" + queryTime2 + "'";
//		}
//		hql += "  and category.categoryId =1 order by time desc";
//		int allRow = newsAndNoticeDao.getAllRowCount(hql);// 总记录数
//		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数
//		final int offset = PageBean.countOffset(pageSize, page);// 当前页开始记录
//		final int length = pageSize;// 每页记录数
//		final int currentPage = PageBean.countCurrentPage(page, totalPage);
//		List list = newsAndNoticeDao.queryNewsForPage(hql, offset, length);// "一页"的记录
//
//		// 把分页信息保存到Bean中
//		PageBean pageBean = new PageBean();
//		pageBean.setPageSize(pageSize);
//		pageBean.setCurrentPage(currentPage);
//		pageBean.setAllRow(allRow);
//		pageBean.setTotalPage(totalPage);
//		pageBean.setList(list);
//
//		pageBean.init();
//		return pageBean;
//	}

	public List getCategoryTab() {
		// TODO Auto-generated method stub
		return newsAndNoticeDao
				.listAllNewsAndNotice("from NewsAndNoticeCategory)");
	}
	
	public List getCategory() {
		// TODO Auto-generated method stub
		String subHql = "select category.categoryId from NewsAndNotice where category.categoryId =3 or category.categoryId =4 or category.categoryId =5";
		return newsAndNoticeDao
				.listAllNewsAndNotice("from NewsAndNoticeCategory where categoryId not in ("
						+ subHql + ")");
	}

	public List getSource() {
		// TODO Auto-generated method stub
		return newsAndNoticeDao
				.listAllNewsAndNotice("from NewsAndNoticeSource");
	}

	public void setNewsAndNoticeDao(NewsAndNoticeDAO newsAndNoticeDao) {
		this.newsAndNoticeDao = newsAndNoticeDao;
	}

	public NewsAndNoticeDAO getNewsAndNoticeDao() {
		return newsAndNoticeDao;
	}

}