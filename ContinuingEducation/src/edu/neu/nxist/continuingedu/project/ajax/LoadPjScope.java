package edu.neu.nxist.continuingedu.project.ajax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import edu.neu.nxist.continuingedu.project.model.ProjectScope;
import edu.neu.nxist.continuingedu.project.service.ProjectService;

public class LoadPjScope {
	/**
	 * 
	 */
	private ProjectService projectService;

	@SuppressWarnings("unchecked")
	public String execute() {
		System.out.println("LoadPjScope");
		List<ProjectScope> pjScopeList = new ArrayList<ProjectScope>();
		pjScopeList = (List<ProjectScope>) projectService.getPjScope();
		try {
			JSONArray jsonArray = JSONArray.fromObject(pjScopeList);

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
