package edu.neu.nxist.continuingedu.guestbook.dao;

import java.util.List;

import edu.neu.nxist.continuingedu.basic.BasicDAO;
import edu.neu.nxist.continuingedu.guestbook.model.*;

public class GuestbookDAOImpl implements GuestbookDAO {
	private BasicDAO myBasicDao;

	public void addGuestbook(Guestbook book) {
		// TODO Auto-generated method stub
		this.myBasicDao.addRecord(book);
	}

	public void deleteGuestbook(Guestbook book) {
		// TODO Auto-generated method stub
		this.myBasicDao.deleteRecord(book);
	}

	public void updateGuestbook(Guestbook book) {
		// TODO Auto-generated method stub
		this.myBasicDao.updateRecord(book);
	}

	public Guestbook findGuestbookById(String id) {
		// TODO Auto-generated method stub
		return (Guestbook)this.myBasicDao.findById(Guestbook.class, id);
	}

	public int getAllRowCount(String hql) {
		// TODO Auto-generated method stub
		return this.myBasicDao.getAllRowCount(hql);
	}

	public List queryGuestbookForPage(String hql, int offset, int length) {
		// TODO Auto-generated method stub
		return this.myBasicDao.queryForPage(hql, offset, length);
	}
	
	public List checkGuestbookForPage(String hql, int offset, int length) {
		// TODO Auto-generated method stub
		return this.myBasicDao.queryForPage(hql, offset, length);
	}

	public List listAllGuestbook(String hql) {
		return (List<Guestbook>)this.myBasicDao.listAllRecord(hql);
	}

	public BasicDAO getmyBasicDao() {
		return myBasicDao;
	}

	public void setmyBasicDao(BasicDAO myBasicDao) {
		this.myBasicDao = myBasicDao;
	}
}