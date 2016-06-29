package edu.neu.nxist.continuingedu.project.dao;

import java.util.List;

import edu.neu.nxist.continuingedu.project.model.Project;

public interface ProjectDAO {
	public void addProject(Project myProject);

	public void deleteProject(Project myProject);

	public void updateProject(Project myProject);

	public Project findProjectById(String id);

	public List listAllProject(String hql);

	public List queryProjectForPage(final String hql, final int offset,
			final int length);

	public int getAllRowCount(String hql);
	// public List queryBySql(String sql);
}
