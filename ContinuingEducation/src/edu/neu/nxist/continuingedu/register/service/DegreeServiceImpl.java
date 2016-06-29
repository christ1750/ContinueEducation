package edu.neu.nxist.continuingedu.register.service;

import java.util.List;

import edu.neu.nxist.continuingedu.register.dao.DegreeDAO;

public class DegreeServiceImpl implements DegreeService {
	private DegreeDAO degreeDao;

	public List getDegree() {
		return degreeDao
				.listAllDegree("select d.degreeID,d.degreeName from Degree as d");
	}

	public DegreeDAO getDegreeDao() {
		return degreeDao;
	}

	public void setDegreeDao(DegreeDAO degreeDao) {
		this.degreeDao = degreeDao;
	}

}
