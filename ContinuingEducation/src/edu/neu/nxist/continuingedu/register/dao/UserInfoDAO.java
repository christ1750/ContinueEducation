package edu.neu.nxist.continuingedu.register.dao;

import java.util.List;

import edu.neu.nxist.continuingedu.register.model.UserInfo;

public interface UserInfoDAO {
	public void addUserInfo(UserInfo myUserInfo);

	public void deleteUserInfo(UserInfo myUserInfo);

	public void updateUserInfo(UserInfo myUserInfo);

	public List listAllUserInfo(String hql);

	public List findUserInfoById(String hql);

	public List findUserInfoByName(String hql);

	public UserInfo findUserInfoBybh(String bh);

	public List queryUserInfoForPage(final String hql, final int offset,
			final int length);
	public int getAllRowCount(String hql);

}
