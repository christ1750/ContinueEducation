package edu.neu.nxist.continuingedu.project.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.neu.nxist.continuingedu.project.model.Project;
import edu.neu.nxist.continuingedu.project.model.ProjectCategory;
import edu.neu.nxist.continuingedu.project.service.ProjectService;
import edu.neu.nxist.continuingedu.register.dto.ConfigUtil;
import edu.neu.nxist.continuingedu.register.dto.Notification;
import edu.neu.nxist.continuingedu.register.dto.PageBean;

public class ProjectActionForMgr extends ActionSupport implements
		ModelDriven<Project> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3564067016393262842L;

	private int searchProjectCategory;
	private String searchProjectName;
	private String searchProjectID;
	private Project myProject = new Project();
	private PageBean pageBean;
	private List<Project> projectList;
	private List<ProjectCategory> pjCategoryList;
	private ProjectService myProjectService;
	private int page;
	private int pageSize = 20;

	// 添加项目信息之前的初始化
	public String beforeaddProject() {
		System.out.println("初始化  start......");
		
		return "beforeAddPj";
	}
	// 报名确认之前的初始化
		public String beforeConfirm() {
			System.out.println("初始化  start......");
			return "beforeConfirm";
		}
	// 保存项目信息
	public String addProject() {
		System.out.println("saveMethod  start......");
		this.myProjectService.addProject(myProject);
		System.out.println("saveMethod  end......");
		Notification notification = new Notification();
		notification.setClassType(ConfigUtil.getConfig().getString(
				"css.class.success"));
		notification.setTitle(ConfigUtil.getConfig().getString(
				"msg.title.add"));
		notification.setMessage(ConfigUtil.getConfig().getString(
				"msg.message.add"));
		ActionContext.getContext().getSession().put("Notification",
				notification);
		return "addProject";
	}

	public String updateProject() {
		this.myProjectService.updateProject(myProject);
		Notification notification = new Notification();
		notification.setClassType(ConfigUtil.getConfig().getString(
				"css.class.success"));
		notification.setTitle(ConfigUtil.getConfig().getString(
				"msg.title.update"));
		notification.setMessage(ConfigUtil.getConfig().getString(
				"msg.message.update"));
		ActionContext.getContext().getSession().put("Notification",
				notification);
		return "updateProject";
	}
 
	public String deleteProject() {
		myProject = this.myProjectService.findProjectById(searchProjectID);
		myProject.setVisible("0");
		this.myProjectService.updateProject(myProject);
		Notification notification = new Notification();
		notification.setClassType(ConfigUtil.getConfig().getString(
				"css.class.success"));
		notification.setTitle(ConfigUtil.getConfig().getString(
				"msg.title.delete"));
		notification.setMessage(ConfigUtil.getConfig().getString(
				"msg.message.delete"));
		ActionContext.getContext().getSession().put("Notification",
				notification);
		return "deleteProject";
	}
 
	public void getProjectByID() {
		JsonConfig config = new JsonConfig();
		config.setIgnoreDefaultExcludes(false);
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		config.setExcludes(new String[] { "pjRegister" });
		myProject = this.myProjectService.findProjectById(searchProjectID);
		try {
			JSONArray jsonArray = JSONArray.fromObject(myProject, config);

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

	// 项目报名审核用
	@SuppressWarnings("unchecked")
	public String listProjectForPage() {
		this.setPjCategoryList(myProjectService.getPjCategory());
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		this.pageBean = this.myProjectService.queryProjectForPage(
				searchProjectCategory, searchProjectName, pageSize, page);
		return "listProjectForPage";
	}

	public String beforeIndex() {
		try {
			System.out.println("beforeAddBeginTeachingPlan  start...");
			// this.doInitial();
			// this.setPjCategoryList(this.departmentService.listAllAcademy());
			// this.setVersionYearList(this.teachingPlanService.allVersionYear());
			System.out.println("+  end...");
			return "beforeIndex";
		} catch (Exception e) {
			return "beforeIndex";
		}
	}

	// 项目删改用
	@SuppressWarnings("unchecked")
	public String queryProjectForPage() {
		this.setPjCategoryList(myProjectService.getPjCategory());
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		this.pageBean = this.myProjectService.queryProjectForPage(
				searchProjectCategory, searchProjectName, pageSize, page);
		return "queryProjectForPage";
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

	public Project getMyProject() {
		return myProject;
	}

	public void setMyProject(Project myProject) {
		this.myProject = myProject;
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

	public void setPjCategoryList(List<ProjectCategory> pjCategoryList) {
		this.pjCategoryList = pjCategoryList;
	}

	public List<ProjectCategory> getPjCategoryList() {
		return pjCategoryList;
	}

	public ProjectService getMyProjectService() {
		return myProjectService;
	}

	public void setMyProjectService(ProjectService myProjectService) {
		this.myProjectService = myProjectService;
	}

	public String listProjectType() {
		return "listProjectType";
	}

	public Project getModel() {
		// TODO Auto-generated method stub
		return myProject;
	}

}
