package edu.neu.nxist.continuingedu.project.ajax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import edu.neu.nxist.continuingedu.project.model.ProjectCategory;
import edu.neu.nxist.continuingedu.project.service.ProjectService;

public class LoadPjCategory {
	/**
	 * 
	 */
	private ProjectService projectService;

	@SuppressWarnings("unchecked")
	public String execute() {
		System.out.println("LoadFileCategory");
		List<ProjectCategory> pjCategoryList = new ArrayList<ProjectCategory>();
		pjCategoryList = (List<ProjectCategory>) projectService.getPjCategory();
		try {
			JSONArray jsonArray = JSONArray.fromObject(pjCategoryList);

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
}
