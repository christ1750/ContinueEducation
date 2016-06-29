package edu.neu.nxist.continuingedu.courseware.dao;

import java.util.List;

import edu.neu.nxist.continuingedu.courseware.model.Courseware;

public interface CoursewareDAO {
	public void addCourseware(Courseware ware);

	public void deleteCourseware(Courseware ware);

	public void updateCourseware(Courseware ware);

	public Courseware findCoursewareById(String id);

	public List listAllCourseware(String hql);

	public List queryCoursewareForPage(final String hql, final int offset,
			final int length);

	public int getAllRowCount(String hql);
}