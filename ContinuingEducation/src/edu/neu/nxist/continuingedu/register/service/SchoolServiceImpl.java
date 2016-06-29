package edu.neu.nxist.continuingedu.register.service;

import java.util.List;

import edu.neu.nxist.continuingedu.register.dao.SchoolDAO;

public class SchoolServiceImpl implements SchoolService {
	public SchoolDAO schoolDao;

	public List getSchool(String input) {
		return schoolDao
				.listAllSchool("from School as s where s.schoolName like "
						+ "'%" + input + "%' or s.schoolHistory like '%"
						+ input + "%'");
	}

	public SchoolDAO getSchoolDao() {
		return schoolDao;
	}

	public void setSchoolDao(SchoolDAO schoolDao) {
		this.schoolDao = schoolDao;
	}

}
