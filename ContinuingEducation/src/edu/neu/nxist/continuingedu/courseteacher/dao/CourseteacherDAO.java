package edu.neu.nxist.continuingedu.courseteacher.dao;

import java.util.List;

import edu.neu.nxist.continuingedu.courseteacher.model.*;

public interface CourseteacherDAO {

	public void addCourseteacher(Courseteacher courseteacher);

	public void deleteCourseteacher(Courseteacher courseteacher);

	public void updateCourseteacher(Courseteacher courseteacher);

	public Courseteacher findCourseteacherById(String id);

	public List listAllCourseteacher(String hql);

	public List queryCourseteacherForPage(final String hql, final int offset,
			final int length);

	public int getAllRowCount(String hql);
	
	public int findByPidUid(String hql);
}
