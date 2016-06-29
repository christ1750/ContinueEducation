package edu.neu.nxist.continuingedu.register.service;

import java.util.List;

import edu.neu.nxist.continuingedu.register.dto.PageBean;
import edu.neu.nxist.continuingedu.register.model.UserInfo;

public interface UserInfoService {
	public void addUserInfo(UserInfo myUserInfo);

	public void deleteUserInfo(UserInfo myUserInfo);

	public void updateUserInfo(UserInfo myUserInfo);
	
	public List findUserInfoById(String id);

	public List findUserInfoByName(String name);

	public UserInfo getUserInfoBybh(String bh);
	
	public PageBean querystuForPage(String searchName,String searchrealName,String searchID, int pageSize, int page);
	
	public PageBean querymanagerForPage(String searchName,String searchrealName,String searchID, int pageSize, int page);
	
	public PageBean queryteacherForPage(String searchName,String searchrealName,String searchID, int pageSize, int page);
	
	public PageBean queryteacherTempForPage(String searchName,String searchrealName,String searchID, int pageSize, int page);
	
	public PageBean queryteaForPage(String searchName,String searchrealName,String searchID, int pageSize, int page);
	
	public PageBean querydeletedForPage(String searchName,String searchrealName,String searchID, int pageSize, int page);

	public List queryUserInfoForPage(final String hql, final int offset,
			final int length);

}
