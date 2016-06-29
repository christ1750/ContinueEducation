package edu.neu.nxist.continuingedu.register.service;

import java.util.Iterator;
import java.util.List;

import edu.neu.nxist.continuingedu.register.dao.UserInfoDAO;
import edu.neu.nxist.continuingedu.register.dto.PageBean;
import edu.neu.nxist.continuingedu.register.model.UserInfo;

public class UserInfoServiceImpl implements UserInfoService {
	private UserInfoDAO userInfoDao;

	public void addUserInfo(UserInfo myUserInfo) {
		// TODO Auto-generated method stub
		userInfoDao.addUserInfo(myUserInfo);
	}

	public void deleteUserInfo(UserInfo myUserInfo) {
		// TODO Auto-generated method stub
		userInfoDao.deleteUserInfo(myUserInfo);
	}

	
	
	public List findUserInfoById(String id) {
		// TODO Auto-generated method stub
		return userInfoDao
				.findUserInfoById("from UserInfo where certificateID='" + id
						+ "'");
	}

	public List findUserInfoByName(String name) {
		// TODO Auto-generated method stub
		return userInfoDao.findUserInfoByName("from UserInfo where username='"
				+ name + "'");
	}

	public UserInfo getUserInfoBybh(String bh) {
		// TODO Auto-generated method stub
		return userInfoDao.findUserInfoBybh(bh);
	}

	public List queryUserInfoForPage(String hql, int offset, int length) {
		// TODO Auto-generated method stub
		return userInfoDao.queryUserInfoForPage(hql, offset, length);
	}
	
    public PageBean querystuForPage(String searchName, String searchrealName,String searchID,int pageSize, int page)
    {
    	String hql = "from UserInfo where 1=1";// 查询语句
		if (!"".equals(searchName) && searchName != null) {
			hql += " and userName like '%" + searchName + "%'";
		}
		if (!"".equals(searchrealName) && searchrealName != null) {
			hql += " and realName like '%" + searchrealName + "%'";
		}
		if (!"".equals(searchID) && searchID != null) {
			hql += " and certificateID like '%" + searchID + "%'";
		}
		hql += " and role ='1' and hide ='0' order by userName asc";
		int allRow = userInfoDao.getAllRowCount(hql);// 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数	
		final int length = pageSize;// 每页记录数
		final int currentPage = PageBean.countCurrentPage(page, totalPage);
		final int offset = PageBean.countOffset(pageSize, currentPage);// 当前页开始记录
		List list = userInfoDao.queryUserInfoForPage(hql, offset, length);// "一页"的记录

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
	
	public PageBean querymanagerForPage(String searchName,String searchrealName,String searchID, int pageSize, int page)
	{
		String hql = "from UserInfo where 1=1";// 查询语句
		if (!"".equals(searchName) && searchName != null) {
			hql += " and userName like '%" + searchName + "%'";
		}
		if (!"".equals(searchrealName) && searchrealName != null) {
			hql += " and realName like '%" + searchrealName + "%'";
		}
		if (!"".equals(searchID) && searchID != null) {
			hql += " and certificateID like '%" + searchID + "%'";
		}
		hql += " and role ='2'and hide ='0'  order by userName asc";
		int allRow = userInfoDao.getAllRowCount(hql);// 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数
		final int offset = PageBean.countOffset(pageSize, page);// 当前页开始记录
		final int length = pageSize;// 每页记录数
		final int currentPage = PageBean.countCurrentPage(page,totalPage);
		List list = userInfoDao.queryUserInfoForPage(hql, offset, length);// "一页"的记录

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
	
	public PageBean queryteacherForPage(String searchName,String searchrealName,String searchID, int pageSize, int page)
	{
		String hql = "from UserInfo where 1=1";// 查询语句
		if (!"".equals(searchName) && searchName != null) {
			hql += " and userName like '%" + searchName + "%'";
		}
		if (!"".equals(searchrealName) && searchrealName != null) {
			hql += " and realName like '%" + searchrealName + "%'";
		}
		if (!"".equals(searchID) && searchID != null) {
			hql += " and certificateID like '%" + searchID + "%'";
		}
		hql += " and role ='3'and hide ='0'  order by userName asc";
		int allRow = userInfoDao.getAllRowCount(hql);// 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数
		final int offset = PageBean.countOffset(pageSize, page);// 当前页开始记录
		final int length = pageSize;// 每页记录数
		final int currentPage = PageBean.countCurrentPage(page,totalPage);
		List list = userInfoDao.queryUserInfoForPage(hql, offset, length);// "一页"的记录

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
	
	public PageBean queryteaForPage(String searchName,String searchrealName,String searchID, int pageSize, int page)
	{
		String hql = "from UserInfo where 1=1";// 查询语句
		if (!"".equals(searchName) && searchName != null) {
			hql += " and userName like '%" + searchName + "%'";
		}
		if (!"".equals(searchrealName) && searchrealName != null) {
			hql += " and realName like '%" + searchrealName + "%'";
		}
		if (!"".equals(searchID) && searchID != null) {
			hql += " and certificateID like '%" + searchID + "%'";
		}
		hql += " and (role ='3' or role='4')and hide ='0'  order by userName asc";
		int allRow = userInfoDao.getAllRowCount(hql);// 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数
		final int offset = PageBean.countOffset(pageSize, page);// 当前页开始记录
		final int length = pageSize;// 每页记录数
		final int currentPage = PageBean.countCurrentPage(page,totalPage);
		List list = userInfoDao.queryUserInfoForPage(hql, offset, length);// "一页"的记录

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
	
	public PageBean queryteacherTempForPage(String searchName,String searchrealName,String searchID, int pageSize, int page)
	{
		String hql = "from UserInfo where 1=1";// 查询语句
		if (!"".equals(searchName) && searchName != null) {
			hql += " and userName like '%" + searchName + "%'";
		}
		if (!"".equals(searchrealName) && searchrealName != null) {
			hql += " and realName like '%" + searchrealName + "%'";
		}
		if (!"".equals(searchID) && searchID != null) {
			hql += " and certificateID like '%" + searchID + "%'";
		}
		hql += " and role ='4'and hide ='0'  order by userName asc";
		int allRow = userInfoDao.getAllRowCount(hql);// 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数
		final int offset = PageBean.countOffset(pageSize, page);// 当前页开始记录
		final int length = pageSize;// 每页记录数
		final int currentPage = PageBean.countCurrentPage(page,totalPage);
		List list = userInfoDao.queryUserInfoForPage(hql, offset, length);// "一页"的记录

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
	
	public PageBean querydeletedForPage(String searchName,String searchrealName,String searchID, int pageSize, int page)
	{
		String hql = "from UserInfo where 1=1";// 查询语句
		if (!"".equals(searchName) && searchName != null) {
			hql += " and userName like '%" + searchName + "%'";
		}
		if (!"".equals(searchrealName) && searchrealName != null) {
			hql += " and realName like '%" + searchrealName + "%'";
		}
		if (!"".equals(searchID) && searchID != null) {
			hql += " and certificateID like '%" + searchID + "%'";
		}
		hql += " and hide ='1'  order by hidetime desc";
		int allRow = userInfoDao.getAllRowCount(hql);// 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数
		final int offset = PageBean.countOffset(pageSize, page);// 当前页开始记录
		final int length = pageSize;// 每页记录数
		final int currentPage = PageBean.countCurrentPage(page,totalPage);
		List list = userInfoDao.queryUserInfoForPage(hql, offset, length);// "一页"的记录

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
	
	

	public void updateUserInfo(UserInfo myUserInfo) {
		// TODO Auto-generated method stub
		userInfoDao.updateUserInfo(myUserInfo);
	}

	public void setuserInfoDao(UserInfoDAO userInfoDao) {
		this.userInfoDao = userInfoDao;
	}

	public UserInfoDAO getuserInfoDao() {
		return userInfoDao;
	}

}
