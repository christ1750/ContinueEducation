package edu.neu.nxist.continuingedu.signup.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.neu.nxist.continuingedu.register.dto.PageBean;
import edu.neu.nxist.continuingedu.signup.model.ProjectRegister;
import edu.neu.nxist.continuingedu.signup.service.ProjectRegisterService;

public class ProjectRegisterAction extends ActionSupport implements
		ModelDriven<ProjectRegister> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5448014882799408446L;

	private ProjectRegisterService projectRegisterService;
	private ProjectRegister projectRegister = new ProjectRegister();
	private String applyId;
	private String userId;
	private String projectId;
	private String searchId;
	private PageBean pageBean;
	private String nameOrder;
	private String beginTime;
	private String endTime;
	private int status;
	private int page;
	private int pageSize = 15;

	public String saveProjectRegister() {
		
		this.projectRegisterService.saveProjectRegister(projectRegister);
		return "saveProjectRegister";
	}

	public void findAll() {
		this.projectRegisterService.findAll();
	}

	public String findByUserId() {
		pageBean = this.projectRegisterService.findByUserId(userId, nameOrder,
				beginTime, endTime, status, page, pageSize);
		return "findByUserId";
	}

	public void findByUidAndPid() {
		JsonConfig config = new JsonConfig();
		config.setIgnoreDefaultExcludes(false);
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		config.setExcludes(new String[] { "pjRegister" });
		List list = this.projectRegisterService.findByUidAndPid(userId,
				projectId);

		try {
			JSONArray jsonArray = JSONArray.fromObject(list, config);
			HttpServletResponse response = ServletActionContext.getResponse();
			try {
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().print(jsonArray.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ProjectRegister findByApplyId() {
		return this.projectRegisterService.findByApplyId(applyId);
	}

	public ProjectRegisterService getProjectRegisterService() {
		return projectRegisterService;
	}

	public void setProjectRegisterService(
			ProjectRegisterService projectRegisterService) {
		this.projectRegisterService = projectRegisterService;
	}

	public ProjectRegister getProjectRegister() {
		return projectRegister;
	}

	public void setProjectRegister(ProjectRegister projectRegister) {
		this.projectRegister = projectRegister;
	}

	public void setApplyId(String applyId) {
		this.applyId = applyId;
	}

	public String getApplyId() {
		return applyId;
	}

	public String getNameOrder() {
		return nameOrder;
	}

	public void setNameOrder(String nameOrder) {
		this.nameOrder = nameOrder;
	}

	public String getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public void setSearchId(String searchId) {
		this.searchId = searchId;
	}

	public String getSearchId() {
		return searchId;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public ProjectRegister getModel() {
		// TODO Auto-generated method stub
		return projectRegister;
	}

}
