package edu.neu.nxist.continuingedu.project.service;

import java.util.List;

import edu.neu.nxist.continuingedu.project.model.Project;
import edu.neu.nxist.continuingedu.register.dto.PageBean;

public interface ProjectService {
	public List getProject();

	public List getPjCategory();

	public List getPjNameByCategory(String pjCategory);

	public List getPjSponsor();

	public List getPjStatus();

	public List getPjScope();

	public void addProject(Project myProject);

	public void deleteProject(Project myProject);

	public void updateProject(Project myProject);

	public Project findProjectById(String id);

	// public PageBean queryProjectForPage(int pageSize,int page);
	public PageBean queryProjectForPage(int searchProjectCategory,
			String searchProjectName, int pageSize, int page);

}
