package edu.neu.nxist.continuingedu.courseware.service;

import java.util.Iterator;
import java.util.List;

import edu.neu.nxist.continuingedu.courseware.dao.CoursewareDAO;
import edu.neu.nxist.continuingedu.courseware.model.Courseware;
import edu.neu.nxist.continuingedu.register.dto.PageBean;

public class CoursewareServiceImpl implements CoursewareService {

	private CoursewareDAO coursewareDao;

	public CoursewareDAO getCoursewareDao() {
		return coursewareDao;
	}

	public void setCoursewareDao(CoursewareDAO coursewareDao) {
		this.coursewareDao = coursewareDao;
	}


	public void saveCourseware(Courseware ware) {

		coursewareDao.addCourseware(ware);
	}

	
	public void updateCourseware(Courseware ware) {
		// TODO Auto-generated method stub
		this.coursewareDao.updateCourseware(ware);
	}

	public Courseware findCoursewareById(String id) {
		// TODO Auto-generated method stub
		return this.coursewareDao.findCoursewareById(id);
	}

	
	public void deleteCourseware(Courseware ware) {
		// TODO Auto-generated method stub
		this.coursewareDao.deleteCourseware(ware);
	}


	
	public PageBean queryhsjyForPage(String searchName, int pageSize, int page) {
		// TODO Auto-generated method stub
		String hql = "from Courseware where 1=1";// 
		if (!"".equals(searchName) && searchName != null) {
			hql += " and title like '%" + searchName + "%'";
		}
		hql += " and category ='1' order by time desc";
		int allRow = coursewareDao.getAllRowCount(hql);// 
		int totalPage = PageBean.countTotalPage(pageSize, allRow);//
		final int offset = PageBean.countOffset(pageSize, page);//
		final int length = pageSize;// 
		final int currentPage = PageBean.countCurrentPage(page,totalPage);
		List list = coursewareDao.queryCoursewareForPage(hql, offset, length);// 

		//
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

	@SuppressWarnings("unchecked")
	public PageBean queryjxjyForPage(String searchName, int pageSize, int page) {
		// TODO Auto-generated method stub
		String hql = "from Courseware where 1=1";
		if (!"".equals(searchName) && searchName != null) {
			hql += " and title like '%" + searchName + "%'";
		}
		hql += "  and category ='0' order by time desc";
		int allRow = coursewareDao.getAllRowCount(hql);
		int totalPage = PageBean.countTotalPage(pageSize, allRow);
		final int offset = PageBean.countOffset(pageSize, page);
		final int length = pageSize;
		final int currentPage = PageBean.countCurrentPage(page,totalPage);
		List list = coursewareDao.queryCoursewareForPage(hql, offset, length);

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
	
	
	
	public PageBean queryaqscpxForPage(String searchName, int pageSize, int page) {
		// TODO Auto-generated method stub
		String hql = "from Courseware where 1=1";
		if (!"".equals(searchName) && searchName != null) {
			hql += " and title like '%" + searchName + "%'";
		}
		hql += "  and category ='2' order by time desc";
		int allRow = coursewareDao.getAllRowCount(hql);// 
		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 
		final int offset = PageBean.countOffset(pageSize, page);//  
		final int length = pageSize;//  
		final int currentPage = PageBean.countCurrentPage(page,totalPage);
		List list = coursewareDao.queryCoursewareForPage(hql, offset, length);//  

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
	
	
	public PageBean queryzyjnpxForPage(String searchName, int pageSize, int page) {
		// TODO Auto-generated method stub
		String hql = "from Courseware where 1=1";// 
		if (!"".equals(searchName) && searchName != null) {
			hql += " and title like '%" + searchName + "%'";
		}
		hql += "  and category ='3' order by time desc";
		int allRow = coursewareDao.getAllRowCount(hql);// 
		int totalPage = PageBean.countTotalPage(pageSize, allRow); 
		final int offset = PageBean.countOffset(pageSize, page); 
		final int length = pageSize; 
		final int currentPage = PageBean.countCurrentPage(page,totalPage);
		List list = coursewareDao.queryCoursewareForPage(hql, offset, length); 

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


	

	public PageBean queryCoursewareForPage(int pageSize, int page) {
		// TODO Auto-generated method stub
		return null;
	}

}