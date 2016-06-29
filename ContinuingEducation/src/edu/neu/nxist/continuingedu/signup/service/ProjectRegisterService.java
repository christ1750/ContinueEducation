package edu.neu.nxist.continuingedu.signup.service;

import java.util.List;

import edu.neu.nxist.continuingedu.register.dto.PageBean;
import edu.neu.nxist.continuingedu.signup.model.ProjectRegister;

public interface ProjectRegisterService {
	public List findAll();

	public PageBean findByUserId(String userId, String nameOrder,
			String beginTime, String endTime, int checkStatus, int page,
			int pageSize);

	public List findByProjectId(String projectId);

	public List findByCheckStatus(int checkStatus);

	public List findByReportStatus(int reportStatus);

	public List findByUidAndPid(String userId, String projectId);

	public List findByNameAndReportNum(String searchName, String searchReportNum);

	public List findByNameAndProjectId(String searchName, String projectId);

	public ProjectRegister findByApplyId(String applyId);

	public void updateProjectRegister(ProjectRegister pjReg);

	public void deleteProjectRegister(ProjectRegister pjReg);

	public void saveProjectRegister(ProjectRegister pjReg);

	public void batchCheck(String applyId, int statusId, String reportNum);

	public void checkReported(String applyId, int reportId);

	public PageBean queryForPage(String searchId, int pageSize, int page);

	public List queryOneSignUpList(String searchId);

	public List<ProjectRegister> findByCondition(String userId,
			String projectId, int checkStatus, int reportStatus);
}
