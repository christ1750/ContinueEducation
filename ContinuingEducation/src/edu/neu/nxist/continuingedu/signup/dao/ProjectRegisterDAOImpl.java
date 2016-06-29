package edu.neu.nxist.continuingedu.signup.dao;

import java.util.List;

import edu.neu.nxist.continuingedu.basic.BasicDAO;
import edu.neu.nxist.continuingedu.signup.model.ProjectRegister;

public class ProjectRegisterDAOImpl implements ProjectRegisterDAO {
	private BasicDAO basicDao;

	public List findAll(String hql) {
		return this.basicDao.listAllRecord(hql);
	}

	public List findByUserId(String hql) {
		return this.basicDao.listAllRecord(hql);

	}

	public List findByProjectId(String hql) {
		return this.basicDao.listAllRecord(hql);
	}

	public List findByCheckStatus(String hql) {
		return this.basicDao.listAllRecord(hql);
	}

	public List findByReportStatus(String hql) {
		return this.basicDao.listAllRecord(hql);
	}

	public List findByCondition(String hql) {
		// TODO Auto-generated method stub
		return this.basicDao.listAllRecord(hql);
	}

	public ProjectRegister findByApplyId(String applyId) {
		return (ProjectRegister) this.basicDao.findById(ProjectRegister.class,
				applyId);
	}

	public void updateProjectRegister(ProjectRegister e) {
		this.basicDao.updateRecord(e);
	}

	public void deleteProjectRegister(ProjectRegister e) {
		this.basicDao.deleteRecord(e);
	}

	public void saveProjectRegister(ProjectRegister e) {
		this.basicDao.addRecord(e);
	}

	public void check(String hql) {
		this.basicDao.listAllRecord(hql);
	}

	public int getAllRowCount(String hql) {
		// TODO Auto-generated method stub
		return this.basicDao.getAllRowCount(hql);
	}

	public List queryForPage(String hql, int offset, int length) {
		// TODO Auto-generated method stub
		return this.basicDao.queryForPage(hql, offset, length);
	}

	public void setBasicDao(BasicDAO basicDao) {
		this.basicDao = basicDao;
	}

	public BasicDAO getBasicDao() {
		return basicDao;
	}

}
