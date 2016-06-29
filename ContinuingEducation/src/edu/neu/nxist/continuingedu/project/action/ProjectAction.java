package edu.neu.nxist.continuingedu.project.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import edu.neu.nxist.continuingedu.project.model.Project;
import edu.neu.nxist.continuingedu.project.service.ProjectService;
import edu.neu.nxist.continuingedu.register.dto.PageBean;

public class ProjectAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5957616843358412632L;
	private int searchProjectCategory;
	private String searchProjectName;
	private String searchProjectID;
	private Project myProject;
	private PageBean pageBean;
	private List<Project> projectList;
	private ProjectService myProjectService;
	private int page;
	private int pageSize = 15;

	public String showOneProject() {
		myProject = this.myProjectService.findProjectById(searchProjectID);
		ActionContext.getContext().getSession().put("myProject", myProject);
		return "showOneProject";
	}

	public String searchProjectForPage() {
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		this.pageBean = this.myProjectService.queryProjectForPage(
				searchProjectCategory, searchProjectName, pageSize, page);
		return "searchProjectForPage";
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getSearchProjectName() {
		return searchProjectName;
	}

	public void setSearchProjectName(String searchProjectName) {
		this.searchProjectName = searchProjectName;
	}

	public int getSearchProjectCategory() {
		return searchProjectCategory;
	}

	public void setSearchProjectCategory(int searchProjectCategory) {
		this.searchProjectCategory = searchProjectCategory;
	}

	public String getSearchProjectID() {
		return searchProjectID;
	}

	public void setSearchProjectID(String searchProjectID) {
		this.searchProjectID = searchProjectID;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public List<Project> getProjectList() {
		return projectList;
	}

	public void setProjectList(List<Project> projectList) {
		this.projectList = projectList;
	}

	public ProjectService getMyProjectService() {
		return myProjectService;
	}

	public void setMyProjectService(ProjectService myProjectService) {
		this.myProjectService = myProjectService;
	}

	public String displayProject() {
		return "displayProject";
	}

	public String listProjectType() {
		return "listProjectType";
	}

}
