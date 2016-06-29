package edu.neu.nxist.continuingedu.courseteacher.service;

import edu.neu.nxist.continuingedu.courseteacher.model.Courseteacher;
import edu.neu.nxist.continuingedu.register.dto.PageBean;

public interface CourseteacherService {
	public void addCourseteacher(Courseteacher courseteacher);

	public Courseteacher findCourseteacherById(String id);

	public void updateCourseteacher(Courseteacher courseteacher);
	
	public void deleteCourseteacher(Courseteacher courseteacher);

	public PageBean queryCourseteacherForPage(String coursename,String teachername,
			String queryTime1, String queryTime2, int pageSize, int page);
	
	public PageBean queryteacherForPageByPID(String projectId,int pageSize,int page );
	
	public PageBean queryteacherForPage(int pageSize, int page);
	
	public boolean isExist(Courseteacher courseteacher);
	
	public PageBean listteachprojectForPage(String uid, int pageSize,int page);
	
	public PageBean listgradeForPage(String queryProjectID, int pageSize, int page);
	
	public PageBean searchgradeForPage(String searchStudentID, int pageSize, int page);
    
	

}
