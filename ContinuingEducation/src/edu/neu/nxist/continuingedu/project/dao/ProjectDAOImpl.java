package edu.neu.nxist.continuingedu.project.dao;

import java.util.List;

import edu.neu.nxist.continuingedu.basic.BasicDAO;
import edu.neu.nxist.continuingedu.project.model.Project;

public class ProjectDAOImpl implements ProjectDAO {

	private BasicDAO myBasicDao;

	public BasicDAO getmyBasicDao() {
		return myBasicDao;
	}

	public void setmyBasicDao(BasicDAO myBasicDao) {
		this.myBasicDao = myBasicDao;
	}

	public void addProject(Project myProject) {
		// TODO Auto-generated method stub
		this.myBasicDao.addRecord(myProject);
	}

	public void deleteProject(Project myProject) {
		// TODO Auto-generated method stub
		this.myBasicDao.deleteRecord(myProject);
	}

	public Project findProjectById(String id) {
		// TODO Auto-generated method stub
		return (Project) this.myBasicDao.findById(Project.class, id);
	}

	public int getAllRowCount(String hql) {
		// TODO Auto-generated method stub
		return this.myBasicDao.getAllRowCount(hql);
	}

	public List listAllProject(String hql) {
		// TODO Auto-generated method stub
		return this.myBasicDao.listAllRecord(hql);
	}

	public List queryBySql(String sql) {
		// TODO Auto-generated method stub
		return this.myBasicDao.queryBySql(sql);
	}

	public List queryProjectForPage(String hql, int offset, int length) {
		// TODO Auto-generated method stub
		return this.myBasicDao.queryForPage(hql, offset, length);
	}

	public void updateProject(Project myProject) {
		// TODO Auto-generated method stub
		this.myBasicDao.updateRecord(myProject);
	}

}
