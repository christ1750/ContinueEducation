package edu.neu.nxist.continuingedu.courseware.dao;

import java.util.List;

import edu.neu.nxist.continuingedu.basic.BasicDAO;
import edu.neu.nxist.continuingedu.courseware.model.Courseware;

public class CoursewareDAOImpl implements CoursewareDAO {
	private BasicDAO myBasicDao;

	public void addCourseware(Courseware ware) {
		// TODO Auto-generated method stub
		this.myBasicDao.addRecord(ware);
	}

	public void deleteCourseware(Courseware ware) {
		// TODO Auto-generated method stub
		this.myBasicDao.deleteRecord(ware);
	}

	public void updateCourseware(Courseware ware) {
		// TODO Auto-generated method stub
		this.myBasicDao.updateRecord(ware);
	}

	public Courseware findCoursewareById(String id) {
		// TODO Auto-generated method stub
		return (Courseware)this.myBasicDao.findById(Courseware.class, id);
	}

	public int getAllRowCount(String hql) {
		// TODO Auto-generated method stub
		return this.myBasicDao.getAllRowCount(hql);
	}

	public List queryCoursewareForPage(String hql, int offset, int length) {
		// TODO Auto-generated method stub
		return this.myBasicDao.queryForPage(hql, offset, length);
	}

	public List listAllCourseware(String hql) {
		return this.myBasicDao.listAllRecord(hql);
	}

	public BasicDAO getmyBasicDao() {
		return myBasicDao;
	}

	public void setmyBasicDao(BasicDAO myBasicDao) {
		this.myBasicDao = myBasicDao;
	}
}