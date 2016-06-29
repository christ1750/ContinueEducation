package edu.neu.nxist.continuingedu.courseteacher.dao;
import java.util.List;

import edu.neu.nxist.continuingedu.basic.BasicDAO;
import edu.neu.nxist.continuingedu.courseteacher.model.Courseteacher;

public class CourseteacherDAOImpl implements CourseteacherDAO {
	private BasicDAO myBasicDao;
	public void addCourseteacher(Courseteacher courseteacher) {
		// TODO Auto-generated method stub
		this.myBasicDao.addRecord(courseteacher);
	}

	public BasicDAO getMyBasicDao() {
		return myBasicDao;
	}

	public void setMyBasicDao(BasicDAO myBasicDao) {
		this.myBasicDao = myBasicDao;
	}

	public void deleteCourseteacher(Courseteacher courseteacher) {
		// TODO Auto-generated method stub
		this.myBasicDao.deleteRecord(courseteacher);
	}

	public void updateCourseteacher(Courseteacher courseteacher) {
		// TODO Auto-generated method stub
		this.myBasicDao.updateRecord(courseteacher);
	}

	public Courseteacher findCourseteacherById(String id) {
		// TODO Auto-generated method stub
		return (Courseteacher)this.myBasicDao.findById(Courseteacher.class, id);
	}

	public int getAllRowCount(String hql) {
		// TODO Auto-generated method stub
		return this.myBasicDao.getAllRowCount(hql);
	}

	public List queryCourseteacherForPage(String hql, int offset, int length) {
		// TODO Auto-generated method stub
		return this.myBasicDao.queryForPage(hql, offset, length);
	}

	public List listAllCourseteacher(String hql) {
		return this.myBasicDao.listAllRecord(hql);
	}
	
	public int findByPidUid(String hql)
	{
		return this.myBasicDao.getAllRowCount(hql);
	
	}

	public BasicDAO getmyBasicDao() {
		return myBasicDao;
	}

	public void setmyBasicDao(BasicDAO myBasicDao) {
		this.myBasicDao = myBasicDao;
	}
}
