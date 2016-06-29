package edu.neu.nxist.continuingedu.register.service;

import java.util.List;

import edu.neu.nxist.continuingedu.register.dao.NationDAO;

public class NationServiceImpl implements NationService {
	private NationDAO NationDao;

	public List getNation() {
		return NationDao
				.listAllNation("select n.nationID,n.nationName from Nation as n");
	}

	public NationDAO getNationDao() {
		return NationDao;
	}

	public void setNationDao(NationDAO NationDao) {
		this.NationDao = NationDao;
	}

}
