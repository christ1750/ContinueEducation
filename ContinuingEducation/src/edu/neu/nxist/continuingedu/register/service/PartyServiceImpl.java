package edu.neu.nxist.continuingedu.register.service;

import java.util.List;

import edu.neu.nxist.continuingedu.register.dao.PartyDAO;

public class PartyServiceImpl implements PartyService {
	private PartyDAO partyDao;

	public List getParty() {
		return partyDao
				.listAllParty("select p.partyID,p.partyName from Party as p");
	}

	public PartyDAO getPartyDao() {
		return partyDao;
	}

	public void setPartyDao(PartyDAO partyDao) {
		this.partyDao = partyDao;
	}

}
