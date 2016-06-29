package edu.neu.nxist.continuingedu.signup.service;

import java.util.ArrayList;
import java.util.List;

import edu.neu.nxist.continuingedu.register.dto.PageBean;
import edu.neu.nxist.continuingedu.signup.dao.ProjectRegisterDAO;
import edu.neu.nxist.continuingedu.signup.model.ProjectRegister;

public class ProjectRegisterServiceImpl implements ProjectRegisterService {

	private ProjectRegisterDAO projectRegisterDao;

	public void saveProjectRegister(ProjectRegister pjReg) {
		// TODO Auto-generated method stub
		this.projectRegisterDao.saveProjectRegister(pjReg);
	}

	public void updateProjectRegister(ProjectRegister pjReg) {
		// TODO Auto-generated method stub
		this.projectRegisterDao.updateProjectRegister(pjReg);
	}

	public void deleteProjectRegister(ProjectRegister pjReg) {
		// TODO Auto-generated method stub
		this.projectRegisterDao.deleteProjectRegister(pjReg);
	}

	public List findAll() {
		// TODO Auto-generated method stub
		return this.projectRegisterDao.findAll("from ProjectRegister");
	}

	public ProjectRegister findByApplyId(String applyId) {
		// TODO Auto-generated method stub
		return this.projectRegisterDao.findByApplyId(applyId);
	}

	public List findByCheckStatus(int checkStatus) {
		// TODO Auto-generated method stub
		return this.projectRegisterDao
				.findByCheckStatus("from ProjectRegister where checkStatus.checkId="
						+ checkStatus);
	}

	public List findByReportStatus(int reportStatus) {
		return this.projectRegisterDao
				.findByReportStatus("from ProjectRegister where reportStatus.reportId="
						+ reportStatus);
	}

	public List findByProjectId(String projectId) {
		// TODO Auto-generated method stub
		return this.projectRegisterDao
				.findByProjectId("from ProjectRegister where project.projectID='"
						+ projectId + "'");
	}

	public List findByCondition(String userId, String projectId,
			int checkStatus, int reportStatus) {
		// TODO Auto-generated method stub
		String hql = "from ProjectRegister where 1=1";// 查询语句
		if (!"".equals(userId) && userId != null) {
			hql += " and userInfo.userId ='" + userId + "'";
		}
		if (!"".equals(projectId) && projectId != null)
			hql += " and project.projectID ='" + projectId + "'";
		if (checkStatus != 0)
			hql += " and checkStatus.checkId =" + checkStatus;
		if (reportStatus != 0)
			hql += " and reportStatus.reportId =" + reportStatus;
		return this.projectRegisterDao.findByCondition(hql);
	}
	
	public PageBean findByUserId(String userId, String nameOrder,
			String beginTime, String endTime, int checkStatus, int page,
			int pageSize) {
		// TODO Auto-generated method stub
		String hql = "from ProjectRegister where 1=1";// 查询语句
		if (!"".equals(nameOrder) && nameOrder != null) {
			hql += " and project.projectName like '%" + nameOrder
					+ "%' or project.projectOrder like '%" + nameOrder + "%'";
		}
		if (!"".equals(beginTime) && beginTime != null) {
			hql += " and signupTime >='" + beginTime + "'";
		}
		if (!"".equals(endTime) && endTime != null) {
			hql += " and signupTime <='" + endTime + "'";
		}
		if (checkStatus != -1 ) {
			hql += " and checkStatus.checkId =" + checkStatus;
		}
		hql += "  and userInfo.userId='" + userId
				+ "' order by signupTime desc";
		int allRow = projectRegisterDao.getAllRowCount(hql);// 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数
		final int length = pageSize;// 每页记录数
		final int currentPage = PageBean.countCurrentPage(page, totalPage);
		final int offset = PageBean.countOffset(pageSize, currentPage);// 当前页开始记录
		List list = projectRegisterDao.queryForPage(hql, offset, length);// "一页"的记录

		// 把分页信息保存到Bean中
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);

		pageBean.init();
		return pageBean;
	}

	public List findByUidAndPid(String userId, String projectId) {
		// TODO Auto-generated method stub
		String hql = "from ProjectRegister where 1=1";// 查询语句
		if (!"".equals(userId) && userId != null) {
			hql += " and userInfo.userId ='" + userId + "'";
		}
		if (!"".equals(projectId) && projectId != null)
			hql += " and project.projectID ='" + projectId + "'";

		return this.projectRegisterDao.findByCondition(hql);

	}

	public List findByNameAndReportNum(String searchName, String searchReportNum) {
		String hql = "from ProjectRegister where 1=1";// 查询语句
		if (!"".equals(searchName) && searchName != null) {
			hql += " and userInfo.realName ='" + searchName + "'";
		}
		if (!"".equals(searchReportNum) && searchReportNum != null)
			hql += " and reportNum ='" + searchReportNum + "'";
		return this.projectRegisterDao.findAll(hql);
	}

	public List findByNameAndProjectId(String searchName, String projectId) {
		String hql = "from ProjectRegister where 1=1";// 查询语句
		if (!"".equals(searchName) && searchName != null) {
			hql += " and userInfo.realName ='" + searchName + "'";
		}
		if (!"".equals(projectId) && projectId != null)
			hql += " and project.projectID ='" + projectId + "'";
		return this.projectRegisterDao.findAll(hql);
	}

	public PageBean queryForPage(String searchId, int pageSize, int page) {
		// TODO Auto-generated method stub
		String hql = "from ProjectRegister where 1=1";// 查询语句
		if (!"".equals(searchId) && searchId != null) {
			hql += " and project.projectID ='" + searchId + "'";
		}
		hql += " order by signupTime desc";

		int allRow = projectRegisterDao.getAllRowCount(hql);// 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数
		final int currentPage = PageBean.countCurrentPage(page, totalPage);
		final int offset = PageBean.countOffset(pageSize, currentPage);// 当前页开始记录
		final int length = pageSize;// 每页记录数

		List list = projectRegisterDao.queryForPage(hql, offset, length); // "一页"的记录

		// 把分页信息保存到Bean中
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);

		pageBean.init();
		searchId = null;
		return pageBean;
	}

	public PageBean queryForPage(String name, String reportNum, int pageSize,
			int page) {
		// TODO Auto-generated method stub
		String hql = "from ProjectRegister where 1=1";// 查询语句
		if (!"".equals(name) && name != null) {
			hql += " and userInfo.realName ='" + name + "'";
		}
		if (!"".equals(reportNum) && reportNum != null) {
			hql += " and reportNum ='" + reportNum + "'";
		}
		// hql += " order by signupTime desc";
		hql += " group by project.projectCategory.projectID";
		int allRow = projectRegisterDao.getAllRowCount(hql);// 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数
		final int currentPage = PageBean.countCurrentPage(page, totalPage);
		final int offset = PageBean.countOffset(pageSize, currentPage);// 当前页开始记录
		final int length = pageSize;// 每页记录数

		List list = projectRegisterDao.queryForPage(hql, offset, length); // "一页"的记录

		// 把分页信息保存到Bean中
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);

		pageBean.init();
		return pageBean;
	}

	public List queryOneSignUpList(String searchId) {
		// TODO Auto-generated method stub
		List list = new ArrayList();
		String hql = "from ProjectRegister where 1=1";// 查询语句
		if (!"".equals(searchId) && searchId != null) {
			hql += " and project.projectID ='" + searchId + "'";
		}
		hql += " order by signupTime desc";

		list = projectRegisterDao.findAll(hql); // "一页"的记录
		return list;
	}
	
	public void batchCheck(String applyId, int checkId, String reportNum) {
		ProjectRegister e = this.projectRegisterDao.findByApplyId(applyId);
		e.getCheckStatus().setCheckId(checkId);
		e.setReportNum(reportNum);
		this.projectRegisterDao.updateProjectRegister(e);
	}

	public void checkReported(String applyId, int reportId) {
		ProjectRegister e = this.projectRegisterDao.findByApplyId(applyId);
		e.getReportStatus().setReportId(reportId);
		this.projectRegisterDao.updateProjectRegister(e);
	}

	public void setProjectRegisterDao(ProjectRegisterDAO projectRegisterDao) {
		this.projectRegisterDao = projectRegisterDao;
	}

	public ProjectRegisterDAO getProjectRegisterDao() {
		return projectRegisterDao;
	}

}
