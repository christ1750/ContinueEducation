package edu.neu.nxist.continuingedu.courseware.service;

import edu.neu.nxist.continuingedu.courseware.model.Courseware;
import edu.neu.nxist.continuingedu.register.dto.PageBean;

public interface CoursewareService {
	public void saveCourseware(Courseware ware);
	//public void saveNewsAndNotice(NewsAndNotice news, String htmlData)throws Exception;// 保存新闻

	public Courseware findCoursewareById(String id); // 显示新闻内容

	public void updateCourseware(Courseware ware);// 更新新闻
	
	public void deleteCourseware(Courseware ware);// 删除新闻

	public PageBean queryCoursewareForPage(int pageSize, int page); // 分页查找显示

	public PageBean queryjxjyForPage(String searchName, int pageSize, int page); // 分页查找显示
	
	public PageBean queryhsjyForPage(String searchName, int pageSize, int page); // 分页查找显示
 
	public PageBean queryaqscpxForPage(String searchName, int pageSize, int page);
	
	public PageBean queryzyjnpxForPage(String searchName, int pageSize, int page);
}
