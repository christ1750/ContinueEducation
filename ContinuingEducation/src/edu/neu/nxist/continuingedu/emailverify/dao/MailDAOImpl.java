package edu.neu.nxist.continuingedu.emailverify.dao;

import java.util.List;

import edu.neu.nxist.continuingedu.basic.BasicDAO;
import edu.neu.nxist.continuingedu.emailverify.model.MailInfo;

public class MailDAOImpl implements MailDAO {
	private BasicDAO basicDao;

	public BasicDAO getBasicDao() {
		return basicDao;
	}

	public void setBasicDao(BasicDAO basicDao) {
		this.basicDao = basicDao;
	}

	public void addMail(MailInfo mail) {
		// TODO Auto-generated method stub
		this.basicDao.addRecord(mail);
	}

	public void deleteMail(MailInfo mail) {
		// TODO Auto-generated method stub
		this.basicDao.deleteRecord(mail);
	}

	public MailInfo findMailById(String id) {
		// TODO Auto-generated method stub
		return (MailInfo) this.basicDao.findById(MailInfo.class, id);
	}
	
	public List findMailAll(String hql) {
		// TODO Auto-generated method stub
		return this.basicDao.listAllRecord(hql);
	}

	public void updateMail(MailInfo mail) {
		// TODO Auto-generated method stub
		this.basicDao.updateRecord(mail);
	}

}
