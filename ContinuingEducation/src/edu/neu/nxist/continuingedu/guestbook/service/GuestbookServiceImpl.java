package edu.neu.nxist.continuingedu.guestbook.service;

import java.util.Iterator;
import java.util.List;

import edu.neu.nxist.continuingedu.guestbook.dao.*;
import edu.neu.nxist.continuingedu.guestbook.model.*;
import edu.neu.nxist.continuingedu.register.dto.PageBean;

public class GuestbookServiceImpl implements GuestbookService {

	private GuestbookDAO guestbookDao;

	public GuestbookDAO getGuestbookDao() {
		return guestbookDao;
	}

	public void setGuestbookDao(GuestbookDAO guestbookDao) {
		this.guestbookDao = guestbookDao;
	}

	// 保存数据
	public void saveGuestbook(Guestbook book) {

		guestbookDao.addGuestbook(book);
	}

	// 修改新闻
	public void updateGuestbook(Guestbook book) {
		// TODO Auto-generated method stub
		this.guestbookDao.updateGuestbook(book);
	}

	// 按id查找新闻
	public Guestbook findGuestbookById(String id) {
		// TODO Auto-generated method stub
		return this.guestbookDao.findGuestbookById(id);
	}

	// 删除新闻
	public void deleteGuestbook(Guestbook book) {
		// TODO Auto-generated method stub
		this.guestbookDao.deleteGuestbook(book);
	}

	
	public List listAllGuestbook()
	{
		String hql = "from Guestbook order by CTime desc";
		return this.guestbookDao.listAllGuestbook(hql);
		
	}
	
	
	

	public PageBean queryGuestbookForPage(int pageSize, int page) {
		// TODO Auto-generated method stub
		try{
		String hql = "from Guestbook where status ='1' order by CTime desc";// 查询语句
		int allRow = guestbookDao.getAllRowCount(hql);// 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数
		final int offset = PageBean.countOffset(pageSize, page);// 当前页开始记录
		final int length = pageSize;// 每页记录数
		final int currentPage = PageBean.countCurrentPage(page,totalPage);
		List list = guestbookDao.queryGuestbookForPage(hql, offset, length);// "一页"的记录

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
		}catch(Exception e){return new PageBean();}
	}
	
	public PageBean checkGuestbookForPage(int pageSize, int page) {
		// TODO Auto-generated method stub
		try{
		String hql = "from Guestbook where status ='0'  order by CTime desc";// 查询语句
		int allRow = guestbookDao.getAllRowCount(hql);// 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数
		final int offset = PageBean.countOffset(pageSize, page);// 当前页开始记录
		final int length = pageSize;// 每页记录数
		final int currentPage = PageBean.countCurrentPage(page,totalPage);
		List list = guestbookDao.queryGuestbookForPage(hql, offset, length);// "一页"的记录

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
		}catch(Exception e){return new PageBean();}
	}

}