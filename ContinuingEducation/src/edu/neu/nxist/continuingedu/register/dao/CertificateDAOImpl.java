package edu.neu.nxist.continuingedu.register.dao;

import java.util.List;

import edu.neu.nxist.continuingedu.basic.BasicDAO;

public class CertificateDAOImpl implements CertificateDAO {
	private BasicDAO myBasicDao;

	public BasicDAO getmyBasicDao() {
		return myBasicDao;
	}

	public void setmyBasicDao(BasicDAO myBasicDao) {
		this.myBasicDao = myBasicDao;
	}

	public List listAllCertificate(String hql) {
		return this.myBasicDao.listAllRecord(hql);
	}

}
