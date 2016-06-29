package edu.neu.nxist.continuingedu.courseteacher.service;

import java.util.Iterator;
import java.util.List;

import edu.neu.nxist.continuingedu.courseteacher.dao.CourseteacherDAO;
import edu.neu.nxist.continuingedu.courseteacher.model.Courseteacher;
import edu.neu.nxist.continuingedu.courseware.model.Courseware;
import edu.neu.nxist.continuingedu.register.dao.UserInfoDAO;
import edu.neu.nxist.continuingedu.register.dto.PageBean;
import edu.neu.nxist.continuingedu.register.model.UserInfo;
import edu.neu.nxist.continuingedu.register.service.UserInfoService;

public class CourseteacherServiceImpl  implements CourseteacherService{
	private CourseteacherDAO courseteacherDao;
	public void addCourseteacher(Courseteacher courseteacher) {
		// TODO Auto-generated method stub
		courseteacherDao.addCourseteacher(courseteacher);
	}

	public void deleteCourseteacher(Courseteacher courseteacher) {
		// TODO Auto-generated method stub
		courseteacherDao.deleteCourseteacher(courseteacher);
	}

	
	public void updateCourseteacher(Courseteacher courseteacher) {
		// TODO Auto-generated method stub
		this.courseteacherDao.updateCourseteacher(courseteacher);
	}

	
	public Courseteacher findCourseteacherById(String id) {
		// TODO Auto-generated method stub
		return (Courseteacher)
		courseteacherDao.findCourseteacherById(id);
	}
	
	
	
	public PageBean queryCourseteacherForPage(String coursename,String teachername,
			String queryTime1, String queryTime2, int pageSize, int page)
	{
		String hql = "from Courseteacher where 1=1";// 查询语句
		if (!"".equals(coursename) && coursename != null) {
			hql += " and project.projectName like '%" + coursename + "%'";
		}
		if (!"".equals(teachername) && teachername != null) {
			hql += " and userInfo.realName like '%" + teachername + "%'";
		} 
		if (!"".equals(queryTime1) && queryTime1 != null) {
			hql += " and time >='" + queryTime1 + "'";
		}
		if (!"".equals(queryTime2) && queryTime2 != null) {
			hql += " and time <='" + queryTime2 + "'";
		}
		hql += " and ( userInfo.role ='3' or userInfo.role = '4' ) and userInfo.hide ='0'  order by time desc";
		int allRow = courseteacherDao.getAllRowCount(hql);// 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数
		final int offset = PageBean.countOffset(pageSize, page);// 当前页开始记录
		final int length = pageSize;// 每页记录数
		final int currentPage = PageBean.countCurrentPage(page,totalPage);
		List list = courseteacherDao.queryCourseteacherForPage(hql, offset, length);// "一页"的记录

		// 把分页信息保存到Bean中
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);

		Iterator it = pageBean.getList().iterator();
		while (it.hasNext()) {
			System.out.println("***********************" + it.next().toString());
		}
		pageBean.init();
		return pageBean;
	}
	
	public PageBean queryteacherForPageByPID(String projectId,int pageSize,int page )
	{
		String hql = "from Courseteacher where project.projectID = '"+projectId+"'and userInfo.hide ='0' order by time desc";// 查询语句
		
		int allRow = courseteacherDao.getAllRowCount(hql);// 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数
		final int offset = PageBean.countOffset(pageSize, page);// 当前页开始记录
		final int length = pageSize;// 每页记录数
		final int currentPage = PageBean.countCurrentPage(page,totalPage);
		List list = courseteacherDao.queryCourseteacherForPage(hql, offset, length);// "一页"的记录

		// 把分页信息保存到Bean中
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);

		Iterator it = pageBean.getList().iterator();
		while (it.hasNext()) {
			System.out.println("***********************" + it.next().toString());
		}
		pageBean.init();
		return pageBean;
	}
	
	public PageBean queryteacherForPage(int pageSize, int page)
	{
       String hql = "from UserInfo where 1=1 and (role = '3' or role = '4')and hide='0' order by userName asc";// 查询语句

		int allRow = courseteacherDao.getAllRowCount(hql);// 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数
		final int offset = PageBean.countOffset(pageSize, page);// 当前页开始记录
		final int length = pageSize;// 每页记录数
		final int currentPage = PageBean.countCurrentPage(page,totalPage);
		List list = courseteacherDao.queryCourseteacherForPage(hql, offset, length);// "一页"的记录

		// 把分页信息保存到Bean中
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);

		Iterator it = pageBean.getList().iterator();
		while (it.hasNext()) {
			System.out.println("***********************" + it.next().toString());
		}
		pageBean.init();
		return pageBean;
		
	}
		
	public boolean isExist(Courseteacher courseteacher)
	{   String projectId = courseteacher.getProject().getProjectID();
	    String userId= courseteacher.getUserInfo().getUserId();
		String hql="from Courseteacher where project.projectID = '"+projectId+"' and userInfo.userId = '"+userId+"'";
		if(courseteacherDao.findByPidUid(hql)!=0) return true;
		else return false;
	}
	
	
	public PageBean listteachprojectForPage(String uid, int pageSize,int page)
	{
		String hql = "from Courseteacher where userInfo.userId = '" + uid+ " ' and userInfo.hide = '0' order by time desc";// 查询语句

		int allRow = courseteacherDao.getAllRowCount(hql);// 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数
		final int offset = PageBean.countOffset(pageSize, page);// 当前页开始记录
		final int length = pageSize;// 每页记录数
		final int currentPage = PageBean.countCurrentPage(page,totalPage);
		List list = courseteacherDao.queryCourseteacherForPage(hql, offset, length);// "一页"的记录

		// 把分页信息保存到Bean中
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);

		Iterator it = pageBean.getList().iterator();
		while (it.hasNext()) {
			System.out.println("***********************" + it.next().toString());
		}
		pageBean.init();
		return pageBean;
		
		
	}
	
	
	public PageBean listgradeForPage(String queryProjectID, int pageSize, int page)
	{
		
		String hql = "from ProjectRegister where project.projectID = '" + queryProjectID+ " ' and checkStatus.checkId = '1' order by signupTime asc";// 查询语句

		int allRow = courseteacherDao.getAllRowCount(hql);// 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数
		final int offset = PageBean.countOffset(pageSize, page);// 当前页开始记录
		final int length = pageSize;// 每页记录数
		final int currentPage = PageBean.countCurrentPage(page,totalPage);
		List list = courseteacherDao.queryCourseteacherForPage(hql, offset, length);// "一页"的记录

		// 把分页信息保存到Bean中
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);

		Iterator it = pageBean.getList().iterator();
		while (it.hasNext()) {
			System.out.println("***********************" + it.next().toString());
		}
		pageBean.init();
		return pageBean;
		
	}
	
	public PageBean searchgradeForPage(String searchStudentID, int pageSize, int page)
	{
		String hql = "from ProjectRegister where userInfo.userId = '" + searchStudentID+ " ' and checkStatus.checkId = '1' order by signupTime desc";// 查询语句

		int allRow = courseteacherDao.getAllRowCount(hql);// 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数
		final int offset = PageBean.countOffset(pageSize, page);// 当前页开始记录
		final int length = pageSize;// 每页记录数
		final int currentPage = PageBean.countCurrentPage(page,totalPage);
		List list = courseteacherDao.queryCourseteacherForPage(hql, offset, length);// "一页"的记录

		// 把分页信息保存到Bean中
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);

		Iterator it = pageBean.getList().iterator();
		while (it.hasNext()) {
			System.out.println("***********************" + it.next().toString());
		}
		pageBean.init();
		return pageBean;
		
		
		
		
	}

	public CourseteacherDAO getCourseteacherDao() {
		return courseteacherDao;
	}

	public void setCourseteacherDao(CourseteacherDAO courseteacherDao) {
		this.courseteacherDao = courseteacherDao;
	}

}
