package edu.neu.nxist.continuingedu.signup.dao;

import java.util.List;

import edu.neu.nxist.continuingedu.signup.model.ProjectRegister;

public interface ProjectRegisterDAO {

	public List findAll(String hql);

	public List findByUserId(String hql);

	public List findByProjectId(String hql);

	public List findByCheckStatus(String hql);

	public List findByReportStatus(String hql);

	public List findByCondition(String hql);

	public ProjectRegister findByApplyId(String applyId);

	public void updateProjectRegister(ProjectRegister e);

	public void deleteProjectRegister(ProjectRegister e);

	public void saveProjectRegister(ProjectRegister e);

	public void check(String hql);

	public int getAllRowCount(String hql);

	public List queryForPage(String hql, int offset, int length);

}