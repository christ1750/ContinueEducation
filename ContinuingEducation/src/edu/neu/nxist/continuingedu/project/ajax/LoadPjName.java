package edu.neu.nxist.continuingedu.project.ajax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import edu.neu.nxist.continuingedu.project.service.ProjectService;

public class LoadPjName {

	private ProjectService projectService;
	private String pjCategoryId;

	public String execute() {
		System.out.println("LoadProject");
		List projectList = new ArrayList();
		projectList = projectService.getPjNameByCategory(pjCategoryId);
		try {
			JSONArray jsonArray = JSONArray.fromObject(projectList);

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
		return null;
	}

	public ProjectService getProjectService() {
		return projectService;
	}

	public void setProjectService(ProjectService projectService) {
		this.projectService = projectService;
	}

	public String getPjCategoryId() {
		return pjCategoryId;
	}

	public void setPjCategoryId(String pjCategoryId) {
		this.pjCategoryId = pjCategoryId;
	}

}
