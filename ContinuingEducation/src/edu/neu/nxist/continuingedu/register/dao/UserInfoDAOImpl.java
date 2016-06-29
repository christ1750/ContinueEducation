package edu.neu.nxist.continuingedu.register.dao;

import java.util.List;

import edu.neu.nxist.continuingedu.basic.BasicDAO;
import edu.neu.nxist.continuingedu.register.model.UserInfo;

public class UserInfoDAOImpl implements UserInfoDAO {
	private BasicDAO myBasicDao;

	public void addUserInfo(UserInfo myUserInfo) {
		// TODO Auto-generated method stub
		this.myBasicDao.addRecord(myUserInfo);
	}

	public void deleteUserInfo(UserInfo myUserInfo) {
		// TODO Auto-generated method stub
		this.myBasicDao.deleteRecord(myUserInfo);
	}

	public void updateUserInfo(UserInfo myUserInfo) {
		// TODO Auto-generated method stub
		this.myBasicDao.updateRecord(myUserInfo);
	}

	public List findUserInfoById(String hql) {
		// TODO Auto-generated method stub
		return this.myBasicDao.listAllRecord(hql);
	}

	public List findUserInfoByName(String hql) {
		// TODO Auto-generated method stub
		return this.myBasicDao.listAllRecord(hql);
	}

	public UserInfo findUserInfoBybh(String bh) {
		// TODO Auto-generated method stub
		return (UserInfo) this.myBasicDao.findById(UserInfo.class, bh);
	}

	public List listAllUserInfo(String hql) {
		// TODO Auto-generated method stub
		return this.myBasicDao.listAllRecord(hql);
	}

	public List queryUserInfoForPage(String hql, int offset, int length) {
		// TODO Auto-generated method stub
		return this.myBasicDao.queryForPage(hql, offset, length);
	}
	
	public int getAllRowCount(String hql) {
		// TODO Auto-generated method stub
		return this.myBasicDao.getAllRowCount(hql);
	}

	public BasicDAO getMyBasicDao() {
		return myBasicDao;
	}

	public void setMyBasicDao(BasicDAO myBasicDao) {
		this.myBasicDao = myBasicDao;
	}

}
