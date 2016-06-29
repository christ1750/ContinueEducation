package edu.neu.nxist.continuingedu.register.dao;

import java.util.List;

import edu.neu.nxist.continuingedu.basic.BasicDAO;

public class SchoolDAOImpl implements SchoolDAO {
	private BasicDAO myBasicDao;

	public BasicDAO getmyBasicDao() {
		return myBasicDao;
	}

	public void setmyBasicDao(BasicDAO myBasicDao) {
		this.myBasicDao = myBasicDao;
	}

	public List listAllSchool(String hql) {
		return this.myBasicDao.listAllRecord(hql);
	}

}
