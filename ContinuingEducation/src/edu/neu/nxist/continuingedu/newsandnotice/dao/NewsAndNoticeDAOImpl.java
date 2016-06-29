package edu.neu.nxist.continuingedu.newsandnotice.dao;

import java.util.List;

import edu.neu.nxist.continuingedu.basic.BasicDAO;
import edu.neu.nxist.continuingedu.newsandnotice.model.NewsAndNotice;

public class NewsAndNoticeDAOImpl implements NewsAndNoticeDAO {
	private BasicDAO myBasicDao;

	public void addNewsAndNotice(NewsAndNotice news) {
		// TODO Auto-generated method stub
		this.myBasicDao.addRecord(news);
	}

	public void deleteNewsAndNotice(NewsAndNotice news) {
		// TODO Auto-generated method stub
		this.myBasicDao.deleteRecord(news);
	}

	public void updateNewsAndNotice(NewsAndNotice news) {
		// TODO Auto-generated method stub
		this.myBasicDao.updateRecord(news);
	}

	public NewsAndNotice findNewsAndNoticeById(String id) {
		// TODO Auto-generated method stub
		return (NewsAndNotice) this.myBasicDao
				.findById(NewsAndNotice.class, id);
	}

	public int getAllRowCount(String hql) {
		// TODO Auto-generated method stub
		return this.myBasicDao.getAllRowCount(hql);
	}

	public List queryNewsForPage(String hql, int offset, int length) {
		// TODO Auto-generated method stub
		return this.myBasicDao.queryForPage(hql, offset, length);
	}

	public List listAllNewsAndNotice(String hql) {
		return this.myBasicDao.listAllRecord(hql);
	}

	public BasicDAO getmyBasicDao() {
		return myBasicDao;
	}

	public void setmyBasicDao(BasicDAO myBasicDao) {
		this.myBasicDao = myBasicDao;
	}
}