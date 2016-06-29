package edu.neu.nxist.continuingedu.courseware.service;

import edu.neu.nxist.continuingedu.courseware.model.Courseware;
import edu.neu.nxist.continuingedu.register.dto.PageBean;

public interface CoursewareService {
	public void saveCourseware(Courseware ware);
	//public void saveNewsAndNotice(NewsAndNotice news, String htmlData)throws Exception;// ��������

	public Courseware findCoursewareById(String id); // ��ʾ��������

	public void updateCourseware(Courseware ware);// ��������
	
	public void deleteCourseware(Courseware ware);// ɾ������

	public PageBean queryCoursewareForPage(int pageSize, int page); // ��ҳ������ʾ

	public PageBean queryjxjyForPage(String searchName, int pageSize, int page); // ��ҳ������ʾ
	
	public PageBean queryhsjyForPage(String searchName, int pageSize, int page); // ��ҳ������ʾ
 
	public PageBean queryaqscpxForPage(String searchName, int pageSize, int page);
	
	public PageBean queryzyjnpxForPage(String searchName, int pageSize, int page);
}
