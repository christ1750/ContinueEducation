package edu.neu.nxist.continuingedu.project.service;

import java.util.Iterator;
import java.util.List;

import edu.neu.nxist.continuingedu.project.dao.ProjectDAO;
import edu.neu.nxist.continuingedu.project.model.Project;
import edu.neu.nxist.continuingedu.register.dto.PageBean;

public class ProjectServiceImpl implements ProjectService {

	private ProjectDAO projectDao;

	public ProjectDAO getProjectDao() {
		return projectDao;
	}

	public void setProjectDao(ProjectDAO projectDao) {
		this.projectDao = projectDao;
	}

	public ProjectDAO getprojectDao() {
		return projectDao;
	}

	public void setprojectDao(ProjectDAO projectDao) {
		this.projectDao = projectDao;
	}

	public void addProject(Project myProject) {
		// TODO Auto-generated method stub
		this.projectDao.addProject(myProject);
	}

	public void deleteProject(Project myProject) {
		// TODO Auto-generated method stub
		this.projectDao.deleteProject(myProject);
	}

	public Project findProjectById(String Id) {
		// TODO Auto-generated method stub
		return this.projectDao.findProjectById(Id);
	}

	public void updateProject(Project myProject) {
		// TODO Auto-generated method stub
		this.projectDao.updateProject(myProject);
	}

	@SuppressWarnings("unchecked")
	public PageBean queryProjectForPage(int searchProjectCategory,
			String searchProjectName, int pageSize, int page) {
		// TODO Auto-generated method stub
		String hql = "from Project where 1=1 and visible='1'";// 查询语句
		if (searchProjectCategory != 0) {
			hql += " and projectCategory.pjCategoryId = '"
					+ searchProjectCategory + "'";
		}
		if (!"".equals(searchProjectName) && searchProjectName != null) {
			hql += " and projectName like '%" + searchProjectName + "%'";
		}
		hql += " and pjStatusId !=3 and pjStatusId !=4"; //不显示已结业或已停办的项目
		hql += " order by createTime desc ";
		int allRow = projectDao.getAllRowCount(hql);// 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数	
		final int length = pageSize;// 每页记录数
		final int currentPage = PageBean.countCurrentPage(page, totalPage);
		final int offset = PageBean.countOffset(pageSize, currentPage);// 当前页开始记录
		List list = projectDao.queryProjectForPage(hql, offset, length);// "一页"的记录

		// 把分页信息保存到Bean中
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);

		Iterator it = pageBean.getList().iterator();
		while (it.hasNext()) {
			System.out
					.println("***********************" + it.next().toString());
		}
		pageBean.init();
		return pageBean;
	}

	public List getProject() {
		return projectDao
				.listAllProject("select pj.projectID,pj.projectName from Project as pj where and visible='1'");
	}

	public List getPjCategory() {
		// TODO Auto-generated method stub
		return projectDao.listAllProject("from ProjectCategory");
	}

	public List getPjSponsor() {
		// TODO Auto-generated method stub
		return projectDao.listAllProject("from ProjectSponsor");
	}

	public List getPjStatus() {
		// TODO Auto-generated method stub
		return projectDao.listAllProject("from ProjectStatus");
	}

	public List getPjScope() {
		// TODO Auto-generated method stub
		return projectDao.listAllProject("from ProjectScope");
	}

	public List getPjNameByCategory(String pjCategory) {
		// TODO Auto-generated method stub
		return projectDao
				.listAllProject("select projectID,projectName from Project where projectCategory.pjCategoryId="
						+ pjCategory + " and visible='1' order by beginTime desc");
	}

}
